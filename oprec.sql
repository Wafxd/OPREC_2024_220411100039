-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jul 2024 pada 07.07
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oprec`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `kode_barang` char(5) NOT NULL,
  `nama_barang` varchar(40) NOT NULL,
  `harga` int(10) NOT NULL,
  `stok` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `harga`, `stok`) VALUES
('BRG01', 'Monitor', 200000, 30),
('BRG02', 'Keyboard', 120000, 50),
('BRG03', 'Mouse', 50000, 40),
('BRG04', 'Speaker', 150000, 35),
('BRG05', 'Headphone', 80000, 60),
('BRG06', 'Proyektor', 350000, 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_petugas`
--

CREATE TABLE `tb_petugas` (
  `kode_petugas` char(5) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(250) NOT NULL,
  `nama_petugas` varchar(40) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_petugas`
--

INSERT INTO `tb_petugas` (`kode_petugas`, `email`, `password`, `nama_petugas`, `jenis_kelamin`) VALUES
('PTG01', 'kartika@gmail.com', '12345', 'Kartika Melani', 'Perempuan'),
('PTG02', 'ghani@gmail.com', '5eeb3a2490a2c11be5dc6294b5ea7c29cf09e1a2f5768ce61245549843e9c412', 'Ghani Mahendra', 'Laki-Laki'),
('PTG03', 'dina@gmail.com', '80a4109778cf5389682009f04031d6624b8298f150397196e4ffd4c1cab4c58d', 'Dina Hartati', 'Perempuan'),
('PTG04', 'harimurti@gmail.com', 'f3233d28b529ca6ae4d10b7a3545966af836e4e9515e265dc257e84ab726f8e3', ' Harimurti Kurniawan', 'Laki-Laki'),
('PTG05', 'anita@gmail.com', '000e02e40e441be798211aaf86d037bacd3dedbc8a6318ca5f9a5c72ad52ffbe', 'Anita Lestari', 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_rekapan`
--

CREATE TABLE `tb_rekapan` (
  `kode_petugas` char(5) NOT NULL,
  `kode_barang` char(5) NOT NULL,
  `tahun` year(4) NOT NULL,
  `total_pendapatan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tb_rekapan`
--

INSERT INTO `tb_rekapan` (`kode_petugas`, `kode_barang`, `tahun`, `total_pendapatan`) VALUES
('PTG01', 'BRG01', '2022', 2000000),
('PTG01', 'BRG03', '2022', 480000),
('PTG02', 'BRG04', '2022', 180000),
('PTG02', 'BRG05', '2022', 300000),
('PTG02', 'BRG06', '2023', 210000),
('PTG03', 'BRG01', '2024', 1800000),
('PTG03', 'BRG06', '2023', 1750000),
('PTG04', 'BRG02', '2022', 2400000),
('PTG04', 'BRG05', '2022', 960000),
('PTG05', 'BRG01', '2023', 220000),
('PTG05', 'BRG02', '2023', 7200000),
('PTG05', 'BRG04', '2022', 1200000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indeks untuk tabel `tb_petugas`
--
ALTER TABLE `tb_petugas`
  ADD PRIMARY KEY (`kode_petugas`);

--
-- Indeks untuk tabel `tb_rekapan`
--
ALTER TABLE `tb_rekapan`
  ADD PRIMARY KEY (`kode_petugas`,`kode_barang`),
  ADD KEY `kode_petugas` (`kode_petugas`,`kode_barang`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_rekapan`
--
ALTER TABLE `tb_rekapan`
  ADD CONSTRAINT `tb_rekapan_ibfk_1` FOREIGN KEY (`kode_petugas`) REFERENCES `tb_petugas` (`kode_petugas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_rekapan_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
