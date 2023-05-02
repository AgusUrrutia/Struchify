<!DOCTYPE html>
    <html lang="en">
    <head>
        <base href="{BASE_URL}">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" class="icono" href="img/logo2.png">
        <title>StruchiFy</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
    <div class="contenedorHeader">
        <div class="logopag">
            <a href="home"><img src="img/logo2.png" alt="imagen del logo" class="icono"></a>
            <a href="home"><h1 class="struchify">StruchiFy</h1></a> 
        </div>
        <div>
            {if isset($smarty.session.USER_ID)} 
                <div class="a">
                    {if $smarty.session.USER_PERMISSIONS == 1}
                        <a href="AdministrarGeneros" class="btn btn-secondary">Administrar Generos</a>
                        <a href="showUsers" class="btn btn-secondary">Administrar usuarios</a>
                    {/if}
                    <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#contactoModal" data-bs-whatever="@getbootstrap">contactanos</button>
                    <a class="btn btn-danger" href="logout">{$smarty.session.USER_EMAIL} Logout</a>
                    
                </div>
            {else}
                <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#contactoModal" data-bs-whatever="@getbootstrap">contactanos</button>
                <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#registerModal" data-bs-whatever="@getbootstrap">register</button>
                <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@getbootstrap">login</button>
            {/if}
        </div>
    </div>

{include file="templates/modals/showModalLogin.tpl"}
{include file="templates/modals/showModalRegister.tpl"}
{include file="templates/modals/showModalContacto.tpl"}