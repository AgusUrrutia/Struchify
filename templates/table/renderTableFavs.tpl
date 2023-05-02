
<h1 class="text-center text-light favoritos">💚 Favoritos 💚</h1> 
<div class="container mt-4" id="global">
    
    <table class="table table-dark table-striped text-center">
        <thead class="position-sticky top-0">
            <tr>
                <th>nombre</th>
                <th>artista</th>
                <th>album</th>
                <th>genero</th>
                <th>acciones</th>
            </tr>
        </thead>
        <tbody>
                {foreach from=$songs item=$music}
                        <tr class="fila">
                        <td class="table-dark tdForm">{$music->nombreCancion|truncate:15}</td>
                        <td class="table-dark tdForm">{$music->artista|truncate:15}</td>
                        <td class="table-dark tdForm">{$music->album|truncate:15}</td>
                        <td class="table-dark tdForm">{$music->genero}</td>
                        <td class="table-dark d-flex justify-content-center tdForm">
                            <div class="w-75 p-3 d-flex justify-content-around">
                            {if isset($smarty.session.USER_ID)}
                                <form action="changeValueFav" method="POST">
                                    <input type="hidden" name="musica" value="{$music->id_musica}">
                                    <button class="corazon">💚</button>
                                </form>
                                    {if $smarty.session.USER_PERMISSIONS == 1}
                                        <a href="delete/{$music->id_musica}" class="btn bg-danger btnBorrar">X</a>
                                        <a href="update/{$music->id_musica}" class="btn bg-warning btnModificar">modificar</a>
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