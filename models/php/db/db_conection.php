<?php
function start_conection()
{
    $host = '127.0.0.1';
    $user = 'root';
    $pass = '';
    $db = 'procastgent_note';
    $result = mysqli_connect($host, $user, $pass, $db);
    if (!$result)
        echo '<script>alert(\'Error al conectar con el servidor\')</script>' . mysqli_connect_error();
    else
        return $result;
}

function exit_conection($db)
{
    mysqli_close($db);
}
?>