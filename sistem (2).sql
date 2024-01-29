-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 29, 2024 at 02:45 AM
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
  `kode_brg` varchar(40) NOT NULL,
  `nama_barang` varchar(200) NOT NULL,
  `gambar_barang` varchar(100) NOT NULL,
  `spek` text DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `stok_barang` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_brg`, `nama_barang`, `gambar_barang`, `spek`, `deskripsi`, `stok_barang`) VALUES
('BRG00001', 'Mesin pompa 1', '65b1eab76c9b4.jpg', 'Mitsubishi', '-', 1),
('BRG00002', 'Mesin Pompa 2', '65b1ead4019a7.jpg', 'Mitsubishi', '-', 1),
('BRG00003', 'Mesin AE ', '65b1eaee10a9b.jpg', 'Mitsubishi', '-', 1),
('BRG00004', 'Accu GS p N100', '65b1eb17d0683.jpg', 'GS p N100', '-', 4),
('BRG00005', 'Accu NS p N120', '65b1eb35d2247.jpg', 'NS p N120', '-', 2),
('BRG00006', 'Charger Accu', '65b1eb9514851.jpg', 'Maxtron CB 30', '-', 1),
('BRG00007', 'Fire Extinguisher', '65b1ebbe050fe.jpg', 'Dry Powder 9kg', '-', 2),
('BRG00008', 'Fire Extinguisher', '65b20422c0929.jpg', 'Chemical 4,6kg', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_transaksi` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `qty_masuk` int(5) NOT NULL,
  `harga_brg` decimal(10,0) NOT NULL,
  `waranty` varchar(50) DEFAULT NULL,
  `renewal` date DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `id_vendor` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `id_satuan` int(10) NOT NULL,
  `id_req_brg` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `kategori_cuti`
--

