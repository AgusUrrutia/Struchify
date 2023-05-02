{include file="templates/showHeader.tpl"}
{include file="templates/showNav.tpl"}
{include file="templates/forms/formFiltro.tpl"}
    <div class="container mt-4 scrollTabla" >

        <table class="table table-dark table-striped text-center">
            <thead class="position-sticky top-0">
                <tr>   
                    <th class="d-flex align-items-center justify-content-center" > - <input type="range" class="mt-1" id="volumen" max="100" min="0" step="1"> + </th>
                    <th>nombre</th>
                    <th>artista</th>
                    <th>album</th>
                    <th>genero</th>
                    <th>acciones</th>
                </tr>
            </thead>
            <tbody>
                    {foreach from=$musicForGenre item=$music}
                    
                        <tr class="fila" >
                            <td class="table-dark tdForm">
                            {include file="templates/audio.tpl"}
                                
                                <button class="btn btn-outline-primary botones_play" data-id="{$music->id_musica}" >▶️</button>
                                <button class="btn btn-outline-primary botones_pause botones_no" data-id="{$music->id_musica}" >⏸️</button>
                            </td>
                            
                            <td class="table-dark tdForm">{$music->nombreCancion|truncate:15}</td>
                            <td class="table-dark tdForm">{$music->artista|truncate:15}</td>
                            <td class="table-dark tdForm">{$music->album|truncate:15}</td>
                            <td class="table-dark tdForm">{$music->genero}</td>
                            <td class="table-dark d-flex justify-content-center tdForm">
                                <div class="w-75 p-3 d-flex justify-content-around">
                                {if isset($smarty.session.USER_ID)}
                                    <form action="changeValueFav" method="POST">
                                        {if isset($tablaTodos)}
                                            <input type="hidden" name="tablaTodos" value="{$tablaTodos}">
                                        {/if} 
                                         <input type="hidden" name="musica" value="{$music->id_musica}">
                                        {if $music->favorito == 0}                
                                                <button class="corazon">💜</button>
                                            {else}
                                                <button class="corazon">💚</button>
                                        {/if}
                                    </form>
                                    {if $smarty.session.USER_PERMISSIONS == 1}
                                        <a href="deleteSong/{$music->id_musica}" class="btn bg-danger btnBorrar">X</a>
                                        <a href="showFormUpdate/{$music->id_musica}" class="btn bg-warning btnModificar">modificar</a>
                                    {/if}
                                {/if}
                                    <a href="verMas/{$music->id_musica}" class="btn btn-primary">Ver mas</a>
                                </div>
                            </td>
                        </tr>
                    {/foreach}
            </tbody>
        </table>
    </div>
    <script src="js/reproductor.js"></script>

{include file="templates/showFooter.tpl"}