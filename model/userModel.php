<?php
    class userModel{
        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=db_musica_tpe;charset=utf8', 'root', '');
        }

        function getUser($user){
            $query = $this->db->prepare('SELECT * FROM usuarios WHERE usuario = ?');
            $query->execute([$user]);
            return $query->fetch(PDO::FETCH_OBJ);
        }
        
        function register($user,$passwordEncripted){
            $query = $this->db->prepare('INSERT INTO `usuarios` (`usuario`, `contraseña`) VALUES (?,?)');
            $query->execute([$user,$passwordEncripted]);
        }

        function showAll(){
            $query = $this->db->prepare('SELECT * FROM `usuarios`');
            $query->execute([]);
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

        function deleteUser($idUser){
            $query = $this->db->prepare('DELETE FROM `usuarios` WHERE id_usuario = ?');
            $query->execute([$idUser]);
        }

        function changeAdmin($idUser,$permiso){
            $query = $this->db->prepare('UPDATE usuarios SET permiso = ? WHERE id_usuario = ?');
            $query->execute([$permiso,$idUser]);
        }

        function getAllAdmin(){
            $query = $this->db->prepare('SELECT COUNT(id_usuario) AS cant FROM `usuarios` WHERE permiso = 1');
            $query->execute([]);
            return $query->fetch(PDO::FETCH_OBJ);
        }

        function isAdmin($idUser){
            $query = $this->db->prepare('SELECT * FROM `usuarios` WHERE permiso = 1 && id_usuario = ?');
            $query->execute([$idUser]);
            return $query->fetch(PDO::FETCH_OBJ);
        }

        function getPermiso($idUser){
            $query = $this->db->prepare('SELECT permiso FROM `usuarios` WHERE id_usuario = ?');
            $query->execute([$idUser]);
            return $query->fetch(PDO::FETCH_OBJ);
        }
        
    }