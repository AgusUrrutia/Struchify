{include file="templates/showHeader.tpl"}

<div class="container">
    <table class="table table-dark table-striped text-center">
        <thead class="position-sticky top-0">
            <tr>
                <th>Id Usuario</th>
                <th>nombre</th>
                <th>administrar</th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$allUsers item=$usuario}
                {if $usuario->usuario != $smarty.session.USER_EMAIL}
                    <tr class="fila">
                        <td class="table-dark tdForm" >{$usuario->id_usuario}</td>
                        <td class="table-dark tdForm">{$usuario->usuario}</td>
                        <td class="table-dark tdForm">
                            <a href="deleteUser/{$usuario->id_usuario}" class="btn btn-danger btnBorrar">Eliminar usuario</a>
                            {if $usuario->permiso == 0}
                                    <a href="doAdmin/{$usuario->id_usuario}" class="btn btn-primary">Hacer admin</a>  <!-- (>‿◠)✌ -->  
                                {else}
                                    <a href="removeAdmin/{$usuario->id_usuario}" class="btn btn-secondary">Quitar admin</a>
                            {/if}
                        </td>
                    </tr>
                {/if}
            {/foreach}
        </tbody>
    </table>
</div>





{include file="templates/showFooter.tpl"}