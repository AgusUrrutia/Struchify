<div class="container modificar">
    <form action="updateMusic" method="POST" enctype="multipart/form-data">
        <legend>Usted quiere modificar la cancion "{$nombre|upper}"</legend>
            <div class="mb-3">
                <input type="hidden" name="id" value="{$id}" class="form-control">
                <div class="pt-3">
                    <label class="form-label">Nombre de la cancion</label>
                    <input type="text" name="nombre" class="form-control formulario" value="{$nombre}" required>
                </div>
                <div class="pt-3">
                    <label class="form-label">Nombre del artista</label>
                    <input type="text" name="artista" class="form-control formulario" value="{$artista}" required>
                </div>
                <div class="pt-3">
                    <label class="form-label">Nombre del album</label>
                    <input type="text" name="album" class="form-control formulario" value="{$album}" required>
                </div>
                <div class="pt-3 w-5">
                    <label class="form-label">año de la cancion</label>
                    <input type="date" name="anio" class="form-control formulario" value="{$anio}" required>
                </div>
                <div class="pt-3 w-5">
                    <label class="form-label">imagen de la cancion</label>
                    <input type="file" name="input_name" class="form-control formulario" value="{$imagen}">
                </div>
                <div class="pt-3 w-5">
                    <label class="form-label">url de cancion</label>
                    <input type="text" name="url_cancion" class="form-control formulario" value="{$audio}">
                </div>

            </div>
            <div class="mb-3">
                <label class="form-label">Genero de la cancion</label>
                <select name="genre" class="form-select">
                    <option disabled selected value="false">Seleccione Genero</option>
                    {foreach from=$genres item=$genre}
                        <option value="{$genre->id}">{$genre->genero}</option>
                    {/foreach}
                </select>
            </div>

        <button type="submit" class="btn btn-primary">Modificar</button>
    </form>
</div>
