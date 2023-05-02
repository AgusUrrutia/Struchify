<?php 
    /* internos */
    require_once('model/musicModel.php');
    require_once('view/musicView.php');
    /* helper */
    require_once('helpers/auth.helper.php');
    /* externos */
    require_once('model/genreModel.php');

    class MusicController{
        private $musicView;
        private $musicModel;
        private $genreModel;
        private $authHelper;
        private $genres;

        function __construct(){
            $this->musicView = new MusicView();
            $this->musicModel = new MusicModel();
            $this->genreModel = new GenreModel();
            $this->authHelper = new AuthHelper();
            $this->genres = $this->genreModel->getAllGenre();
        }

        function showView(){
            $genre = $this->genreModel->getAllGenre();
            $this->musicView->showHome($genre);
        }

        function showGenreMusic($genre, $filtro=NULL){
            if(isset($genre) && isset($filtro) && $genre == 7){
                $musicForGenre = $this->musicModel->filtrarAll($filtro);
            }elseif(isset($genre) && isset($filtro)){
                $musicForGenre = $this->musicModel->filtrar($genre, $filtro);
            }elseif($genre == 7){
                $musicForGenre = $this->musicModel->getAllMusic();
            }else{
                $musicForGenre = $this->musicModel->musicForGenre($genre);
            }
            
            if ($genre == 7) {
                $tablaTodos = 7;
                $this->musicView->showTable($musicForGenre,$this->genres,$genre,$tablaTodos);
            }elseif($genre != 7){
                $this->musicView->showTable($musicForGenre,$this->genres,$genre,NULL);
            }
           
        }

        function deleteSong($id){
            if (!($_SESSION['USER_PERMISSIONS'] == 1))  {
                $this->musicView->showError('No contiene permiso para realizar esta accion!!!');
            }else{
                $getOneSong = $this->musicModel->getOneSong($id);
                $id_genero = $getOneSong->id;
                if (!empty($getOneSong)) {
                    $Musicdelete = $this->musicModel->delete($id);
                }
        
                header("Location:". TABLA .$id_genero);
            }
        }

        function showFormUpdate($id){

            $infoMusic = $this->musicModel->getDatesOfMusic($id);
            
            $nombre = $infoMusic->nombreCancion;
            $artista = $infoMusic->artista;
            $album = $infoMusic->album;
            $anio = $infoMusic->anio;
            $imagen = $infoMusic->imagen;
            $audio = $infoMusic->cancion;

            $genres = $this->genreModel->getAllGenre();
            $this->musicView->musicUpdate($nombre,$artista,$album,$anio,$genres,$imagen,$id,$audio);
        }

        function updateMusic(){
            if (!($_SESSION['USER_PERMISSIONS'] == 1)) {
                $this->musicmusicView->showError('No contiene permiso para realizar esta accion!!!');
            }else{
                if (isset($_REQUEST['nombre']) && !empty($_REQUEST['nombre'])  && 
                    isset($_REQUEST['artista']) && !empty($_REQUEST['artista'])&& 
                    isset($_REQUEST['album']) && !empty($_REQUEST['album'])    && 
                    isset($_REQUEST['anio']) && !empty($_REQUEST['anio'])      && 
                    isset($_REQUEST['genre']) && $_REQUEST['genre']!="false"   && 
                    isset($_REQUEST['id']) && !empty($_REQUEST['id'])) {
                        $nombre = $_REQUEST['nombre'];
                        $artista = $_REQUEST['artista'];
                        $album = $_REQUEST['album'];
                        $anio = $_REQUEST['anio'];
                        $genre = $_REQUEST['genre'];
                        $id = $_REQUEST['id'];
                        
                        
                        if(isset($_REQUEST['url_cancion']) && !empty($_REQUEST['url_cancion'])){
                            $url_cancion = $_REQUEST['url_cancion'];
                        }

                        if ($_FILES['input_name']['type'] == "image/jpg"  || 
                            $_FILES['input_name']['type'] == "image/jpeg" || 
                            $_FILES['input_name']['type'] == "image/png"){
                            
                            $imagen = $_FILES['input_name']['tmp_name'];
                          }

                        if($genre != "false"){
                            $this->musicModel->updateMusic($nombre,$artista,$album,$anio,$genre,$imagen,$id,$url_cancion); 
                            header("Location:". TABLA .$genre);
                        }
                }else{
                    $this->musicView->showError('*No se seleccionó ningun genero fallido*');
                }
            }
        }

        function getAllGenre(){
            $genre = $this->genreModel->getAllGenre();
            return $genre;
        }

        function filtro(){
            $idGenero = $_POST['idGenero'];
            $filtro = $_POST['filtro'];
            $this->showGenreMusic($idGenero,$filtro);
        }

        function showFormAddSong(){
            $this->musicView->showFormAddSong($this->genres);
        }

        function addSong(){
            if (!($_SESSION['USER_PERMISSIONS'] == 1)) {
                $this->musicView->showError('No contiene permiso para realizar esta accion!!!');
            }else{
                if (isset($_REQUEST['nombre']) && !empty($_REQUEST['nombre'])  && 
                    isset($_REQUEST['artista'])&& !empty($_REQUEST['artista']) && 
                    isset($_REQUEST['album'])  && !empty($_REQUEST['album'])   && 
                    isset($_REQUEST['anio'])   && !empty($_REQUEST['anio'])    &&
                    isset($_REQUEST['genre'])  && $_REQUEST['genre']!="false"){
                    
                    $nombreCancion = $_REQUEST['nombre'];
                    $artista = $_REQUEST['artista'];
                    $album = $_REQUEST['album'];
                    $anio = $_REQUEST['anio'];
                    $genero = $_REQUEST['genre'];

                    if(isset($_REQUEST['url_cancion']) && !empty($_REQUEST['url_cancion'])){
                        $url_cancion = $_REQUEST['url_cancion'];
                    }

                    if ($_FILES['input_name']['type'] == "image/jpg" || 
                        $_FILES['input_name']['type'] == "image/jpeg"|| 
                        $_FILES['input_name']['type'] == "image/png"){
                        
                        $imagen = $_FILES['input_name']['tmp_name'];
                        $songAdd = $this->musicModel->addSong($nombreCancion,$artista,$album,$anio,$genero,$url_cancion,$imagen);  
                        
                    }else{
                        $songAdd = $this->musicModel->addSong($nombreCancion,$artista,$album,$anio,$genero,$url_cancion,null); 
                    }

                    if($songAdd){
                        header("Location:". TABLA . $genero);
                    }
                }
            }
        }
        
        function showCardSeeMore($id){

            $infoMusic = $this->musicModel->getDatesOfMusic($id);

            $cancion = $infoMusic->nombreCancion;
            $artista = $infoMusic->artista;
            $album = $infoMusic->album;
            $anio = $infoMusic->anio;
            $imagen = $infoMusic->imagen;
            $id_genero = $infoMusic->id_genero_fk;

            $getGenero = $this->musicModel->getGenero($id);
            $genero = $getGenero->genero;

            $puntajes = array(1 =>"⭐",2=>"⭐⭐",3=>"⭐⭐⭐",4=>"⭐⭐⭐⭐",5=>"⭐⭐⭐⭐⭐");
            
            if($infoMusic){
                $this->musicView->showMoreInfoMusic($cancion,$artista,$album,$anio,$genero,$imagen,$id_genero,$puntajes,$id);
            }
        }
    }