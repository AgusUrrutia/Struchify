<?php
    require_once('model/genreModel.php');
    require_once('view/genreView.php');
    require_once('view/musicView.php');
    require_once ('helpers/auth.helper.php');

    class GenreController{
        private $view; 
        private $musicView;
        private $genreModel; 
        private $authHelper;

        function __construct(){
            $this->view = new GenreView();
            $this->musicView = new MusicView();
            $this->genreModel = new GenreModel();
            $this->authHelper = new AuthHelper();
        }

        function showTableGenre(){
            $genres = $this->genreModel->getAllGenre();
            $this->view->showTableGenre($genres);
        }

        function addNewGenre(){
            if(isset($_REQUEST['newGenre']) && !empty($_REQUEST['newGenre'])){
                $genre = $_REQUEST['newGenre'];
                
                $this->genreModel->addNewGenre($genre);
            }
            header("Location:". GENRE_TABLE);
        }

        function deleteGenre($id){
            $cant = $this->genreModel->validarGenre($id);
            if(empty($cant->cant) && $id != 7){
                $this->genreModel->deleteGenre($id);
                header("Location:". GENRE_TABLE);
            }else{
                $this->musicView->showError("no se puede elimar la tabla debido a que tiene elementos asosiados");
            }
        }

        function renderUpdateGenre($id){
            $genre = $this->genreModel->getOneGenre($id);
            $this->view->RenderUpdateGenre($genre);
        }

        function updateGenre(){
            if(isset($_REQUEST['newGenre']) && !empty($_REQUEST['newGenre'])){
                $id = $_REQUEST['id'];
                $genre = $_REQUEST['newGenre'];
                $itsUpdate = $this->genreModel->updateGenre($id,$genre);

                if($itsUpdate){
                    header("Location:". GENRE_TABLE);
                }
            }
            
        }
    }