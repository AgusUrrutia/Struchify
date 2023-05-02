<?php 

    class favoriteModel {
        private $db;

        function __construct(){
            $this->db = new PDO('mysql:host=localhost;'.'dbname=db_musica_tpe;charset=utf8', 'root', '');
        }

        function changeValueFav($id,$fav){
            $query = $this->db->prepare('UPDATE musica SET favorito = ? WHERE musica.id_musica = ?');
            $query->execute([$fav,$id]);
            return $query->fetch(PDO::FETCH_OBJ); 
        }

        function getAllSongsFavs($fav){
            $query = $this->db->prepare(
           'SELECT m.*, g.genero
            FROM musica m
            INNER JOIN generos g
            ON m.id_genero_fk = g.id
            WHERE m.favorito = ?');
            $query->execute([$fav]);
            return $query->fetchAll(PDO::FETCH_OBJ);
        }
    }