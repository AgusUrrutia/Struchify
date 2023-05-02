<div class="modal fade" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1" id="registerModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        
        <h5 class="modal-title" id="exampleModalLabel">Registrate</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        
        </div>
        <div class="modal-body">
          
          <form action="register" method="POST">
              <div class="mb-3">
                  <label for="recipient-name" class="col-form-label">Elige tu nombre de Usuario:</label>
                  <input type="text" name="user" class="form-control" required>
              </div>
              <div class="mb-3">
                  <label for="message-text" class="col-form-label">Escribe tu contraseña:</label>
                  <input type="password" name="password" class="form-control" required>
              </div>
                <button type="submit" class="btn btn-primary">Registrarse</button>
          </form>

        </div>
    </div>
  </div>
</div>
