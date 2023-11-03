<?php
function conection() {
    $host = '127.0.0.1';
    $user = 'rooter';
    $pass = '';
    $db = 'procastgent_note';
    $result = mysqli_connect($host, $user, $pass, $db);
    if (! $result)
        echo 'Error al conectar con el servidor'. mysqli_connect_error();
    else
        return $result;
}
conection();
?>