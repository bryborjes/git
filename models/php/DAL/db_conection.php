<?php
class db_connection
{
    public static function connect()
    {
        $data = array('127.0.0.1', 'root', '', 'procastgent_note');
        $conn = new mysqli($data[0], $data[1], $data[2], $data[3]);

        if ($conn->connect_error) {
            die('Error connecting to database: ' . $conn->connect_error);
        }

        return $conn;
    }

    public static function close()
    {
        mysqli_close(self::connect());
    }
}

?>