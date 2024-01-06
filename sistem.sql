-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2024 at 04:10 AM
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
  `inv_id` varchar(200) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `spek` varchar(200) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `qty` int(5) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `harga` int(10) NOT NULL,
  `vendor` varchar(200) NOT NULL,
  `waranty` varchar(200) NOT NULL,
  `renewal` varchar(200) NOT NULL,
  `kondisi` varchar(100) NOT NULL,
  `status` varchar(200) NOT NULL,
  `id_user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `inv_id`, `nama_barang`, `spek`, `deskripsi`, `qty`, `tgl_masuk`, `harga`, `vendor`, `waranty`, `renewal`, `kondisi`, `status`, `id_user`) VALUES
(15, 'MU00128\r\n', 'Isi Hydran Box\r\n', 'Isi Hydran Box\r\n', 'Selang dan Nozzle\r\n', 1, '2024-01-05', 10000, 'pt lain\r\n', '1 thn', 'thn dpn', 'ok', 'Menunggu Persetujuan', 6),
(16, 'MU00125', 'Aktip Speaker + bluetooth', 'Centronic', 'Centronic', 10, '2024-01-05', 100000, 'pt lain', '1 thn', 'tahun depan', 'ok', 'Sudah disetujui', 5),
(17, 'MU00115', 'Genset AE Portabel ', 'lampu 2 TL', 'Centronic', 2, '2024-01-06', 100000, 'pt lain', '5 thn', 'tahun depan', 'Finish Good', 'Sedang diproses', 6),
(18, 'MU00125', 'Genset AE Portabel ', 'Centronic', 'lampu 2 TL', 2, '2024-01-06', 100000, 'pt lain', '1 thn', 'tahun depan', 'ok', 'Menunggu Persetujuan', 5),
(19, 'MU00127', 'Lampu Penerangan', 'lampu 2 TL', 'Centronic', 10, '2024-01-06', 100000, 'pt lain', '1 thn', 'tahun depan', 'Finish Good', 'Menunggu Persetujuan', 5),
(20, 'MU00115', 'Aktip Speaker + bluetooth', 'Centronic', 'Centronic', 3, '2024-01-06', 100000, 'pt lain', '5 thn', 'tahun depan', 'ok', 'Menunggu Persetujuan', 1),
(21, 'MU00125', 'Genset AE Portabel ', 'Krissbow', 'Centronic', 1, '2024-01-06', 100000, 'pt lain', '1 thn', 'tahun depan', 'ok', 'Menunggu Persetujuan', 1);

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
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`) VALUES
(1, 'mabrur', '$2y$10$n3/GAvaY.GC9Im98tMiPJ.SOGyyxEq118iG5Dk2Ktkic2ez0r4rp6', 'mabrur@gmail.com'),
(4, 'asd', '$2y$10$blX1pnDPHKlsmrFDPgOoueVfDjDLOE9CFjrAoSXXUNjChpH3JYyQe', 'adit.hs85@gmail.com'),
(5, 'diki', '$2y$10$gFV/j7klER8P9lMSTQ7u7ODikYwW472MmhGj4x6z7zxQqAt7bgw6i', 'diki@gmail.com'),
(6, 'admin', '$2y$10$qkscpu7F2q6F8O9Vc8ud3OZDu9IvAp4N8eRYrYWVEhUKACfjJ54mG', 'admin@gmail.com');

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
  MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_emp` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
