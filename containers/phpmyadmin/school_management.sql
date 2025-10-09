-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 21, 2025 at 12:37 AM
-- Server version: 12.0.2-MariaDB-ubu2404
-- PHP Version: 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `akun_id` int(11) NOT NULL,
  `akun_email` varchar(255) NOT NULL,
  `akun_password` varchar(255) NOT NULL,
  `peran_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `guru_id` int(11) NOT NULL,
  `guru_nip` varchar(255) DEFAULT NULL,
  `guru_nama` varchar(255) NOT NULL,
  `guru_nomor` bigint(20) DEFAULT NULL,
  `guru_jabatan` varchar(100) DEFAULT NULL,
  `guru_gender` enum('Pria','Perempuan') NOT NULL,
  `guru_alamat` varchar(255) DEFAULT NULL,
  `guru_tgl_lahir` date DEFAULT NULL,
  `akun_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `jadwal_id` int(11) NOT NULL,
  `jadwal_hari` enum('Senin','Selasa','Rabu','Kamis','Jumat','Sabtu','Minggu') NOT NULL,
  `jadwal_jam_mulai` time NOT NULL,
  `jadwal_jam_selesai` time NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `mapel_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `jurusan_id` int(11) NOT NULL,
  `jurusan_nama` varchar(255) NOT NULL,
  `jurusan_deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `kelas_id` int(11) NOT NULL,
  `kelas_nama` varchar(255) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `guru_id` int(11) NOT NULL COMMENT 'ID Guru Wali Kelas',
  `tahun_ajaran_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Mendefinisikan sebuah kelas dalam satu tahun ajaran';

-- --------------------------------------------------------

--
-- Table structure for table `kelas_siswa`
--

CREATE TABLE `kelas_siswa` (
  `siswa_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `tahun_ajaran_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Mencatat sejarah pendaftaran siswa di kelas per tahun';

-- --------------------------------------------------------

--
-- Table structure for table `mapel`
--

CREATE TABLE `mapel` (
  `mapel_id` int(11) NOT NULL,
  `mapel_nama` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `nilai_id` int(11) NOT NULL,
  `nilai_tipe_penilaian` enum('Tugas','Ujian Harian','UTS','UAS') NOT NULL,
  `nilai_nilai` decimal(5,2) NOT NULL,
  `nilai_tggl_penilaian` date NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL COMMENT 'Konteks nilai ini diberikan (mapel, kelas, guru)',
  `tugas_id` int(11) DEFAULT NULL COMMENT 'Diisi jika tipe_penilaian adalah Tugas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peran`
--

