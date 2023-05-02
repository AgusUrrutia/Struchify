<?php
require_once('model/comentariosModel.php');
require_once('api/api-comentariosView.php');
require_once('view/musicView.php');

class ApiComentariosController{

    private $comentariosModel;
    private $comentariosView;
    private $musicView;
    private $data;

    function __construct(){
        $this->comentariosView = new ComentariosView();
        $this->comentariosModel = new ComentariosModel();
        $this->musicView = new MusicView();
       
    }

    private function getData() {
        $data = file_get_contents("php://input");
        return json_decode($data);
    }

    function getAll($params = null){
        if(isset($params[':ID']) && !empty($params[':ID'])){
            $id_cancion = $params[':ID'];
        }
        $comentarios = $this->comentariosModel->getAll($id_cancion);
        if(!empty($comentarios)){
             $this->comentariosView->response($comentarios, 200);
        }else{
            $this->comentariosView->response("not found", 204);
        }  
    }

    function order($params = null){
    
        if(isset($params[':ID']) && !empty($params[':ID']) ){
            if(isset($_GET['filtro']) && !empty($_GET['filtro']) && ($_GET['filtro'] == "puntaje" || $_GET['filtro'] == "id_comentarios")){
                $id = $params[':ID'];
                $columnaFiltro = $_GET['filtro'];
                if($_GET['order'] == "DESC"){
                    $order = "DESC";
                }else{
                    $order = "ASC";
                }    
            $comentsOrder = $this->comentariosModel->order($id,$order,$columnaFiltro);
            if(!empty($comentsOrder)){
                $this->comentariosView->response($comentsOrder, 200);
            }else{
                $this->comentariosView->response("no se pudo realizar el ordenamiento correctamente", 404);
            }
            }
            
        }
    }

    function delete($params = null){
        /* if (isset($_SESSION['USER_PERMISSIONS']) && ($_SESSION['USER_PERMISSIONS'] == 1)) {  */
            if(isset($params[':ID']) && !empty($params[':ID'])){
                $id = $params[':ID'];
            }

            $comentario = $this->comentariosModel->getOne($id);
            if(!empty($comentario)){
                $this->comentariosModel->delete($id);
                $comentario = $this->comentariosModel->getOne($id);
                if(empty($comentario)){
                    $this->comentariosView->response($id, 200);
                }else{
                    $this->comentariosView->response("No se pudo eliminar el comentario", 404);
                }
            }else{
                $this->comentariosView->response("Comentario no encontrado", 404);
            }
          /* }else{
           $this->comentariosView->response("Sin permisos", 204);
        }  */
    }


    function add($params = null){
        //permisos
       // if($_SESSION['USER_ID']){
            $data = $this->getData();
            $idComentario = $this->comentariosModel->addComent($data->comentario,$data->puntaje,$data->id_cancion);
            $comentario = $this->comentariosModel->getOne($idComentario);
            if(!empty($comentario)){
                $this->comentariosView->response($comentario);
            }else{
                $this->comentariosView->response("not found", 404);
            }
        /*else{
            $this->view->showError("usuario no permitido");
        }*/
    }

    function filtroPuntaje($params = null){
         if(isset($params[":ESTRELLAS"]) && !empty($params[":ESTRELLAS"]) && 
           isset($params[':ID']) && !empty($params[':ID'])){
             
            $estrellas = $params[":ESTRELLAS"];
            $id_cancion = $params[":ID"]; 
            $filtroPuntaje = $this->comentariosModel->filtro($id_cancion,$estrellas);

            if(!empty($filtroPuntaje)){
                $this->comentariosView->response($filtroPuntaje);
            }else{
                $this->comentariosView->response("not found", 404);
            }
        }
    }  
}