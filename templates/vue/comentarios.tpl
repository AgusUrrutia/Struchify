   {literal}
        <div class="d-flex flex-column w-100 tarjetas" id="cajaComentarios">
    {/literal}
            <form class="input-group mb-3 d-flex align-items-baseline w-100" id="formComentarios" action="api/comentarios/canciones">   
                <input type="hidden" id="id_cancion" name="id_cancion" value="{$id_cancion}">  
                {if isset($smarty.session.USER_ID)} 
                    <input class="form-control m-3 d-flex text-center" type="text" placeholder="Publica un comentario" name="comentarios" id="input_comentario" required>
                    
                    <select class="form-select select_puntaje" name="puntajeComentarios">
                        {foreach from=$puntajes item=$puntaje key=$index}
                            <option value="{$index}">{$puntaje}</option>
                        {/foreach}
                    </select>
                    <button type="submit" class="btn btn-outline-secondary ms-3" id="btnEnviar">Enviar</button>
                {/if} 
            </form>
        {literal}
            <button v-on:click="order('ASC','id_comentarios')" class="btn btn-outline-primary text-center fs-5">⬆️</button>
            <button v-on:click="order('ASC','puntaje')" class="btn btn-outline-primary text-center mt-3 fs-5">⭐⬆️⭐</button>
        {/literal}
            <div class="d-flex justify-content-center align-items-center mt-5 w-100">
                <form action="filtroPuntaje " class="w-100 d-flex justify-content-center "> 
                    <select class="w-50 me-3 form-select" id="puntajeComentarios">
                        {foreach from=$puntajes item=$puntaje key=$index}
                            <option value="{$index}">{$puntaje}</option>
                        {/foreach}
                    </select>  
                    <button class="btn btn-outline-secondary" id="filtroComentarios">Filtrar</button>
                </form>
                
            </div>
        {literal}
               
                <div v-if="coments != ''" class="ScrollComentarios">
                    <ul v-for="coment in coments" class="mt-3 list-group list-group-horizontal me-3">
                        <li class="list-group-item list-group-item-action d-flex flex-wrap justify-content-between w-75 ms-5">
                            {{coment.comentario}}
                        </li>
                        <li class="list-group-item">
                            
                            <span class="spanComentario"> {{coment.puntaje}}⭐</span>
                        </li>
                    {/literal}

                    {if isset($smarty.session.USER_PERMISSIONS) && $smarty.session.USER_PERMISSIONS == 1}   
                        {literal}
                            <li class="list-group-item">
                                <button class="badge bg-danger rounded-pill" v-on:click="eliminar(coment.id_comentarios)" class="btn btn-danger btnEliminar">X</button> </li>        
                            </li>
                        {/literal}
                    {/if}
                    
                    {literal}

                    </ul>
                </div>
                <div v-else class="ScrollComentarios d-flex justify-content-center h-100">
                    <p class="align-self-center"> no hay comentarios en esta cancion </p>
                </div>
            
            
            <button v-on:click="order('DESC','puntaje')" class="btn btn-outline-primary fs-5 mb-3">⭐⬇️⭐</button>
            <button v-on:click="order('DESC','id_comentarios')" class="btn btn-outline-primary fs-5">⬇️</button>
        </div>
    {/literal}