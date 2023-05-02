<div class="modal fade" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1" id="exampleModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
       
        <h5 class="modal-title" id="exampleModalLabel">Iniciar Sesion</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      
      </div>
      <div class="modal-body">
        
        <form action="login" method="POST">

            <div class="mb-3">
                <label for="recipient-name" class="col-form-label">Usuario:</label>
                <input type="text" name="user" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="message-text" class="col-form-label">Contraseña:</label>
                <input type="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary">Iniciar Sesion</button>
        </form>

      </div>
      <div class="modal-footer">
        
        <p>Aún no estas registrado?</p>
        <button type="button" class="btn btn-secondary" data-bs-target="#registerModal" data-bs-toggle="modal">Registrate</button>
      
      </div>
    </div>
  </div>
</div>
