<?php
    require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');

class genreView{
    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function showTableGenre($genres){
        $this->smarty->assign("genres",$genres);
        $this->smarty->display("templates/genre/showTableGenre.tpl");
    }

    function RenderUpdateGenre($genre){
        $this->smarty->assign("genre",$genre);
        $this->smarty->display("templates/genre/showUpdateGenre.tpl");
    }
}