-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2024 at 12:02 PM
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
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id_absen` int(10) NOT NULL,
  `no_absen` int(10) NOT NULL,
  `id_emp` int(10) NOT NULL,
  `id_lantai` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`id_absen`, `no_absen`, `id_emp`, `id_lantai`) VALUES
(8, 5, 17, 2),
(9, 6, 14, 2);

-- --------------------------------------------------------

--
-- Table structure for table `akses_pintu`
--

CREATE TABLE `akses_pintu` (
  `id_akses` int(10) NOT NULL,
  `no_akses` int(10) NOT NULL,
  `id_emp` int(10) NOT NULL,
  `id_lantai` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akses_pintu`
--

INSERT INTO `akses_pintu` (`id_akses`, `no_akses`, `id_emp`, `id_lantai`) VALUES
(9, 2, 10, 2),
(10, 1, 8, 1),
(11, 2, 8, 2),
(12, 3, 8, 2);

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

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_emp` int(10) NOT NULL,
  `nama_emp` varchar(40) NOT NULL,
  `jabatan` varchar(40) NOT NULL,
  `divisi` varchar(40) NOT NULL,
  `status` varchar(30) NOT NULL,
  `gambar` varchar(200) NOT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jenis_kelamin` varchar(30) DEFAULT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `status_pernikahan` varchar(30) DEFAULT NULL,
  `nik` varchar(30) DEFAULT NULL,
  `npwp` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_emp`, `nama_emp`, `jabatan`, `divisi`, `status`, `gambar`, `tgl_lahir`, `jenis_kelamin`, `alamat`, `no_hp`, `email`, `status_pernikahan`, `nik`, `npwp`) VALUES
(5, 'Andre Yogi', 'Staff Operasional', 'Office', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(8, 'Raden Sulaiman Sanjeev', 'Direktur Utama', 'BSD', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(9, 'Regina', 'Direktur Keuangan', 'BSD', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(10, 'James Taju', 'Direktur HRD', 'HRM', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(11, 'Bambang Wahyudi', 'Direktur Operasional', 'Manager', 'Aktif', '65a4f45ead15a.png', '0000-00-00', 'Laki-laki', '', '', '', 'Belum Menikah', NULL, ''),
(12, 'Michael Kawilarang', 'Kepala Cabang', 'Manager', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(13, 'Gahral', 'Kepala Shipping', 'Shipping', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(14, 'Elis', 'Finance', 'Finance', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(15, 'Rika', 'Staff Shipping', 'Shipping', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(16, 'Krisno', 'Staff Shipping', 'Shipping', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(17, 'Niken', 'Staff Finance', 'Finance', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(18, 'Robby T. Hamisi', 'Staff Operasional', 'Operasional', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(19, 'Alex', 'Staff Operasional', 'Operasional', 'Aktif', '65a4f99d7d9a8.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(30, 'Muhammad Mabrur Al Mutaqi', 'Staff IT', 'IT', 'Aktif', '65a644a80e773.png', '2002-05-21', 'Laki-laki', 'Cipta Asri blok Herba no.120', '082178192938', 'mabruralmutaqi@gmail.com', 'Belum Menikah', '2171012105020001', '95.461.480.6-225.000');

-- --------------------------------------------------------

--
-- Table structure for table `lantai`
--

CREATE TABLE `lantai` (
  `id_lantai` int(10) NOT NULL,
  `nama_lantai` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lantai`
--

INSERT INTO `lantai` (`id_lantai`, `nama_lantai`) VALUES
(1, 'Lantai 1'),
(2, 'Lantai 2'),
(3, 'Lantai 3');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(200) NOT NULL,
  `id_emp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `level`, `id_emp`) VALUES
(11, 'admin', '$2y$10$jgzkM0mK8zHgZlhC7nuTjepzouD91p6z0PaZPp3aymL/BabwifU4e', 'admin', 12),
(12, 'admin2', '$2y$10$lhYFeDPMGWrR9.dVWm.NNe9THUiW.MOStkt/vpHnwrpjvBs9sE3yu', 'admin2', 11),
(13, 'admin3', '$2y$10$0NepItZYt5bIyKOvPQhRpuGxb..ykUBm2BNLeeQ6iMNPb106CByli', 'admin3', 5),
(14, 'admin4', '$2y$10$3SspMiCSr.VJIpZy9thj2O1tNUeKc/EGPCLLRLaj4SznMsEmQliN.', 'admin4', 9),
(15, 'hrd', '$2y$10$0vdFzekf.t/55JdvfOtw4ekZT39B3dML6yfSlQwTMm0XZzPNK09Kq', 'hrd', 10),
(18, 'mabrur', '$2y$10$JboZ8aA.oN73OflRoEC8iuPaHxGskhwoLGI2blVG2Zf.9IUcm926e', 'hrd', 30),
(21, 'sanjeev', '$2y$10$1cjd3DxIxgvUsSOu.Y2ke.EeUeweAJkTCzitXZnjoWCHWAAbGU8wm', 'dirut', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id_absen`),
  ADD KEY `id_emp` (`id_emp`),
  ADD KEY `id_lantai` (`id_lantai`);

--
-- Indexes for table `akses_pintu`
--
ALTER TABLE `akses_pintu`
  ADD PRIMARY KEY (`id_akses`),
  ADD KEY `id_emp` (`id_emp`),
  ADD KEY `id_lantai` (`id_lantai`);

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
-- Indexes for table `lantai`
--
ALTER TABLE `lantai`
  ADD PRIMARY KEY (`id_lantai`);

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
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id_absen` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `akses_pintu`
--
ALTER TABLE `akses_pintu`
  MODIFY `id_akses` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_emp` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `lantai`
--
ALTER TABLE `lantai`
  MODIFY `id_lantai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `absen`
--
ALTER TABLE `absen`
  ADD CONSTRAINT `absen_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`),
  ADD CONSTRAINT `absen_ibfk_2` FOREIGN KEY (`id_lantai`) REFERENCES `lantai` (`id_lantai`);

--
-- Constraints for table `akses_pintu`
--
ALTER TABLE `akses_pintu`
  ADD CONSTRAINT `akses_pintu_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`),
  ADD CONSTRAINT `akses_pintu_ibfk_2` FOREIGN KEY (`id_lantai`) REFERENCES `lantai` (`id_lantai`);

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
