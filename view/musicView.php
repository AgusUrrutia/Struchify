<?php
    require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');
    
class musicView{
    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function showHome($genre){
        $this->smarty->assign("genres", $genre);
        $this->smarty->display("templates/showHome.tpl");
    }

    function showTable($musicForGenre,$genre, $idGenero, $tablaTodos=NULL){
        // para mostrar los generos en el nav
        $this->smarty->assign("genres", $genre);
        // para usarlo en el form filtro
        $this->smarty->assign("idGenero", $idGenero);
        if($tablaTodos){
           $this->smarty->assign("tablaTodos", $tablaTodos); 
        }
        $this->smarty->assign("musicForGenre", $musicForGenre);

        $this->smarty->display("templates/table/showTable.tpl");
    }

    

    function musicUpdate($nombre,$artista,$album,$anio,$genres,$imagen,$id,$audio){
        $this->smarty->assign("nombre", $nombre);
        $this->smarty->assign("artista", $artista);
        $this->smarty->assign("album", $album);
        $this->smarty->assign("anio", $anio);
        $this->smarty->assign("genres", $genres);
        $this->smarty->assign("imagen", $imagen);
        $this->smarty->assign("id", $id);
        $this->smarty->assign("audio", $audio);

        $this->smarty->display("templates/forms/formUpdateMusic.tpl");
    }

    function showFormAddSong($genres){
        $this->smarty->assign("genres", $genres);
        $this->smarty->display("templates/forms/showFormAddSong.tpl");
    }

    function showError($msg){
        $this->smarty->assign("msg",$msg);
        $this->smarty->display("templates/showError.tpl");
    }

    function showMoreInfoMusic($cancion,$artista,$album,$anio,$genero,$imagen,$id_genero,$puntajes,$id){
        $this->smarty->assign("cancion",$cancion);
        $this->smarty->assign("artista",$artista);
        $this->smarty->assign("album",$album);
        $this->smarty->assign("anio",$anio);
        $this->smarty->assign("genero",$genero);
        $this->smarty->assign("imagen",$imagen);
        $this->smarty->assign("id_genero",$id_genero);
        $this->smarty->assign("puntajes",$puntajes);
        $this->smarty->assign("id_cancion",$id);
        
        $this->smarty->display("templates/showMoreInfoMusic.tpl");
    }
}
