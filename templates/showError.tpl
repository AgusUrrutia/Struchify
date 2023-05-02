{include file="templates/showHeader.tpl"}
    <div class="container">
        <div class="card text-center text-white bg-dark mb-3">
            <div class="card-header">
                <h1>Ups Algo Salio Mal 😕</h1>
            </div>
            <div class="card-body">
                <h4 class="error mb-5">{$msg|capitalize}</h4>
                <a href="home" class="btn btn-outline-info">Volver al inicio</a>
            </div>
        </div>
    </div>
{include file="templates/showFooter.tpl"}
