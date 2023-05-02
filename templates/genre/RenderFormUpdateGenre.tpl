<div class="container d-flex-colum w-10">
    <div class="container-fluid justify-content-center w-50 mt-4">
        <form action="updateGenre" method="POST" class="d-flex" >
            <input type="hidden" name="id" value="{$genre->id}">
            <input type="text" name="newGenre" value ="{$genre->genero}" class="form-control w-100 m-2">
            <button type="submit" class="btn bg-info m-2 align-items-center ">Agregar</button>
        </form>
    </div>
</div>