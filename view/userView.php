<?php
    require_once('libs/lib/smarty-3.1.39/libs/Smarty.class.php');

class userView{
    private $smarty;

    function __construct(){
        $this->smarty = new Smarty();
    }

    function showError($msg){
        $this->smarty->assign("msg", $msg);
        $this->smarty->display("templates/showError.tpl");
    }

    function showAllUsers($allUsers){
        $this->smarty->assign("allUsers", $allUsers);
        $this->smarty->display("templates/table/showTableUsers.tpl");
    }
}