CREATE TABLE `peran` (
  `peran_id` int(11) NOT NULL,
  `peran_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Daftar peran pengguna (Admin, Guru, Siswa, dll)';

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE `presensi` (
  `presensi_id` int(11) NOT NULL,
  `presensi_tggl` date NOT NULL,
  `presensi_status` enum('Hadir','Sakit','Izin','Alpa') NOT NULL,
  `presensi_deskripsi` text DEFAULT NULL,
  `siswa_id` int(11) NOT NULL,
  `jadwal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `siswa_id` int(11) NOT NULL,
  `siswa_nis` varchar(255) DEFAULT NULL,
  `siswa_nama` varchar(255) NOT NULL,
  `siswa_nomor` bigint(20) DEFAULT NULL,
  `siswa_gender` enum('Pria','Perempuan') NOT NULL,
  `siswa_tgl_lahir` date DEFAULT NULL,
  `siswa_alamat` varchar(255) DEFAULT NULL,
  `akun_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `siswa_wali`
--

CREATE TABLE `siswa_wali` (
  `siswa_id` int(11) NOT NULL,
  `wali_id` int(11) NOT NULL,
  `sw_hubungan` enum('Ayah','Ibu','Wali') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tahun_ajaran`
--

CREATE TABLE `tahun_ajaran` (
  `tahun_ajaran_id` int(11) NOT NULL,
  `tahun_ajaran_tahun` varchar(10) NOT NULL,
  `tahun_ajaran_semester` enum('Ganjil','Genap') NOT NULL,
  `tahun_ajaran_tanggal_mulai` date NOT NULL,
  `tahun_ajaran_tanggal_selesai` date NOT NULL,
  `tahun_ajaran_aktif` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Mengatur periode waktu akademis';

-- --------------------------------------------------------

--
-- Table structure for table `tugas`
--

CREATE TABLE `tugas` (
  `tugas_id` int(11) NOT NULL,
  `tugas_nama` varchar(255) NOT NULL,
  `tugas_deskripsi` text DEFAULT NULL,
  `tugas_mulai` datetime NOT NULL,
  `tugas_tenggat` datetime NOT NULL,
  `jadwal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wali`
--

CREATE TABLE `wali` (
  `wali_id` int(11) NOT NULL,
  `wali_nama` varchar(255) NOT NULL,
  `wali_nomor` bigint(20) DEFAULT NULL,
  `wali_alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`akun_id`),
  ADD UNIQUE KEY `akun_email` (`akun_email`),
  ADD KEY `idx_peran_id` (`peran_id`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`guru_id`),
  ADD UNIQUE KEY `akun_id` (`akun_id`),
  ADD UNIQUE KEY `guru_nip_unique` (`guru_nip`) USING BTREE,
  ADD KEY `idx_guru_nama` (`guru_nama`) USING BTREE;

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`jadwal_id`),
  ADD KEY `idx_jadwal_kelas_id` (`kelas_id`),
  ADD KEY `idx_jadwal_mapel_id` (`mapel_id`),
  ADD KEY `idx_jadwal_guru_id` (`guru_id`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`jurusan_id`),
  ADD KEY `idx_jurusan_nama` (`jurusan_nama`) USING BTREE;

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kelas_id`),
  ADD KEY `idx_jurusan_id` (`jurusan_id`),
  ADD KEY `idx_guru_id_wali` (`guru_id`),
  ADD KEY `idx_tahun_ajaran_id` (`tahun_ajaran_id`),
  ADD KEY `idx_k_nama` (`kelas_nama`) USING BTREE;

--
-- Indexes for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD PRIMARY KEY (`siswa_id`,`kelas_id`,`tahun_ajaran_id`),
  ADD KEY `idx_ks_kelas_id` (`kelas_id`),
  ADD KEY `idx_ks_tahun_ajaran_id` (`tahun_ajaran_id`);

--
-- Indexes for table `mapel`
--
ALTER TABLE `mapel`
  ADD PRIMARY KEY (`mapel_id`),
  ADD UNIQUE KEY `mapel_nama` (`mapel_nama`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`nilai_id`),
  ADD KEY `idx_nilai_siswa_id` (`siswa_id`),
  ADD KEY `idx_nilai_jadwal_id` (`jadwal_id`),
  ADD KEY `idx_nilai_tugas_id` (`tugas_id`);

--
-- Indexes for table `peran`
--
ALTER TABLE `peran`
  ADD PRIMARY KEY (`peran_id`),
  ADD UNIQUE KEY `nama_peran` (`peran_nama`);

--
-- Indexes for table `presensi`
--
ALTER TABLE `presensi`
  ADD PRIMARY KEY (`presensi_id`),
  ADD KEY `idx_presensi_siswa_id` (`siswa_id`),
  ADD KEY `idx_presensi_jadwal_id` (`jadwal_id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`siswa_id`),
  ADD UNIQUE KEY `akun_id` (`akun_id`),
  ADD UNIQUE KEY `siswa_nis_unique` (`siswa_nis`) USING BTREE,
  ADD KEY `idx_s_nama` (`siswa_nama`) USING BTREE;

--
-- Indexes for table `siswa_wali`
--
ALTER TABLE `siswa_wali`
  ADD PRIMARY KEY (`siswa_id`,`wali_id`),
  ADD KEY `idx_sw_wali_id` (`wali_id`);

--
-- Indexes for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  ADD PRIMARY KEY (`tahun_ajaran_id`);

--
-- Indexes for table `tugas`
--
ALTER TABLE `tugas`
  ADD PRIMARY KEY (`tugas_id`),
  ADD KEY `idx_tugas_jadwal_id` (`jadwal_id`);

--
-- Indexes for table `wali`
--
ALTER TABLE `wali`
  ADD PRIMARY KEY (`wali_id`),
  ADD KEY `idx_w_nama` (`wali_nama`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `akun_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `guru_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `jadwal_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `jurusan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `kelas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mapel`
--
ALTER TABLE `mapel`
  MODIFY `mapel_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `nilai_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peran`
--
ALTER TABLE `peran`
  MODIFY `peran_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `presensi`
--
ALTER TABLE `presensi`
  MODIFY `presensi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tahun_ajaran`
--
ALTER TABLE `tahun_ajaran`
  MODIFY `tahun_ajaran_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tugas`
--
ALTER TABLE `tugas`
  MODIFY `tugas_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wali`
--
ALTER TABLE `wali`
  MODIFY `wali_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `akun_fk_peran` FOREIGN KEY (`peran_id`) REFERENCES `peran` (`peran_id`);

--
-- Constraints for table `guru`
--
ALTER TABLE `guru`
  ADD CONSTRAINT `guru_fk_akun` FOREIGN KEY (`akun_id`) REFERENCES `akun` (`akun_id`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_fk_guru` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`guru_id`),
  ADD CONSTRAINT `jadwal_fk_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`),
  ADD CONSTRAINT `jadwal_fk_mapel` FOREIGN KEY (`mapel_id`) REFERENCES `mapel` (`mapel_id`);

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_fk_guru_wali` FOREIGN KEY (`guru_id`) REFERENCES `guru` (`guru_id`),
  ADD CONSTRAINT `kelas_fk_jurusan` FOREIGN KEY (`jurusan_id`) REFERENCES `jurusan` (`jurusan_id`),
  ADD CONSTRAINT `kelas_fk_tahun_ajaran` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`);

--
-- Constraints for table `kelas_siswa`
--
ALTER TABLE `kelas_siswa`
  ADD CONSTRAINT `ks_fk_kelas` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`kelas_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ks_fk_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ks_fk_tahun_ajaran` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajaran` (`tahun_ajaran_id`) ON DELETE CASCADE;

--
-- Constraints for table `nilai`
--
ALTER TABLE `nilai`
  ADD CONSTRAINT `nilai_fk_jadwal` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`jadwal_id`),
  ADD CONSTRAINT `nilai_fk_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`siswa_id`),
  ADD CONSTRAINT `nilai_fk_tugas` FOREIGN KEY (`tugas_id`) REFERENCES `tugas` (`tugas_id`);

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `presensi_fk_jadwal` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`jadwal_id`),
  ADD CONSTRAINT `presensi_fk_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`siswa_id`);

--
-- Constraints for table `siswa`
--
ALTER TABLE `siswa`
  ADD CONSTRAINT `siswa_fk_akun` FOREIGN KEY (`akun_id`) REFERENCES `akun` (`akun_id`);

--
-- Constraints for table `siswa_wali`
--
ALTER TABLE `siswa_wali`
  ADD CONSTRAINT `sw_fk_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`siswa_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sw_fk_wali` FOREIGN KEY (`wali_id`) REFERENCES `wali` (`wali_id`) ON DELETE CASCADE;

--
-- Constraints for table `tugas`
--
ALTER TABLE `tugas`
  ADD CONSTRAINT `tugas_fk_jadwal` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwal` (`jadwal_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
