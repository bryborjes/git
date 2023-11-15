<?php
require_once("../db_conection.php");

class SignUp
{
    private $userdb;

    public function __construct()
    {
        $this->userdb = new db_connection();
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $data = json_decode($_POST['request'], true);
            $username = $data['username'];
            $password = $data['password'];
            $email = $data['email'];

            $this->signUp($username, $password, $email);
        }
    }

    public function signUp($username, $password, $email)
    {
        $sql = "SELECT * FROM user WHERE username = '$username'";
        $result = $this->userdb->connect()->query($sql);
        $request = ["pass" => false];

        if ($result->num_rows > 0)
        {
            $request = ["pass" => false];
        }
        else
        {
            $sql = "INSERT INTO users (username, password, email) VALUES ('$username', '$password', '$email')";
            $result = $this->userdb->connect()->query($sql);
            $request = ["pass" => true];
        }
        $this->userdb->close();
        try {
            // Código principal que genera la respuesta JSON
            header('Content-Type: application/json');
            echo json_encode($request);
        } catch (Exception $e) {
            // Manejar cualquier error y devolver un JSON de error
            echo json_encode(['error' => $e->getMessage()]);
        }
    }
}

// Crear una instancia de la clase para activar el constructor

$signup = new SignUp();
?>