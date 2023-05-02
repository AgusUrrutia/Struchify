<?php

    class genreModel{
        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=db_musica_tpe;charset=utf8', 'root', '');
        }

        function getAllGenre(){
            $query = $this->db->prepare('SELECT * FROM generos');
            $query->execute([]);
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

        function getOneGenre($id){
            $query = $this->db->prepare('SELECT * FROM generos WHERE id = ?');
            $query->execute([$id]);
            return $query->fetch(PDO::FETCH_OBJ); 
        }

        function addNewGenre($genre){
            $query = $this->db->prepare(' INSERT INTO generos (genero) VALUES (?);');
            $query->execute([$genre]);
            return $this->db->lastInsertId();
        }

        function validarGenre($id){
            $query = $this->db->prepare(
               'SELECT COUNT(m.id_musica) AS cant
                FROM musica m 
                INNER JOIN generos g
                ON m.id_genero_fk = g.id
                WHERE g.id = ?');
            $query->execute([$id]);
            $cant = $query->fetch(PDO::FETCH_OBJ);
            return $cant;
        }  

        function deleteGenre($id){
            $query = $this->db->prepare('DELETE FROM generos WHERE generos.id = ?');
            $query->execute([$id]);
        }

        function updateGenre($id,$genre){
            $query = $this->db->prepare('UPDATE generos SET genero = ? WHERE generos.id = ?');
            return $query->execute([$genre,$id]);
        }
    }