-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2024 at 12:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
(116, 112345232112123, 'Aktip Speaker + bluetooth', 'lampu 2 TL', 'Krissbow', 2, '2024-01-09', 'Sudah disetujui', 'admin', 'admin2', 10),
(117, 112345232112124, 'PC ASUS ROG ', 'Intel Core i7-10350 RAM 32GB VGA NVIDIA RTX 4030TI', 'Untuk dijadikan server lokal', 1, '2024-01-09', 'Sudah disetujui', 'Henda Kurniawan', 'Aldi Taher', 9),
(118, 112345232112125, 'Genset AE Portabel ', 'Genset AE Portabel ', 'Krissbow', 1, '2024-01-08', 'Sudah disetujui', 'Henda Kurniawan', 'Aldi Taher', 9),
(119, 112345232112126, 'PC ALL IN ONE', 'Intel Core i5-9400 RAM 8GB DD5 ', 'untuk kebutuhan administrasi kantor', 1, '2024-01-10', 'Sudah disetujui', 'Henda Kurniawan', 'Aldi Taher', 10),
(120, 112345232112127, 'Mouse Pad', '-', 'Merk Logitech', 1, '2024-01-10', 'Sudah disetujui', 'Henda Kurniawan', 'Aldi Taher', 10);

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

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_emp`, `nama_emp`, `jabatan`, `divisi`, `status`) VALUES
(1, 'Muhammad Mabrur Al Mutaqi', 'Staff IT', 'IT', 'Aktif'),
(2, 'Diki Fadhilah', 'Staff Admin', 'Finance', 'Aktif'),
(3, 'Henda Kurniawan', 'Staff Purchasing', 'Finance', 'Aktif'),
(4, 'Aldi Taher', 'Admin Officer', 'Office', 'Aktif'),
(5, 'Andre Yogi', 'Direktur Operasional', 'Office', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `level` varchar(200) NOT NULL,
  `id_emp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `email`, `level`, `id_emp`) VALUES
(9, 'mabrur', '$2y$10$IFfpvdyJyFuR6GCsvs8hje.Uy8gP41N0B9GijjPs5sgh8xGtnR56u', 'admin@gmail.com', 'user', 1),
(10, 'diki', '$2y$10$qk3IdIT8A/oiu9lIaEGW/u/CDMgZeTT91wu4F4ww/f1P.EU2.gmpy', 'diki@gmail.com', 'user', 2),
(11, 'admin', '$2y$10$jgzkM0mK8zHgZlhC7nuTjepzouD91p6z0PaZPp3aymL/BabwifU4e', 'admin@gmail.com', 'admin', 3),
(12, 'admin2', '$2y$10$lhYFeDPMGWrR9.dVWm.NNe9THUiW.MOStkt/vpHnwrpjvBs9sE3yu', 'admin2@gmail.com', 'admin2', 4),
(13, 'admin3', '$2y$10$0NepItZYt5bIyKOvPQhRpuGxb..ykUBm2BNLeeQ6iMNPb106CByli', 'admin3@gmail.com', 'admin3', 5);

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
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_emp` (`id_emp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_emp` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
