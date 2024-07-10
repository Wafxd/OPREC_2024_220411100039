<?php

session_start();

include "koneksi.php";

if (isset($_POST["submit"])) {
    $email = $_POST["email"];
    $pass = $_POST["password"];
    $pw = $pass;

    $query = query("SELECT * FROM tb_petugas WHERE email = '$email' AND password = '$pw'");

    if ($query) {
        $username = query("SELECT * FROM tb_petugas WHERE email = '$email' AND password = '$pw'")[0];
        $user = $username["nama_petugas"];
        $uss = $_SESSION[$user];
        echo "<script>alert(Berhasil Login);window.location.href = 'index.php';</script>";
    } else {
        echo "<script>alert(gagal Login);window.location.href = 'login.php';</script>";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h1>LOGIN PETUGAS</h1>
    <form method="post">
        <table>
            <tr>
                <td><label for="email">Email</label></td>
                <td><input type="email" name="email" required></td>
            </tr>
            <tr>
                <td><label for="password">Password</label></td>
                <td><input type="password" name="password" required></td>
            </tr>
        </table>
        <button type="submit" name="submit">
            Login
        </button>
    </form>
</body>
</html>