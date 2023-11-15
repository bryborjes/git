<?php

require_once('../db_conection.php');

class UserLogin
{
    private $userdb;

    public function __construct()
    {
        $this->userdb = new db_connection();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = json_decode($_POST['request'], true);

            $username = $data['username'];
            $password = $data['password'];
            
            $this->login($username, $password);
        }
    }

    public function login($username, $password)
    {
        $sql = "SELECT username, password FROM user WHERE username = '$username'";
        $result = $this->userdb->connect()->query($sql);
        $signIn = ["userFound" => false, "passwordMatch" => false];

        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {

                // password_verify
                if (($password == $row['password'])) {
                    $_SESSION['username'] = $row['username'];
                    $_SESSION['password'] = $row['password'];
                    $signIn = ["userFound" => true, "passwordMatch" => true];
                    break;
                } else {
                    $signIn = ["userFound" => true, "passwordMatch" => false];
                }
            }
        } else {
            $signIn = ["userFound" => false, "passwordMatch" => false];
        }
        $this->userdb->close();
        try {
            // Código principal que genera la respuesta JSON
            header('Content-Type: application/json');
            echo json_encode($signIn);
        } catch (Exception $e) {
            // Manejar cualquier error y devolver un JSON de error
            echo json_encode(['error' => $e->getMessage()]);
        }
    }
}

// Crear una instancia de la clase para activar el constructor
$userLogin = new UserLogin();
