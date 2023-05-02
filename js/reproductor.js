"use strict";
let botones_play = document.querySelectorAll(".botones_play");

botones_play.forEach(btn => {
    console.log(btn.dataset.id);
    btn.addEventListener('click',()=>{
        reproducir(btn.dataset.id);

    })
    
});

let botones_pause = document.querySelectorAll(".botones_pause");

botones_pause.forEach(btn => {
    console.log(btn.dataset.id);
    btn.addEventListener('click',()=>{
        pausar(btn.dataset.id);
    })
    
});

function reproducir(id){

    

    botones_play.forEach(btn => {
        if (btn.dataset.id == id) {
            btn.classList.add('botones_no');
        }
    });
    

    botones_pause.forEach(btn => {
        if (btn.dataset.id == id) {
            btn.classList.remove('botones_no');
        }
    });

    let audio = document.querySelector('#play'+id);
    audio.play();

    let volumen= document.getElementById('volumen');
    volumen.addEventListener('mousemove',()=>{
        audio.volume = volumen.value / 100;
    });

    
    

}


// function setVolumen(audio,volumen){
//     audio.volume = volumen.value / 100;
//     }

function pausar(id){

    botones_play.forEach(btn => {
        if (btn.dataset.id == id) {
            btn.classList.remove('botones_no');
        }
    });

    botones_pause.forEach(btn => {
        if (btn.dataset.id == id) {
            btn.classList.add('botones_no');
        }
    });

    let audio = document.querySelector('#play'+id);
    audio.pause();
}

let audios = document.querySelectorAll('.audios');





