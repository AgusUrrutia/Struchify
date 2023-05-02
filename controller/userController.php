<?php
    require_once('model/userModel.php');
    require_once('view/musicView.php');
    require_once('view/userView.php');
    require_once 'helpers/auth.helper.php';

    class UserController{
        private $userModel;
        private $view;
        private $authHelper;

        function __construct(){
            $this->userModel=new UserModel();
            $this->view=new UserView();
            $this->authHelper = new AuthHelper();
        }

        public function login() {
            if (!empty($_POST['user']) && !empty($_POST['password'])) {
                $user = $_POST['user'];
                $password = $_POST['password'];

                // Obtengo el usuario de la base de datos
                $user = $this->userModel->getUser($user);

                // Si el user$user existe y las contraseñas coinciden
                if ($user && password_verify($password, $user->contraseña)) {
                    // armo la sesion del user$user
                    $this->authHelper->login($user);
                    header("Location: " . BASE_URL);
                } else {
                    $this->view->showError("Usuario o contraseña inválida");
                }
            }else{
                header("Location: " . BASE_URL);
            }
        }

        public function register(){
            if (!empty($_POST['user']) && !empty($_POST['password'])) {
                $user = $_POST['user'];
                $password = $_POST['password'];

                $passwordEncripted = password_hash($password,PASSWORD_BCRYPT);
                // Consulto si el usuario existe      
                $loged = $this->userModel->getUser($user);
                if (!empty($loged)) {
                    $this->view->showError("Éste usuario ya está registrado!!!");
                }else{
                // Registro al usuario                 
                  $this->userModel->register($user,$passwordEncripted);
                  $loged = $this->userModel->getUser($user);

                  if ($loged) {
                    // Genero la session al usuario        
                    $this->authHelper->login($loged);
                    header("Location: " . BASE_URL);
                  }
                
                }

            }else{
                header("Location: " . BASE_URL);
            }
        }

        public function deleteUser($idUser){
            if (!($_SESSION['USER_PERMISSIONS'] == 1)) {
                $this->view->showError('No contiene permiso para realizar esta accion!!!');
            }else{
                $cantAdmins = $this->userModel->getAllAdmin();
                $isAdmin = $this->userModel->isAdmin($idUser);

                // || $cantAdmins->cant == 1
                if (!$isAdmin){
                    if (isset($idUser) && !empty($idUser)) {
                        $this->userModel->deleteUser($idUser);
                        header("Location: " .USER_TABLE);    
                    }else{
                        $this->view->showError("No existe este usuario!!!");
                    }
                }else{
                    if ($cantAdmins->cant == 1) {
                        $this->view->showError("No se puede eliminar el ultimo admin!!!");
                    }else{
                        if (isset($idUser) && !empty($idUser)) {
                            $this->userModel->deleteUser($idUser);
                            header("Location: " .USER_TABLE);    
                        }else{
                            $this->view->showError("No existe este usuario!!!");
                        }
                    }
                }
            }
        }

        function showAll(){
            if (!($_SESSION['USER_PERMISSIONS'] == 1)) {
                $this->view->showError('No contiene permiso para realizar esta accion!!!');
            }else{
                $allUsers = $this->userModel->showAll();

                if (!empty($allUsers)) {
                    $this->view->showAllUsers($allUsers);
                }
            }
        }

        function changeAdmin($idUser){
            if (!($_SESSION['USER_PERMISSIONS'] == 1)) {
                $this->view->showError('No contiene permiso para realizar esta accion!!!');
            }else{
                if (isset($idUser) && !empty($idUser)) {
                    $user = $this->userModel->getPermiso($idUser);
                    if ($user->permiso == 1) {
                        $this->userModel->changeAdmin($idUser,0);
                    }else{
                        $this->userModel->changeAdmin($idUser,1);
                    }
                    header("Location: " .USER_TABLE);
                }else{
                    $this->view->showError("No existe este usuario!!!");
                }
            }
        }

        function logout(){
            $this->authHelper->logout();
        }

    }