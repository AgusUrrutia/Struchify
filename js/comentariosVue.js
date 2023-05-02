"use strict"
const URL = "api/comentarios";

let app = new Vue({
    el: "#cajaComentarios",
    data: {
        coments: [],
    },
    methods:{
        eliminar: eliminar, 
        order: orderComents,
    },
});



let formulario = document.querySelector("#formComentarios");
formulario.addEventListener("submit", add);

let idCancion = document.querySelector("#id_cancion").value;

let btnFiltroComentarios = document.querySelector("#filtroComentarios");
btnFiltroComentarios.addEventListener("click", filtroComentarios);

let comentario_input = document.querySelector("#input_comentario");

async function orderComents(order,filtro){
    console.log(order);
    try {
        let response = await fetch(URL + "/canciones/" + idCancion + "/order?filtro="+filtro+"&order="+order);
        if (response.ok) {
            let promesa = await response.json();
            app.coments = promesa;
            console.log(promesa);
        }
    } catch (e) {
        console.log(e);
    }
}

async function getComents(){
    try {
        let response = await fetch(URL+"/canciones/"+idCancion);
        if(response.ok){
            let promesa = await response.json(); 
            app.coments = promesa ;
           
        }  
    } catch(e) {
        console.log(e);
    }
    
}

async function eliminar(id){
    console.log(id);
    try {
        let response = await fetch(URL+"/"+id, {
            "method": "DELETE"
        });
        if (response.ok) {
            for (let i = 0; i < app.coments.length; i++) {
                if(app.coments[i].id_comentarios == id){
                app.coments.splice(i,1);
                }
            }
        }
    } catch (e) {
        console.log(e);
    }
}

async function add(e){
    e.preventDefault();

    let form = new FormData(formulario);
    if (form.get("comentarios") == "") {
        console.log("campo vacio");
    }else{
        let comentario = {
            "comentario": form.get("comentarios"),
            "puntaje": form.get("puntajeComentarios"),
            "id_cancion": form.get("id_cancion")
        }

        try{
            let resp = await fetch(URL+"/canciones/", {
                "method": "POST",
                "headers": { "Content-type": "application/json" },
                "body": JSON.stringify(comentario)
            });       
            if (resp.ok) {
                console.log("se agrego comentario correctamente");
                getComents();
                comentario_input.value = "";
            }
        }catch (error) {
            console.log("error catch");
        }
    }
}
 

async function filtroComentarios(e){
    e.preventDefault();
    console.log("entro");
    let puntaje = document.querySelector("#puntajeComentarios"); 
    try {
        let response = await fetch(URL+"/canciones/" + idCancion +"/filtro/" + puntaje.value);
        if(response.ok){
            let promesa = await response.json(); 
            app.coments = promesa ;
        }  
    } catch(e) {
        console.log(e);
    }
} 

getComents();