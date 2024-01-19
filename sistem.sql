-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2024 at 11:51 AM
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
(9, 6, 14, 2),
(10, 1, 30, 2);

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
(12, 3, 8, 2),
(13, 4, 30, 2);

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
(157, 14351234445231, 'Fan cooler', '3 kaki', 'butuh cepat', 1, '2024-01-17', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 27),
(158, 14351234445232, 'Oli', '2L', 'untuk mesin kapal', 1, '2024-01-17', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 28),
(159, 14351234445233, 'Printer', 'Canon L3110 Ecotank', 'untuk administrasi', 1, '2024-01-17', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 27),
(160, 14351234445234, 'Fan Cooler', '3 Kipas', 'Liferaft', 1, '2024-01-17', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 28);

-- --------------------------------------------------------

--
-- Table structure for table `ijazah`
--

CREATE TABLE `ijazah` (
  `id_ijazah` int(10) NOT NULL,
  `no_ijazah` varchar(40) NOT NULL,
  `tgl_penitipan` date NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `status_ijazah` varchar(50) NOT NULL,
  `scan_ijazah` varchar(200) NOT NULL,
  `id_emp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ijazah`
--

INSERT INTO `ijazah` (`id_ijazah`, `no_ijazah`, `tgl_penitipan`, `tgl_kembali`, `status_ijazah`, `scan_ijazah`, `id_emp`) VALUES
(60, 'M-SMK/1100023', '2024-01-02', '0000-00-00', 'Sedang dititipkan', '65aa48284ecd6.pdf', 30);

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
(8, 'Raden Sulaiman Sanjeev', 'Direktur Utama', 'BSD', 'Aktif', '65a4f45ead15a.png', '1985-01-01', 'Laki-laki', '-', '0', 'sanjeev@bumi-laut.com', 'Sudah Menikah', '1312', '1321'),
(9, 'Regina', 'Direktur Keuangan', 'BSD', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(10, 'James Taju', 'Direktur HRD', 'HRM', 'Aktif', '65a4f45ead15a.png', '1980-01-01', 'Laki-laki', '-', '1231231', 'btm@gmail.xom', 'Sudah Menikah', '123', '123'),
(11, 'Bambang Wahyudi', 'Direktur Operasional', 'Manager', 'Aktif', '65a4f45ead15a.png', '0000-00-00', 'Laki-laki', '-', '0', 'btm@gmail.xom', 'Sudah Menikah', '132', '132'),
(12, 'Michael Kawilarang', 'Kepala Cabang', 'Manager', 'Aktif', '65a8b1dbd087d.png', '0000-00-00', 'Laki-laki', '-', '0', 'batam@gmail.com', 'Sudah Menikah', '123', '123'),
(13, 'Gahral', 'Kepala Shipping', 'Shipping', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(14, 'Elis', 'Finance', 'Finance', 'Aktif', '65a4f45ead15a.png', '0000-00-00', 'Laki-laki', '-', '0', 'btm@gmail.xom', 'Belum Menikah', '123', '1321'),
(15, 'Rika', 'Staff Shipping', 'Shipping', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(16, 'Krisno', 'Staff Shipping', 'Shipping', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(17, 'Niken', 'Staff Finance', 'Finance', 'Aktif', '65a4f45ead15a.png', NULL, NULL, NULL, '', '', '', NULL, ''),
(18, 'Robby T. Hamisi ', 'Staff Operasional', 'Operasional', 'Aktif', '65a4f45ead15a.png', '1980-08-08', 'Laki-laki', 'Nongsa', '082285686292', 'robby.t@gmail.com', 'Sudah Menikah', '2171012205180001', '082222050215000'),
(19, 'Alex Untu', 'Staff Operasional', 'Operasional', 'Aktif', '65a8a7a4c616b.png', '0000-00-00', 'Laki-laki', 'Bengkong Kolam Swadaya', '081100001212', 'alex@gmail.com', 'Belum Menikah', '2171012122030001', '927824938215000'),
(30, 'Muhammad Mabrur Al Mutaqi', 'Staff IT', 'IT Dept', 'Aktif', '65a8cc3d11e59.png', '2002-05-21', 'Laki-laki', 'Cipta Asri blok Herba no.120', '082178192938', 'mabruralmutaqi@gmail.com', 'Belum Menikah', '2171012105020001', '95.461.480.6-225.000');

-- --------------------------------------------------------

--
-- Table structure for table `kontrak_kerja`
--

CREATE TABLE `kontrak_kerja` (
  `id_kontrak` int(10) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date DEFAULT NULL,
  `gaji_pokok` int(10) NOT NULL,
  `tunjangan` int(10) NOT NULL,
  `status_kontrak` varchar(40) NOT NULL,
  `id_emp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kontrak_kerja`
--

INSERT INTO `kontrak_kerja` (`id_kontrak`, `tgl_mulai`, `tgl_akhir`, `gaji_pokok`, `tunjangan`, `status_kontrak`, `id_emp`) VALUES
(27, '2025-04-04', '0000-00-00', 6000000, 0, 'Permanent', 30);

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
(11, 'admin', '$2y$10$IgW4FLMwe9euVk0Ne9.ks.8ZhYCvheo7j1at4NiMIW38uOXYUM8pi', 'Kepala Cabang', 12),
(12, 'admin2', '$2y$10$HGD9twPbqY2jRuhsR6NMA.qUNiqShFNa8AFS8hy2LjDvFqdvGGM3e', 'Direktur Operasional', 11),
(13, 'admin3', '$2y$10$Q3IQI9/N96Pkm12hhwZrRe152Y937dQmRcqeZZSshp0mpz2Mh7IjO', 'Purchasing', 14),
(14, 'admin4', '$2y$10$3SspMiCSr.VJIpZy9thj2O1tNUeKc/EGPCLLRLaj4SznMsEmQliN.', 'admin4', 9),
(15, 'hrd', '$2y$10$rfSEEc5RaRZ/YjmxEF9G8uDTXi8w04f8PnuI/3Br7pXPWD9PKOhN2', 'HRD', 10),
(21, 'sanjeev', '$2y$10$dqD5eyXMYFl5dmq.1s103OeZOPTBNN4gHGqbu/D5neofhrjWRKxBO', 'Direktur Utama', 8),
(27, 'alex', '$2y$10$pKR0gqG2v6B0T7/3oiKvPexleYhzbBKMLyH1M6gnP3j6nJdVvi4SK', 'Staff Operasional', 19),
(28, 'robi', '$2y$10$pi39ljqjbeI7Xgu6up8uie2wOUT6Gv7dwqsQXgvI60DotWKCmSvQC', 'Staff Operasional', 18),
(29, 'krisno', '$2y$10$wdmPEof2zbHxxFyJWXAZZOZOigLJucxD/Vy5oALS.0y5ZJkvzVNhC', 'Staff Operasional', 16),
(30, 'niken', '$2y$10$Kzzb.fetZnuGPtKI03hX6.p.b.XP81bzSX92q0P3/HpRpWFSpdPZa', 'Staff Operasional', 17),
(31, 'mabrur', '$2y$10$zxwFH.e4ooAM3CgI8Wzi8Ot0AIZhzcnKMHNPSIprWt.gbQiArYqki', 'Staff IT', 30);

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
-- Indexes for table `ijazah`
--
ALTER TABLE `ijazah`
  ADD PRIMARY KEY (`id_ijazah`),
  ADD KEY `id_emp` (`id_emp`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_emp`);

--
-- Indexes for table `kontrak_kerja`
--
ALTER TABLE `kontrak_kerja`
  ADD PRIMARY KEY (`id_kontrak`),
  ADD KEY `id_emp` (`id_emp`);

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
  MODIFY `id_absen` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `akses_pintu`
--
ALTER TABLE `akses_pintu`
  MODIFY `id_akses` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `ijazah`
--
ALTER TABLE `ijazah`
  MODIFY `id_ijazah` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_emp` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `kontrak_kerja`
--
ALTER TABLE `kontrak_kerja`
  MODIFY `id_kontrak` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `lantai`
--
ALTER TABLE `lantai`
  MODIFY `id_lantai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
-- Constraints for table `ijazah`
--
ALTER TABLE `ijazah`
  ADD CONSTRAINT `ijazah_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`);

--
-- Constraints for table `kontrak_kerja`
--
ALTER TABLE `kontrak_kerja`
  ADD CONSTRAINT `kontrak_kerja_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
