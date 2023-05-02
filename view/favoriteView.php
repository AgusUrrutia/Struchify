<?php
require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');

class favoriteView{
    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function showTableFavs($favsSongs,$genres){
        $this->smarty->assign("songs", $favsSongs);
        $this->smarty->assign("genres", $genres);
        $this->smarty->display("templates/table/showTableFavs.tpl");
    }
        
}