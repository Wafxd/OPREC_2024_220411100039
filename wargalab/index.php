<?php

include "koneksi.php";

$query = query("SELECT * FROM tb_rekapan INNER JOIN tb_barang using(kode_barang) INNER JOIN tb_petugas USING(kode_petugas)");

if (isset($_GET["submit"])) {
    $awal = $_GET["awal"];
    $akhir = $_GET["akhir"];

    echo "<script>alert('filter');window.location.href = 'index.php?awal=$awal&akhir=$akhir'</script>";
} else {
    $awal = "";
    $akhir = "";
}


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Data Rekapan barang</h1>
    <form method="get">
        <table>
            <tr>
                <td><label for="awal">Dari Tahun</label></td>
                <td><input type="YEAR" name="awal" id=""></td>
            </tr>
            <tr>
                <td><label for="akhir">Sampai tahun</label></td>
                <td><input type="YEAR" name="akhir" id=""></td>
            </tr>
            <tr>
                <td>
                    <button type="submit" name="submit">
                        Submit
                    </button>
                </td>
                
            </tr>
        </table>
    </form>
    <table>
        <tr>
            <th>NO</th>
            <th>Nama Petugas</th>
            <th>Nama Barang</th>
            <th>Tahun</th>
            <th>Total Pendapatan</th>
        </tr>
        <?php
            $n = 0;
            foreach ($query as $all) {
                $n += 1; 
            ?>
        <tr>
            
            <td><?= $n ?></td>
            <td><?= $all["nama_petugas"] ?></td>
            <td><?= $all["nama_barang"] ?></td>
            <td><?= $all["tahun"] ?></td>
            <td><?= $all["total_pendapatan"] ?></td>
            
        </tr>
        <?php
            }
            ?>
    </table>
</body>
</html>