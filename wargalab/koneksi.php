<?php

$host = "localhost";
$user = "root";
$pw = "";
$dbname = "oprec";

$koneksi = mysqli_connect($host, $user, $pw, $dbname);


function query($query) {
    global $koneksi;
    $result = mysqli_query($koneksi, $query);
    $rows = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $rows[] = $row;
    }
    return $rows;
}

?>