CREATE TABLE `kategori_cuti` (
  `id_kategori_cuti` int(10) NOT NULL,
  `kategori_cuti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_cuti`
--

INSERT INTO `kategori_cuti` (`id_kategori_cuti`, `kategori_cuti`) VALUES
(4, 'Annual Leave'),
(5, 'Sick Leave'),
(6, 'Unpaid Leave');

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
(27, '2025-04-04', '0000-00-00', 6000000, 0, 'Permanent', 30),
(28, '2025-04-25', '0000-00-00', 6000000, 500000, 'Permanent', 17);

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
-- Table structure for table `lokasi_barang`
--

CREATE TABLE `lokasi_barang` (
  `id_lokasi` int(10) NOT NULL,
  `nama_lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lokasi_barang`
--

INSERT INTO `lokasi_barang` (`id_lokasi`, `nama_lokasi`) VALUES
(1, 'OB Mitra Utama 03'),
(2, 'OB Selaras 01'),
(3, 'OB Garuda'),
(4, 'TB Tiga Permata'),
(5, 'Office');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_room`
--

CREATE TABLE `lokasi_room` (
  `id_room` int(10) NOT NULL,
  `room_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lokasi_room`
--

INSERT INTO `lokasi_room` (`id_room`, `room_name`) VALUES
(1, 'Engine Room'),
(2, 'Store Room'),
(3, 'Main Deck'),
(4, 'Cabin Crew'),
(5, 'Office Lt. 1'),
(6, 'Office Lt. 2'),
(7, 'Office Lt. 3');

-- --------------------------------------------------------

--
-- Table structure for table `manage_cuti`
--

CREATE TABLE `manage_cuti` (
  `id_manage_cuti` int(10) NOT NULL,
  `id_kategori_cuti` int(10) NOT NULL,
  `kuota_cuti` int(5) NOT NULL,
  `id_emp` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `manage_cuti`
--

INSERT INTO `manage_cuti` (`id_manage_cuti`, `id_kategori_cuti`, `kuota_cuti`, `id_emp`) VALUES
(28, 4, 9, 30),
(29, 6, 3, 30),
(30, 5, 6, 30),
(32, 4, 8, 19),
(33, 5, 6, 19),
(34, 6, 3, 19);

-- --------------------------------------------------------

--
-- Table structure for table `req_barang`
--

CREATE TABLE `req_barang` (
  `id_req_brg` int(10) NOT NULL,
  `kode_pengajuan` varchar(100) NOT NULL,
  `kode_brg` varchar(40) NOT NULL,
  `qty_req` int(5) NOT NULL,
  `tgl_req_brg` date NOT NULL,
  `alasan` text DEFAULT NULL,
  `status_req` varchar(50) NOT NULL,
  `acc1` varchar(50) DEFAULT NULL,
  `acc2` varchar(50) DEFAULT NULL,
  `id_lokasi` int(10) NOT NULL,
  `id_room` int(10) NOT NULL,
  `id_user` int(10) NOT NULL,
  `id_satuan` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `req_barang`
--

INSERT INTO `req_barang` (`id_req_brg`, `kode_pengajuan`, `kode_brg`, `qty_req`, `tgl_req_brg`, `alasan`, `status_req`, `acc1`, `acc2`, `id_lokasi`, `id_room`, `id_user`, `id_satuan`) VALUES
(39, 'REQ-24012700001-53657', 'BRG00001', 1, '2024-01-27', '', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 1, 1, 28, 1),
(40, 'REQ-24012700002-90814', 'BRG00002', 1, '2024-01-27', '', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 2, 3, 28, 1),
(41, 'REQ-24012700003-60169', 'BRG00003', 1, '2024-01-27', '', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 2, 2, 29, 1),
(42, 'REQ-24012700004-41123', 'BRG00008', 8, '2024-01-27', '', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 2, 1, 29, 1),
(43, 'REQ-24012700005-26597', 'BRG00007', 2, '2024-01-27', '', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 1, 1, 29, 1),
(44, 'REQ-24012700006-15577', 'BRG00001', 1, '2024-01-27', '', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 1, 1, 29, 1),
(45, 'REQ-24012800007-52211', 'BRG00001', 1, '2024-01-28', 'untuk jig', 'On Progress in Purchasing', 'Michael Kawilarang', 'Bambang Wahyudi', 1, 1, 28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `req_cuti`
--

CREATE TABLE `req_cuti` (
  `id_req_cuti` int(10) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_akhir` date NOT NULL,
  `jml_hari` int(5) NOT NULL,
  `tipe_cuti` varchar(30) DEFAULT NULL,
  `alasan` text NOT NULL,
  `status_cuti` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `id_emp` int(10) NOT NULL,
  `id_kategori_cuti` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `req_cuti`
--

INSERT INTO `req_cuti` (`id_req_cuti`, `tgl_mulai`, `tgl_akhir`, `jml_hari`, `tipe_cuti`, `alasan`, `status_cuti`, `created_at`, `updated_at`, `id_emp`, `id_kategori_cuti`) VALUES
(22, '2024-01-25', '2024-01-25', 1, 'Full Day', 'perpanjang STNK', 'Sudah diapprove', '2024-01-23 14:39:37', '2024-01-23 14:54:18', 30, 4),
(23, '2024-01-25', '2024-01-26', 2, 'Full Day', 'Pulang Kampung', 'Sudah diapprove', '2024-01-23 14:56:52', '2024-01-23 15:03:19', 30, 4),
(30, '2024-01-24', '2024-01-24', 1, 'Full Day', 'Ngurus ATM', 'Sudah diapprove', '2024-01-23 17:47:40', '2024-01-23 17:48:41', 19, 4);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id_satuan` int(10) NOT NULL,
  `nama_satuan` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id_satuan`, `nama_satuan`) VALUES
(1, 'Unit'),
(2, 'Pack'),
(3, 'Pcs'),
(4, 'Liter'),
(5, 'Lusin'),
(6, 'Box'),
(7, 'Galon'),
(8, 'Botol'),
(9, 'Set'),
(10, 'Roll'),
(11, 'Kg'),
(12, 'Drum');

-- --------------------------------------------------------

--
-- Table structure for table `storage_barang`
--

CREATE TABLE `storage_barang` (
  `id_storage` varchar(50) NOT NULL,
  `tgl_input` date NOT NULL,
  `qty_brg` int(5) NOT NULL,
  `reason` text NOT NULL,
  `kondisi_brg` text NOT NULL,
  `id_lokasi` int(10) NOT NULL,
  `id_satuan` int(10) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `id_room` int(10) NOT NULL,
  `id_user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(13, 'admin3', '$2y$10$Q3IQI9/N96Pkm12hhwZrRe152Y937dQmRcqeZZSshp0mpz2Mh7IjO', 'Purchasing', 19),
(14, 'admin4', '$2y$10$3SspMiCSr.VJIpZy9thj2O1tNUeKc/EGPCLLRLaj4SznMsEmQliN.', 'Finance', 14),
(15, 'hrd', '$2y$10$rfSEEc5RaRZ/YjmxEF9G8uDTXi8w04f8PnuI/3Br7pXPWD9PKOhN2', 'HRD', 10),
(21, 'sanjeev', '$2y$10$dqD5eyXMYFl5dmq.1s103OeZOPTBNN4gHGqbu/D5neofhrjWRKxBO', 'Direktur Utama', 8),
(27, 'alex', '$2y$10$AIPkK9rwsTtwIpWxWxQyl.B4q1KZkeHJuzk9htMLmXM3k7hgRuyzW', 'Purchasing', 19),
(28, 'robi', '$2y$10$pi39ljqjbeI7Xgu6up8uie2wOUT6Gv7dwqsQXgvI60DotWKCmSvQC', 'Crew', 18),
(29, 'krisno', '$2y$10$wdmPEof2zbHxxFyJWXAZZOZOigLJucxD/Vy5oALS.0y5ZJkvzVNhC', 'Crew', 16),
(30, 'niken', '$2y$10$Kzzb.fetZnuGPtKI03hX6.p.b.XP81bzSX92q0P3/HpRpWFSpdPZa', 'Staff Operasional', 17),
(31, 'mabrur', '$2y$10$zxwFH.e4ooAM3CgI8Wzi8Ot0AIZhzcnKMHNPSIprWt.gbQiArYqki', 'Staff IT', 30);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id_vendor` int(10) NOT NULL,
  `nama_vendor` varchar(50) NOT NULL,
  `no_telp_vendor` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id_vendor`, `nama_vendor`, `no_telp_vendor`) VALUES
(1, 'PT Karimun Marine Suplarindo', NULL),
(2, 'PT Evercode Internasional', NULL),
(3, 'PT Securindo Jaya Pratama', NULL);

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
  ADD PRIMARY KEY (`kode_brg`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_transaksi` (`id_transaksi`),
  ADD UNIQUE KEY `id_transaksi_2` (`id_transaksi`),
  ADD KEY `id_vendor` (`id_vendor`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_satuan` (`id_satuan`),
  ADD KEY `id_req_brg` (`id_req_brg`);

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
-- Indexes for table `kategori_cuti`
--
ALTER TABLE `kategori_cuti`
  ADD PRIMARY KEY (`id_kategori_cuti`);

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
-- Indexes for table `lokasi_barang`
--
ALTER TABLE `lokasi_barang`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- Indexes for table `lokasi_room`
--
ALTER TABLE `lokasi_room`
  ADD PRIMARY KEY (`id_room`);

--
-- Indexes for table `manage_cuti`
--
ALTER TABLE `manage_cuti`
  ADD PRIMARY KEY (`id_manage_cuti`),
  ADD KEY `id_kategori_cuti` (`id_kategori_cuti`),
  ADD KEY `id_emp` (`id_emp`);

--
-- Indexes for table `req_barang`
--
ALTER TABLE `req_barang`
  ADD PRIMARY KEY (`id_req_brg`),
  ADD KEY `kode_brg` (`kode_brg`),
  ADD KEY `id_lokasi` (`id_lokasi`),
  ADD KEY `id_room` (`id_room`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_satuan` (`id_satuan`);

--
-- Indexes for table `req_cuti`
--
ALTER TABLE `req_cuti`
  ADD PRIMARY KEY (`id_req_cuti`),
  ADD KEY `id_emp` (`id_emp`),
  ADD KEY `id_kategori_cuti` (`id_kategori_cuti`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `storage_barang`
--
ALTER TABLE `storage_barang`
  ADD PRIMARY KEY (`id_storage`),
  ADD KEY `id_lokasi` (`id_lokasi`),
  ADD KEY `id_satuan` (`id_satuan`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_room` (`id_room`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_emp` (`id_emp`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id_vendor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id_absen` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `akses_pintu`
--
ALTER TABLE `akses_pintu`
  MODIFY `id_akses` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ijazah`
--
ALTER TABLE `ijazah`
  MODIFY `id_ijazah` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id_emp` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `kategori_cuti`
--
ALTER TABLE `kategori_cuti`
  MODIFY `id_kategori_cuti` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kontrak_kerja`
--
ALTER TABLE `kontrak_kerja`
  MODIFY `id_kontrak` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `lantai`
--
ALTER TABLE `lantai`
  MODIFY `id_lantai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lokasi_barang`
--
ALTER TABLE `lokasi_barang`
  MODIFY `id_lokasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lokasi_room`
--
ALTER TABLE `lokasi_room`
  MODIFY `id_room` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `manage_cuti`
--
ALTER TABLE `manage_cuti`
  MODIFY `id_manage_cuti` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `req_barang`
--
ALTER TABLE `req_barang`
  MODIFY `id_req_brg` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `req_cuti`
--
ALTER TABLE `req_cuti`
  MODIFY `id_req_cuti` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id_satuan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id_vendor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id_vendor`),
  ADD CONSTRAINT `barang_masuk_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `barang_masuk_ibfk_3` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`),
  ADD CONSTRAINT `barang_masuk_ibfk_4` FOREIGN KEY (`id_req_brg`) REFERENCES `req_barang` (`id_req_brg`);

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
-- Constraints for table `manage_cuti`
--
ALTER TABLE `manage_cuti`
  ADD CONSTRAINT `manage_cuti_ibfk_1` FOREIGN KEY (`id_kategori_cuti`) REFERENCES `kategori_cuti` (`id_kategori_cuti`),
  ADD CONSTRAINT `manage_cuti_ibfk_2` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`);

--
-- Constraints for table `req_barang`
--
ALTER TABLE `req_barang`
  ADD CONSTRAINT `req_barang_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`),
  ADD CONSTRAINT `req_barang_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi_barang` (`id_lokasi`),
  ADD CONSTRAINT `req_barang_ibfk_3` FOREIGN KEY (`id_room`) REFERENCES `lokasi_room` (`id_room`),
  ADD CONSTRAINT `req_barang_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `req_barang_ibfk_5` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`);

--
-- Constraints for table `req_cuti`
--
ALTER TABLE `req_cuti`
  ADD CONSTRAINT `req_cuti_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`),
  ADD CONSTRAINT `req_cuti_ibfk_2` FOREIGN KEY (`id_kategori_cuti`) REFERENCES `kategori_cuti` (`id_kategori_cuti`);

--
-- Constraints for table `storage_barang`
--
ALTER TABLE `storage_barang`
  ADD CONSTRAINT `storage_barang_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi_barang` (`id_lokasi`),
  ADD CONSTRAINT `storage_barang_ibfk_2` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id_satuan`),
  ADD CONSTRAINT `storage_barang_ibfk_3` FOREIGN KEY (`id_transaksi`) REFERENCES `barang_masuk` (`id_transaksi`),
  ADD CONSTRAINT `storage_barang_ibfk_4` FOREIGN KEY (`id_room`) REFERENCES `lokasi_room` (`id_room`),
  ADD CONSTRAINT `storage_barang_ibfk_5` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_emp`) REFERENCES `karyawan` (`id_emp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;