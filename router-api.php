<?php
require_once('libs/lib/Router.php');
require_once('api/api-comentariosController.php');

$router = new Router();

$router->addRoute('comentarios/canciones/:ID', 'GET', 'ApiComentariosController','getAll');
$router->addRoute('comentarios/:ID', 'DELETE', 'ApiComentariosController','delete');
$router->addRoute('comentarios/canciones', 'POST', 'ApiComentariosController','add');
$router->addRoute('comentarios/canciones/:ID/order', 'GET', 'ApiComentariosController','order');
$router->addRoute('comentarios/canciones/:ID/filtro/:ESTRELLAS', 'GET', 'ApiComentariosController','filtroPuntaje');

$resource = $_GET['resource'];
$method = $_SERVER['REQUEST_METHOD'];
$router->route($resource,$method);

