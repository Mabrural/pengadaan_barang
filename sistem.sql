-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2024 at 11:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(10) NOT NULL,
  `kode_pengajuan` bigint(30) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `spek` varchar(200) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `qty` int(5) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `status` varchar(200) DEFAULT NULL,
  `acc1` varchar(200) DEFAULT NULL,
  `acc2` varchar(200) DEFAULT NULL,
  `id_user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_pengajuan`, `nama_barang`, `spek`, `deskripsi`, `qty`, `tgl_pengajuan`, `status`, `acc1`, `acc2`, `id_user`) VALUES
(110, 110989191219281927, 'Ranjang Tingkat', 'lampu 2 TL', 'Centronic', 1, '2024-01-09', 'Sudah disetujui', 'admin', 'admin2', 1),
(111, 110989191219281928, 'Meja', 'lampu 2 TL', 'Centronic', 1, '2024-01-09', 'Sudah disetujui', 'admin', 'admin2', 1),
(112, 110989191219281929, 'Lampu Penerangan', 'Rak Piring', 'Centronic', 1, '2024-01-09', 'Sudah disetujui', 'admin', 'admin2', 1),
(113, 110989191219281930, 'Ranjang Tingkat', 'lampu 2 TL', 'Krissbow', 1, '2024-01-09', 'Sudah disetujui', 'admin', 'Almutaqi', 1);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_emp` int(10) NOT NULL,
  `nama_emp` varchar(40) NOT NULL,
  `jabatan` varchar(40) NOT NULL,
  `divisi` varchar(40) NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `level` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `level`) VALUES
(1, 'Muhammad Mabrur Al Mutaqi', '$2y$10$n3/GAvaY.GC9Im98tMiPJ.SOGyyxEq118iG5Dk2Ktkic2ez0r4rp6', 'mabrur@gmail.com', 'user'),
(4, 'admin3', '$2y$10$VMubzUN5RRdfWXenrTgc7uEA0DETX9hh3ht3GmqA4RjRtPKJW1chG', 'adit.hs85@gmail.com', 'admin3'),
(5, 'diki', '$2y$10$gFV/j7klER8P9lMSTQ7u7ODikYwW472MmhGj4x6z7zxQqAt7bgw6i', 'diki@gmail.com', 'user'),
(6, 'admin', '$2y$10$qkscpu7F2q6F8O9Vc8ud3OZDu9IvAp4N8eRYrYWVEhUKACfjJ54mG', 'admin@gmail.com', 'admin'),
(7, 'admin2', '$2y$10$f3bYLOoUrVdWx/2/BH///uiucCZYyGRJwXzXdn4ILSJnDRb6CJugW', 'mabrur@gmail.com', 'admin2'),
(8, 'Almutaqi', '$2y$10$BMIxPOs8JsfIAwZ2Abi11OXkH6LLrHiahR5.jKiQhTgxdeZqr4twy', 'Almutaqi@gmail.com', 'admin2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_emp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_emp` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
