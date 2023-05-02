<div class="container-fluid justify-content-center w-50 mt-4 d-flex">
        <form action="filtro" method="POST" class="d-flex w-50">
            <input type="hidden" name="idGenero" value="{$idGenero}">
            <input class="form-control me-2" name="filtro" type="search" placeholder="Search">
            <button type="submit" class="btn btn-secondary" >Buscar</button>
        </form>
        
        {if isset($smarty.session.USER_PERMISSIONS) && $smarty.session.USER_PERMISSIONS == 1}
            <a href="showFormAddSong" class="btn btn-secondary ms-1" >Agregar</a>
        {/if}
</div>