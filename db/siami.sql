-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2023 at 07:59 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siami`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nip`, `created_at`) VALUES
(1, '150041910', '2023-06-25 05:02:54');

-- --------------------------------------------------------

--
-- Table structure for table `ami`
--

CREATE TABLE `ami` (
  `id_ami` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `status_akhir` enum('open','close') NOT NULL DEFAULT 'open',
  `rtm` date DEFAULT NULL,
  `file_rtm` varchar(225) DEFAULT NULL,
  `tanggal_ba` date DEFAULT NULL,
  `berita_acara` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_by` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ami`
--

INSERT INTO `ami` (`id_ami`, `id_periode`, `id_unit`, `status_akhir`, `rtm`, `file_rtm`, `tanggal_ba`, `berita_acara`, `created_at`, `updated_at`, `updated_by`) VALUES
(1, 2, 2, 'open', NULL, NULL, NULL, NULL, '2023-07-26 13:16:54', '2023-07-26 13:16:54', '2023-07-26 13:16:54'),
(2, 3, 2, 'open', '2023-09-30', '495b13f4d74167115e913a66b28fa79e.pdf', NULL, NULL, '2023-07-27 03:15:56', '2023-07-26 22:52:01', '0000-00-00 00:00:00'),
(3, 3, 12, 'open', '2023-09-25', '45ed2d354ef8f50fe2a6469cb73fe614.pdf', '2023-09-05', 'dddddddddddddddddd', '2023-08-21 15:26:26', '2023-08-21 15:26:26', '2023-08-21 15:26:26'),
(4, 3, 3, 'open', '2023-07-05', NULL, NULL, NULL, '2023-09-03 07:32:43', '2023-09-04 23:03:31', '2023-09-03 07:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `audit`
--

CREATE TABLE `audit` (
  `id_audit` int(11) NOT NULL,
  `id_ami` int(11) NOT NULL,
  `id_substandart` int(11) NOT NULL,
  `kts` varchar(225) DEFAULT NULL,
  `nilai_kts` int(11) DEFAULT NULL,
  `uraian_kts` text DEFAULT NULL,
  `uraian_kts_lainnya` text DEFAULT NULL,
  `uraian_perbaikan` text DEFAULT NULL,
  `uraian_perbaikan_lainnya` text DEFAULT NULL,
  `target_waktu` varchar(225) DEFAULT NULL,
  `status` enum('open','close') NOT NULL DEFAULT 'open',
  `atl_kts` varchar(225) DEFAULT NULL,
  `atl_nilai_kts` int(11) DEFAULT NULL,
  `atl_uraian_kts` text DEFAULT NULL,
  `atl_uraian_kts_lainnya` text DEFAULT NULL,
  `atl_uraian_perbaikan` text DEFAULT NULL,
  `atl_uraian_perbaikan_lainnya` text DEFAULT NULL,
  `atl_target_waktu` varchar(225) DEFAULT NULL,
  `atl_status` enum('open','close') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(225) DEFAULT NULL,
  `updated_by` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `audit`
--

INSERT INTO `audit` (`id_audit`, `id_ami`, `id_substandart`, `kts`, `nilai_kts`, `uraian_kts`, `uraian_kts_lainnya`, `uraian_perbaikan`, `uraian_perbaikan_lainnya`, `target_waktu`, `status`, `atl_kts`, `atl_nilai_kts`, `atl_uraian_kts`, `atl_uraian_kts_lainnya`, `atl_uraian_perbaikan`, `atl_uraian_perbaikan_lainnya`, `atl_target_waktu`, `atl_status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 1, 'Observasi', 1, 'tt', NULL, 'tt', NULL, '1 minggu', 'open', '', 0, '', NULL, '', NULL, '', 'open', '2023-07-26 13:18:47', '2023-09-03 02:29:55', '150041910', '150041910'),
(2, 2, 3, 'Observasi', 1, 'test', NULL, 'test', NULL, '1 hari', 'open', '', 0, '', NULL, '', NULL, '', 'open', '2023-07-27 03:16:59', '2023-07-26 22:39:46', '150041910', '150041910'),
(3, 2, 2, 'KTS', 0, '-', NULL, '-', NULL, '1 minggu', 'open', '', 0, '', NULL, '', NULL, '', 'open', '2023-07-27 03:17:00', '2023-07-26 22:40:02', '150041910', '150041910'),
(4, 4, 4, 'Observasi', 1, 'test', NULL, 'tt', NULL, '1 semester', 'open', 'KTS', 0, 'fdafdasfwwwww1', '', 'lainnya', 'wwwwwwwwwsdasgdsagsdagsdagwwwwww', '1', 'open', '2023-09-03 07:34:33', '2023-09-05 12:50:58', '150041910', '150041910'),
(5, 4, 2, 'Observasi', 1, 'test', '', 'test', '', '1 semester', 'open', 'KTS', 0, 'fdafdasfwwwww1', '', 'lainnya', 'sssssssssss', '1', 'open', '2023-09-03 07:34:34', '2023-09-05 12:55:34', '150041910', '150041910'),
(6, 4, 3, 'KTS', 0, 'tes', NULL, 'tes', NULL, '1 semester', 'open', 'Observasi', 1, 'lainnya', 'fggggggggggg', 'lainnya', 'xxsdafdfa', '1', 'open', '2023-09-03 07:34:35', '2023-09-05 12:55:41', '150041910', '150041910'),
(7, 3, 2, 'KTS', 0, 'fdafdasfwwwww1', '', 'ddddddddddd', 'yyyyyaaaaaaaaaaaa', '1 smt', 'open', '', 0, '', NULL, '', NULL, '', 'open', '2023-09-04 02:10:12', '2023-09-03 23:04:30', '150041910', '150041910'),
(8, 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'open', '', 0, '', NULL, '', NULL, '', 'open', '2023-09-04 02:10:12', '2023-09-04 02:10:12', '150041910', NULL),
(9, 3, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'open', '', 0, '', NULL, '', NULL, '', 'open', '2023-09-04 02:10:13', '2023-09-04 02:10:13', '150041910', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auditor`
--

CREATE TABLE `auditor` (
  `id_auditor` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `level` enum('anggota','ketua','koordinator') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auditor`
--

INSERT INTO `auditor` (`id_auditor`, `id_periode`, `nip`, `level`, `created_at`) VALUES
(14, 2, '197304192000031002', 'anggota', '2023-07-26 08:44:56'),
(16, 2, '150041910', 'ketua', '2023-07-26 13:25:08'),
(17, 3, '197304192000031002', 'ketua', '2023-07-27 03:03:57'),
(18, 3, '197304122006041004', 'anggota', '2023-07-27 03:04:08'),
(19, 3, '196907052009012003', 'anggota', '2023-07-27 03:04:39'),
(20, 3, '150041910', 'ketua', '2023-07-27 03:07:12'),
(21, 3, '198304262011011010', NULL, '2023-08-21 15:14:10');

-- --------------------------------------------------------

--
-- Table structure for table `auditor_ami`
--

CREATE TABLE `auditor_ami` (
  `id_auditor_ami` int(11) NOT NULL,
  `id_auditor` int(11) NOT NULL,
  `id_ami` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auditor_ami`
--

INSERT INTO `auditor_ami` (`id_auditor_ami`, `id_auditor`, `id_ami`, `created_at`) VALUES
(49, 16, 1, '2023-07-26 13:26:11'),
(52, 14, 1, '2023-07-26 13:28:27'),
(55, 16, 3, '2023-08-21 15:26:26'),
(56, 19, 3, '2023-08-21 15:26:26'),
(57, 20, 2, '2023-08-21 15:28:54'),
(58, 18, 2, '2023-08-21 15:28:54'),
(60, 19, 4, '2023-09-03 07:32:43'),
(61, 16, 4, '2023-09-03 07:37:07');

-- --------------------------------------------------------

--
-- Table structure for table `detail_periode`
--

CREATE TABLE `detail_periode` (
  `id_detail_periode` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `detail_periode` varchar(225) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `tgl_mulai` date DEFAULT NULL,
  `tgl_selesai` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `detail_periode`
--

INSERT INTO `detail_periode` (`id_detail_periode`, `id_periode`, `detail_periode`, `deskripsi`, `tgl_mulai`, `tgl_selesai`) VALUES
(6, 2, 'Verifikasi Kelengkapan Dokumen', NULL, NULL, NULL),
(7, 2, 'Perbaikan Dokumen AMI', NULL, NULL, NULL),
(8, 2, 'Penilaian Auditor', NULL, NULL, NULL),
(9, 2, 'Pengumuman Hasil', NULL, NULL, NULL),
(10, 2, 'test', '1123', NULL, NULL),
(11, 3, 'Verifikasi Kelengkapan Dokumen', NULL, NULL, NULL),
(12, 3, 'Perbaikan Dokumen AMI', NULL, NULL, NULL),
(13, 3, 'Penilaian Auditor', NULL, NULL, NULL),
(14, 3, 'Pengumuman Hasil', NULL, NULL, NULL),
(15, 3, 'test', '1123', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dokumentasi`
--

CREATE TABLE `dokumentasi` (
  `id_dokumentasi` int(11) NOT NULL,
  `id_ami` int(11) NOT NULL,
  `nama_dokumentasi` varchar(225) NOT NULL,
  `file_dokumentasi` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id_faq` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id_faq`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(3, 'Breaking The Rules Using SQLite To Demo Web?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip', '2023-07-08 12:50:12', '2023-07-08 12:50:12'),
(4, 'Monthly Web Development Update Pragmatic Releasing?', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip', '2023-07-08 12:50:38', '2023-07-08 12:50:38'),
(5, 'How To Use Underlined Text To Improve User Experience', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip', '2023-07-08 12:51:02', '2023-07-08 12:51:02'),
(6, 'Understanding CSS Layout And The Block Formatting', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip', '2023-07-08 12:51:21', '2023-07-08 12:51:21');

-- --------------------------------------------------------

--
-- Table structure for table `file_audit`
--

CREATE TABLE `file_audit` (
  `id_file_audit` int(11) NOT NULL,
  `id_audit` int(11) NOT NULL,
  `nama_audit` varchar(225) NOT NULL,
  `file_audit` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `file_audit`
--

INSERT INTO `file_audit` (`id_file_audit`, `id_audit`, `nama_audit`, `file_audit`, `created_at`, `created_by`) VALUES
(3, 3, 'visi mosi', '0eabcb115ac311d38c282d9d6c3c14f9.png', '2023-07-27 03:27:17', '150041910'),
(4, 3, 'visi mosi', 'd56b03c144c4c8665241080b6c07b3bb.png', '2023-07-27 03:27:30', '150041910'),
(5, 2, 'sk', 'fd874b6d806f25c5837f513ce6df0a16.png', '2023-07-27 03:28:30', '150041910'),
(6, 1, 'mou', '9a6342168abeb20eb487d13b974018ef.pdf', '2023-09-03 07:27:55', '150041910'),
(7, 1, 'aa', '560c6d10916fbbd626e75d4ee2e79c76.pdf', '2023-09-03 07:28:09', '150041910'),
(8, 5, 'a', 'cf92589d28ef7886c8e765ffc0f12c79.pdf', '2023-09-03 09:11:49', '150041910'),
(9, 6, 'sss', '511e4b5a2d42d1d4ee156fb9f9ed9350.pdf', '2023-09-03 09:12:03', '150041910'),
(10, 4, 'dddd', 'c05eabc9b514ff4014d6da4414f6caca.pdf', '2023-09-03 09:12:18', '150041910');

-- --------------------------------------------------------

--
-- Table structure for table `file_audit_atl`
--

CREATE TABLE `file_audit_atl` (
  `id_file_atl` int(11) NOT NULL,
  `id_audit` int(11) NOT NULL,
  `nama_atl` varchar(225) NOT NULL,
  `file_atl` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `file_audit_atl`
--

INSERT INTO `file_audit_atl` (`id_file_atl`, `id_audit`, `nama_atl`, `file_atl`, `created_at`, `created_by`) VALUES
(1, 5, 'cxxxxxxxxxxxxxxxx', 'f59e238cea8d412cb49809b7643be311.pdf', '2023-09-05 16:18:09', '150041910'),
(2, 6, 'ddddddddddddd', '13d5221a61014a7f2d1a71d6b1c8bb59.pdf', '2023-09-05 16:20:47', '150041910'),
(3, 4, 'kkkkkk', '0399a637f217d5e491756c36ff35bf1c.pdf', '2023-09-05 17:56:57', '150041910');

-- --------------------------------------------------------

--
-- Table structure for table `format_dokumen`
--

CREATE TABLE `format_dokumen` (
  `id_format` int(11) NOT NULL,
  `tujuan` text NOT NULL,
  `manfaat` text NOT NULL,
  `lingkup` text NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `format_dokumen`
--

INSERT INTO `format_dokumen` (`id_format`, `tujuan`, `manfaat`, `lingkup`, `updated_at`) VALUES
(1, 'a', 'a', 'a', '2023-07-07 11:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_mekanisme`
--

CREATE TABLE `hasil_mekanisme` (
  `id_hasil_mekanisme` int(11) NOT NULL,
  `id_ami` int(11) NOT NULL,
  `id_mekanisme` int(11) NOT NULL,
  `jawaban` enum('Y','N') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hasil_mekanisme`
--

INSERT INTO `hasil_mekanisme` (`id_hasil_mekanisme`, `id_ami`, `id_mekanisme`, `jawaban`, `created_at`, `update_at`) VALUES
(1, 1, 3, 'N', '2023-07-26 13:16:54', '2023-07-26 13:16:54'),
(2, 2, 3, 'N', '2023-07-27 03:15:56', '2023-07-27 03:15:56'),
(3, 2, 4, 'N', '2023-07-27 03:15:56', '2023-07-27 03:15:56'),
(4, 3, 3, 'N', '2023-08-21 15:26:26', '2023-08-21 15:26:26'),
(5, 3, 4, 'N', '2023-08-21 15:26:26', '2023-08-21 15:26:26'),
(6, 4, 3, 'N', '2023-09-03 07:32:43', '2023-09-03 07:32:43'),
(7, 4, 4, 'N', '2023-09-03 07:32:43', '2023-09-03 07:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `kesimpulan`
--

CREATE TABLE `kesimpulan` (
  `id_kesimpulan` int(11) NOT NULL,
  `id_ami` int(11) NOT NULL,
  `status_kesimpulan` enum('N','Y') NOT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kts`
--

CREATE TABLE `kts` (
  `id_kts` int(11) NOT NULL,
  `nama_kts` varchar(225) NOT NULL,
  `nilai_kts` decimal(10,0) NOT NULL,
  `id_periode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kts`
--

INSERT INTO `kts` (`id_kts`, `nama_kts`, `nilai_kts`, `id_periode`) VALUES
(2, 'KTS', '0', 3),
(3, 'Observasi', '1', 3),
(4, 'ddddddd', '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mekanisme`
--

CREATE TABLE `mekanisme` (
  `id_mekanisme` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `nama_mekanisme` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mekanisme`
--

INSERT INTO `mekanisme` (`id_mekanisme`, `id_periode`, `nama_mekanisme`, `created_at`) VALUES
(3, 2, 'Apakah Mempertemukan Mahasiswa ?', '2023-07-26 08:39:09'),
(4, 3, 'Apakah Mempertemukan Mahasiswa ?', '2023-07-27 03:01:42');

-- --------------------------------------------------------

--
-- Table structure for table `m_kategori`
--

CREATE TABLE `m_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(30) DEFAULT NULL,
  `desc_kategori` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m_kategori`
--

INSERT INTO `m_kategori` (`id_kategori`, `nama_kategori`, `desc_kategori`) VALUES
(1, 'Pendidikan', NULL),
(2, 'Politik', NULL),
(3, 'Sains', NULL),
(5, 'Penelitian', NULL),
(6, 'Prestasi', NULL),
(13, 'Olah Raga', NULL),
(14, 'kampus', NULL),
(16, 'Politik', 'Bidang Politik');

-- --------------------------------------------------------

--
-- Table structure for table `m_perbaikan`
--

CREATE TABLE `m_perbaikan` (
  `id` int(11) NOT NULL,
  `template_perbaikan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_perbaikan`
--

INSERT INTO `m_perbaikan` (`id`, `template_perbaikan`) VALUES
(1, 'ddddddddddd');

-- --------------------------------------------------------

--
-- Table structure for table `m_subunit`
--

CREATE TABLE `m_subunit` (
  `id_subunit` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `nama_subunit` varchar(250) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `m_subunit`
--

INSERT INTO `m_subunit` (`id_subunit`, `id_unit`, `nama_subunit`, `deskripsi`) VALUES
(1, 12, 'Studi Agama Agama', NULL),
(2, 12, 'Ilmu Al-Quran dan Tafsir', NULL),
(3, 12, 'Psikologi Islam', NULL),
(4, 12, 'Komunikasi Dan Penyiaran Islam', NULL),
(5, 12, 'Tasawuf dan Psikoterapi', NULL),
(6, 12, 'Ilmu Hadits', NULL),
(7, 12, 'Sosiologi Agama', NULL),
(8, 13, 'Pendidikan Agama Islam', NULL),
(9, 13, 'Pendidikah Bahasa Arab', NULL),
(10, 13, 'Tadris Bahasa Inggris', NULL),
(11, 13, 'Tadris Matematika', NULL),
(12, 13, 'Manajemen Pendidikan Islam', NULL),
(13, 13, 'Pendidikan Guru Madrasah Ibtidaiyah', NULL),
(14, 13, 'Tadris Bahasa Indonesia', NULL),
(15, 13, 'Tadris IPA', NULL),
(16, 10, 'Hukum Keluarga Islam', NULL),
(17, 10, 'Hukum Ekonomi Syariah', NULL),
(18, 11, 'Ekonomi Syariah', NULL),
(19, 11, 'Perbankan Syariah', NULL),
(20, 11, 'Akuntansi Syariah', NULL),
(21, 11, 'Manajemen Bisnis Syariah', NULL),
(22, 14, 'Pendidikan Agama Islam', NULL),
(24, 14, 'Ilmu Al-Quran dan Tafsir', NULL),
(25, 14, 'Pendidikan Bahasa Arab', NULL),
(26, 14, 'Manajemen Pendidikan Islam', NULL),
(27, 5, 'Ekonomi Syariah', NULL),
(28, 5, 'Tadris Bahasa Inggris', NULL),
(29, 5, 'Hukum Keluarga Islam', NULL),
(31, 16, 'ttt', 'ttt');

-- --------------------------------------------------------

--
-- Table structure for table `m_tahap`
--

CREATE TABLE `m_tahap` (
  `id_tahap` int(11) NOT NULL,
  `nama_tahap` varchar(225) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `m_tahap`
--

INSERT INTO `m_tahap` (`id_tahap`, `nama_tahap`, `deskripsi`) VALUES
(2, 'Verifikasi Kelengkapan Dokumen', NULL),
(3, 'Perbaikan Dokumen AMI', NULL),
(4, 'Penilaian Auditor', NULL),
(5, 'Pengumuman Hasil', NULL),
(6, 'test', '1123');

-- --------------------------------------------------------

--
-- Table structure for table `m_temuan`
--

CREATE TABLE `m_temuan` (
  `id` int(11) NOT NULL,
  `template_temuan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_temuan`
--

INSERT INTO `m_temuan` (`id`, `template_temuan`) VALUES
(3, 'fdafdasfwwwww1');

-- --------------------------------------------------------

--
-- Table structure for table `m_unit`
--

CREATE TABLE `m_unit` (
  `id_unit` int(11) NOT NULL,
  `nama_unit` varchar(225) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `m_unit`
--

INSERT INTO `m_unit` (`id_unit`, `nama_unit`, `deskripsi`) VALUES
(2, 'Bagian Umum', 'Bagian Umum'),
(3, 'Akademik', 'Bagian Akademik, Mahasiwa dan Kerja Sama'),
(4, 'LPM', 'LPM'),
(5, 'LPPM', 'LPPM'),
(6, 'UPT TIPD', 'UPT TIPD'),
(7, 'UPT BAHASA', 'UPT BAHASA'),
(8, 'UPT MAHAD', 'UPT MAHAD'),
(9, 'PERPUS', 'PERPUS'),
(10, 'Studi Agama Agama', 'Fakultas Ushuluddin dan Dakwah'),
(11, 'Ilmu Al-Quran dan Tafsir', 'Fakultas Ushuluddin dan Dakwah'),
(12, 'Psikologi Islam', 'Fakultas Ushuluddin dan Dakwah'),
(13, 'Komunikasi Dan Penyiaran Islam', 'Fakultas Ushuluddin dan Dakwah'),
(14, 'Tasawuf dan Psikoterapi', 'Fakultas Ushuluddin dan Dakwah'),
(15, 'Ilmu Hadits', 'Fakultas Ushuluddin dan Dakwah'),
(16, 'Sosiologi Agama', 'Fakultas Ushuluddin dan Dakwah'),
(17, 'Pendidikan Agama Islam', 'Fakultas Tarbiyah'),
(18, 'Pendidikah Bahasa Arab', 'Fakultas Tarbiyah'),
(19, 'Tadris Bahasa Inggris', 'Fakultas Tarbiyah'),
(20, 'Tadris Matematika', 'Fakultas Tarbiyah'),
(21, 'Manajemen Pendidikan Islam', 'Fakultas Tarbiyah'),
(22, 'Pendidikan Guru Madrasah Ibtidaiyah', 'Fakultas Tarbiyah'),
(23, 'Tadris Bahasa Indonesia', 'Fakultas Tarbiyah'),
(24, 'Tadris IPA', 'Fakultas Tarbiyah'),
(25, 'Hukum Keluarga Islam', 'Fakultas Syariah'),
(26, 'Hukum Ekonomi Syariah', 'Fakultas Syariah'),
(27, 'Ekonomi Syariah', 'Fakultas Ekonomi dan Bisnis'),
(28, 'Perbankan Syariah', 'Fakultas Ekonomi dan Bisnis'),
(29, 'Akuntansi Syariah', 'Fakultas Ekonomi dan Bisnis'),
(30, 'Manajemen Bisnis Syariah', 'Fakultas Ekonomi dan Bisnis'),
(31, 'Pendidikan Agama Islam', 'Pascasarjana'),
(32, 'Ilmu Al-Quran dan Tafsir', 'Pascasarjana'),
(33, 'Pendidikan Bahasa Arab', 'Pascasarjana'),
(34, 'Manajemen Pendidikan Islam', 'Pascasarjana'),
(35, 'Ekonomi Syariah', 'LPPM'),
(36, 'Tadris Bahasa Inggris', 'LPPM'),
(37, 'Hukum Keluarga Islam', 'LPPM');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id_news` int(11) NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `konten` text DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT 0,
  `img` varchar(40) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_unit` varchar(40) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `tampil` enum('Y','N') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id_news`, `title`, `konten`, `tanggal`, `id_kategori`, `views`, `img`, `id_user`, `id_unit`, `slug`, `tampil`, `created_at`, `updated_at`) VALUES
(1, 'Cras et dictum nisl nulla vitae auctor diam', '<p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.&nbsp;Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.&nbsp;Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.&nbsp;Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra</p>', '2023-07-08', 2, 0, '6c5f741b2230158bd737378220cd4d60.jpg', NULL, NULL, 'cras-et-dictum-nisl-nulla-vitae-auctor-diam', 'Y', '2023-07-08 11:50:39', '2023-07-08 11:50:39'),
(2, 'Cras et dictum nisl nulla vitae auctor diam', '<p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.</p>', '2023-07-08', 3, 0, 'bb9090b543ba015dc89ca921723e0009.png', NULL, NULL, 'cras-et-dictum-nisl-nulla-vitae-auctor-diam', 'Y', '2023-07-08 11:52:52', '2023-07-08 11:52:52'),
(3, 'Cras et dictum nisl nulla vitae auctor diam', '<p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.</p>', '2023-07-08', 1, 0, '8aac871be4cd7e3c69ffcb894d23aff7.png', NULL, NULL, 'cras-et-dictum-nisl-nulla-vitae-auctor-diam', 'Y', '2023-07-08 11:53:16', '2023-07-08 11:53:16'),
(4, 'What is Lorem Ipsum?', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2023-07-08', 1, 0, '4b1368d96f038a0ea986767747e635d3.png', NULL, NULL, 'what-is-lorem-ipsum', 'Y', '2023-07-08 11:53:54', '2023-07-08 11:53:54'),
(5, 'Why do we use it?', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', '2023-07-08', 1, 0, '5c32d1b0522234e709fc54b6f1a43cdd.png', NULL, NULL, 'why-do-we-use-it', 'Y', '2023-07-08 11:54:14', '2023-07-08 11:54:14'),
(6, 'Where does it come from?', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham</p>', '2023-07-08', 1, 0, '1fbf24ef88651ce3185eb221fac48105.jpg', NULL, NULL, 'where-does-it-come-from', 'Y', '2023-07-08 11:54:41', '2023-07-08 11:54:41'),
(7, 'Where can I get some?', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '2023-07-08', 1, 11, '3fa6df60df12f385e355f38845b94a94.png', NULL, NULL, 'where-can-i-get-some', 'Y', '2023-07-08 11:55:12', '2023-07-08 11:55:12');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `pin` varchar(11) NOT NULL,
  `nik` varchar(32) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `id_status` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_grade` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `keterangan` varchar(225) DEFAULT NULL,
  `gelar_depan` varchar(20) DEFAULT NULL,
  `gelar_belakang` varchar(20) DEFAULT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `tempat_lahir` varchar(200) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gol_darah` varchar(2) DEFAULT NULL,
  `agama` enum('islam','kristen','katolik','hindu','budha') NOT NULL,
  `status_pernikahan` enum('Belum Menikah','Menikah','Duda','Janda') DEFAULT NULL,
  `foto` varchar(225) DEFAULT NULL,
  `tmt_pegawai` date DEFAULT NULL,
  `status` enum('aktif','nonaktif','tubel','ibel','mutasi','meninggal') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `pin`, `nik`, `nip`, `id_status`, `nama`, `id_grade`, `id_unit`, `keterangan`, `gelar_depan`, `gelar_belakang`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `nohp`, `email`, `gol_darah`, `agama`, `status_pernikahan`, `foto`, `tmt_pegawai`, `status`) VALUES
(1, '1', '198306122008011009', '198306122008011009', 2, 'Badrul Munir Marzuqi, S.Kom', 9, 10, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(2, '2', '197304192000031002', '197304192000031002', 2, 'H Tri Hartanto, S.Sos, M.Si.', 12, 7, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(3, '3', '197304122006041004', '197304122006041004', 2, 'Budiyanto, S. Sos, MM', 10, 6, '', '', '', 'L', 'Kediri', '1973-04-12', 'Jl. Joyoboyo I no. 98 Tepus, Kab Kediri', '085235068202', 'budiyanto120473@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/197304122006041004-1657160061509.jpg', '0000-00-00', 'aktif'),
(4, '4', '196907052009012003', '196907052009012003', 2, 'Isrofin, S.Ag', 7, 6, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(7, '7', '197708262003122001', '197708262003122001', 2, 'Hj. Atik Masfiah, S.Ag, MM', 10, 8, '', '', '', 'P', 'kediri', '2022-08-26', 'susuhan gampeng RT/Rw 04/03 Gampengrejo kediri', '081335689213', 'amas.fiah28@gmail.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(8, '8', '197902032007012020', '197902032007012020', 2, 'Fitri Wijayanti, S.Sos., MM', 10, 7, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(9, '9', '196804072005011002', '196804072005011002', 2, 'Muchamad Sulton, S.Sos', 9, 6, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(10, '10', '196806272006041001', '196806272006041001', 2, 'Drs. Muhammad Sururi', 7, 19, '', '', '', 'L', 'Kediri', '1968-06-27', 'Lingk. Centong Rt. 02 Rw. 07 Kelurahan Bawang Kec. Pesantren Kota Kediri', '08123439875', 'muhammadsururi²70668@gmail.com', 'AB', 'islam', 'Menikah', 'public/uploads/196806272006041001-1679987175968.jpg', '0000-00-00', 'aktif'),
(11, '11', '197610072009011005', '197610072009011005', 2, 'Dion Ekha Sanjaya, S.IP', 9, 20, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/197610072009011005-1655699950213.jpg', '0000-00-00', 'aktif'),
(12, '143', '196004201987032002', '196004201987032002', 1, 'Sardjuningsih, Dr., Hj., M.Ag', 14, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(13, '58', '197201242008011008', '197201242008011008', 1, 'Ahmad Sholihuddin, M.Pd', 12, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(15, '13', '197810042007011015', '197810042007011015', 2, 'Nanang Arif Marzuki', 6, 23, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(16, '12', '197403262009101001', '197403262009101001', 2, 'Budi Dwi Santoso, S.Sos.', 9, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(17, '14', '196706012000031001', '196706012000031001', 2, 'Marhasan, MM', 12, 12, '', '', '', 'L', 'Pamekasan', '1967-06-01', 'Jln. Sunan Giri No. 32 RT 05 RW 04 Kelurahan Rejomulyo Kecamatan Kota, Kotamadya Kediri', '082111433445', 'hasanmarhasan@yahoo.com', '', 'islam', 'Menikah', 'public/uploads/196706012000031001-1676009674002.jpg', '0000-00-00', 'aktif'),
(18, '15', '197506202003121002', '197506202003121002', 2, 'Mahmudi, SE', 10, 12, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(19, '16', '198202032009011018', '198202032009011018', 2, 'Ahmad Dian Lukman Harun, M.M.', 8, 25, '', '', '', 'L', 'Blitar', '1982-02-03', 'Tapan Bakung Udanawu Blitar', '085655333876', 'ayungadlh@gmail.com', 'AB', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(20, '17', '198303242009101002', '198303242009101002', 2, 'Ganet Falufi, S.Sos.', 6, 14, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(21, '18', '197610082005012003', '197610082005012003', 2, 'Versi Islachatin, SE', 10, 14, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(22, '19', '197905052003122005', '197905052003122005', 2, 'Uswatu Khittotin, S.HI', 10, 16, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(23, '20', '198508072009012012', '198508072009012012', 2, 'Indriya Inayati, SE', 9, 19, '', '', 'SE', 'P', 'Kediri', '1985-08-07', 'Kanigoro Kras Kediri', '085647854443', 'indria.sf@gmail.com', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(24, '21', '198304142009011014', '198304142009011014', 2, 'Finis Kurnianto, S.Sos. M.Si.', 8, 6, '', '', '', 'L', 'Kediri', '1983-04-14', 'Perum Bumi Asri Blok Z-4 Kaliombo Kediri', '085235073170', 'finis.kurnianto@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/198304142009011014-1654004211358.jpg', '0000-00-00', 'aktif'),
(25, '22', '198007062007101005', '198007062007101005', 2, 'Aqul Mashuri, S.Sos', 9, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(26, '23', '197608102007011021', '197608102007011021', 2, 'Purwanto', 6, 10, '', '', '', 'L', 'kediri', '1976-08-10', 'jl rau.  RT.02. RW.03. DS.wates. kec pagu. kab Kediri.jatim', '085230347117', 'purwanto.stainkediri@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(27, '24', '197201222002121001', '197201222002121001', 2, 'Imam Yanuar, S.Pd', 10, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(28, '25', '196711302005011002', '196711302005011002', 2, 'Gatot Wijanarko, S.Ag, M.Si', 10, 8, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(29, '26', '197312052000032001', '197312052000032001', 2, 'Masyfu\'ah, S.Sos', 10, 16, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/197312052000032001-1670984961749.jpg', '0000-00-00', 'aktif'),
(30, '27', '197708292009122001', '197708292009122001', 2, 'Ni`mah Mujtahidah, SE', 10, 12, '', '', 'S.E.', 'P', 'Lamongan', '1977-08-29', 'Lingkungan Dadapan RT 02 RW 09 Pesantren Kota Kediri', '085232992105', 'nimahkdr@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(31, '28', '198304262011011010', '198304262011011010', 2, 'Zainul Qo`im, S.Kom', 10, 6, '', '', 'S.Kom', 'L', 'Kediri', '1983-04-26', 'Jl. Karebet RT 1 RW 6 Desa Turus Kecamatan  Gurah Kab. Kediri', '085784526055', 'zai.co.im@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/198304262011011010-1641273307221.jpg', '0000-00-00', 'aktif'),
(32, '29', '198607032011011006', '198607032011011006', 2, 'Seto Wahyu Anggara, S.E', 8, 6, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(33, '30', '197608222001121001', '197608222001121001', 2, 'Ilham Mashuri, Dr., S.Ag,SS, MH', 8, 20, '', '', '', 'L', 'Madiun', '0001-11-30', 'Ngasinan Kelurahan Rejomulyo Kota Kediri', '082161625822', 'ilham_mashuri@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(34, '31', '196504082000121003', '196504082000121003', 2, 'Achmad Muslih, H. S.sos', 10, 21, '', '', '', 'L', '', '0001-11-30', 'jln.Tinalan barat II/28b kota Kediri', '085234777686', 'ahmadmuslih1965@gmail.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(36, '33', '197912122005012008', '197912122005012008', 2, 'Evi Rahmawati, S.I.Kom.', 9, 21, '', '', '', 'P', 'Kediri', '1979-12-12', 'Dsn. Krajan RT.01 RW.01 Ds.Mangunrejo Kec.Ngadiluwih Kab.Kediri', '085233591111', 'evinudi@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/197912122005012008-1684118586522.jpg', '0000-00-00', 'aktif'),
(37, '34', '197310142000031001', '197310142000031001', 2, 'Komarudin, S.Ag, S.S.M.Hum', 12, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/197310142000031001-1654471312279.jpg', '0000-00-00', 'aktif'),
(38, '35', '197906302005011004', '197906302005011004', 2, 'Muhamad Hamim, S.Kom', 10, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(39, '36', '198006092003121002', '198006092003121002', 2, 'Muhammad Bahtiar Aman, SE', 9, 18, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(40, '37', '197004212009011007', '197004212009011007', 2, 'Mukhammad Anwar, SE', 9, 6, '', '', 'ME', 'L', 'Kediri', '1970-04-21', 'Sumbersuko asmorobangun Puncu', '082191080527', 'ansukses_ina@yahoo.co.id', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(41, '38', '197205052006041001', '197205052006041001', 1, 'Untung Khoiruddin, Dr., M.Pd.I.', 8, 9, '', '', '', 'L', 'Kediri', '1972-11-05', 'Bogo RT. 001 RT. 007 Bulu Semen Kediri', '085649005500', 'untungkhoiruddin@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(42, '39', '197310312006041007', '197310312006041007', 2, 'Yudi Sumarsono', 6, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(43, '40', '198703092011011006', '198703092011011006', 2, 'Achmad Syafiqul Kholan, S.IP', 10, 7, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/198703092011011006-1674096559692.jpg', '0000-00-00', 'aktif'),
(44, '41', '196910252003121001', '196910252003121001', 1, 'Achmad Munif, SE, MM', 12, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(45, '42', '196312261991031001', '196312261991031001', 1, 'Ahmad Subakir, Dr., H.,  M.Ag.', 14, 11, '', 'Dr.', 'M. Ag.', 'L', 'Blora', '0001-11-30', 'Jl. Ahmad Yani Rt 04 Rw 02 Kranggan Gurah Kab Kediri', '08123259412', 'ahmadsubakir@iainkediri.ac.id', 'A', 'islam', 'Menikah', 'public/uploads/196312261991031001-1649524247425.jpg', '0000-00-00', 'aktif'),
(46, '43', '196202091996031001', '196202091996031001', 1, 'Nur Ahid, Prof., Dr., H., M.Ag', 16, 17, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(47, '44', '196203041998032001', '196203041998032001', 1, 'Nurul Hanani, Dr., MHI', 14, 17, '', '', '', 'P', 'Kediri', '1962-03-04', 'Pucanganom Rt 04 Rw 05 Sukorejo Gurah Kediri', '081297436261', 'nurulhanani2014@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(48, '45', '197403232000031003', '197403232000031003', 1, 'M. Dimyati Huda, Dr., M.Ag.', 14, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(49, '46', '197208292001121002', '197208292001121002', 1, 'Mu`min Firmansyah, Dr. H., S.Ag., MHI', 10, 9, '', 'Dr. H.', 'S.Ag., MHI', 'L', 'Larangan', '1972-08-29', 'Jl. Anggrek Raya No. 2 A RT 07 RW 07 Ngronggo Kota Kediri', '081335869336', 'mumin_firmansyah@yahoo.co.id', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(50, '47', '198608032011012014', '198608032011012014', 2, 'Rudhad Ilaina, M.Pd.', 8, 18, '', '', '', 'P', 'Kediri ', '0001-11-30', 'ngreco kandat kediri', '085815552499', 'rudhad.ilaina@gmail.com', 'B ', 'islam', 'Menikah', 'public/uploads/198608032011012014-1675693961513.jpg', '0000-00-00', 'aktif'),
(51, '48', '197003172003121001', '197003172003121001', 2, 'H. Husnu Rofik, S.pd, MM.', 12, 8, '', '', '', 'L', 'Kediri ', '1970-03-17', 'Jl. Marabunta No. 323  RT.03 RW. 03 Balong Ringinrejo Kediri  ', '081335366209', 'husnurofik7988@gmail.com ', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(52, '49', '198302152003122001', '198302152003122001', 2, 'Dwi Puji Rahayu, SE.', 8, 7, '', '', '', 'L', 'Kediri', '1983-02-15', 'Jln Letjen Suparman No 45 B RT 022 RW 004 Kel. Pakunden Kota Kediri Jawa Timur', '081325024434', 'dwipujirahayu3@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(53, '50', '196606111994032001', '196606111994032001', 2, 'Sri Ningsih, SE', 10, 18, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(55, '52', '197107021998032002', '197107021998032002', 2, 'Julfiana Evarini, SE', 12, 10, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(56, '53', '196807242002121002', '196807242002121002', 2, 'Nurhadi, M.MPd', 10, 14, '', '', '', 'L', 'Kediri', '2022-07-24', 'Permata Hijau D-11 Singonegaran', '085230860565', 'nurhadi@iainkediri.ac.id', 'B', 'islam', 'Menikah', 'public/uploads/196807242002121002-1668640580487.jpg', '0000-00-00', 'aktif'),
(57, '54', '196705031990032002', '196705031990032002', 2, 'Nurwarniatun, SH, MH', 12, 21, '', '', '', 'P', 'Nganjuk', '1967-05-03', 'Perum Permata Hijau blok D no.11, Desa Singonegaran Kec. Pesantren Kota Kediri.', '085234667112', 'nurt347@gmail.com', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(58, '55', '196703302005012002', '196703302005012002', 2, 'Dewi Masithoh, SE', 7, 6, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(59, '56', '196505272000031001', '196505272000031001', 1, 'Agus Edi Winarto, Drs, M.Pd', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(60, '57', '197203022007101007', '197203022007101007', 1, 'Ahmad Rifa`i, M.Pd', 12, 9, '', 'Dr.H.', '', 'L', 'Malang', '1972-03-02', 'Jl. Sersan Suharmaji gang Usman Ali 8 b Kota Kediri', '085736237570', 'rifaikdr72@gmail.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(61, '59', '197108202006041002', '197108202006041002', 1, 'Ahmad Taufiq, S. Ag. M. Si.', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(62, '60', '196405031996031001', '196405031996031001', 1, 'Ali Anwar, Dr, H. M.Ag', 14, 9, '', '', '', 'L', 'Demak', '1964-05-03', 'Jl.  Sunan Ampel II/18 RT 001 RW 002 Rejomulyo,  Kota,  Kediri', '081554222280', 'ali.anwar@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(63, '61', '197312151999031002', '197312151999031002', 1, 'Anis Humaidi, Dr., M.Ag.', 14, 17, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(64, '62', '198204302008012011', '198204302008012011', 1, 'Ary Setya Budhi Ningrum, Dr., M.Pd', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(65, '63', '197509302007101004', '197509302007101004', 1, 'Bahruddin, S.S., M.Pd.', 12, 9, '', '', '', 'L', 'Pamekasan', '1975-09-30', 'Jl Taman Kemuning Gg Melati 99, Tamanan - Kediri', '0811388522', 'mrbee@bahruddin.net', '0+', 'islam', 'Menikah', 'public/uploads/197509302007101004-1674781866372.jpg', '0000-00-00', 'aktif'),
(66, '64', '197906202009121001', '197906202009121001', 1, 'Burhanudin Syaifulloh, H. M.Ed', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(67, '65', '197910222009121002', '197910222009121002', 1, 'Chothibul Umam, M.Pd', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(69, '67', '197611252007102005', '197611252007102005', 1, 'Erna Nurkholida, M.Pd', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(70, '68', '196608111999032002', '196608111999032002', 1, 'Fartika Ifriqia, Dra. M.Pd.', 12, 9, '', 'Dr.', 'M. Pd', 'P', 'Blitar', '1966-08-11', 'Kediri', '081553514341', 'kalmanfartika@ymail.com ', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(71, '69', '196908312000031001', '196908312000031001', 1, 'Fathor Rasyid, Dr., M.Pd.', 14, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/196908312000031001-1645726399862.jpg', '0000-00-00', 'aktif'),
(72, '70', '197009042003121002', '197009042003121002', 1, 'Ilham Tohari, Dr., H., SH., M.HI.', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(73, '71', '197111032000031003', '197111032000031003', 1, 'Imron Muzakki, Dr., S.Psi, M.Psi', 12, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(74, '72', '196406011998031001', '196406011998031001', 1, 'Iskandar Tsani, Dr., M.Ag.', 14, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(75, '73', '197509132008011014', '197509132008011014', 1, 'Jamaludin Acmad Kholik, Dr., MA', 12, 17, '', 'Dr.', 'Lc. ', 'L', 'Kediri', '1975-09-13', 'Jl. Hasanudin RT 08 RW. 01 Desa Ngasem Jec. Gurah Kab. Kediri', '085317375445', 'gamal_ac@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(76, '74', '197303032007011045', '197303032007011045', 1, 'Khoiru Nidak, M.Pd', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(77, '76', '197403232002121001', '197403232002121001', 2, 'Moch. Basit Aulawi, S.Pd, S.IPI.', 12, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(78, '77', '196612201991031002', '196612201991031002', 1, 'Moh. Irfan Burhani, Drs, M.Psi', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(79, '78', '195907111992031002', '195907111992031002', 1, 'Moh. Rois, Drs., MA', 14, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(80, '79', '198012262009121004', '198012262009121004', 1, 'Mohammad Muhyidin, M.Pd', 9, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(81, '80', '196806041998032001', '196806041998032001', 1, 'Mu\'awanah, Dr., M.Pd', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(82, '81', '197106101998031003', '197106101998031003', 1, 'Muhamad Yasin, Dr., S.Ag., M.Pd', 14, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(83, '82', '196604051992031002', '196604051992031002', 1, 'Mukhammad Abdullah, Dr., M.Ag', 14, 17, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(84, '83', '197004121994032006', '197004121994032006', 1, 'Munifah, Dr., M.Pd.', 14, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(85, '84', '198008022005012005', '198008022005012005', 1, 'Ninik Zuroidah, M.Si', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(86, '86', '197701092005012002', '197701092005012002', 1, 'Noer Hidayah, Dr. M.Si', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(87, '87', '197707132003122003', '197707132003122003', 1, 'Nur Afifi, M.App.Ling', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(89, '89', '196703092007102001', '196703092007102001', 1, 'Nurul Ain, Dra. M.Pd.', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(90, '90', '196907142001121002', '196907142001121002', 1, 'Qomarus Zaman', 14, 15, '', '', 'Lc., M.Pd.I', 'L', 'Nganjuk', '1969-07-14', 'RT. 29 RW.09 Tanjungtani Prambon Nganjuk Jatim', '081335749972', 'qomarzaman@gmail.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(91, '91', '197208272005011005', '197208272005011005', 1, 'Saifullah, H., M.Ag.', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(92, '92', '197307092006042001', '197307092006042001', 1, 'Salma Sunaiyah, S. Ag., M.Pd.', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(93, '93', '196302261993031001', '196302261993031001', 1, 'Syamsul Huda, Dr., H., M.Ag', 14, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(94, '94', '198102152009122003', '198102152009122003', 1, 'Tatik Imadatus Sa\'adati, S.Psi, M.Psi, Psikolog.', 12, 11, '', '', '', 'P', '', '1981-02-15', 'Perum .Graha Mukti Regency .C.29', '085790421128', 'imakediri@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/198102152009122003-1657675366706.jpg', '0000-00-00', 'aktif'),
(95, '95', '197212202006042003', '197212202006042003', 1, 'Toyyibah, Dr., M.Pd', 12, 17, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(96, '96', '197402062003121003', '197402062003121003', 1, 'Wahidul Anam, Dr., M.Ag', 14, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(97, '97', '197604062007102007', '197604062007102007', 1, 'Yuyun Zunairoh, Dr., M.Pd', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(98, '98', '197406202011011001', '197406202011011001', 1, 'Moh. Zainal Fanani, M.Pd.I', 10, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(99, '99', '198404082011011009', '198404082011011009', 1, 'Ibrahim Bin Sa`id, Ph.D.', 8, 9, '', 'Dr.', '', 'L', 'Surabaya', '1984-04-08', 'Sidoresmo Dalam No 53 Surabaya', '+628121784729', 'binsaid@iainkediri.ac.id', '0', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(100, '100', '198409092011012018', '198409092011012018', 1, 'Sri Wahyuni, Dr, M.Pd', 12, 9, '', 'Dr', 'M. Pd', 'P', 'Kediri', '1984-09-09', 'Jl. Sunan Ampel I/36 Rejomulyo, Kota Kediri', '085736768465', 'swy090984@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(102, '102', '196706222006041009', '196706222006041009', 1, 'Abdullah Taufik, Dr., SH, MH.', 12, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(103, '103', '197607082006041004', '197607082006041004', 1, 'Ahmad Syakur, Dr., M.EI.', 12, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(104, '104', '197610312009011003', '197610312009011003', 1, 'H. Ali Samsuri, Dr., M.EI', 12, 13, '', '', '', 'L', 'Jombang', '1976-10-31', 'Sumberbendo Gg Masjid Arribath RT.006 RW 005 Ds.Jogoroto Kec. Jogoroto Kab. Jombang ', '081555794777', 'alisamsuri@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(105, '105', '197605072008011013', '197605072008011013', 1, 'Amrul Mutaqin, M.EI', 12, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/197605072008011013-1657512889409.jpg', '0000-00-00', 'aktif'),
(106, '106', '197301132003122001', '197301132003122001', 1, 'Andriani, Dr., SE., MM.', 14, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(107, '107', '197504192000032002', '197504192000032002', 1, 'Ashfa Fikriyah, S.Ag, M.EI', 1, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(108, '108', '197501011998031002', '197501011998031002', 1, 'Imam Annas Mushlihin, Dr., H., MHI', 14, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(109, '109', '197701072009121001', '197701072009121001', 1, 'Iwan Marwan, Dr., M.Hum', 12, 9, '', '', '', 'L', 'Bandung', '1977-01-07', 'jalan cakarwesi nomor 44 tosaren ', '085645024177', 'iwanmarwan@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/197701072009121001-1645705381068.jpg', '0000-00-00', 'aktif'),
(110, '110', '196406242002121001', '196406242002121001', 1, 'Khamim, Dr., M.Ag', 14, 15, '', '', '', 'L', 'Demak ', '1964-06-24', 'Dusun Gading Desa Gadingmangu Perak Jombang ', '081231142294', 'musakhamim@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(111, '111', '196401042000031002', '196401042000031002', 1, 'M. Mahdil Mawahib, H.Drs, M.Ag,SH.BA.', 14, 15, '', '', '', 'L', 'Nganjuk', '1964-01-04', 'jl.Hasyim Asy\'ari GG.Bahagia 09Banjarmlati Mojoroto Kediri Jatim', '085708896364', 'hajimahdil76@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(112, '112', '197702232009011004', '197702232009011004', 1, 'Moh. Nafik, M.HI', 10, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/197702232009011004-1655127720915.jpg', '0000-00-00', 'aktif'),
(113, '113', '197307131997031003', '197307131997031003', 1, 'Mohammad Bakir, M.Fil.I', 10, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(114, '114', '197404012003121005', '197404012003121005', 1, 'Muhammad Muhaimin, M.Ag', 1, 15, '', 'Dr', '', 'L', '', '2023-04-01', 'Jl Raya Gudo 172', '081330467950', 'imin0474@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(115, '115', '197405282003122001', '197405282003122001', 1, 'Naning Fatmawatie, Dr. Hj., SE, MM.', 14, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(116, '116', '196807141997031002', '196807141997031002', 1, 'Nur Chamid, Dr., H., MM.', 14, 13, '', '', '', 'L', 'Jombang', '1968-07-14', 'Sambong Dukuh, kec Jombang, kab Jombang', '087754154129', 'nurchamid5770@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(117, '117', '198001312003122003', '198001312003122003', 1, 'Nuril Hidayati, M.Hum', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(118, '118', '197712152005012002', '197712152005012002', 1, 'Rini Risnawita Suminta, Dr. M.Si', 12, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(119, '119', '196906171998031002', '196906171998031002', 1, 'Rofik Efendi, S.Kom, MM', 12, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(120, '120', '197206261999031002', '197206261999031002', 1, 'Ropingi,Dr.,  S.Ag, M.Pd.', 14, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(121, '121', '197712252009012006', '197712252009012006', 1, 'Sri Anugrah Natalina, SE, MM', 12, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(122, '122', '198109302009012008', '198109302009012008', 1, 'Sulistyowati, Dr., S.HI., M.EI', 12, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(123, '123', '197802012005012002', '197802012005012002', 1, 'Ulin Na\'mah, Dr., M.HI', 12, 15, '', '', '', 'P', '', '0001-11-30', 'Jl. Dandang Gendis 94, RT /RW: 28/ 05 Ds. Doko, Kec. Ngasem, Kabupaten Kediri', '081335707587', 'ulinnakmah@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/197802012005012002-1648034865586.jpg', '0000-00-00', 'aktif'),
(124, '124', '197312162005011002', '197312162005011002', 1, 'Zayad Abd. Rahman, M.HI', 12, 17, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(125, '125', '197204122006042001', '197204122006042001', 1, 'Zuraidah, Dr., S.Si., M.Si', 12, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(126, '126', '198003132011012004', '198003132011012004', 1, 'Siti Nurhayati, Dr. Hj., S.H.I., M.Hum.', 0, 15, '', 'Dr. Hj.', 'S.H.I., M.Hum.', 'P', 'Magetan ', '1980-03-13', 'Getasanyar RT/RW 001/001 Getasanyar Sidorejo Magetan Jawa Timur 63361', '085233967894', 'sitinurhayati@iainkediri.ac.id ', 'A', 'islam', 'Menikah', 'public/uploads/198003132011012004-1671534417519.jpg', '0000-00-00', 'aktif'),
(127, '127', '197111212005011006', '197111212005011006', 1, 'A. Halil Thahir, Dr.,  M.HI.', 14, 17, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(129, '129', '197912162008012024', '197912162008012024', 1, 'Diah Handayani, M.Si', 12, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/197912162008012024-1648771504146.jpg', '0000-00-00', 'aktif'),
(130, '130', '195301191987031001', '195301191987031001', 1, 'Fauzan Saleh, Prof., H., MA., Ph.D.', 16, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(131, '131', '197211122000031001', '197211122000031001', 1, 'Hasan Basri, M.Ag', 14, 11, '', 'H', '', 'L', 'Lampung Tengah ', '1972-11-12', 'Jl. Raung GG Masjid 15A RT 03 RW 05 Lirboyo, Mojoroto, Kota Kediri ', '081231252551', 'hasbaskediri@gmail.com', 'O', 'islam', 'Duda', '', '0000-00-00', 'aktif'),
(132, '132', '197305041999031014', '197305041999031014', 1, 'M. Mu\'tashim Billah, H., MA', 14, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(133, '133', '197711302003121002', '197711302003121002', 1, 'Moch. Muwaffiqillah, Dr. M.Fil.I', 0, 11, '', '', '', 'L', 'Kediri ', '1977-11-30', 'dsn. Setono, RT. 02 RW. 03 Ds. Tales Ngadiluwih Kediri ', '081332868847', 'muwaffiqymuhammad@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(134, '134', '197303012000031001', '197303012000031001', 1, 'Moh. Akib, Dr, H., M.Ag', 14, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(135, '135', '197506132003121004', '197506132003121004', 1, 'Moh. Asror Yusuf, Dr., M.Ag', 14, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(136, '136', '197607082003121003', '197607082003121003', 1, 'Moh. Shofiyul Huda MF, M.Ag', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(137, '137', '197408251999031003', '197408251999031003', 1, 'Mohamad Zaenal Arifin, Dr., MHI.', 14, 11, '', 'Dr', 'MHI.', 'L', 'Grobogan', '1974-08-25', 'Jl. Kenongo 7/2 RT/RW 16/08 Ngronggo Kediri', '081335725966', 'mohamadzaenalarifin@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/197408251999031003-1646046472450.jpg', '0000-00-00', 'aktif'),
(138, '138', '196902171999031001', '196902171999031001', 1, 'Muhammad Qomarul Huda, Dr., M.Fil.I', 12, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(139, '140', '197804212005011002', '197804212005011002', 1, 'Prilani, Dr.,  M.Si', 12, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(141, '141', '198010142009122002', '198010142009122002', 1, 'Prima Ayu Rizqi Mahanani, Dr., M.Si', 1, 11, '', 'Dr', 'M.Si', 'P', 'Kediri ', '1980-10-14', 'Jl. Anggraini IV/8 Kediri', '0817250841', 'prima.ayu99@yahoo.co.id', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(142, '142', '196904081998032002', '196904081998032002', 1, 'Robingatun, Dra, M.Pd.I', 14, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(143, '144', '197206152000031004', '197206152000031004', 1, 'Tasmin, MA', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(144, '145', '197207252006041003', '197207252006041003', 1, 'Taufik Alamin,', 12, 11, '', 'Dr.', 'SS, M.Si', 'L', 'Gunungkidul', '1972-07-25', 'Kedungsentul RT10/RW 12 Mojoroto Kota Kediri', '081330714840', 'taufikalamin25@iainkediri.ac.id', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(145, '146', '196106171989031001', '196106171989031001', 1, 'Taufiqurrahman, Dr.,H.,  M.Ag.', 14, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(146, '147', '197307042005012003', '197307042005012003', 1, 'Yuli Darwati, M.Si', 12, 11, '', '', 'M.Si', 'L', 'Blitar', '1973-07-04', 'Perum BTN Rejomulyo  gg 2 no.47 Kota Kediri', '081331461018', 'yulidarwati73@gmail.com', 'A', 'islam', 'Menikah', 'public/uploads/197307042005012003-1648730935014.jpg', '0000-00-00', 'aktif'),
(147, '148', '197912122011012005', '197912122011012005', 1, 'Siti Amanah, M.Si', 12, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(148, '162', '198103032014121003', '198103032014121003', 2, 'Alif Mubarok, S.Ag', 7, 6, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(149, '185', '196807052006041001', '196807052006041001', 1, 'Mohammad Arif, Dr., M.A,', 12, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/196807052006041001-1664873190672.jpg', '0000-00-00', 'aktif'),
(150, '188', '196805112006041001', '196805112006041001', 1, 'Umar Faruq, S.Ag, M.Fil.I.', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(151, '198', '196010261979032001', '196010261979032001', 1, 'Umi Hanik, Dr., M.Ag.', 12, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(152, '217', '198709012015032003', '198709012015032003', 1, 'Zaenatul Hakamah, Lc, MA.Hum.', 8, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/198709012015032003-1664895244854.jpg', '0000-00-00', 'aktif'),
(153, '218', '199008172015032006', '199008172015032006', 1, 'Dewi Agus Triani, M.Pd.I.', 10, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(154, '219', '198811042015032012', '198811042015032012', 2, 'Aflakha Hakim Provesa, S.Pd.I.', 7, 7, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/198811042015032012-1662471408159.jpg', '0000-00-00', 'aktif'),
(155, '220', '198207292015031002', '198207292015031002', 1, 'Zuhri Humaidi, M.S.I.', 10, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(156, '221', '198808232015031008', '198808232015031008', 1, 'Addin Arsyadana, Dr. M. Pd. I. ', 10, 9, '', 'Dr. ', 'M. Pd. I. ', 'L', 'Nganjuk', '1988-08-23', 'Perum Joho View, Blok B2, Ds. Joho, Kec. Wates, Kab. Kediri', '081234662044', 'addinarsyadana88@gmail.com', 'B+', 'islam', 'Menikah', 'public/uploads/198808232015031008-1660176474292.jpg', '0000-00-00', 'aktif'),
(157, '222', '198607022015032003', '198607022015032003', 1, 'Ima Fitriyah, M.Pd.I.', 8, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(158, '223', '198401222015031005', '198401222015031005', 1, 'Erwin Indrioko, Dr., M.Pd.I.', 8, 9, '', '', '', 'L', '', '1984-01-22', 'kalangan. ngunut. tulungagung', '085735707375', 'indriokoerwin@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(159, '224', '198804232015031003', '198804232015031003', 1, 'M. Syamsul Ma\'arif, M.Pd.I.', 10, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(160, '225', '198504012015031003', '198504012015031003', 1, 'Munjiyat, M.Pd.I.', 8, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(161, '226', '198508122015031002', '198508122015031002', 1, 'Bagus Andrian Permata, M.Pd.I.', 10, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(162, '227', '198504272015032007', '198504272015032007', 1, 'Luthfi Atmasari, ', 8, 11, '', '', 'M.Psi., Psikolog', 'P', 'Tulungagung', '1985-04-27', 'Tulungagung', '08563651926', 'luthfiatmasari@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/198504272015032007-1650445991430.jpg', '0000-00-00', 'aktif'),
(163, '228', '198101202015031002', '198101202015031002', 1, 'Akhmad Hasan Saleh, S.Pd, M.PI.', 8, 11, '', '', '', 'L', 'sumenep', '1981-01-20', 'Vila Bukit Tidar A1/89 Malang', '081334079818', 'aconghasan@yahoo.com', 'AB', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(164, '229', '198508252015031003', '198508252015031003', 1, 'Khaerul Umam, Dr., M.Ud.', 8, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(165, '230', '198007072015031001', '198007072015031001', 1, 'Maufur, M.A.', 8, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(166, '231', '198709062015032007', '198709062015032007', 1, 'Dewi Hamidah, S.Si, M.Pd.', 8, 9, '', '', '', 'L', 'Palu', '1987-09-06', 'Pule, Kandat, Kab. Kediri', '6285216440489', 'dewi.hamidah@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/198709062015032007-1645688808299.jpg', '0000-00-00', 'aktif'),
(167, '233', '198809022015031004', '198809022015031004', 1, 'Ahmad Syamsudin, M.Kom.', 8, 9, '', '', 'M.Kom', 'L', 'Ponorogo', '0001-11-30', 'Ngasem ', '0895366600711', 'syamsudin@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/198809022015031004-1649368710553.jpg', '0000-00-00', 'aktif'),
(168, '234', '198610242015032003', '198610242015032003', 1, 'Nilna Fauza, M.HI.', 10, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(169, '235', '198703142015031006', '198703142015031006', 1, 'M. Alim Khoiri, S.HI, M.Sy.', 10, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(170, '236', '198602202015031004', '198602202015031004', 1, 'Syaiful Bahri, M.H.I.', 8, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(171, '237', '199004022015032004', '199004022015032004', 1, 'Faridatul Fitriyah, M.Sy.', 8, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/199004022015032004-1648097138184.jpg', '0000-00-00', 'aktif'),
(172, '244', '196307102014111001', '196307102014111001', 1, 'Asmakin, S.Ag. M.Pd.', 7, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(173, '247', '195703081981031003', '195703081981031003', 1, 'Abd. Manan Zakaria, H., Drs, MM.', 12, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(174, '249', '195812071993032001', '195812071993032001', 1, 'Najahah, Dr, Hj, M.Ag', 12, 9, '', '', '', 'L', 'Gresik, 07 Desember 1958', '0001-11-30', 'Jl. Sri Rejeki no 23 Madiun', '08125969304', 'najahahmudzakkir6@gmail.com ', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(175, '252', '197303252005012005', '197303252005012005', 1, 'Ratna Sa\'idah, M.Ag', 12, 9, '', '', 'M.Ag', 'P', 'Gresik ', '1973-03-25', 'Dsn. Purworejo RT. 20/ RW. 04 Desa/Kec. Kepung Kediri ', '081259134517', 'saidahratna8@gmail.com', 'B ', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(176, '278', '196510082005011003', '196510082005011003', 1, 'Imam Taulabi, Drs, M.PdI', 12, 9, '', '', '', 'L', '', '1965-10-08', 'bandar lor', '082147723081', 'imamtaulabi10@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(177, '296', '198607282018012001', '198607282018012001', 1, 'Citra Orwela, Hj., S.Fil., M.I.Kom.', 7, 11, '', '', '', 'P', 'Kediri', '1986-07-28', 'Jl. Perintis Kemerdekaan No.112 Ngronggo, Kota Kediri', '085649143739', 'orwellac@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(178, '297', '195910201994031002', '195910201994031002', 1, 'Hamam Thontowi, Drs, M.Pd.I.', 8, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(179, '362', '196611061994031007', '196611061994031007', 1, 'Muniron, Dr., M.Ag.', 14, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(180, '374', '198311082018011001', '198311082018011001', 1, 'Zainal Muttaqin, H. M.A.', 7, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(181, '375', '198403082018011004', '198403082018011004', 1, 'Abdulloh Munir, H., Lc., M.H.I', 7, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/198403082018011004-1662430651614.jpg', '0000-00-00', 'aktif'),
(182, '376', '198408152018012001', '198408152018012001', 1, 'Ririn Tri Puspita Ningrum, M.S.I.', 7, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/198408152018012001-1649293489802.jpg', '0000-00-00', 'aktif'),
(183, '377', '199001042018011003', '199001042018011003', 1, 'Nurul Hudha Purnomo, M.Pd.', 7, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(184, '378', '199102062018012001', '199102062018012001', 1, 'Nur Fadilatul Ilmiyah, M.Si.', 7, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(185, '379', '199110092018012002', '199110092018012002', 1, 'Eka Sulistyawati, M.Pd.', 7, 9, '', '', '', 'P', 'Kulon Progo', '1991-10-09', 'Pendem, Sidomulyo, Pengasih, Kulon Progo, Yogyakarta', '085743119119', 'ekasulistyawati@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/199110092018012002-1673449811486.jpg', '0000-00-00', 'aktif'),
(187, '382', '150091808', '150091808', 4, 'A. Zahid', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(188, '398', '150081610', '150081610', 4, 'Abu Samsudin', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(189, '395', '150081635', '150081635', 4, 'Agus Dwi Santosa', 0, 9, 'DTN-PNS', '', 'M.Pd.I', 'L', 'Kediri', '2030-01-11', 'Desa Badal Kec. Ngadiluwih Kab. Kediri', '085735109307', 'dwisantosaagus@ IAIN kediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/150081635-1664981348416.jpg', '0000-00-00', 'aktif'),
(190, '328', '150081651', '150081651', 4, 'Agus Miftakus Surur', 0, 9, 'DTN-PNS', '', 'S.Si, M.Pd', 'L', 'Kediri ', '1989-01-05', 'Karangtengah 02/01, Kandangan', '085743714181', 'surur.math@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/150081651-1641394505097.jpg', '0000-00-00', 'aktif'),
(191, '299', '150081656', '150081656', 4, 'Ainul Naim', 0, 9, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(192, '288', '150081647', '150081647', 4, 'Alwi Musa Muzaiyin', 0, 13, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(193, '293', '150081602', '150081602', 4, 'Anwariyah', 0, 13, 'DTN-PNS', '', 'M.Pd.', 'P', 'Kediri', '1977-01-19', 'Jalan Jeng Esti 13 Kelurahan Tamanan, Kota Kediri', '085232249007', 'anna.khoirul@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(194, '284', '150081616', '150081616', 4, 'Arif Zunaidi', 0, 13, 'DTN-PNS', '', 'SHI, MEI', 'L', '', '0001-11-30', 'Nganjuk', '082330308440', 'arifzunaidi@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/150081616-1685866226663.jpg', '0000-00-00', 'aktif'),
(195, '384', '150091803', '150091803', 4, 'Arisa rahmawati Zakiyah', 0, 11, '', '', '', 'L', '', '1987-02-08', 'Kebonagung 02/01 Wonojoyo Gurah Kediri', '08113341870', 'arisazakia@yahoo.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(196, '321', '150081627', '150081627', 4, 'Binti Mutafarida', 0, 13, 'DTN-PNS', 'Dr', 'SE.,MEI', 'P', 'Kediri', '1984-10-04', 'Jl.Kauman Rt 02 Rw 07 Sumberjo Kandat Kediri', '083877705464', 'rida.fayi@gmail.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(197, '290', '150081624', '150081624', 4, 'Choiril Anam', 0, 13, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(198, '334', '150081663', '150081663', 4, 'Choirul Annisa', 0, 9, 'DTN-PNS', '', 'M.Pd.', 'P', 'kediri', '1991-04-03', 'Ds. Susuhbango RT. 02 RW. 01 Kec. Ringinrejo Kab. Kediri', '081233938028', 'choirul.annisa@gmail.com', 'A', 'islam', 'Menikah', 'public/uploads/150081663-1654852268361.jpg', '0000-00-00', 'aktif'),
(199, '307', '150081659', '150081659', 4, 'Dewi Nur Suci', 0, 9, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(200, '308', '150081601', '150081601', 4, 'Dijan Novia Saka', 0, 13, 'DTN-PNS', '', 'SE., M.M.', 'P', 'Kediri', '1970-12-14', 'Jl. Ahmad Yani 123 Kota Kediri (64122)', '085231535050', 'sakanova@iainkediri.ac.id', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(201, '339', '150081603', '150081603', 4, 'Duwi Hariono', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(202, '385', '150091802', '150091802', 4, 'Ervin Abdillah', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(203, '302', '150081652', '150081652', 4, 'Fatimatuz Zahro`', 0, 15, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(204, '313', '150081636', '150081636', 4, 'Fatma Puri Sayekti', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(205, '325', '150081648', '150081648', 4, 'Fitriatul Masitoh', 0, 9, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(206, '291', '150081608', '150081608', 4, 'Hisbulloh Hadziq', 0, 15, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(207, '295', '150081639', '150081639', 4, 'Husnul Khotimah', 0, 0, 'EKS DTN', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(208, '397', '150081612', '150081612', 4, 'Ibnu Hajar Ansori', 0, 11, '', '', 'M.Th.I', 'L', 'Baturaja', '1980-11-25', 'Sidoarjo', '085645777706', 'ibnuhajar93@iainkediri.ac.id', 'O+', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(209, '327', '150081657', '150081657', 4, 'Ika Silviana', 0, 11, '', '', 'S.Sos., M.A', 'P', 'Madiun', '1989-08-24', 'Jl. Emerald 5 No 18 Suci Manyar Gresik', '081554238213', 'ikasilviana@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(210, '320', '198505282019031004', '198505282019031004', 1, 'Imam Masrur, M.Th.I', 0, 11, '', 'H', 'M.Th. I', 'L', 'Kediri ', '1985-05-28', 'dsn. ngelowan,DS Duwet,kec Wates,kab. Kediri ', '085645735340', 'imammasrur@iainkediri.ac.id ', 'AB', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(211, '306', '150081640', '150081640', 4, 'Imroatul Hasanah', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(212, '282', '199006012019032009', '199006012019032009', 1, 'Intan Nuyulis Naeni Puspitasari, M.Pd.I.', 0, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(213, '332', '150081665', '150081665', 4, 'Irma Rosalina', 0, 9, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(214, '386', '150091801', '150091801', 4, 'Khainudin', 0, 9, 'DTN-PNS', '', 'S.Pd.I,M.Ag', 'L', 'JEPARA', '1985-05-03', 'JL SUNAN AMPEL II GANG CEMARA RT 1 RW 3', '085649556927', 'khainuddin@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/150091801-1666681939757.jpg', '0000-00-00', 'aktif'),
(215, '401', '150081662', '150081662', 4, 'Kholila Mukaromah', 0, 0, 'EKS DTN', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(216, '289', '198510062019031003', '198510062019031003', 1, 'Limas Dodi, Dr., M. Hum. ', 0, 11, '', 'Dr. ', 'M. Hum. ', 'L', 'Bojonegoro', '1985-10-06', 'Rt/Rw: 003/003 Barat Masjid Ds. Brodot - Bandar KM - Jombang', '085855040224', 'ade_elfa@ymail.com', '', 'islam', 'Menikah', 'public/uploads/198510062019031003-1646300316941.jpg', '0000-00-00', 'aktif'),
(217, '343', '150081604', '150081604', 4, 'M. Bik Muhtaruddin', 0, 9, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(218, '344', '150081605', '150081605', 4, 'M. Soleh Mauludin', 0, 13, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(219, '316', '150081634', '150081634', 4, 'Masrul Isroni Nurwahyudi', 0, 9, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(220, '305', '150081619', '150081619', 4, 'Moch. Zainuddin', 0, 13, 'DTN-PNS', '', 'M.EI', 'L', 'Bojonegoro', '1983-10-30', 'Turus G.Rejo Kediri', '08563654809', 'kangzain@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/150081619-1633648417320.jpg', '0000-00-00', 'aktif'),
(221, '286', '150081622', '150081622', 4, 'Mochamad Desta Pradana', 0, 9, 'DTN-PNS', '', 'M.Pd', 'L', 'Trenggalek', '1983-12-19', 'perumahan grahamukti regency E/26 tosaren kediri', '081334233778', 'destapradana83@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150081622-1680152212935.jpg', '0000-00-00', 'aktif'),
(222, '311', '150081658', '150081658', 4, 'Moh. Badrus Solichin', 0, 15, 'DTN-PNS', '', '', 'L', 'Nganjuk', '1990-08-30', 'Perum GRP 2 Jl. Raya Harmoni, Manisrenggo, Kediri', '081233771861', 'badrusmoh@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/150081658-1630906460672.jpg', '0000-00-00', 'aktif'),
(223, '383', '150091817', '150091817', 4, 'Moh. Sholeh Afyuddin', 0, 9, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(224, '336', '150081655', '150081655', 4, 'Mohamad Anang Firdaus', 0, 13, 'DTN-PNS', 'Dr.', 'M.Pd.I.', 'L', 'Sidoarjo', '1989-07-10', 'Tebuireng Cukir Diwek Jombang', '085645557060', 'anangfirdaus@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150081655-1659912786007.jpg', '0000-00-00', 'aktif'),
(225, '317', '150081606', '150081606', 4, 'Mohammad Asy`ari', 0, 9, 'DTN-PNS', '', 'MHI', 'L', 'Demak', '1979-02-21', 'RT 04 RW 02 Jarak Plosoklaten Kediri', '082142456323', 'mohammadasyari99@gmail.com', '0', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(226, '319', '150081609', '150081609', 4, 'Mokhammad Miftakhul Huda', 0, 13, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(227, '214', '150081623', '150081623', 4, 'Muhammad Afifi', 0, 9, 'DTN-PNS', '', 'S.Hum., M.Pd', 'L', 'Kediri', '1984-03-27', 'Dusun Gemenggeng rt/rw 12/05 Desa Janti, Kec. Wates, Kab. Kediri', '085755940151', 'afifimuhammad8@gmail.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(228, '243', '150081629', '150081629', 4, 'Muhammad Nabil Khasbulloh', 0, 9, 'DTN-PNS', '', '', 'L', 'Kediri', '1985-01-27', 'Jl Setono Ringinsari Kandat Kediri', '085607204006', 'nabil_@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(229, '315', '150081607', '150081607', 4, 'Muhammad Zuhdi', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(230, '329', '150081660', '150081660', 4, 'Mukhammad Luqman Hakim', 0, 9, 'DTN-PNS', '', 'M. Pd. ', 'L', 'Lumajang', '1989-11-26', 'Jalan Melati VII No. 7 Perumnas Ngronggo Kediri', '085755535695', 'mukh.luqman@iainkediri.ac.id', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(231, '318', '150081613', '150081613', 4, 'Najihatul Fadhliyah', 0, 9, 'DTN-PNS', 'Dr.', 'S.H.I., M.Pd.I', 'P', 'Jombang ', '1981-11-03', 'Jl. Sumber Jiput No.13 RT 01 RW 01 Rejomulyo Kota Kediri ', '085853566241 ', 'najihah.anis46@gmail.com ', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(232, '342', '150081641', '150081641', 4, 'Nila Zaimatus Septiana', 0, 9, 'DTN-PNS', '', 'M.Pd', 'P', 'Blitar', '1987-09-21', 'kebonagung 02/01 sukodono sidoarjo', '085815444827', 'nila.zaima@gmail.com', 'A', 'islam', 'Menikah', 'public/uploads/150081641-1646229694054.jpg', '0000-00-00', 'aktif'),
(234, '292', '150081643', '150081643', 4, 'Niwari', 0, 15, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif');
INSERT INTO `pegawai` (`id_pegawai`, `pin`, `nik`, `nip`, `id_status`, `nama`, `id_grade`, `id_unit`, `keterangan`, `gelar_depan`, `gelar_belakang`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `nohp`, `email`, `gol_darah`, `agama`, `status_pernikahan`, `foto`, `tmt_pegawai`, `status`) VALUES
(235, '310', '198311132019032004', '198311132019032004', 1, 'Novi Wahyu Winastuti, M. Psi.', 0, 11, '', '', 'M.Psi, Psikolog', 'P', 'Kediri', '0001-11-30', 'jln. Taruna Bhakti 351 Kras', '081330550183', 'novi.winastuti@iainkediri.ac.id', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(236, '304', '150081638', '150081638', 4, 'Nur Khamidah', 0, 9, 'DTN-PNS', '', '', 'P', 'Kediri', '1986-11-07', 'Jalan Masjid al-Huda Nomor 190 Ngadirejo Kediri Kota', '085331222619', 'midahkdr99@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(237, '300', '198905262019032014', '198905262019032014', 1, 'Nurmahmudah, M.Phil.', 0, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(238, '341', '150081626', '150081626', 4, 'Nurul Ahsin', 0, 9, 'DTN-PNS', '', 'M.Pd.I', 'L', 'Gresik', '1984-09-19', 'Perum Rosan Asri, Dsn. Cakruk RT 01/RW 04 Ds. Tales Kec. Ngadiluwih Kab. Kediri', '085737038238', 'ahsin@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/150081626-1630643716887.jpg', '0000-00-00', 'aktif'),
(239, '388', '150091805', '150091805', 4, 'Nurul Aini', 0, 9, 'DTN-PNS', '', 'M.Pd', 'P', 'Kediri', '1988-07-03', 'Brenggolo Plosoklaten Kediri', '085736186139', 'florida_aini@iainkediri.ac.id', '0', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(240, '340', '150081618', '150081618', 4, 'Pandi Rais', 0, 15, 'DTN-PNS', '', 'M.Pd', 'L', 'Kediri', '1983-06-10', 'Branggahan Ngadiluwih Kediri', '081556619004', 'pandirais.10@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/150081618-1634515662423.jpg', '0000-00-00', 'aktif'),
(241, '399', '150081617', '150081617', 4, 'Qoidatul Marhumah', 0, 11, '', '', 'LC.,M.Th.I', 'P', 'Kediri', '1982-05-07', 'jl. raya Sememi no 1A Benowo Surabaya', '085732105612', 'idamalik48@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150081617-1686012180187.jpg', '0000-00-00', 'aktif'),
(242, '303', '150081611', '150081611', 4, 'Ria Fakhrurriana', 0, 9, 'DTN-PNS', '', 'M. Pd', 'P', 'Kediri', '1980-10-17', 'dsn Pule Selatan RT 01 RW 01 Pule Kandat Kediri', '08563410000', 'ria.riana@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(243, '338', '150081650', '150081650', 4, 'Ridho Afifudin', 0, 11, '', '', '', 'L', 'Trenggalek', '1988-12-13', 'Sugihan kampak Trenggalek', '081235815894', 'ridhoafifudin11@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(244, '335', '150081628', '150081628', 4, 'Ruston Nawawi', 0, 15, 'DTN-PNS', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/150081628-1675555824887.jpg', '0000-00-00', 'aktif'),
(245, '324', '150081649', '150081649', 4, 'Saidah', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(246, '333', '150081654', '150081654', 4, 'Saiful Mujab', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(247, '280', '150081642', '150081642', 4, 'Septiana Purwaningrum', 0, 9, 'DTN-PNS', 'Dr.', 'M.Pd.I', 'P', 'Kediri', '1987-09-23', 'Perumahan Grand Surya Asri Blok C.35 Wonocatur Ngasem Kediri Jawa Timur', '085735545422', 'septianamanisdewe@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(248, '309', '150081637', '150081637', 4, 'Shofi Mirwani', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(249, '287', '199107122019031008', '199107122019031008', 1, 'Sufirmansyah, M.Pd.I', 0, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(250, '337', '150081614', '150081614', 4, 'Sunarno', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(251, '396', '150081645', '150081645', 4, 'Surahmat,', 0, 9, 'DTN-PNS', '', 'M.Hum.', 'L', 'Jakarta ', '1988-02-03', 'Perumahan Joho View B10 Jl. Raya Joho Wates Kediri', '085775524485', 'surahmatdali@gmail.com ', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(252, '294', '150081630', '150081630', 4, 'Syafruddin Faisal Thohar', 0, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(254, '331', '150081646', '150081646', 4, 'Trimurti Ningtyas', 0, 11, '', 'Dr. ', 'M.KP', 'P', 'Kediri', '1988-02-03', 'Perumahan Betet Indah G-7', '081233719604', 'tyas03@iainkediri.ac.id', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(255, '387', '150091806', '150091806', 4, 'Ulfi Dina Hamida', 0, 13, 'DTN-PNS', '', 'M.Pd', 'P', 'Tulungagung', '1990-02-21', 'Nganjuk', '085730998827', 'ulfidina@iainkediri.ac.id', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(256, '298', '150081615', '150081615', 4, 'Ulin Ni`mah Rodliya Ulfah', 0, 13, 'DTN-PNS', '', 'M.Pd.', 'P', 'Kediri', '2023-05-07', 'Kolak Utara, Wonorejo, Ngadiluwih Kediri Jatim', '081554011505', 'ulinni\'mah@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/150081615-1683267740900.jpg', '0000-00-00', 'aktif'),
(257, '326', '150081632', '150081632', 4, 'Yuli Astuti Hasanah', 0, 15, 'DTN-PNS', '', 'M. Pd. ', 'P', '', '2030-01-11', 'Perum Mangunrejo View A-4 Ngadiluwih Kab Kediri', '085649755949', 'yulihasan@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(258, '323', '150081625', '150081625', 4, 'Zakiyatus Soimah', 0, 9, 'DTN-PNS', '', 'MH.I', 'P', 'Kediri', '1984-06-15', 'Ngasinan Rejomulyo Kota Kediri', '085645785540', 'zakiyatus.soimah@iainkediri.ac', 'O', 'islam', 'Menikah', 'public/uploads/150081625-1659953932889.jpg', '0000-00-00', 'aktif'),
(259, '239', '150021503', '150021503', 3, 'A. Qowi Shaleh', 0, 14, 'Administrasi', '', '', 'L', 'Kediri', '1989-10-01', 'Banyakan Kediri', '085785427747', 'aqowishaleh@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150021503-1669862258007.jpg', '0000-00-00', 'aktif'),
(260, '369', '150021807', '150021807', 3, 'Abdur Rozak', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(261, '199', '150101302', '150101302', 3, 'Achmad Nafi`in', 0, 6, 'Satpam', '', '', 'L', 'Kediri,21 Mei 1976', '2021-08-31', 'jln flamboyan no.23 Rt 029 Rw 004 kel.Ngampel Mojoroto Kota Kediri', '081553761353', 'nafiinahmad76@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(262, '261', '150021607', '150021607', 3, 'Adi Purwantoro', 0, 6, 'Satpam', '', '', 'L', 'Kediri', '1981-12-24', 'jl sunan ampel 1/81, RT/RW:02/01,Kel:Rejomulyo,Kec:Kota Kediri', '085648813200', 'adipurwanto2412@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150021607-1675005334328.jpg', '0000-00-00', 'aktif'),
(263, '194', '150071302', '150071302', 3, 'Agung Prasetyo', 0, 6, 'Satpam', '', '', 'L', 'kediri', '1978-05-30', 'Ds,Burengan no,13, Rt=3 / Rw =8 ,jLn Letjend Suprapto gg, 2 kec, pesantren', '081554096663', 'agungwahyudi@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150071302-1630508651359.jpg', '0000-00-00', 'aktif'),
(264, '215', '150091401', '150091401', 3, 'Agus Hanafi', 0, 6, 'Driver', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(265, '171', '150021205', '150021205', 3, 'Agus Kurniawan', 0, 6, 'Satpam', '', '', 'L', 'Kediri', '1986-04-27', 'Kediri', '085790691117', 'gondrong8663@yahoo.com', '', 'islam', 'Menikah', 'public/uploads/150021205-1630497113649.jpg', '0000-00-00', 'aktif'),
(266, '268', '150021614', '150021614', 3, 'Agus Suryani', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(267, '262', '150021608', '150021608', 3, 'Achmad Fauzi', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1982-03-29', 'JL. Sumber 1 no.01  rt.06/rw.02 kel.Ngronggo kota kediri', '081554516489', 'masujik89962@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/150021608-1672620440751.jpg', '0000-00-00', 'aktif'),
(268, '167', '150021204', '150021204', 3, 'Ahmad Firdaus', 0, 12, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(269, '259', '150021605', '150021605', 3, 'Ahmad Nasruddin', 0, 6, 'Satpam', '', '', 'L', 'Kediri', '1980-07-10', 'Jl.raya pagut 158 RT/RW:19/07 Kel.Blabak Kec.Pesantren Kota Kediri', '085735578628', 'mangudin597@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/150021605-1630682974525.jpg', '0000-00-00', 'aktif'),
(270, '260', '150021606', '150021606', 3, 'Anas Fatoni', 0, 6, 'Satpam', '', '', 'L', 'Kediri', '1980-09-25', 'JL Super Semar 23 Ngronggo Kediri 64127', '085655769636', 'anasfatoni20@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/150021606-1630405851400.jpg', '0000-00-00', 'aktif'),
(271, '355', '150021706', '150021706', 3, 'Andi Pranata', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(272, '182', '150091206', '150091206', 3, 'Andi Setiawan', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1988-03-30', 'jl.sunan ampel 1/81 Rt/Rw 002/001 kel Rejomulyo kec Kota', '085696171689', '085696171689andy@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150091206-1635741935309.jpg', '0000-00-00', 'aktif'),
(273, '366', '150021804', '150021804', 3, 'Andi Setiawan', 0, 6, 'Satpam', '', '', 'L', 'Jakarta', '1986-10-23', 'pabyungan rt01 rw 01 krosok sendang tulung agung', '085856229386', 'rizkiandiyatama@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/150021804-1630659991208.jpg', '0000-00-00', 'aktif'),
(274, '181', '150091205', '150091205', 3, 'Andri Yuli Wantoro', 0, 7, '', '', '', 'L', 'Kediri', '1987-07-29', 'Jl. Balowerti V / 50 Kota Kediri', '0816567725', 'andri@iainkediri.ac.id', '0+', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(275, '349', '150021710', '150021710', 3, 'Ardhian Wardhana Putra', 0, 6, 'Driver', '', '', 'L', 'Kediri', '1993-11-27', 'Jl. Letjend Sutoyo Gg. II No.31, Tinalan, Kec. Pesantren, Kediri, Jawa Timur 64132', '085784156871', 'ardianw86@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150021710-1681087180149.jpg', '0000-00-00', 'aktif'),
(276, '193', '150071305', '150071305', 3, 'Ari Irawan', 0, 6, 'Satpam', '', '', 'L', '', '1989-11-02', 'Dsn Tawangrejo, Kel. Tawangrejo, Kec.Wonodadi, Kab.Blitar', '085706609363', 'ariirawan341.ai@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/150071305-1630588391204.jpg', '0000-00-00', 'aktif'),
(277, '168', '150021203', '150021203', 3, 'Ari Wahyudi', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(278, '352', '150021703', '150021703', 3, 'Bahroni', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(279, '346', '150021712', '150021712', 3, 'Bella Fitriana', 0, 18, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(280, '258', '150021604', '150021604', 3, 'Bintoro', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(281, '353', '150021701', '150021701', 3, 'Budi Santoso', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(282, '156', '150091001', '150091001', 3, 'Candra Setiawan', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1977-08-18', 'dsn.kutukan wates kab.kediri', '085749973637', 'ajiecandra6@gmail.com', '', 'islam', 'Duda', 'public/uploads/150091001-1630497076030.jpg', '0000-00-00', 'aktif'),
(283, '159', '150031001', '150031001', 3, 'Choirul Anam', 0, 6, 'Administrasi', '', '', 'L', 'Kediri', '1977-03-04', 'Kel. Rejomulyo kota Kediri', '081234460916', 'abdullahaljabbar02@gmail.com', 'AB', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(284, '187', '150011301', '150011301', 3, 'Da`imul Hidayah', 0, 16, 'Administrasi', '', '', 'L', 'nganjuk', '1969-10-28', 'jl. Wahid Hasyim gang 5 a. no. 45 bandarlor Mojoroto kota kediri', '081333987866', 'daimulhidayah@gmail.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(285, '367', '150021805', '150021805', 3, 'Damiran', 0, 6, 'Satpam', '', '', 'L', 'Nganjuk', '1989-02-01', 'Jl.Sunan Ampel 1 No.5 , RT 03 / RW 01 Rejomulyo, kota Kediri', '085738870050', 'adamflasher43@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150021805-1630565674282.jpg', '0000-00-00', 'aktif'),
(286, '174', '150091203', '150091203', 3, 'David Ahmad Effendy', 0, 23, '', '', 'M.Kom', 'L', 'Kediri', '1985-03-05', 'Jln. Perintis Kemerdekaan No.116 Ngronggo Kota Kediri', '085745595828', 'bangdavid07@gmail.com', 'o', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(287, '351', '150021714', '150021714', 3, 'Dedik Trisnanto', 0, 6, 'Kebersihan', '', '', 'L', 'Kediri', '1996-12-10', 'Jl. Sunan ampel 1 No.51 RT/RW.02/01 Rejomulyo', '085855225075', 'dedythroat@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150021714-1636693249059.jpg', '0000-00-00', 'aktif'),
(288, '149', '150020901', '150020901', 3, 'Didik Prasetyo Hadiono', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/150020901-1664814124875.jpg', '0000-00-00', 'aktif'),
(289, '206', '150101307', '150101307', 3, 'Dodik Irawan', 0, 6, 'Satpam', '', '', 'L', 'Kediri', '1994-01-29', 'Jl. Sunan Ampel 3', '081234438772', 'irawandodik236@gmail.com', 'O', 'islam', 'Belum Menikah', 'public/uploads/150101307-1630581119320.jpg', '0000-00-00', 'aktif'),
(290, '257', '150021603', '150021603', 3, 'Dony Trilaksono', 0, 6, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/150021603-1650842263440.jpg', '0000-00-00', 'aktif'),
(291, '191', '150071303', '150071303', 3, 'Eko Santoso', 0, 6, 'Satpam', '', '', 'L', 'KEDIRI', '1981-07-20', 'DESA NGASEM RT03 RW02 KEC.NGASEM', '081217372456', 'capluks81@gmail.com', 'AB', 'islam', 'Menikah', 'public/uploads/150071303-1631344725740.jpg', '0000-00-00', 'aktif'),
(292, '273', '150021619', '150021619', 3, 'Eko Suro Wiyono', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/150021619-1670227343580.jpg', '0000-00-00', 'aktif'),
(293, '359', '150021711', '150021711', 3, 'Ela Alvianita Farikha', 0, 8, '', '', 'S.E.', 'P', 'Kediri', '0001-11-30', 'Ds. Putih Kec..Gampengrejo Kab. Kediri', '081333982882', 'elafarikha7@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(294, '256', '150021602', '150021602', 3, 'Fachrodin', 0, 6, 'Satpam', '', '', 'L', 'Kendal', '1975-02-12', 'dsn. babal rt. 01 rw. 02 ds. ngadi kec.mojo kab. Kediri', '082229232220', 'fachrodin983@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/150021602-1631575374888.jpg', '0000-00-00', 'aktif'),
(295, '195', '150071304', '150071304', 3, 'Feri Yoearies', 0, 23, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(296, '207', '150101308', '150101308', 3, 'Firman Avianto', 0, 6, 'Satpam', '', '', 'L', '', '1992-09-12', 'jl.kaliombo raya', '087866841733', 'firmanavianto6@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150101308-1630484338923.jpg', '0000-00-00', 'aktif'),
(297, '279', '150041602', '150041602', 3, 'Fuat Hasan Sulthon Al Ashar', 0, 12, '', '', '', 'L', 'kediri', '1990-05-12', 'Ds. Sidoharjo, Kec. Tanjunganom', '085791959672', 'foefa1@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150041602-1640585510855.jpg', '0000-00-00', 'aktif'),
(298, '281', '150041601', '150041601', 3, 'Hendra Kurniawan', 0, 6, 'Kebersihan', '', '', 'L', 'KEDIRI', '1990-03-12', 'JL SUNAN AMPEL 1 REJOMULYO', '085816356088', 'joss8885@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150041601-1631357314472.jpg', '0000-00-00', 'aktif'),
(299, '270', '150021616', '150021616', 3, 'Hilda Manda Alrianto', 0, 6, 'Satpam', '', 'S.pd.', 'L', 'Biak', '1993-07-12', 'Desa badal pandean rt. 3 rw.1 kec. ngadluwih kab. kediri', '087820976597', 'hilmanalrianto@gmail.com', 'o', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(300, '348', '150021708', '150021708', 3, 'Ika Insyiroh', 0, 6, 'Administrasi', '', 'S. E.,  M. M', 'P', 'Kediri', '1993-10-16', 'Desa Bandar Kidul', '085233967836', 'insyorohika@gmail.com', 'AB', 'islam', 'Menikah', 'public/uploads/150021708-1646368523565.jpg', '0000-00-00', 'aktif'),
(301, '361', '150041701', '150041701', 3, 'Irma Zaharoh', 0, 18, 'Administrasi', '', '', 'P', 'Tulungagung', '1986-01-30', 'Jl. Dandangan III/1 Kota Kediri', '085749009789', 'zidaneirma@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(302, '265', '150021611', '150021611', 3, 'Khamim Tohari', 0, 6, 'Kebersihan', '', '', 'L', 'kedir', '1987-09-08', 'JL MAWAR NO 35 RT/RW 004/001 BAWANG - PESANTREN - KEDIRI', '087804446707', 'khamintohari4@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(303, '254', '150111501', '150111501', 3, 'Lucky Hermawan', 0, 0, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(304, '153', '150091005', '150091005', 3, 'Lukman Varik', 0, 6, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(305, '200', '150101306', '150101306', 3, 'Lutfi Sanggrama Saputra', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(306, '238', '150021504', '150021504', 3, 'M. Ibrahim Kholilulloh', 0, 12, '', '', '', 'L', '', '1990-07-05', 'Nganjuk', '085604893400', 'muhammad.ibra@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(307, '241', '150021506', '150021506', 3, 'M. Mirza Firdaus', 0, 20, 'Administrasi', '', 'M.Psi', 'L', 'Kediri', '1992-02-21', 'Jombang', '085735811286', 'mirzafirdaus008@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/150021506-1634303323781.jpg', '0000-00-00', 'aktif'),
(308, '178', '150091202', '150091202', 3, 'M. Munirul Khakim', 0, 0, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(309, '358', '150021713', '150021713', 3, 'M A L I K', 0, 6, 'Satpam', '', '', 'L', 'Kediri', '1995-04-27', 'Jln.Sunan Ampel No.58 Rt.03 Rw.02 Kelurahan Rejomulyo Kota Kediri', '085804522225', 'malik27041995@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(310, '175', '150031201', '150031201', 3, 'Mamlu`atul Khusnah', 0, 6, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(311, '161', '150091003', '150091003', 3, 'Miftakhul Munir', 0, 6, 'Kebersihan', '', '', 'L', 'Nganjuk', '1980-12-24', 'jln sunan ampel gg:1/38  desa rejomulyo RT:03/01  kecamatan  kota kediri  64129', '085649461333', 'mmunir57@yahoo.com', 'o', 'islam', 'Menikah', 'public/uploads/150091003-1630505568735.jpg', '0000-00-00', 'aktif'),
(312, '203', '150101304', '150101304', 3, 'Moch. Sahrul Arifin', 0, 6, 'Satpam', '', '', 'L', '', '0001-11-30', 'ds cerme dsn glatik grogol kediri', '085645718184', 'arifinsahrul08@gmail.com ', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(313, '155', '150090501', '150090501', 3, 'Moch. Sudjud', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(314, '360', '150031701', '150031701', 3, 'Moch. Taufiq Yahya', 0, 0, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(315, '240', '150021505', '150021505', 3, 'Mochamad Taufiq Kolil', 0, 0, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(316, '350', '150021709', '150021709', 3, 'MOCHAMMAD FAQIH SHOLAHUDIN', 0, 23, '', '', 'M.Psi.', 'L', 'Kediri', '1981-10-21', 'Ngasinan, Rejomulyo', '085746172004', 'faqih@iainkediri.ac.id', 'A', 'islam', 'Belum Menikah', 'public/uploads/150021709-1631613829972.jpg', '0000-00-00', 'aktif'),
(317, '276', '150021622', '150021622', 3, 'Moh. Irfan Afandi', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1997-09-14', 'jl sunan ampel 1 no57 desa REJOMULYO', '085210608085', 'irfanafandi23@yahoo.com', 'o', 'islam', 'Belum Menikah', 'public/uploads/150021622-1634188949015.jpg', '0000-00-00', 'aktif'),
(318, '201', '150101301', '150101301', 3, 'Moh. Kholiq Anwar', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(319, '371', '150021809', '150021809', 3, 'Mohamad Pascal Fakhriza', 0, 18, 'Administrasi', '', '', 'L', 'Kediri', '1993-07-08', 'Desa Gogorante RT 14 RW 3, Ngasem, Kabupaten Kediri', '081234680476', 'pascal.mohamad.93@gmail.com', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(320, '158', '150091006', '150091006', 3, 'Moh. Rizzal Affandi', 0, 6, 'Driver', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(321, '363', '150021801', '150021801', 3, 'Mohamad Darul Khoiri', 0, 6, 'Satpam', '', '', 'L', 'kediri', '1977-06-24', 'Dsn. Nglungur RT 33 RW 04 DS. Jemekan Kec. Ringinrejo Kab. Kediri ', '082244148753', 'khoiridarul003@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150021801-1687066945200.jpg', '0000-00-00', 'aktif'),
(322, '370', '150021808', '150021808', 3, 'Mohammad Amiruddin', 0, 14, 'Administrasi', '', ',S.H.I.,M.H.I', 'L', 'SIDOARJO', '1992-09-23', 'jl teratai gang 7 RT 20, RW 03, kelurahan ngampel ', '085852599979', 'mohammadammir92@gmail.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(323, '205', '150101305', '150101305', 3, 'Muh. Ghufron Hefi', 0, 6, 'Kebersihan', '', '', 'L', 'NGANJUK ', '1988-07-17', 'GANG STONO RT/RW 007/001 ds. KWADUNGAN kec. NGASEM kab. KEDIRI', '083117500198', 'sci.rilia@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150101305-1630402001284.jpg', '0000-00-00', 'aktif'),
(324, '373', '150021811', '150021811', 3, 'Muhammad Farouq Wicaksono', 0, 6, 'Kebersihan', '', '', 'L', 'KEDIRI', '1997-09-27', 'JL. SUNAN AMPEL 1 NO 83C', '0895620111995', 'garotwicak@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150021811-1643119409297.jpg', '0000-00-00', 'aktif'),
(325, '381', '150091809', '150091809', 3, 'Muhammad Ubaidillah', 0, 18, 'Administrasi', '', 'S. Kom', 'L', 'Kediri', '1990-08-07', 'Pare', '082244565865', 'sm.studio78@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150091809-1630455212235.jpg', '0000-00-00', 'aktif'),
(326, '368', '150021806', '150021806', 3, 'Nafiul Umam', 0, 6, 'Kebersihan', '', 'S. Sos', 'L', 'Kediri', '1989-11-29', 'JL Sunan Ampel II/75 Rejomulyo kota kediri', '085646611585', 'nafiul2911@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150021806-1678933053513.jpg', '0000-00-00', 'aktif'),
(327, '210', '150031403', '150031403', 3, 'Nofrilyan A.P Fatimatuzzahro`', 0, 16, 'Administrasi', '', '', 'P', 'Kediri', '1989-11-04', 'Jabang, Kras, Kediri', '085608067527', 'saly_qhu@yahoo.com', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(328, '209', '150021401', '150021401', 3, 'Puguh Hariyanto', 0, 6, 'Kebersihan', '', '', 'L', 'nganjuk', '1985-06-21', 'PRAMBON SUGEH WARAS ', '085755076755', 'hariantopuguh35@gmail.com', 'o', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(329, '170', '150021201', '150021201', 3, 'Pujianto', 0, 6, 'Satpam', '', '', 'L', 'Kediri 9 Mei 1967', '0001-11-30', 'jln joyoboyo no 170 sukorejo gurah kab kediri. ', '081359857108', 'tidak ada... ', 'AB', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(330, '165', '150021206', '150021206', 3, 'Putut Miartha', 0, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(331, '180', '150091201', '150091201', 3, 'Qomarudin', 0, 6, 'Satpam', '', '', 'L', 'Kediri', '1961-06-09', 'Dusun Prambon desa tegaron kabupaten nganjuk', '085745215357', 'gedongsari03@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150091201-1630403662015.jpg', '0000-00-00', 'aktif'),
(332, '274', '150021620', '150021620', 3, 'R. ZAKI. HENDRAWAN', 0, 6, 'Kebersihan', '', '', 'L', 'Gresik', '1995-03-02', 'jalan sunan ampel no.77 kota kediri', '085645737371', 'zakihendrawan07@gmail.com', '0', 'islam', 'Belum Menikah', 'public/uploads/150021620-1681192912600.jpg', '0000-00-00', 'aktif'),
(333, '347', '150021704', '150021704', 3, 'Ragil Nur Sumanjaya', 0, 8, '', '', 'S. Pd. I', 'L', 'Mojokerto', '1985-12-27', 'RUSUNAWA BLOK D NO 18 L. 3 KELAS. DANDANGAN', '081335450981', 'welifonda@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(334, '275', '150021621', '150021621', 3, 'Regam Mamfuat', 0, 6, 'Satpam', '', '', 'L', 'kediri', '1996-05-08', 'JL. SUMBER JIPUT NO.25 RT.01 RW.01 KEL.REJOMULYO', '085 784 792 629', 'regammamfuat@gmail.com', '', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(335, '372', '150021810', '150021810', 3, 'Riezal Fikri Arsyadi', 0, 18, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/150021810-1636125747405.jpg', '0000-00-00', 'aktif'),
(336, '267', '150021613', '150021613', 3, 'Risky Meyanto', 0, 6, 'Satpam', '', 'S.M', 'L', 'Kediri', '1990-05-19', 'Jl.Sumber no.14 Rt/Rw 004/003 Desa.Ngronggo Kec.kota Kediri', '085646343666', 'selvylolita288@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(337, '272', '150021618', '150021618', 3, 'Rizki puguh Pri Santoso', 0, 6, 'Teknisi', '', '', 'L', 'kediri', '1994-04-18', 'gg.  modin rt/rw 002/001 bujel mojoroto', '08981103777', 'riskipuguh6@gmail.com ', 'B', 'islam', 'Menikah', 'public/uploads/150021618-1645695710811.jpg', '0000-00-00', 'aktif'),
(338, '212', '150031405', '150031405', 3, 'Romadlon Budiarto', 0, 10, 'Administrasi', '', 'S.Th.i', 'L', 'Kediri', '1990-11-11', 'Dsn Mangunrejo Ds. Pranggang Kec. Plosokalten Kab. Kediri', '085731623117', 'romadlon.budiarto90@gmail.com', 'o', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(339, '172', '150081202', '150081202', 3, 'Ruhana Maskurun', 0, 14, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(340, '271', '150021617', '150021617', 3, 'Sahal Mahfudh', 0, 6, 'Teknisi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(341, '186', '150011302', '150011302', 3, 'Samsuhadi', 0, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(342, '204', '150101303', '150101303', 3, 'Slamet Raharjo', 0, 0, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(343, '164', '150021202', '150021202', 3, 'Soetris', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1969-03-30', 'tinalan', '089686948975', 'itquick500@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(344, '157', '150091004', '150091004', 3, 'Suko Waluyo', 0, 6, 'Teknisi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(345, '365', '150021803', '150021803', 3, 'Suko Wiyono', 0, 6, 'Satpam', '', '', 'L', 'kediri', '1984-02-07', 'ds.rejomulyo.rt.01.rw.01.jln sumberjiput.no.29', '085536957825', 'sukoijan88@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/150021803-1685935403835.jpg', '0000-00-00', 'aktif'),
(346, '211', '150031402', '150031402', 3, 'Sukron Abadan', 0, 19, 'Administrasi', '', 'S.Kom', 'L', 'Blitar', '1987-10-17', 'Kota Kediri', '085649151797', 'sukronabadan@yahoo.com', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(347, '345', '150091601', '150091601', 3, 'Sulastri', 0, 24, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(348, '208', '150011401', '150011401', 3, 'Sumitro Sulistriyo', 0, 16, 'Administrasi', '', '', 'L', 'Blitar', '1987-01-10', 'blitar', '085691211137', 'throwrock87@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(349, '151', '150030901', '150030901', 3, 'Suprianto', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(350, '266', '150021612', '150021612', 3, 'Supriyadi', 0, 6, 'Satpam', '', '', 'L', 'Kediri.12-10-1987', '2021-08-31', 'DS.betet.kec.pesatren. RT.11.RW.04', '081222164103', 'Oton Ot', 'o', 'islam', 'Menikah', 'public/uploads/150021612-1633275216729.jpg', '0000-00-00', 'aktif'),
(351, '364', '150021802', '150021802', 3, 'Suwarno', 0, 6, 'Kebersihan', '', '', 'L', 'Kediri', '1978-06-23', 'ngronggo karang anyar kediri', '081218043152', 'suwarnomcs0@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(352, '357', '150021702', '150021702', 3, 'Taofik', 0, 6, 'Satpam', '', 'S.Pd.I', 'L', 'Kediri', '1976-10-13', 'Dusun Babadan RT/RW: 07/06 Desa Sumbercangkring Kecamatan Gurah Kabupaten Kediri', '0812-3434-3322', 'taofik1976@co.id', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(353, '160', '150091002', '150091002', 3, 'Totok Suyanto', 0, 6, 'Kebersihan', '', '', 'L', 'Kediri', '1978-02-01', 'jln Karang anyar no168 Ngronggo Kediri Rt02 Rw02', '08563530747', 'totok.stainkediri@gmail.com', 'o', 'islam', 'Menikah', 'public/uploads/150091002-1683778009344.jpg', '0000-00-00', 'aktif'),
(354, '264', '150021610', '150021610', 3, 'Tri Zakaria', 0, 21, '', '', '', 'L', 'NGAWI', '1984-06-17', 'NGAWI', '0812-4955-7979', 'trizakaria54@gmai.com', '', 'islam', 'Menikah', 'public/uploads/150021610-1665203015555.jpg', '0000-00-00', 'aktif'),
(355, '197', '150071307', '150071307', 3, 'Tristianto', 0, 10, 'Administrasi', '', '', 'L', 'Blitar', '2030-01-11', 'Ngronggo', '089517268238', 'paijahpaijo397@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/150071307-1644015017561.jpg', '0000-00-00', 'aktif'),
(356, '255', '150021601', '150021601', 3, 'Wageono', 0, 6, 'Satpam', '', '', 'L', 'kediri', '1970-12-04', 'blabak kandat kab.kediri', '085853236327', 'onowage45@mail.com', 'b', 'islam', 'Duda', 'public/uploads/150021601-1631286927311.jpg', '0000-00-00', 'aktif'),
(357, '356', '150021707', '150021707', 3, 'Weldan Wijaksono', 0, 6, 'Satpam', '', '', 'L', 'kediri', '1993-09-07', 'jl. sunan ampel 2 no 100, rt 01  rw 03', '081334346329', 'wildanwijaksono2@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150021707-1639528123646.jpg', '0000-00-00', 'aktif'),
(358, '269', '150021615', '150021615', 3, 'Wildan Samsul Huda', 0, 6, 'Satpam', '', '', 'L', 'Kediri', '1992-02-11', 'Jalan Agus Salim No. 46 Kota Kediri', '085856225115', 'wildansamsulhuda@gmail.com', 'A', 'islam', 'Menikah', 'public/uploads/150021615-1646527523494.jpg', '0000-00-00', 'aktif'),
(359, '242', '150021502', '150021502', 3, 'Yeni Masrokah', 0, 12, '', '', 'S. Psi', 'P', 'Kediri', '2030-01-11', 'Dusun Temboro RT. 010 RW. 002 Desa Plaosan Kec. Wates Kab. Kediri', '085808366662', 'Anjuminayyirah@gmail.com', 'A+', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(360, '216', '150101402', '150101402', 3, 'Yoyok Hadi Susanto', 0, 6, 'Kebersihan', '', '', 'L', '', '1981-03-30', 'jl atmowijoyo rt01/02 ringinsari kandat kediri', '085749644009', 'yoyokbayan1@gmail.com ', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(361, '263', '150021609', '150021609', 3, 'Yoyok Triyono', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1982-10-17', 'jln sunan ampel 1 no 46', '085746244156', 'yoyokwagiso2@gmail.com', 'o', 'islam', 'Duda', 'public/uploads/150021609-1630507458358.jpg', '0000-00-00', 'aktif'),
(362, '189', '150071301', '150071301', 3, 'Zainal Abidin', 0, 6, 'Driver', '', '', 'L', 'Kediri', '1973-04-19', 'DS Ngebrak RT 03 RW 01 Kec Gampengrejo Kab Kediri', '081384468964', 'za241512@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(363, '389', '198306062011012012', '198306062011012012', 1, 'Ummiy Fauziyah Laili, M.Si.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(365, '66', '199306212019032012', '199306212019032012', 2, 'Sara Isnawati, S.H.I.', 9, 6, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(366, '75', '198708112019031003', '198708112019031003', 2, 'Achmad Fauzi Zulchizar, S.AP', 9, 6, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/198708112019031003-1649318052025.jpg', '0000-00-00', 'aktif'),
(367, '85', '199506302019031007', '199506302019031007', 2, 'Harisul Ikrom Amin, S.Kom', 9, 23, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(368, '139', '199005192019031005', '199005192019031005', 2, 'Abd Hadi, S.Si', 9, 7, '', '', 'S.Si', 'L', 'Mojokerto', '1990-05-19', 'Pesanan Bicak Trowulan Mojokerto', '0', 'abdhadi@iainkediri.ac.id', 'A+', 'islam', 'Menikah', 'public/uploads/199005192019031005-1645702192181.jpg', '0000-00-00', 'aktif'),
(369, '150', '198711142019031003', '198711142019031003', 1, 'Abdul Mujib, M.A.', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(370, '152', '199302192019031007', '199302192019031007', 1, 'Abdul Rosyid, M.A.', 1, 11, '', '', '', 'L', 'Pati', '1993-02-19', 'Desa Ngagel, Kec. Dukuhseti, Kab. Kediri', '087704265403', 'rosyidabdul@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/199302192019031007-1678926927291.jpg', '0000-00-00', 'aktif'),
(371, '154', '198509292019031005', '198509292019031005', 1, 'Abdur Ro`uf Hasbullah, M.Pd.I.', 1, 9, '', '', '', 'L', 'Lamongan', '1985-09-29', 'Dsn. Soko Rt 01 Rw 05 Ds. Pacarpeluk Megaluh Jombang', '085652160966', 'roufchasbullah@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/198509292019031005-1649762383350.jpg', '0000-00-00', 'aktif'),
(372, '163', '199005312019031008', '199005312019031008', 1, 'Ach Khiarul Waro Wardani, M.H.', 1, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(373, '166', '198802032019031004', '198802032019031004', 1, 'Ach. Shodiqil Hafil, M.Fil.I', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(374, '169', '198603102019031007', '198603102019031007', 1, 'Adin Fadilah, M.E.Sy.', 1, 13, '', '', '', 'L', 'Ponorogo', '1986-03-10', 'Perum Griya Ngronggo Kota Blok A12', '081938707966', 'adinfadilah@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/198603102019031007-1645672419209.jpg', '0000-00-00', 'aktif'),
(375, '173', '198507152019031003', '198507152019031003', 1, 'Akhmad Jazuli Afandi, M.Fil.I', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(376, '176', '198606232019031005', '198606232019031005', 1, 'Andi Ardiyan Mustakim, M.H.', 1, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(377, '177', '199008092019032008', '199008092019032008', 1, 'Annisa Aulia Saharani, M.Pd.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(378, '179', '199304232019032020', '199304232019032020', 1, 'Apriliyani Diah Kartikasari, M.Pd.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(379, '183', '199003012019031010', '199003012019031010', 1, 'Asy`ari, M.Ag.', 1, 11, '', '', '', 'L', 'Pamekasan', '1990-03-01', 'Dsn. Krajan Desa Sukorejo Kec. Bangsalsari Kab. Jember', '085330211590', 'asy\'ari.ri@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(380, '184', '198710122019032007', '198710122019032007', 1, 'Choiru Umatin, M.Pd', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(381, '190', '198906192019032014', '198906192019032014', 1, 'Dwi Shinta Rahayu,M.Pd.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(382, '192', '199101252019032012', '199101252019032012', 1, 'Eka Resti Wulan, M.Pd.', 1, 9, '', '', '', 'P', 'Jombang', '1991-01-25', 'Wisma Jaten Asri 3, Blok B-7, Blabak, Kandat, Kediri', '08563198958', 'ekaresti.wulan@iainkediri.ac.id', 'B', 'islam', 'Menikah', 'public/uploads/199101252019032012-1677929563393.jpg', '0000-00-00', 'aktif'),
(383, '196', '199010292019031009', '199010292019031009', 1, 'Eko Budi Hartanto, S.Hum., M.Pd.I', 1, 9, '', '', 'S.Hum., M.Pd.I', 'L', 'Ngawi', '1990-10-29', 'Janti Harmoniland No.B2 Dsn. klampisan Ds. Janti Kec. wates Kab. Kediri ', '085331174287', 'ekobudi@iainkediri.ac.id', 'A', 'islam', 'Menikah', 'public/uploads/199010292019031009-1648807231426.jpg', '0000-00-00', 'aktif'),
(384, '202', '199303062019032016', '199303062019032016', 1, 'Erawati Dwi Lestari', 1, 9, '', '', 'M. Hum.', 'P', 'Pasuruan', '1993-03-06', 'Griya Palladium Indah Kota Kediri', '081286224029', 'erawatidwilestari@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/199303062019032016-1652107678587.jpg', '0000-00-00', 'aktif'),
(385, '213', '199002252019031004', '199002252019031004', 1, 'Febri Hijroh Mukhlis, M.Hum.', 1, 11, '', '', '', 'L', 'Madiun', '1990-02-25', 'Desa Kedondong Rt 29 Rw 10 Kecamatan Kebonsari Madiun', '085736061118', 'hi_jroh@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/199002252019031004-1645701794861.jpg', '0000-00-00', 'aktif'),
(386, '232', '199009302019032014', '199009302019032014', 1, 'Fidia Astuti, M.Psi.', 1, 13, '', '', 'M.Psi.', 'P', 'Lamongan', '1990-09-30', 'Perumahan Gading Raya Permai 2 Blok B19', '085707123990', 'fidia@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/199009302019032014-1667917515090.jpg', '0000-00-00', 'aktif'),
(387, '245', '198404072019031003', '198404072019031003', 1, 'Gigih Wahyu Pratomo, M. A', 1, 11, '', '', 'M. A', 'L', 'Tuban', '1984-04-07', 'Dsn. Gempol RT 01/RW 02, Sumberdadi, Sumbergempol, Tulungagung', '081233575797', 'gihwahyu@iainkediri.ac.id', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(388, '246', '198908172019031012', '198908172019031012', 1, 'Hutrin Kamil, M.H.', 1, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(391, '251', '198905042019031012', '198905042019031012', 1, 'Jati Pamungkas, M.A.', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(392, '253', '198603042019031007', '198603042019031007', 1, 'Jerhi Wahyu Fernanda, M.Si.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(394, '283', '199107102019031009', '199107102019031009', 1, 'Lukman Hakim, M.Sos.', 1, 11, '', '', 'M.Sos', 'L', 'Pontianak', '1991-07-10', 'Perumahan Banjarejo View C15 Ngadiluwih Kediri', '085732003791', 'lukmanhakim@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/199107102019031009-1670331439247.jpg', '0000-00-00', 'aktif'),
(395, '285', '198911282019031006', '198911282019031006', 1, 'M. Syahrul Ulum, M.Sos', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(396, '301', '199010232019031007', '199010232019031007', 1, 'M. Thoriqul Huda, M.Fil.I', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(397, '314', '199010032019032010', '199010032019032010', 1, 'Mahfudhotin, M.Si.', 1, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(398, '330', '198505022019031003', '198505022019031003', 1, 'Masrul Anam, M.A', 0, 11, '', 'Dr.', '', 'L', 'Jombang', '1985-05-02', 'Jl. Airlangga 83 Abar-abir Bungah Gresik ', '085607000285', 'anam@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(400, '400', '199010172019031013', '199010172019031013', 1, 'Moch. Choirul Rizal, M.H.', 1, 9, '', '', '', 'L', 'Surabaya', '1990-10-17', 'Kabupaten Kediri', '08563229034', 'rizal@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/199010172019031013-1670201031170.jpg', '0000-00-00', 'aktif'),
(401, '402', '198408042019031004', '198408042019031004', 1, 'Mochammad Agus Rachmatulloh, M.H.', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(402, '403', '198807142019031013', '198807142019031013', 1, 'Moh. Misbakhul Khoir, M.Th.I.', 1, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(407, '408', '198608082019031006', '198608082019031006', 1, 'Muhammad Khoiril Akhyar,M.Pd.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(408, '409', '198809262019031004', '198809262019031004', 1, 'Muhammad Solikhudin, M.H.I', 1, 9, '', 'Dr. ', '', 'L', 'Sidoarjo', '1988-09-26', 'Sidoarjo', '081335772236', 'solikhudinmuhammad95@gmail.com ', '', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(409, '410', '198702222019031004', '198702222019031004', 1, 'Mundhori, M.E.', 1, 13, '', '', 'M.E.', 'L', 'Bojonegoro', '1987-02-22', 'Perumahan Griya Pesona Indah Blok A-17 Jl. Harmoni Ngronggo Kota Kediri', '085232663799', 'achmadmundhori@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/198702222019031004-1686810518059.jpg', '0000-00-00', 'aktif'),
(410, '411', '199011282019032012', '199011282019032012', 1, 'Nalsa Cintya Resti, M.Si.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(411, '412', '199002012019032011', '199002012019032011', 1, 'Nila Lukmatus Syahidah, M.Pd.I', 10, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(415, '416', '199310052019032017', '199310052019032017', 1, 'Oktaria Ardika Putri', 1, 13, '', '', 'M.M.', 'P', 'Malang', '2021-10-05', 'Kota Kediri', '081334147024', 'oktariaardika@iainkediri.ac.id', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(416, '417', '198501112019031003', '198501112019031003', 1, 'Puspoko Ponco Ratno', 1, 9, '', '', 'M.T.', 'L', 'Kediri', '1985-01-11', 'Pelem, Pare, Kediri', '087822107396', 'puspoko.ponco@iainkediri.ac.id', '', 'islam', 'Menikah', 'public/uploads/198501112019031003-1646996275055.jpg', '0000-00-00', 'aktif'),
(417, '418', '198903302019032008', '198903302019032008', 1, 'Ratna Wahyu Wulandari, M.Pd.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(418, '419', '199111232019032008', '199111232019032008', 1, 'Rezki Suci Qamaria, M.Psi.', 1, 11, '', '', '', 'P', 'Malaka', '1991-11-23', 'Perumahan Griya Mauni B15, Kelurahan Bangsal, Kecamatan Pesantren Kota Kediri', '082221963243', 'rezkisuciqamaria@iainkediri.ac.id', 'AB', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(419, '420', '199201112019031006', '199201112019031006', 1, 'Rizki Dermawan,', 1, 15, '', '', 'M.H.', 'L', 'Kediri', '1992-01-11', 'Kediri', '081331267015', 'rizkidrmwn11@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(420, '421', '199107172019032020', '199107172019032020', 1, 'Sayekti Indah Kusumawardhany, M.Akun.', 1, 13, '', '', 'M. Akun', 'P', 'Kediri', '1991-07-17', 'Jalan melati 3 no. 20', '081357000298', 'sayekti.indah@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(421, '422', '198712172019031006', '198712172019031006', 1, 'Setiawan, M.Sy', 1, 15, '', '', '', 'L', 'Tulungagung', '1987-12-17', 'Bendo, Gondang, Tulungagung', '085735845198', 'massetiawan@iainkediri.ac.id', 'B+', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(422, '423', '199111152019032011', '199111152019032011', 1, 'Sheila Fakhria, M.H.', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(423, '424', '199205312019032010', '199205312019032010', 1, 'Sheyla Nichlatus Sovia,', 1, 15, '', '', 'Lc., M.Ag.', 'P', 'Magetan', '1992-05-31', 'KPR Asabri I H-80 Tawanganom, Magetan', '085607607045', 'sheyla.sovia@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/199205312019032010-1648716838139.jpg', '0000-00-00', 'aktif'),
(424, '425', '199303162019032010', '199303162019032010', 1, 'Sidanatul Janah, M.H.', 1, 15, '', '', '', 'P', 'Gresik', '1993-03-16', 'Perumnas Ngronggo Kota Kediri', '082234805588', 'sidanatuljanah@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(425, '426', '199207082019032018', '199207082019032018', 1, 'Siska Yulia Weny, M.Ak', 1, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(426, '427', '198510032019032006', '198510032019032006', 1, 'Sri Hariyanti,M.M.', 1, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(428, '429', '199112282019031003', '199112282019031003', 1, 'Suprihantosa Sugiarto, M.H.', 1, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(429, '430', '198312082019031003', '198312082019031003', 1, 'Toni Adhitya, M.S.A.', 0, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(430, '431', '199206222019031008', '199206222019031008', 1, 'Yopi Yudha Utama, M.S.A.', 1, 13, '', '', '', 'L', 'Kediri', '1992-06-22', 'Jl. Anggrek II No.8 Perumnas Ngronggo', '081252412217', 'yopiyudhautama@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(431, '432', '199212032019032013', '199212032019032013', 1, 'Yuliana Desi Rahmawati, M.Ag.', 1, 11, '', '', 'M.Ag', 'P', 'NGANJUK', '1992-12-03', 'Desa Sendangwaru RT 02 RW 01', '085606054544', 'yulianadesi@iainkediri.ac.id', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(432, '433', '198407102019032009', '198407102019032009', 1, 'Yuliani, M.M.', 1, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(434, '480', '199207042019031009', '199207042019031009', 1, 'Muhammad Fajar Sidiq Widodo,M.H.', 0, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/199207042019031009-1686701585578.jpg', '0000-00-00', 'aktif'),
(435, '481', '199211212019032015', '199211212019032015', 1, 'Nurul Dwi Lestari, M.Pd.', 0, 9, '', '', '', 'P', 'Kediri', '1992-11-21', 'Ds. Maron', '085288779765', 'nuruldwilestati@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(436, '483', '198805152019031009', '198805152019031009', 1, 'Mohamad Ma\'mun, M.H.I', 0, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(437, '484', '199010202019031006', '199010202019031006', 1, 'Muhamad Wildan Fawa\'id, Dr. MEI', 0, 13, '', '', '', 'L', 'Nganjuk', '1990-10-20', 'Dusun Mergoyoso RT. 18 RW. 09 Desa Kalianyar Kec. Ngronggot', '085755070024', 'wildanfawaid@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/199010202019031006-1654178901143.jpg', '0000-00-00', 'aktif'),
(438, '485', '198809182019082001', '198809182019082001', 1, 'Erni Septianawati, S.Pd., M.Sc.', 0, 9, '', '', 'S.Pd., M.Sc.', 'P', 'Kediri', '1988-09-18', 'jl.joyoboyo II No.26 Tepus Kab.Kediri', '081542961633', 'erni.septianawati@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/198809182019082001-1645694993538.jpg', '0000-00-00', 'aktif'),
(439, '482', '199009232019032008', '199009232019032008', 1, 'Maziyyatul Muslimah, M.Pd.I', 0, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(440, '450', '150041916', '150041916', 3, 'Moh. Haris Santoso', 0, 6, 'Administrasi', '', 'ST', 'L', 'Kediri', '0001-11-30', 'Kediri', '085664433607', 'harissantos@iainkediri.ac.id', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(442, '493', '150041940', '150041940', 3, 'Andi Sebastian', 0, 6, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(444, '449', '150041915', '150041915', 3, 'Muhammad Iqbal Imaduddin', 0, 20, 'Administrasi', '', 'S.Kom.', 'L', 'Bojonegoro', '1994-10-20', 'Perumnas Ngronggo, Kota Kediri', '085608828314', 'muhi.imaduddin@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150041915-1630417275686.jpg', '0000-00-00', 'aktif'),
(445, '435', '150041901', '150041901', 3, 'Yah Yah An Nurrofiq, S.Kom', 0, 10, 'Administrasi', '', '', 'L', 'Jombang', '1996-10-09', 'Dsn. Kedungmacan, Ds. Kedungbetik, Kec. Kesamben 61484, Kab. Jombang', '085600074309', 'info.yahyah@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(446, '436', '150041902', '150041902', 3, 'Oktawira Wimaputri', 0, 21, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(447, '437', '150041903', '150041903', 3, 'Andhi Pramono', 0, 25, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(448, '438', '150041904', '150041904', 3, 'Anna Nur Ayda Mustika Sari', 0, 12, '', '', 'S.S.T', 'P', 'Kediri', '1995-09-14', 'Gang Setono Ds. Kwadungan Kec. Ngasem Kab. Kediri', '082165686397', 'annaayda333@gmail.com', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(449, '439', '150041905', '150041905', 3, 'Rizky Kurniawan Pambudi', 0, 10, 'Administrasi', '', 'M.E.', 'L', 'BOJONEGORO', '1995-12-04', 'JL. MAUNI 108 KEC. PESANTREN KOTA KEDIRI', '082337569900', 'rizkykukykykurniawan@gmail.com', '0', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(450, '440', '150041906', '150041906', 3, 'Ola Amalia', 0, 16, 'Administrasi', '', '', 'P', 'Kediri', '1993-08-14', 'bandar lor kec. mojoroto kota kediri', '081252290400', 'olaamalia7@gmail.com', '', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(451, '441', '150041907', '150041907', 3, 'Moch. Sayyidul Kaunain', 0, 23, '', '', '', 'L', 'kediri', '1986-11-04', 'ponpes putri menoro mangunsari tulungagung', '081357048337', 'syayidul@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(452, '442', '150041908', '150041908', 3, 'Ahmad Fahmi Yusuf Ma`arif', 0, 22, '', '', 'M.Pd.', 'L', 'Malang', '1990-06-24', 'Bandar Kidul 1, no.27a', '08113604499', 'ahmadfahmiym2406@gmail.com', 'B', 'islam', 'Duda', 'public/uploads/150041908-1658415376304.jpg', '0000-00-00', 'aktif'),
(453, '443', '150041909', '150041909', 3, 'Nur Rokhim', 0, 10, 'Administrasi', '', 'M.Pd.', 'L', 'Tulungagung', '1990-04-18', 'dsn. krajan ds. talunkukon kec. bandung kab. tulungagung', '085790239970', 'nurrokhim481@gmail.com', 'o', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(454, '444', '150041910', '150041910', 3, 'Refi Ridho Septian', 0, 6, 'Administrasi', '', 'S. Kom', 'L', 'kediri', '1992-09-08', 'Perum. Banjarejo Blok C-1 Paras Banjarejo Ngadiluwih Kab. Kediri', '085655585572', 'refiridho@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/150041910-1644883760422.jpg', '0000-00-00', 'aktif'),
(455, '445', '150041911', '150041911', 3, 'Zainur Rahman', 0, 16, 'Administrasi', '', '', 'L', 'SUMENEP', '0001-11-30', 'PURWOASRI', '085735998992', 'zen.sumekar90@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(456, '446', '150041912', '150041912', 3, 'Hannah Husnawati', 0, 7, '', '', 'S.M', 'P', 'Kediri', '1994-02-18', 'Jabang Selatan RT.001 RW.007 Sidomulyo', '081212989642', 'hannahusna7@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif');
INSERT INTO `pegawai` (`id_pegawai`, `pin`, `nik`, `nip`, `id_status`, `nama`, `id_grade`, `id_unit`, `keterangan`, `gelar_depan`, `gelar_belakang`, `jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `nohp`, `email`, `gol_darah`, `agama`, `status_pernikahan`, `foto`, `tmt_pegawai`, `status`) VALUES
(457, '447', '150041913', '150041913', 3, 'Ramadhan Anindya Guna Aniwara', 0, 12, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(458, '448', '150041914', '150041914', 3, 'Agustina Kurniasari', 0, 12, '', '', 'M.Pd', 'P', 'Blitar', '1986-08-07', 'Jl. apel 4. Kertosono', '085851363786', 'agustinakurniasari5@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150041914-1679115730753.jpg', '0000-00-00', 'aktif'),
(460, '380', '199211092018012001', '199211092018012001', 1, 'Novi Rosita Rahmawati', 0, 9, '', '', 'M.Pd', 'P', 'kediri', '1992-11-09', 'Jl. sumber wuni gang pisangrenggo, lawang, kab. malang', '085645170011', 'novirahmawati@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(461, '407', '198607262019032008', '198607262019032008', 1, 'Muhammad Ilman Nafi\'an,', 0, 9, '', 'Dr.', '', 'L', 'Tulungagung ', '1986-07-26', 'Jl. A Yani Timur Dawung Dono Sendang Tulungagung ', '08113431043', 'ilman@iainkediri.ac.id', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(462, '494', '150022009', '150022009', 3, 'Eko Susilo', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1977-11-22', 'kelurahan rejomulyo jln sunan Ampel 1 RT 2 RW 1', '085732222702', 'Ekosusilow00@gmail.com', 'o', 'islam', 'Menikah', 'public/uploads/150022009-1663954684648.jpg', '0000-00-00', 'aktif'),
(463, '495', '150022012', '150022012', 3, 'Dodik Prihandoko', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1984-07-29', 'jl.sunan Ampel 2 no.94 Rejomulyo kota kediri', '0895366965646', 'dodikprihandoko21@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150022012-1632994753317.jpg', '0000-00-00', 'aktif'),
(464, '496', '150022013', '150022013', 3, 'Rivaldo Andi Pratama', 0, 6, 'Kebersihan', '', '', 'L', 'Kediri', '2000-10-21', 'Jl. sunan ampel gg 2 no 96B', '08557027380', 'aldo82577@gmail.com', 'O', 'islam', 'Belum Menikah', 'public/uploads/150022013-1637903319521.jpg', '0000-00-00', 'aktif'),
(465, '497', '150022008', '150022008', 3, 'Anas Anshori', 0, 6, 'Kebersihan', '', '', 'L', 'Kediri', '1999-03-17', 'Jl. Ahmad Jaelani RT.12 RW.04 ,Dsn. Sumberagung Kec. Wates Kab. Kediri', '085736924225', 'hanshilman092@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/150022008-1676847694605.jpg', '0000-00-00', 'aktif'),
(466, '498', '150022001', '150022001', 3, 'UMI MASUKHOH, M.Pd.I', 0, 10, 'Administrasi', '', '', 'P', 'Kediri', '1988-08-01', 'Jl. Perintis Kemerdekaan no. 132-B, Kel. ngronggo, Kec. Kota, Kediri', '085230666558', 'umimasukhoh@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(467, '499', '150022002', '150022002', 3, 'VERYZA AULIA ADHANI, S.IIP', 0, 21, '', '', 'S.IIP', 'P', 'Nganjuk', '1992-06-12', 'desa mlilir kecamatan berbek kabupaten nganjuk', '085648368862', 'veryza.aulia@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/150022002-1645704627539.jpg', '0000-00-00', 'aktif'),
(468, '500', '150022003', '150022003', 3, 'SANDITIA AULIA DIAN, S.Pd.I', 0, 8, '', '', '', 'P', 'Palangkaraya', '1992-08-04', 'Perumahan Banjarejo View Blok C 1 ds Banjarejo Kec ngadiluwih Kab Kediri', '085655616452', 'sandiaudy@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150022003-1632439902173.jpg', '0000-00-00', 'aktif'),
(470, '502', '150022005', '150022005', 3, 'M. ZULFIKAR ALI WAVA, S.Kom, MM', 0, 16, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(471, '503', '150022006', '150022006', 3, 'YUNI LESTARI, A.Md. Kom', 0, 6, 'Administrasi', '', '', 'P', 'Kediri', '1998-03-17', 'Ngletih, Pesantren, Kota Kediri', '081341573817', 'yunlestar41@gmail.com', 'O', 'islam', 'Belum Menikah', 'public/uploads/150022006-1630651345974.jpg', '0000-00-00', 'aktif'),
(472, '504', '150022007', '150022007', 3, 'MUH. HANIF IRFANUDDIN', 0, 6, 'Satpam', '', '', 'L', '', '1974-02-22', 'Ds Brenggolo Rt/Rw 004/010 Dsn Klaten Kec. Plosoklaten', '081555975779 ', 'hanif.muhammad.mh78@gmail.com', 'A', 'islam', 'Menikah', 'public/uploads/150022007-1631145139088.jpg', '0000-00-00', 'aktif'),
(473, '555', '1972102820050110005', '1972102820050110005', 1, 'Kadi, Dr., M. Pd. I', 9, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(474, '543', '197908252008121001', '197908252008121001', 1, 'Nur Aziz Afandi, S. Psi., M.Si', 10, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(475, '454', '150041920', '150041920', 3, 'Ego Permana Putra', 0, 6, 'Kebersihan', '', '', 'L', 'Kediri', '1998-04-21', 'Jl Letjend Sutoyo 2 no 48 Tinalan Pesantren Kota Kediri', '082234631937', 'egospoor68@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150041920-1630496206162.jpg', '0000-00-00', 'aktif'),
(476, '455', '150041921', '150041921', 3, 'Dwi Agung Elgi Fani', 0, 6, 'Kebersihan', '', '', 'L', '', '1997-08-16', 'jl.sunanampel1 rt 02 rw 01', '0000', '00000', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(477, '460', '150041926', '150041926', 3, 'Ayik Hanifah', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(479, '473', '150041939', '150041939', 3, 'Bayu Prasetyo', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(480, '459', '150041925', '150041925', 3, 'Dari Eko Setiawan', 0, 6, 'Kebersihan', '', '', 'L', 'Nganjuk', '1986-03-11', 'jl sunan ampel 1 no 44 kediri kota', '08973450212', 'Alfandika86@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(481, '452', '150041918', '150041918', 3, 'Hari Susela', 0, 6, 'Kebersihan', 'sma', '', 'L', 'kediri', '2021-08-16', 'dsn.weru...ds.Ringinsari...kec.kandat', '085790597538', 'harfiey@gmail.com', 'o', 'islam', 'Menikah', 'public/uploads/150041918-1649299269175.jpg', '0000-00-00', 'aktif'),
(482, '453', '150041919', '150041919', 3, 'Mochamad Agung Wicaksono', 0, 6, 'Kebersihan', '', '', 'L', 'kediri', '1988-08-10', 'Jl.sunan Ampel 1 no.83c', '081259693585', 'agungwicaksono1088@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(483, '457', '150041923', '150041923', 3, 'Nanang Kristiawan', 0, 6, 'Kebersihan', '', '', 'L', 'Grobogan', '1997-10-11', 'jl.sunan Ampel 3 , Rejomulyo kota Kediri', '0857', 'galengkaret21@gmail.com', '', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(484, '456', '150041922', '150041922', 3, 'Mohamad Arifin', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(486, '458', '150041924', '150041924', 3, 'Zainuri', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(487, '556', '199410282020122027', '199410282020122027', 1, 'Afifah Mayaningsih, S.Pd, M.H.', 9, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(489, '557', '199204172020121008', '199204172020121008', 1, 'Ahmad Syafi\'I Mufadzilah Riyadi, S.Hum., M.A', 9, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(491, '558', '199111052020121020', '199111052020121020', 1, 'Ahmad Yani Fathur Rohman, S. Fil., M.Phil', 9, 11, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(493, '559', '198507062020122008', '198507062020122008', 1, 'Al Mas\'udah, SHI.MH', 9, 15, '', '', '', 'P', 'Tuban', '2021-03-26', 'Tuban', '081333320818', 'almasudah@iainkediri.ac.id', 'AB', 'islam', 'Menikah', 'public/uploads/198507062020122008-1650582598732.jpg', '0000-00-00', 'aktif'),
(495, '560', '199408222020122022', '199408222020122022', 1, 'Anggi Nurul Baity, M.Pd', 9, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(497, '561', '199108232020122022', '199108232020122022', 1, 'Ani Mar\'atul Hamidah, M.Pd.I', 9, 9, '', '', 'M.Pd.I', 'P', 'Palangkaraya', '1991-08-23', 'Perumahan Green Ashoka Blok A 24 Kel. Ngronggo Kota Kediri', '085790479607', 'animh@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/199108232020122022-1648767817928.jpg', '0000-00-00', 'aktif'),
(499, '562', '199111122020122020', '199111122020122020', 1, 'Aulia Rohmawati, M. Pd', 9, 9, '', '', '', 'P', 'Bandar Lampung', '1991-11-12', 'Gampengrejo', '085736480756', 'inoe.kilea@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/199111122020122020-1648399590188.jpg', '0000-00-00', 'aktif'),
(501, '563', '198906242020121016', '198906242020121016', 1, 'Dhiya\'u Shidiqy, M.M.', 9, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(503, '564', '199301022020122023', '199301022020122023', 1, 'Erni Zulfa Arini, S.T., M.M.', 9, 13, '', '', '', 'P', 'Nganjuk', '1993-01-02', 'Ngronggo', '082141064325', 'ernizulfaarini@iainkediri.ac.id', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(505, '565', '198905042020121014', '198905042020121014', 1, 'Ghulam Falach, L.c., M.Ag', 9, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(507, '566', '198611292020122006', '198611292020122006', 1, 'Husnul Khotimah, M.Pd.I', 9, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(509, '567', '198505122020121007', '198505122020121007', 1, 'Irfan Harmoko, SEI. MM.', 9, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(511, '568', '198903052020122014', '198903052020122014', 1, 'Islamiati Hidayah, S.A., M.Akun', 9, 13, '', '', '', 'P', 'Banyuwangi', '1989-03-05', 'Jl. Brawijaya No.90', '081515200383', 'islamiati@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/198903052020122014-1645745891839.jpg', '0000-00-00', 'aktif'),
(513, '569', '199209092020122037', '199209092020122037', 1, 'Isyrohil Muyassaroh, SE., MSA', 9, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(515, '570', '199009292020122023', '199009292020122023', 1, 'Kholila Mukaromah, S.Th.I, M.Hum', 9, 11, '', '', 'S.Th.I, M.Hum', 'P', 'Blitar', '1990-09-29', 'Ds.Temenggungan Udanawu Blitar', '082143280592', 'kholilamukaromah@iainkediri.ac.id', 'B', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(517, '571', '198906052020122013', '198906052020122013', 1, 'Lailatul Fitriah, S.Psi., M.Psi., psikolog', 9, 11, '', '', '', 'P', 'Kediri', '1989-06-05', 'plosokaten kediri', '085608090122', 'lailatulfitria@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/198906052020122013-1648027825852.jpg', '0000-00-00', 'aktif'),
(519, '572', '199604242020121009', '199604242020121009', 1, 'M. Royyan Nafis Fathul Wahab, M.Ag.', 9, 9, '', '', '', 'L', 'Jember', '1996-04-24', 'Perumahan Griya Citra Wardhani B-15 Manisrenggo Kediri', '087703044906', 'm.royyannafis@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(521, '573', '199006062020121012', '199006062020121012', 1, 'M. Ubaidillah Ridwanulloh, M.Pd.I', 9, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(523, '574', '199007032020122016', '199007032020122016', 1, 'Maimunatun Habibah, M.Pd.I', 9, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(525, '575', '199102142020121015', '199102142020121015', 1, 'Mohammad Hendy Musthofa, M.H.', 9, 15, '', '', '', 'L', 'Kediri', '1991-02-14', 'Jalan Merpati 82 Pule Kandat Kediri', '081333366393', 'hendymusthofa@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(527, '576', '199004072020121008', '199004072020121008', 1, 'Mohammad Lukman Chakim, M.H', 9, 11, '', '', '', 'L', 'Sidoarjo', '1990-04-07', 'Ds. Kraton RT 01 RW 02 Kec. Mojo Kab. Kediri', '085748568117', 'lukmanchim@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(529, '577', '199406302020121016', '199406302020121016', 1, 'Muhammad Fikri Alan, S.H.,M.H', 9, 15, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(531, '578', '199012122020121015', '199012122020121015', 1, 'Muhammad Habib Adi Putra,', 9, 15, '', '', 'M.H.', 'L', 'Nganjuk', '1990-12-12', 'Desa Papar, Kec. Papar, Kab. Kediri', '    ', ' ', 'O', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(533, '579', '199109222020121015', '199109222020121015', 1, 'Muhammad Nabhani, M.H.', 9, 9, '', '', '', 'L', 'Jombang', '1991-09-22', 'Jerukwangi, Kandangan, Kediri', '082213338007 ', 'nabhanim07@iainkediri.ac.id ', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(535, '580', '198609202020122009', '198609202020122009', 1, 'Muthi\'ah Hijriyati, M.Th.I, M.S.I', 9, 15, '', '', '', 'P', 'surabaya', '2022-02-22', 'jombang', '085645583840', 'mutiahijria@iainkediri.ac.id', 'AB', 'islam', 'Menikah', 'public/uploads/198609202020122009-1645607216202.jpg', '0000-00-00', 'aktif'),
(537, '581', '198712282020122011', '198712282020122011', 1, 'Ning Purnama Sariati, M.E.I', 9, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(539, '582', '199505132020122024', '199505132020122024', 1, 'Nurlaili Adkhi Rizfa Faiza, S.E., M.E.', 9, 13, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(541, '583', '199203072020121015', '199203072020121015', 1, 'Rendi Ardika, S.Pd., M.Akun', 9, 13, '', '', 'S. Pd., M. Akun', 'L', 'Blitar', '1992-03-07', 'Perumahan Podomoro B2-14 Sukorame Kota Kediri', '085882782818', 'ardik0703@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/199203072020121015-1670323048191.jpg', '0000-00-00', 'aktif'),
(543, '584', '198506182020122003', '198506182020122003', 1, 'Renita Donasari, M.Pd.', 9, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(545, '585', '199206072020122027', '199206072020122027', 1, 'Tutik Dinur Rofiah, S.Pd.I, M.Pd', 9, 9, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(547, '586', '199309242020122017', '199309242020122017', 1, 'Vina Septiana Permatasari', 9, 13, '', '', 'M.SEI', 'P', 'Kediri', '1993-09-24', 'Permata Biru Blok H', '081273420099', 'vinaseptianap@iainkediri.ac.id', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(549, '587', '198610102020121010', '198610102020121010', 1, 'Zainal Abidin, Dr., S.Pd,M.Pd.I', 9, 11, '', '', '', 'L', 'Jombang', '1986-10-10', 'Dusun Nglawan Senden kecamatan Peterongan', '081331636908', 'elzein.jombang@iainkediri.ac.id', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(551, '588', '199012172020121004', '199012172020121004', 2, 'Zefry Luttadinata, SE', 7, 18, '', '', '', 'L', 'Blitar', '1990-12-17', 'Jl. Joyoboyo gg II no 06 Rt 4 Rw 11 Sukorejo, Ngasem, Kabupaten Kediri', '085735838006', 'Zefryluttadinata1@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/199012172020121004-1655798608474.jpg', '0000-00-00', 'aktif'),
(553, '589', '199407172020122021', '199407172020122021', 2, 'Zuhrufi Latifah, S.Pd.', 8, 6, '', '', 'S.Pd.', 'P', 'Kediri', '1994-07-17', 'Kediri', '085790694717', 'zuhrufi@iainkediri.ac.id', 'A', 'islam', 'Belum Menikah', 'public/uploads/199407172020122021-1645766020581.jpg', '0000-00-00', 'aktif'),
(555, '590', '199201252020121012', '199201252020121012', 2, 'Alan Yadi Muttaqi, S.E', 8, 7, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(557, '591', '199606212020122025', '199606212020122025', 2, 'Farah Anggraeni, S.AP', 8, 6, '', '', 'S.AP', 'P', 'Kediri', '0001-11-30', 'Jl. Raya Gringging no 41', '089670577648', 'faarahanggraeni@gmail.com', 'AB', 'islam', 'Menikah', 'public/uploads/199606212020122025-1647760169525.jpg', '0000-00-00', 'aktif'),
(559, '592', '198912182020121010', '198912182020121010', 2, 'Moch. Taufiq Yahya, S.Kom.', 8, 8, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(561, '593', '199406022020122026', '199406022020122026', 2, 'Permata Rahmatul Hijjah, S.Kom.', 8, 6, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(563, '594', '199502032020121014', '199502032020121014', 2, 'Rendy Arviandy Lestyan Gilang Ramadhan, S.E.', 7, 10, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(564, '595', '150012105', '150012105', 3, 'Johan Setiawan', 0, 8, '', '', 'S.Kom', 'L', 'Kediri', '1992-10-17', 'Ds. Nambakan Kec. Ringinrejo Kab. Kediri', '085655561692', 'johancorporation@gmail.com', '', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(565, '596', '150022101', '150022101', 3, 'PENI EKO NINGTYAS, S.Sos', 0, 10, 'Administrasi', '', '', 'P', 'KEDIRI', '1992-05-19', 'DS. TALES SELATAN RT 01/RW 01', '081233283139', 'peniekoningtias@gmail.com', '', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(566, '597', '150022102', '150022102', 3, 'KARTIKA PINIJI DWI BUDIARTI, SE', 0, 12, '', '', '', 'P', 'Kediri', '1998-06-14', 'Dsn. Santren Ds. Jagung Kec.Pagu Kab. Kediri', '081553074327', 'kartikapinijidb@gmail.com', 'o', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(567, '598', '150022103', '150022103', 3, 'EKA PUTRA SAMUDRA PURNAMA, S.Kom', 0, 6, 'Administrasi', '', '', 'L', '', '2030-01-11', 'Jl. Sumber Dasem No.97 Ds. Betet Kec. Pesantren Kota Kediri', '087850098765', 'ekaputrasamudra32@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(568, '599', '150022105', '150022105', 3, 'RAHMATUL UMAH, S.Pd.', 0, 24, '', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(569, '600', '150022104', '150022104', 3, 'IKHDATUL FADILAH, S.H.', 0, 6, 'Administrasi', '', '', 'P', 'Jombang', '1997-11-14', 'Jombang', '085648574072', 'ikhdatulfadilah@gmail.com', '', 'islam', 'Belum Menikah', '', '0000-00-00', 'aktif'),
(570, '601', '150042101', '150042101', 3, 'Mokamad Mahbub Junaidi', 0, 21, '', '', 'S. Kom', 'L', 'Kediri', '1995-10-27', 'Ling Blabak Kec Pesatren Kota Kediei', '081336462878', 'mahbub.s.kom@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150042101-1656667107668.jpg', '0000-00-00', 'aktif'),
(571, '602', '150042102', '150042102', 3, 'Puji Pambudi Putra Perdana, S.Kom', 0, 14, 'Administrasi', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(572, '603', '196503141992031003', '196503141992031003', 2, 'Drs. H. Achmad Heru Achadi Hari, M.Si', 15, 5, '', 'Drs', 'M.Si', 'L', 'Sidoarjo', '0001-11-30', 'perum Vila Bulurejo K.02 Blabak Kota Kediri', '08113666376', 'achmadheru14@gmail.com', 'A', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(573, '604', '150062101', '150062101', 3, 'Ahmada Muhammad', 9, 6, 'Administrasi', '', 'A. Md', 'L', 'kediri', '1994-04-25', 'ngronggo', '085735013424', 'ahmadamuh@iainkediri.ac.id', '0', 'islam', 'Menikah', 'public/uploads/150062101-1632231073085.jpg', '0000-00-00', 'aktif'),
(605, '605', '150021717', '150021717', 3, 'TAOFIK, S.Pd.I', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(606, '606', '150041917', '150041917', 3, 'DIMAS TETUKO', 0, 6, 'Kebersihan', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(607, '607', '150041927', '150041927', 3, 'MUCHAMAD SAIFULLOH', 0, 6, 'Satpam', '', '', 'L', 'kediri', '1992-05-24', 'jl.super semar 25 ngronggo', '085749773702', 'mohammadsaifulloh23@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150041927-1637577615267.jpg', '0000-00-00', 'aktif'),
(608, '608', '150041929', '150041929', 3, 'WIYANTO', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/150041929-1631510592081.jpg', '0000-00-00', 'aktif'),
(609, '609', '150041930', '150041930', 3, 'CANDRA SEPTYANTO', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(610, '610', '150041931', '150041931', 3, 'DODIK KRISTANTO', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, 'public/uploads/150041931-1649457022651.jpg', '0000-00-00', 'aktif'),
(611, '611', '150041932', '150041932', 3, 'RYAN DWI KURNIAWAN', 0, 6, 'Satpam', '', '', 'L', 'kediri', '1998-10-18', 'desa maron , kec banyakan , kab kediri ', '081335006782', 'bangpaijooooo@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150041932-1643826268834.jpg', '0000-00-00', 'aktif'),
(612, '612', '150041933', '150041933', 3, 'HENDRA DWI PRASETYO', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(613, '613', '150041934', '150041934', 3, 'DUDUT ARIYANTO', 0, 6, 'Satpam', '', '', 'L', '', '1982-05-26', 'Kel setonopande RT 03 RW 04 kediri', '082140876344', 'dudutariyanto.kdr@gmail.com', '', 'islam', 'Menikah', '', '0000-00-00', 'aktif'),
(614, '614', '150041935', '150041935', 3, 'ANDRIANTO WAHYU CANDRA', 0, 6, 'Satpam', '', '', 'L', 'nganjuk', '1994-04-18', 'desa. Tanjungkalang, kec. Ngronggot, kab. Nganjuk', '085732335817', 'awahyucandra@gmail.com', '', 'islam', 'Menikah', 'public/uploads/150041935-1630563766325.jpg', '0000-00-00', 'aktif'),
(615, '615', '150041936', '150041936', 3, 'BUSTANUL TANFIUR ROCHMAN', 0, 6, 'Satpam', '', '', 'L', 'KEDIRI', '1997-09-24', 'JL RAYA PAGUT NO 153 KEL BLABAK KEC PESANTREN', '083115443471', 'seninbustomi@gmail.com', '', 'islam', 'Belum Menikah', 'public/uploads/150041936-1630512581286.jpg', '0000-00-00', 'aktif'),
(616, '616', '150041937', '150041937', 3, 'TOFAN DIRGANTARA', 0, 6, 'Satpam', '', '', '', '', '0000-00-00', '', '', '', '', '', NULL, '', '0000-00-00', 'aktif'),
(617, '617', '150041938', '150041938', 3, 'RIZAL PUTRA PAMUNGKAS', 0, 6, 'Kebersihan', '', '', 'L', 'Kediri', '2021-08-25', 'Kota Kediri', '007', 'rizalfemof6@gmail.com', 'O', 'islam', 'Belum Menikah', 'public/uploads/150041938-1647855328576.jpg', '0000-00-00', 'aktif'),
(620, '619', '150112101', '150112101', 3, 'Befryan Ismakanito', 0, 11, NULL, ' ', 'S. Sos', 'L', 'Kediri', '1996-05-11', 'Jl. Veteran V RT 02 RW 01 Desa Gurah Kec. Gurah Kab. Kediri', '082132344095', '-', 'O', 'islam', 'Belum Menikah', 'public/uploads/150112101-1648773400996.jpg', NULL, 'aktif'),
(621, '620', '150112102', '150112102', 3, 'Nur Aini Hanin Almawaddah', 0, 15, NULL, ' ', ' ', 'P', 'Tulungagung', '1998-08-31', 'Dusun Jeding Kidul RT/RW 01/10 Desa Ariyojeding Kab, Blitar', '081231600067', 'haninalma0@gmail.com', 'O', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(622, '621', '150112103', '150112103', 3, 'AHMAD PANDU PRASTIAN', 0, 6, NULL, ' ', ' ', 'L', 'kediri', '2003-05-24', 'Karanganyar Ds. Panggung', '085748954598', '-', 'O', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(623, '622', '150112104', '150112104', 3, 'RISKY SURYA HARISTYANTO', 0, 6, NULL, ' ', ' ', 'L', 'Kediri', '1997-03-02', 'Perum. Griya Melati Indah Blok A. 22 RT 04 RW 07 Kel. Banjarmlati Kec. Mojoroto Kota Kediri', '082335055344', '-', 'O', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(624, '623', '150112105', '150112105', 3, 'RUDIK SETIAWAN', 0, 6, NULL, ' ', ' ', 'L', 'Kediri', '1985-05-19', 'Jl. Karang Anyar RT 01 RW 02 Kota Kediri', '081556491794', '-', 'O', 'islam', 'Duda', NULL, NULL, 'aktif'),
(627, '88', '150012201', '150012201', 4, 'Ossa Bodhi Tala Sumanto', 0, 9, NULL, ' ', 'M.A.', 'L', 'kediri', '2022-01-31', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(628, '248', '150012202', '150012202', 4, 'Ahmad Fahroni', 0, 9, NULL, ' ', 'M.Pd.I', 'L', 'kediri', '2022-01-31', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(629, '250', '150012203', '150012203', 4, 'Kurnia Ahadiyah', 0, 9, NULL, ' ', 'M.Si.', 'P', 'kediri', '2022-01-31', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(630, '277', '150012204', '150012204', 4, 'Erika Puspitasari', 0, 9, NULL, ' ', 'M.Pd.', 'P', 'kediri', '2022-01-31', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(631, '312', '150012205', '150012205', 4, 'Putri Kholida Faiqoh', 0, 9, NULL, ' ', 'M.Pd.I', 'P', 'kediri', '2022-01-31', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(632, '354', '150012206', '150012206', 4, 'A. Fauzan Pujianto', 0, 9, NULL, ' ', 'M. Ag. ', 'L', 'Ngawi', '1982-12-09', 'P. P. T. Q. al-Ma\'ruf, Juranguluh - Kedawung - Mojo - Kediri- Jawa Timur', '085745170259', 'ahmadfauzan@iainkediri.ac.id', 'O', 'islam', 'Menikah', NULL, NULL, 'aktif'),
(633, '390', '150012207', '150012207', 4, 'Adib Fatoni', 0, 9, NULL, ' ', 'M.Pd.', 'L', 'Tulungagung', '1990-09-24', 'Ds. Mergayu Kec. Bandung Kab. Tulungagung', '085736125123', 'fatoniadib90@gmail.com', 'O', 'islam', 'Menikah', NULL, NULL, 'aktif'),
(634, '391', '150012208', '150012208', 4, 'Asyhad Abdillah Rosyid', 0, 9, NULL, ' ', 'M.Ag.', 'L', 'jombang', '1987-10-28', 'rejosopinggir tembelang jombang', '085730153774', 'asyhad87@gmail.com', 'B', 'islam', 'Menikah', 'public/uploads/150012208-1646352835878.jpg', NULL, 'aktif'),
(635, '392', '150012209', '150012209', 4, 'Hanis Ribut Makasara', 0, 9, NULL, ' ', 'M.Psi.', 'L', 'kediri', '2022-01-31', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(636, '393', '150012210', '150012210', 4, 'Aziza Anggi Maiyanti', 0, 9, NULL, ' ', 'S.Si, M.Pd.', 'P', 'kediri', '1991-05-24', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', 'public/uploads/150012210-1672704885093.jpg', NULL, 'aktif'),
(637, '394', '150012211', '150012211', 4, 'Eni Prasetyowati', 0, 9, NULL, ' ', 'M.Pd.', 'P', 'kediri', '2022-01-31', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(638, '404', '150012212', '150012212', 4, 'Try Heni Aprilia', 0, 9, NULL, ' ', 'M.Pd.', 'P', 'Kediri', '1993-04-02', 'Dusun Semelo Desa Kayen RT 003 RW 002 Kec. Bandarkedungmulyo Kab. Jombang', '085655506137', 'h3ny.ap@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/150012212-1674088509303.jpg', NULL, 'aktif'),
(639, '405', '150012213', '150012213', 4, 'Yogi Rohana', 0, 9, NULL, ' ', 'M. Hum.', 'P', 'Kediri', '1987-08-04', 'Perum Tejosari Blok B 7 RT 030/RW 007 Gogorante Ngasem Kediri', '085331020832', 'yogihana6@gmail.com', 'A', 'islam', 'Janda', NULL, NULL, 'aktif'),
(640, '406', '150012214', '150012214', 4, 'Nur Afiyah', 0, 13, NULL, 'Hj.', 'S.Th.I, M.Ag.', 'P', 'Demak', '1975-01-03', 'Kediri', '085815812000', 'afiyah.kediri99@gmail.com', 'B', 'islam', 'Menikah', NULL, NULL, 'aktif'),
(641, '413', '150012215', '150012215', 4, 'Yulianti Yusal', 0, 9, NULL, 'Dr', 'S.Pd, M.Pd.', 'P', 'Doping', '1990-03-02', 'Jalan KH Ahmad Dahlan No.30 Mojoroto Kediri', '085242578756', 'yuliantiyusal@iainkediri.ac.id', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(642, '414', '150012216', '150012216', 4, 'Atika Anggraini', 0, 9, NULL, ' ', 'S.Pd, M.Pd.', 'P', 'Bojonegoro', '1995-04-08', 'Perumahan Green Joyoboyo Regency Blok H27 Sobo, Nambaan, Kec. Ngasem, Kabupaten Kediri, Jawa Timur 64182', '081331291888', 'atikaanggraini@iainkediri.ac.id', 'B', 'islam', 'Belum Menikah', 'public/uploads/150012216-1659519499583.jpg', NULL, 'aktif'),
(643, '415', '150012217', '150012217', 4, 'Iwan Kurniarahman', 0, 9, NULL, ' ', ', M.Pd.', 'L', 'Jombang', '1989-02-26', 'kediri', '085755255120', '-', 'O', 'islam', 'Menikah', NULL, NULL, 'aktif'),
(644, '428', '150012218', '150012218', 4, 'Ardiana Fatma Dewi', 0, 9, NULL, ' ', ' S.Stat, M.Stat.', 'P', 'kediri', '1996-12-23', 'kediri', '085704900868', 'ardianafatmad@iainkediri.ac.id', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(645, '434', '150012219', '150012219', 3, 'MUHAMMAD REYHAN VALENTINO', 0, 6, NULL, ' ', ' ', 'L', 'kediri', '2003-02-14', 'Jl Sunan Ampel no 7 gg ll rt1 rw2 Rejomulyo kec. kota Kediri', '087757761043', 'muhreyhanv11@gmail.com', 'O', 'islam', 'Belum Menikah', 'public/uploads/150012219-1645037532618.jpg', NULL, 'aktif'),
(646, '451', '150012220', '150012220', 3, 'ONI FEBI ABI PRATAMA', 0, 6, NULL, ' ', ' ', 'L', 'kediri', '2001-02-28', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(647, '461', '150022201', '150022201', 3, 'DAVID SETIAWAN', 0, 6, 'Satpam', ' ', ' ', 'L', 'kediri', '1997-09-28', 'jl Yos Sudarso no 14', '689282', 'davidstwn9912@gmail.com', 'A', 'islam', 'Menikah', 'public/uploads/150022201-1670317311156.jpg', NULL, 'aktif'),
(648, '462', '150022202', '150022202', 3, 'GANDI ASWAJA YOGATAMA', 0, 6, NULL, ' ', ' M.SM.', 'L', 'kediri', '2022-01-31', 'kediri', '689282', '-', 'A', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(649, '463', '150022204', '150022204', 3, 'ERISSA HANIFAH,', 0, 6, NULL, ' ', 'ME', 'P', 'kediri', '1997-01-07', 'kediri', '085735630680', 'erissahanifah@gmail.com', 'B', 'islam', 'Menikah', NULL, NULL, 'aktif'),
(650, '464', '150022205', '150022205', 3, 'Zahara Madania, S.E', 0, 6, NULL, ' ', '', 'P', 'Lamongan', '2000-10-19', 'Kediri', '08xxx', 'madaniazahara19@gmail.com', 'A', 'islam', 'Belum Menikah', 'public/uploads/150022205-1679969453908.jpg', NULL, 'aktif'),
(651, '465', '198111102005012008', '198111102005012008', 2, 'Elvi Susanti, M. Pd', 10, 10, NULL, ' ', 'M. Pd', 'P', 'B. Malang', '1981-11-10', 'Desa Tj. Tani Kec Prambon Kab Nganjuk Jatim', '081372851881', 'elvisusanti1081@gmail.com', 'AB', 'islam', 'Menikah', 'public/uploads/198111102005012008-1659662348340.jpg', NULL, 'aktif'),
(652, '466', '199410312022032001', '199410312022032001', 2, 'Atikah Hayyu Mulia, S.Kom', 7, 6, NULL, ' ', ', S.Kom', 'P', 'Banjarmasin', '1994-10-31', 'Perum Doko Sragi Blok M-8 Kabupaten Kediri - Jawa Timur', '085156253868', 'hayyumulia@gmail.com', 'AB', 'islam', 'Menikah', 'public/uploads/199410312022032001-1654266976865.jpg', NULL, 'aktif'),
(653, '467', '199106042022032001', '199106042022032001', 1, 'Ayu Ridho Saraswati, M.Pd.', 9, 9, NULL, ' ', ', M.Pd.', 'P', 'Bondowoso', '1991-06-04', 'Jl. Irian No. 23 RT 3 RW 7 Kel. Kepanjenkidul, Kec. Kepanjen Kidul- Kota Blitar - Jawa Timur', '-', '-', 'B', 'islam', 'Menikah', NULL, NULL, 'aktif'),
(654, '468', '199003132022032001', '199003132022032001', 1, 'Irma Khoirot Daulay, Dr., M.Hum.', 10, 9, NULL, 'Dr.', ', M.Hum', 'P', 'Medan', '1990-03-13', 'Jl. Suka Jaya No. 11b Kel. Suka Maju Kec. Medan Johor Kota Medan - Sumatera Utara', '082360222048', 'irmakhoirotdaulay@iainkediri.ac.id', 'A', 'islam', 'Menikah', 'public/uploads/199003132022032001-1658736005828.jpg', NULL, 'aktif'),
(655, '469', '198901102022032001', '198901102022032001', 1, 'Elen Nurjanah, M.Pd.', 10, 9, NULL, ' ', ', M.Pd. ', 'P', 'malang', '1989-01-10', 'Jl. Kemusuk Sawo Dsn Puluhan RT 08 RW 03 Argomulyo Kec. Sedayu Kab. Bantul - DI Yogyakarta', '-', '-', 'AB', 'islam', 'Menikah', NULL, NULL, 'aktif'),
(656, '470', '199603242022032001', '199603242022032001', 1, 'Ellyda Retpitasari, M.Sos.', 10, 11, NULL, ' ', ', M.Sos.', 'P', 'kediri', '1996-03-24', 'Dsn Kapas RT 005 RW 002 Desa Kapas Kecamatan Kunjang Kab. Kediri - Jawa Timur', '-', '-', 'B', 'islam', 'Belum Menikah', NULL, NULL, 'aktif'),
(657, '471', '199011182022031002', '199011182022031002', 1, 'Fairizal Rahman, M.I.Kom', 10, 11, NULL, ' ', 'M.I.Kom', 'L', 'Sumenep', '1990-11-18', 'Jln. Raya Gapura Desa Paberasan Kec. Kota Sumenep Kab. Sumenep Jawa Timur', '085238111990', 'fairizal.rahman@iainkediri.ac.id', 'O', 'islam', 'Menikah', 'public/uploads/199011182022031002-1659398778230.jpg', NULL, 'aktif'),
(658, '472', '199903232022031002', '199903232022031002', 2, 'Mohammad Gervais Pratama', 8, 18, NULL, ' ', ', A.Md.Kom.', 'L', 'Mojokerto', '1999-03-23', 'Kendaldoyong RT/RW 03/02 DS. Banjarejo Kec. Ngadiluwih Kab. Kediri - Jawa Timur', '085649103217', 'mgrvp@iainkediri.ac.id', 'B', 'islam', 'Belum Menikah', 'public/uploads/199903232022031002-1648774203249.jpg', NULL, 'aktif'),
(659, '474', '199101042022032001', '199101042022032001', 1, 'Nisa Fitriani, M.Si.', 10, 11, NULL, ' ', ', M.Si', 'P', 'Tulungagung', '1991-01-04', 'Dsn. Ngrawan RT/RW 01/07 Ds. Tunggangri Kec. Kalidawir Kab. Tulungagung - Jawa Timur', '081249843939', 'nisafitriani1991@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/199101042022032001-1656581449807.jpg', NULL, 'aktif'),
(660, '475', '197704032009011013', '197704032009011013', 1, 'Baitur Rohman, Dr. H., S.H., M.Hum.', 10, 15, NULL, ' Dr. H.', ', S.H., M.Hum.', 'L', 'Bali', '1977-04-03', 'Ngreco Kandat Kediri ', '082248395890', 'alghifary892@gmail.com /baitur@iainkediri.ac.id ', 'O', 'islam', 'Menikah', 'public/uploads/197704032009011013-1658705285916.jpg', NULL, 'aktif'),
(661, '476', '197911302000121002', '197911302000121002', 2, 'Juhanlutfi Yazid', 10, 6, NULL, ' ', ', S.E', 'L', 'Pati', '1979-11-30', 'Jalan Sri Gading No. 15 Dk. Sentono Rt 01 Rw 03 Ds. Pacekulon, Kec. Pace, Kab. Nganjuk', '081229925565', 'lutfiyazid@gmail.com', 'O', 'islam', 'Menikah', 'public/uploads/197911302000121002-1654497885367.jpg', NULL, 'aktif'),
(662, '477', '150062201', '150062201', 3, 'Muhammad Roni Bahtiyar', 0, 6, NULL, ' ', 'A. Md', 'L', 'Nganjuk', '1996-01-16', 'Nganjuk', '-', '-', 'A', 'islam', 'Belum Menikah', 'public/uploads/150062201-1672027092918.jpg', NULL, 'aktif'),
(663, '478', '197608082006041003', '197608082006041003', 1, 'HUSNUL YAQIN', 11, 15, NULL, 'Dr.', 'S.HI., M.H.', 'L', 'Lamongan', '1976-08-08', 'Permata Biru Kota Kediri', '08114885611', 'husnulyaqin@iainkediri.ac.id', 'O', 'islam', '', '95285d8503506fabaf0d102a7122dfa0.jpg', NULL, 'aktif'),
(664, '479', '197701302005011007', '197701302005011007', 1, 'H. AB. MUSYAFA\' FATHONI', 12, 0, NULL, 'Dr. ', 'M. Pd.I', 'L', 'Nganjuk', '1977-01-30', 'Ds. Babadan - Kec. Patian Rowo Kab. Nganjuk', '08113315965', 'musyafa77@gmail.com', 'O', 'islam', '', 'ce3fa47872274a9494f081c42b6da577.jpg', NULL, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `periode`
--

CREATE TABLE `periode` (
  `id_periode` int(11) NOT NULL,
  `tahun` int(11) NOT NULL,
  `siklus` int(11) NOT NULL,
  `nama_periode` varchar(225) NOT NULL,
  `file_sk` varchar(225) NOT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `periode`
--

INSERT INTO `periode` (`id_periode`, `tahun`, `siklus`, `nama_periode`, `file_sk`, `aktif`, `created_at`, `updated_at`) VALUES
(2, 2022, 1, 'AMI Siklus ke 1', '79637878eddc43516e02104c9426c7b3.pdf', 'N', '2023-07-26 08:38:34', '2023-07-26 08:38:34'),
(3, 2023, 2, 'AMI Siklus 2', 'f14fcdce11e3ad852073056b255c5384.pdf', 'Y', '2023-07-27 02:58:02', '2023-07-27 02:58:02');

-- --------------------------------------------------------

--
-- Table structure for table `proses_ami`
--

CREATE TABLE `proses_ami` (
  `id_proses_ami` int(11) NOT NULL,
  `id_ami` int(11) NOT NULL,
  `nama_proses` varchar(225) NOT NULL,
  `status` enum('N','Y') NOT NULL DEFAULT 'N',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proses_ami`
--

INSERT INTO `proses_ami` (`id_proses_ami`, `id_ami`, `nama_proses`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'mekanisme', 'N', '2023-07-26 13:16:54', '2023-07-26 13:16:54'),
(2, 1, 'audit', 'Y', '2023-07-26 13:16:54', '2023-09-03 02:28:09'),
(3, 1, 'kesimpulan', 'N', '2023-07-26 13:16:54', '2023-07-26 13:16:54'),
(4, 1, 'rtm', 'N', '2023-07-26 13:16:54', '2023-07-26 13:16:54'),
(5, 1, 'dokumentasi', 'N', '2023-07-26 13:16:54', '2023-07-26 13:16:54'),
(6, 2, 'mekanisme', 'N', '2023-07-27 03:15:56', '2023-07-27 03:15:56'),
(7, 2, 'audit', 'Y', '2023-07-27 03:15:56', '2023-07-26 22:28:30'),
(8, 2, 'kesimpulan', 'N', '2023-07-27 03:15:56', '2023-07-27 03:15:56'),
(9, 2, 'rtm', 'N', '2023-07-27 03:15:56', '2023-07-27 03:15:56'),
(10, 2, 'dokumentasi', 'N', '2023-07-27 03:15:56', '2023-07-27 03:15:56'),
(11, 3, 'mekanisme', 'N', '2023-08-21 15:26:26', '2023-08-21 15:26:26'),
(12, 3, 'audit', 'N', '2023-08-21 15:26:26', '2023-08-21 15:26:26'),
(13, 3, 'kesimpulan', 'N', '2023-08-21 15:26:26', '2023-08-21 15:26:26'),
(14, 3, 'rtm', 'N', '2023-08-21 15:26:26', '2023-08-21 15:26:26'),
(15, 3, 'dokumentasi', 'N', '2023-08-21 15:26:26', '2023-08-21 15:26:26'),
(16, 4, 'mekanisme', 'N', '2023-09-03 07:32:43', '2023-09-03 07:32:43'),
(17, 4, 'audit', 'Y', '2023-09-03 07:32:43', '2023-09-05 12:56:57'),
(18, 4, 'kesimpulan', 'N', '2023-09-03 07:32:43', '2023-09-03 07:32:43'),
(19, 4, 'rtm', 'Y', '2023-09-03 07:32:43', '2023-09-04 23:03:31'),
(20, 4, 'dokumentasi', 'N', '2023-09-03 07:32:43', '2023-09-03 07:32:43');

-- --------------------------------------------------------

--
-- Table structure for table `standart`
--

CREATE TABLE `standart` (
  `id_standart` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `nama_standart` varchar(225) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `standart`
--

INSERT INTO `standart` (`id_standart`, `id_periode`, `nama_standart`, `deskripsi`) VALUES
(1, 2, 'Pendidikan', ''),
(2, 3, 'Visi Misi', '');

-- --------------------------------------------------------

--
-- Table structure for table `struktur_organisasi`
--

CREATE TABLE `struktur_organisasi` (
  `id_struktur` int(11) NOT NULL,
  `img_struktur` varchar(225) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `jabatan` varchar(225) NOT NULL,
  `deskripsi` text NOT NULL,
  `fb` varchar(225) DEFAULT NULL,
  `ig` varchar(225) DEFAULT NULL,
  `linkedin` varchar(225) DEFAULT NULL,
  `twitter` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `struktur_organisasi`
--

INSERT INTO `struktur_organisasi` (`id_struktur`, `img_struktur`, `nama`, `jabatan`, `deskripsi`, `fb`, `ig`, `linkedin`, `twitter`) VALUES
(4, '9b5ca992836394dbada30eb77aca22fa.png', 'Molestiae non culpa', 'Quis tempora qui eli', 'Alias non ut odit et', 'Reprehenderit ipsam', 'Non molestias id fug', 'Sed ipsa et odit mo', 'Ullam et aut est ven');

-- --------------------------------------------------------

--
-- Table structure for table `sub_standart`
--

CREATE TABLE `sub_standart` (
  `id_substandart` int(11) NOT NULL,
  `kode_instrumen` varchar(50) DEFAULT NULL,
  `id_standart` int(11) NOT NULL,
  `deskripsi_substandart` varchar(225) NOT NULL,
  `isi_substandart` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_standart`
--

INSERT INTO `sub_standart` (`id_substandart`, `kode_instrumen`, `id_standart`, `deskripsi_substandart`, `isi_substandart`) VALUES
(1, '', 1, '1.1.b Strategi pencapaian sasaran dengan rentang waktu yang jelas dan didukung oleh dokumen.', '<p>1.1.b Strategi pencapaian sasaran dengan rentang waktu yang jelas dan didukung oleh dokumen.<br></p>'),
(2, '', 2, 'visi misi', '<p>&nbsp;visi dan misi<br></p>'),
(3, '', 2, 'sk visi misi', '<p>sk visi misi</p>'),
(4, 'acbv11', 2, 'asd21', '<p>dsdadada12</p>');

-- --------------------------------------------------------

--
-- Table structure for table `t_logs`
--

CREATE TABLE `t_logs` (
  `ID` int(11) NOT NULL,
  `user_id` varchar(225) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `info_modul` varchar(50) NOT NULL,
  `info_action` varchar(50) NOT NULL,
  `info_table` varchar(50) NOT NULL,
  `info_id` int(11) DEFAULT NULL,
  `info_data` text NOT NULL,
  `d_proses` date NOT NULL,
  `t_proses` time NOT NULL,
  `ip` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `t_logs`
--

INSERT INTO `t_logs` (`ID`, `user_id`, `user_name`, `info_modul`, `info_action`, `info_table`, `info_id`, `info_data`, `d_proses`, `t_proses`, `ip`) VALUES
(1, '0', NULL, 'login_admin', 'Login', 'sys_user', 150022003, 'Success', '2023-06-25', '07:28:09', '::1'),
(2, '0', NULL, 'login_admin', 'Login', 'sys_user', 150022003, 'Success', '2023-06-25', '07:28:50', '::1'),
(3, '0', '150022003', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-06-25', '07:29:42', '::1'),
(4, '0', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-06-25', '07:29:55', '::1'),
(5, '0', '150022003', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-06-25', '07:33:48', '::1'),
(6, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-25', '07:34:00', '::1'),
(7, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-25', '15:57:34', '::1'),
(8, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-25', '16:00:13', '::1'),
(9, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-25', '16:29:47', '::1'),
(10, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-26', '15:36:40', '::1'),
(11, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-27', '04:26:09', '::1'),
(12, '0', NULL, 'Periode', 'Delete', 'periode', 18, 'data : {\"id_periode\":\"18\"}', '2023-06-27', '04:51:46', '::1'),
(13, '0', NULL, 'Periode', 'Delete', 'periode', 24, 'data : {\"id_periode\":\"24\"}', '2023-06-27', '04:51:57', '::1'),
(14, '0', NULL, 'Periode', 'Delete', 'periode', 25, 'data : {\"id_periode\":\"25\"}', '2023-06-27', '05:02:46', '::1'),
(15, '0', NULL, 'Periode', 'Delete', 'periode', 26, 'data : {\"id_periode\":\"26\"}', '2023-06-27', '05:02:49', '::1'),
(16, '0', NULL, 'Periode', 'Insert', 'periode', 27, 'data : {\"nama_periode\":\"AMI Siklus ke 1\",\"tahun\":\"2023\",\"siklus\":\"1\",\"file_sk\":\"1849049878f0e54af58f1449a7bffda8.pdf\",\"aktif\":\"Y\"}', '2023-06-27', '06:16:15', '::1'),
(17, '0', NULL, 'Periode', 'Delete', 'periode', 27, 'data : {\"id_periode\":\"27\"}', '2023-06-27', '06:28:26', '::1'),
(18, '0', NULL, 'Periode', 'Insert', 'periode', 28, 'data : {\"nama_periode\":\"AMI Siklus ke 1\",\"tahun\":\"2023\",\"siklus\":\"1\",\"file_sk\":\"d4f74b5ac8ed6dedd75cd47078dbdcd5.pdf\",\"aktif\":\"Y\"}', '2023-06-27', '06:40:28', '::1'),
(19, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-27', '09:31:54', '::1'),
(20, '0', NULL, 'Periode', 'Insert', 'periode', 29, 'data : {\"nama_periode\":\"AMI Siklus ke 2\",\"tahun\":\"2023\",\"siklus\":\"2\",\"file_sk\":\"bd2a3d8f8e890ff117e09bb76fc6bd1c.pdf\",\"aktif\":\"N\"}', '2023-06-27', '09:48:54', '::1'),
(21, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-27', '10:39:23', '::1'),
(22, '0', NULL, 'Refi Ridho Septian', 'Logout', 'Logout', 0, 'Success', '2023-06-27', '10:39:25', '::1'),
(23, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-27', '10:39:48', '::1'),
(24, '0', NULL, 'Refi Ridho Septian', 'Logout', 'Logout', 0, 'Success', '2023-06-27', '10:39:50', '::1'),
(25, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-27', '10:39:59', '::1'),
(26, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-27', '13:49:56', '::1'),
(27, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-27', '14:10:47', '::1'),
(28, '0', NULL, 'Admin', 'Insert', 'admin', 2, 'data : {\"nip\":\"199903232022031002\"}', '2023-06-27', '14:18:46', '::1'),
(29, '0', NULL, 'Admin', 'Insert', 'admin', 3, 'data : {\"nip\":\"150022003\"}', '2023-06-27', '14:19:01', '::1'),
(30, '0', NULL, 'Admin', 'Delete', 'admin', 658, 'data : {\"id_admin\":\"658\"}', '2023-06-27', '14:20:18', '::1'),
(31, '0', NULL, 'Admin', 'Delete', 'admin', 2, 'data : {\"id_admin\":\"2\"}', '2023-06-27', '14:21:07', '::1'),
(32, '0', NULL, 'Refi Ridho Septian', 'Logout', 'Logout', 0, 'Success', '2023-06-27', '16:40:27', '::1'),
(33, '0', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-06-27', '16:40:42', '::1'),
(34, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-27', '16:42:03', '::1'),
(35, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-28', '03:34:02', '::1'),
(36, '0', NULL, 'Periode', 'Update', 'periode', 29, 'data : {\"nama_periode\":\"AMI Siklus ke 2\",\"tahun\":\"2023\",\"siklus\":\"2\",\"aktif\":\"Y\"}', '2023-06-28', '03:36:24', '::1'),
(37, '0', NULL, 'Refi Ridho Septian', 'Logout', 'Logout', 0, 'Success', '2023-06-28', '03:36:29', '::1'),
(38, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-28', '03:36:42', '::1'),
(39, '0', NULL, 'Unit', 'Insert', 'm_unit', 15, 'data : {\"nama_unit\":\"IT PROGRAMMER\",\"deskripsi\":\"s\"}', '2023-06-28', '03:48:38', '::1'),
(40, '0', NULL, 'Unit', 'Update', 'm_unit', 15, 'data : {\"nama_unit\":\"IT PROGRAMMER 2\",\"deskripsi\":\"s2\"}', '2023-06-28', '03:48:44', '::1'),
(41, '0', NULL, 'Unit', 'Delete', 'm_unit', 15, 'data : {\"id_unit\":\"15\"}', '2023-06-28', '03:48:48', '::1'),
(42, '0', NULL, 'Unit', 'Insert', 'm_subunit', 30, 'data : {\"nama_subunit\":\"xxxx\",\"deskripsi\":\"1241\",\"id_unit\":\"2\"}', '2023-06-28', '05:10:25', '::1'),
(43, '0', NULL, 'Unit', 'Update', 'm_subunit', 30, 'data : {\"nama_subunit\":\"xxxxcc\",\"deskripsi\":\"1241cc\"}', '2023-06-28', '05:11:27', '::1'),
(44, '0', NULL, 'Unit', 'Delete', 'm_subunit', 30, 'data : {\"id_subunit\":\"30\"}', '2023-06-28', '05:11:32', '::1'),
(45, '0', NULL, 'Unit', 'Insert', 'm_unit', 16, 'data : {\"nama_unit\":\"test\",\"deskripsi\":\"1\"}', '2023-06-28', '05:11:40', '::1'),
(46, '0', NULL, 'Unit', 'Insert', 'm_subunit', 31, 'data : {\"nama_subunit\":\"ttt\",\"deskripsi\":\"ttt\",\"id_unit\":\"16\"}', '2023-06-28', '05:12:41', '::1'),
(47, '0', NULL, 'Tahap', 'Insert', 'm_tahap', 6, 'data : {\"nama_tahap\":\"test\",\"deskripsi\":\"1123\"}', '2023-06-28', '05:25:20', '::1'),
(48, '0', NULL, 'Unit', 'Delete', 'm_unit', 16, 'data : {\"id_unit\":\"16\"}', '2023-06-28', '05:54:36', '::1'),
(49, '0', NULL, 'Unit', 'Insert', 'm_unit', 38, 'data : {\"nama_unit\":\"IT PROGRAMMER\",\"deskripsi\":\"s\"}', '2023-06-28', '06:13:08', '::1'),
(50, '0', NULL, 'Unit', 'Update', 'm_unit', 38, 'data : {\"nama_unit\":\"IT PROGRAMMER22\",\"deskripsi\":\"s2\"}', '2023-06-28', '06:13:12', '::1'),
(51, '0', NULL, 'Unit', 'Delete', 'm_unit', 38, 'data : {\"id_unit\":\"38\"}', '2023-06-28', '06:13:16', '::1'),
(52, '0', NULL, 'Kts', 'Insert', 'kts', 1, 'data : {\"nama_kts\":\"Mayor\",\"nilai_kts\":\"4\"}', '2023-06-28', '07:07:09', '::1'),
(53, '0', NULL, 'Kts', 'Insert', 'kts', 2, 'data : {\"nama_kts\":\"Minor\",\"nilai_kts\":\"2\"}', '2023-06-28', '07:07:16', '::1'),
(54, '0', NULL, 'Kts', 'Insert', 'kts', 3, 'data : {\"nama_kts\":\"Observasi\",\"nilai_kts\":\"3\"}', '2023-06-28', '07:07:30', '::1'),
(55, '0', NULL, 'Kts', 'Update', 'kts', 2, 'data : {\"nama_kts\":\"Minor\",\"nilai_kts\":\"2\"}', '2023-06-28', '07:07:37', '::1'),
(56, '0', NULL, 'Kts', 'Update', 'kts', 1, 'data : {\"nama_kts\":\"Mayor\",\"nilai_kts\":\"1\"}', '2023-06-28', '07:07:42', '::1'),
(57, '0', NULL, 'Standart', 'Insert', 'standart', 1, 'data : {\"nama_standart\":\"1.1 Standart Mutu\",\"deskripsi\":\"test\"}', '2023-06-28', '07:57:50', '::1'),
(58, '0', NULL, 'Standart', 'Insert', 'sub_standart', 1, 'data : {\"deskripsi_substandart\":\"sadasdsadasd\",\"isi_substandart\":\"asdasddfssdfsdf\",\"id_standart\":\"1\"}', '2023-06-28', '08:26:36', '::1'),
(59, '0', NULL, 'Standart', 'Insert', 'sub_standart', 2, 'data : {\"deskripsi_substandart\":\"dsadasda\",\"isi_substandart\":\"<p>sdfdsfsdfdsf<b>fdsfsdfds<\\/b><\\/p><p><b><u>fdsfsdfsdf<\\/u><\\/b><\\/p>\",\"id_standart\":\"1\"}', '2023-06-28', '08:27:14', '::1'),
(60, '0', NULL, 'Standart', 'Delete', 'sub_standart', 1, 'data : {\"id_substandart\":\"1\"}', '2023-06-28', '08:30:14', '::1'),
(61, '0', NULL, 'Standart', 'Delete', 'sub_standart', 2, 'data : {\"id_substandart\":\"2\"}', '2023-06-28', '08:30:19', '::1'),
(62, '0', NULL, 'Standart', 'Insert', 'sub_standart', 3, 'data : {\"deskripsi_substandart\":\"test\",\"isi_substandart\":\"<p><b>dafsdfsdfds<\\/b><\\/p>\",\"id_standart\":\"1\"}', '2023-06-28', '08:30:26', '::1'),
(63, '0', NULL, 'Standart', 'Update', 'sub_standart', 3, 'data : {\"deskripsi_substandart\":\"test3213\",\"isi_substandart\":\"<span id=\\\"isi_substandart\\\"><p><b>dafsdfsdfds 13212<\\/b><\\/p><\\/span>\"}', '2023-06-28', '08:32:44', '::1'),
(64, '0', NULL, 'Standart', 'Delete', 'sub_standart', 3, 'data : {\"id_substandart\":\"3\"}', '2023-06-28', '08:33:34', '::1'),
(65, '0', NULL, 'Standart', 'Delete', 'standart', 1, 'data : {\"id_standart\":\"1\"}', '2023-06-28', '08:33:40', '::1'),
(66, '0', NULL, 'Standart', 'Insert', 'standart', 2, 'data : {\"nama_standart\":\"1.1.a Kejelasan dan kerealistikan visi, misi, tujuan, dan sasaran Program Studi\",\"deskripsi\":\"\"}', '2023-06-28', '08:38:07', '::1'),
(67, '0', NULL, 'Standart', 'Insert', 'standart', 3, 'data : {\"nama_standart\":\"1.1.b Strategi pencapaian sasaran dengan rentang waktu yang jelas dan didukung oleh dokumen.\",\"deskripsi\":\"\"}', '2023-06-28', '09:24:37', '::1'),
(68, '0', NULL, 'Standart', 'Insert', 'sub_standart', 4, 'data : {\"deskripsi_substandart\":\"1.1.b Strategi pencapaian sasaran dengan rentang waktu yang jelas dan didukung oleh dokumen.\",\"isi_substandart\":\"<p>1.1.b Strategi pencapaian sasaran dengan\\r\\nrentang waktu yang jelas dan didukung oleh\\r\\ndokumen.<br><\\/p>\",\"id_standart\":\"3\"}', '2023-06-28', '09:26:29', '::1'),
(69, '0', NULL, 'Standart', 'Insert', 'sub_standart', 5, 'data : {\"deskripsi_substandart\":\"1.1.a Kejelasan dan kerealistikan visi, misi, tujuan, dan sasaran Program Studi\",\"isi_substandart\":\"<p>1.1.a Kejelasan dan kerealistikan visi, misi,\\r\\ntujuan, dan sasaran Program Studi\\r\\n<br><\\/p>\",\"id_standart\":\"3\"}', '2023-06-28', '09:26:38', '::1'),
(70, '0', NULL, 'Standart', 'Insert', 'sub_standart', 6, 'data : {\"deskripsi_substandart\":\"2.1 Tata pamong menjamin terwujudnya visi, terlaksanakannya misi, tercapainya tujuan, berhasilnya strategi yang digunakan secara kredibel, transparan, akuntabel, bertanggung jawab, dan adil.\",\"isi_substandart\":\"2.1 Tata pamong menjamin terwujudnya visi,\\r\\nterlaksanakannya misi, tercapainya tujuan,\\r\\nberhasilnya strategi yang digunakan secara\\r\\nkredibel, transparan, akuntabel, bertanggung\\r\\njawab, dan adil.&nbsp;<span id=\\\"isi_substandart\\\"><\\/span>\",\"id_standart\":\"3\"}', '2023-06-28', '09:34:41', '::1'),
(71, '0', NULL, 'Standart', 'Insert', 'sub_standart', 7, 'data : {\"deskripsi_substandart\":\"2.3 Sistem pengelolaan fungsional dan operasional program studi mencakup: planning, organizing, staffing, lead\",\"isi_substandart\":\"2.3 Sistem pengelolaan fungsional dan\\r\\noperasional program studi mencakup: planning, organizing, staffing, lead<span id=\\\"isi_substandart\\\"><\\/span>\",\"id_standart\":\"3\"}', '2023-06-28', '09:35:14', '::1'),
(72, '0', NULL, 'Standart', 'Insert', 'sub_standart', 8, 'data : {\"deskripsi_substandart\":\"2.4 Pelaksanaan penjaminan mutu di program studi Pelaksanaannya antara lain dengan adanya: kelompok dosen bidang ilmu yang menilai mutu soal ujian, silabus, dan tugas akhir, serta penguji luar (external examiner)\",\"isi_substandart\":\"2.4 Pelaksanaan penjaminan mutu di program\\r\\nstudi Pelaksanaannya antara lain dengan adanya: kelompok dosen bidang ilmu yang menilai\\r\\nmutu soal ujian, silabus, dan tugas akhir, serta\\r\\npenguji luar (external examiner)&nbsp;<span id=\\\"isi_substandart\\\"><\\/span>\",\"id_standart\":\"3\"}', '2023-06-28', '09:35:53', '::1'),
(73, '0', NULL, 'Standart', 'Insert', 'sub_standart', 9, 'data : {\"deskripsi_substandart\":\"ssss\",\"isi_substandart\":\"<p>2.5 Penjaringan umpan balik dan tindak lanjutnya.\\r\\nSumber umpan balik antara lain dari: (1) dosen,\\r\\n(2) mahasiswa, (3) alumni, (4) pengguna lulusan.\\r\\nUmpan balik digunakan untuk perbaikan kurikulum, pelaksanaan proses pembelajaran, dan\\r\\npeningkatan kegiatan program studi.&nbsp;<br><\\/p>\",\"id_standart\":\"3\"}', '2023-06-28', '09:45:56', '::1'),
(74, '0', NULL, 'Standart', 'Insert', 'standart', 4, 'data : {\"nama_standart\":\"test\",\"deskripsi\":\"\"}', '2023-06-28', '09:49:47', '::1'),
(75, '0', NULL, 'Standart', 'Update', 'standart', 4, 'data : {\"nama_standart\":\"test222\",\"deskripsi\":\"\"}', '2023-06-28', '09:49:52', '::1'),
(76, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-28', '10:17:15', '::1'),
(77, '0', NULL, 'Auditor', 'Insert', 'auditor', 1, 'data : {\"nip\":\"198306122008011009\",\"id_periode\":\"29\",\"level\":\"ketua\"}', '2023-06-28', '10:42:07', '::1'),
(78, '0', NULL, 'Auditor', 'Insert', 'auditor', 2, 'data : {\"nip\":\"197304122006041004\",\"id_periode\":\"29\",\"level\":\"ketua\"}', '2023-06-28', '10:48:53', '::1'),
(79, '0', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-06-28', '11:25:13', '::1'),
(80, '0', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-06-28', '11:25:52', '::1'),
(81, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-28', '11:26:15', '::1'),
(82, '0', NULL, 'Auditor', 'Delete', 'auditor', 1, 'data : {\"id_auditor\":\"1\"}', '2023-06-28', '11:26:20', '::1'),
(83, '0', NULL, 'Auditor', 'Insert', 'auditor', 3, 'data : {\"nip\":\"197304192000031002\",\"id_periode\":\"29\",\"level\":\"ketua\"}', '2023-06-28', '12:01:57', '::1'),
(84, '0', NULL, 'Auditor', 'Insert', 'auditor', 4, 'data : {\"nip\":\"198306122008011009\",\"id_periode\":\"28\",\"level\":\"ketua\"}', '2023-06-28', '12:02:20', '::1'),
(85, '0', NULL, 'Unit', 'Insert', 'unit', 1, 'data : {\"nip\":\"196907052009012003\",\"id_periode\":\"29\",\"id_unit\":\"3\"}', '2023-06-28', '12:04:02', '::1'),
(86, '0', NULL, 'Unit', 'Insert', 'unit', 2, 'data : {\"nip\":\"197304122006041004\",\"id_periode\":\"29\",\"id_unit\":\"2\"}', '2023-06-28', '12:04:40', '::1'),
(87, '0', NULL, 'Unit', 'Delete', 'unit', 2, 'data : {\"id_user_unit\":\"2\"}', '2023-06-28', '12:04:47', '::1'),
(88, '0', NULL, 'Auditor', 'Delete', 'auditor', 3, 'data : {\"id_auditor\":\"3\"}', '2023-06-28', '12:05:45', '::1'),
(89, '0', NULL, 'Auditor', 'Delete', 'auditor', 2, 'data : {\"id_auditor\":\"2\"}', '2023-06-28', '12:05:45', '::1'),
(90, '0', NULL, 'Auditor', 'Insert', 'auditor', 5, 'data : {\"nip\":\"198306122008011009\",\"id_periode\":\"29\",\"level\":\"ketua\"}', '2023-06-28', '12:05:50', '::1'),
(91, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-28', '16:36:20', '::1'),
(92, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-30', '03:52:27', '::1'),
(93, '0', NULL, 'Mekanisme', 'Insert', 'mekanisme', 1, 'data : {\"nama_mekanisme\":\"ssss\",\"id_periode\":\"29\"}', '2023-06-30', '05:28:39', '::1'),
(94, '0', NULL, 'Mekanisme', 'Insert', 'mekanisme', 2, 'data : {\"nama_mekanisme\":\"dsadsad\",\"id_periode\":\"29\"}', '2023-06-30', '05:29:36', '::1'),
(95, '0', NULL, 'Mekanisme', 'Insert', 'mekanisme', 3, 'data : {\"nama_mekanisme\":\"dfdf\",\"id_periode\":\"29\"}', '2023-06-30', '05:29:59', '::1'),
(96, '0', NULL, 'Auditor', 'Delete', 'auditor', 4, 'data : {\"id_auditor\":\"4\"}', '2023-06-30', '06:25:41', '::1'),
(97, '0', NULL, 'Auditor', 'Insert', 'auditor', 6, 'data : {\"nip\":\"196907052009012003\",\"id_periode\":\"29\",\"level\":\"anggota\"}', '2023-06-30', '08:50:42', '::1'),
(98, '0', NULL, 'Auditor', 'Insert', 'auditor', 7, 'data : {\"nip\":\"197610072009011005\",\"id_periode\":\"29\",\"level\":\"anggota\"}', '2023-06-30', '08:50:48', '::1'),
(99, '0', NULL, 'Auditor', 'Insert', 'auditor', 8, 'data : {\"nip\":\"197506202003121002\",\"id_periode\":\"29\",\"level\":\"ketua\"}', '2023-06-30', '08:57:00', '::1'),
(100, '0', NULL, 'Auditor', 'Insert', 'auditor', 9, 'data : {\"nip\":\"197304192000031002\",\"id_periode\":\"29\",\"level\":\"ketua\"}', '2023-06-30', '09:12:01', '::1'),
(101, '0', NULL, 'Auditor', 'Insert', 'auditor', 10, 'data : {\"nip\":\"196804072005011002\",\"id_periode\":\"29\",\"level\":\"anggota\"}', '2023-06-30', '09:12:09', '::1'),
(102, '0', NULL, 'Unit', 'Insert', 'unit', 3, 'data : {\"nip\":\"197307092006042001\",\"id_periode\":\"29\",\"id_unit\":\"3\"}', '2023-06-30', '09:13:41', '::1'),
(103, '0', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"2\",\"id_auditor\":[\"8\",\"6\",\"10\",\"7\"]}', '2023-06-30', '11:07:27', '::1'),
(104, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-30', '15:16:38', '::1'),
(105, '0', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-06-30', '15:23:31', '::1'),
(106, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-06-30', '15:24:01', '::1'),
(107, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-01', '00:29:20', '::1'),
(108, '0', NULL, 'Tahap', 'Delete', 'm_tahap', 1, 'data : {\"id_tahap\":\"1\"}', '2023-07-01', '01:02:59', '::1'),
(109, '0', NULL, 'Tahap', 'Delete', 'm_tahap', 1, 'data : {\"id_tahap\":\"1\"}', '2023-07-01', '01:03:26', '::1'),
(110, '0', NULL, 'Ami', 'Delete', 'ami', 1, 'data : {\"id_ami\":\"1\"}', '2023-07-01', '01:04:08', '::1'),
(111, '0', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"2\",\"id_auditor\":[\"5\",\"10\",\"7\"]}', '2023-07-01', '01:14:09', '::1'),
(112, '0', NULL, 'Ami', 'Delete', 'ami', 5, 'data : {\"id_ami\":\"5\"}', '2023-07-01', '01:16:47', '::1'),
(113, '0', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"3\",\"id_auditor\":[\"5\",\"10\"]}', '2023-07-01', '01:17:36', '::1'),
(114, '0', NULL, 'Ami', 'Delete', 'ami', 6, 'data : {\"id_ami\":\"6\"}', '2023-07-01', '01:17:40', '::1'),
(115, '0', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"2\",\"id_auditor\":[\"5\",\"10\",\"7\"]}', '2023-07-01', '01:18:21', '::1'),
(116, '0', NULL, 'Ami', 'Delete', 'ami', 7, 'data : {\"id_ami\":\"7\"}', '2023-07-01', '01:18:25', '::1'),
(117, '0', NULL, 'Mekanisme', 'Delete', 'mekanisme', 1, 'data : {\"id_mekanisme\":\"1\"}', '2023-07-01', '01:19:27', '::1'),
(118, '0', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"2\",\"id_auditor\":[\"5\",\"10\"]}', '2023-07-01', '01:19:37', '::1'),
(119, '0', NULL, 'Mekanisme', 'Delete', 'mekanisme', 2, 'data : {\"id_mekanisme\":\"2\"}', '2023-07-01', '01:19:44', '::1'),
(120, '0', NULL, 'Mekanisme', 'Insert', 'mekanisme', 4, 'data : {\"nama_mekanisme\":\"Apakah sudah di laksanakan\",\"id_periode\":\"29\"}', '2023-07-01', '01:21:52', '::1'),
(121, '0', NULL, 'Mekanisme', 'Delete', 'mekanisme', 3, 'data : {\"id_mekanisme\":\"3\"}', '2023-07-01', '01:21:56', '::1'),
(122, '0', NULL, 'Mekanisme', 'Update', 'mekanisme', 4, 'data : {\"nama_mekanisme\":\"Apakah sudah di laksanakan22\",\"id_periode\":\"29\"}', '2023-07-01', '01:51:18', '::1'),
(123, '0', NULL, 'Mekanisme', 'Update', 'mekanisme', 4, 'data : {\"nama_mekanisme\":\"Apakah sudah di laksanakan22\",\"id_periode\":\"28\"}', '2023-07-01', '01:51:24', '::1'),
(124, '0', NULL, 'Mekanisme', 'Update', 'mekanisme', 4, 'data : {\"nama_mekanisme\":\"Apakah sudah di laksanakan22\",\"id_periode\":\"29\"}', '2023-07-01', '02:03:33', '::1'),
(125, '0', NULL, 'Mekanisme', 'Delete', 'mekanisme', 4, 'data : {\"id_mekanisme\":\"4\"}', '2023-07-01', '02:03:42', '::1'),
(126, '0', NULL, 'Ami', 'Delete', 'ami', 8, 'data : {\"id_ami\":\"8\"}', '2023-07-01', '02:03:47', '::1'),
(127, '0', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"2\",\"id_auditor\":[\"5\",\"10\",\"7\"]}', '2023-07-01', '02:07:17', '::1'),
(128, '0', NULL, 'Ami', 'Delete', 'ami', 9, 'data : {\"id_ami\":\"9\"}', '2023-07-01', '02:07:35', '::1'),
(129, '0', NULL, 'Mekanisme', 'Insert', 'mekanisme', 5, 'data : {\"nama_mekanisme\":\"Apakah sudah dilaksanakan?\",\"id_periode\":\"29\"}', '2023-07-01', '02:07:49', '::1'),
(130, '0', NULL, 'Mekanisme', 'Insert', 'mekanisme', 6, 'data : {\"nama_mekanisme\":\"Apakah melibatkan mahasiswa?\",\"id_periode\":\"29\"}', '2023-07-01', '02:07:57', '::1'),
(131, '0', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"5\",\"id_auditor\":[\"5\",\"10\"]}', '2023-07-01', '02:08:08', '::1'),
(132, '0', NULL, 'Mekanisme', 'Update', 'mekanisme', 5, 'data : {\"nama_mekanisme\":\"Apakah sudah dilaksanakan? y\",\"id_periode\":\"29\"}', '2023-07-01', '03:28:37', '::1'),
(133, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-01', '06:14:54', '::1'),
(134, '0', NULL, 'Mekanisme', 'Insert', 'mekanisme', 2, 'data : null', '2023-07-01', '06:29:04', '::1'),
(135, '0', NULL, 'Mekanisme', 'Delete', 'mekanisme', 7, 'data : {\"id_mekanisme\":\"7\"}', '2023-07-01', '06:29:28', '::1'),
(136, '0', NULL, 'Mekanisme', 'Delete', 'mekanisme', 8, 'data : {\"id_mekanisme\":\"8\"}', '2023-07-01', '06:29:31', '::1'),
(137, '0', NULL, 'Mekanisme', 'Insert', 'mekanisme', 2, 'data : null', '2023-07-01', '06:30:19', '::1'),
(138, '0', NULL, 'Standart', 'Delete', 'standart', 4, 'data : {\"id_standart\":\"4\"}', '2023-07-01', '06:34:22', '::1'),
(139, '0', NULL, 'Standart', 'Delete', 'standart', 2, 'data : {\"id_standart\":\"2\"}', '2023-07-01', '06:34:29', '::1'),
(140, '0', NULL, 'Standart', 'Delete', 'standart', 3, 'data : {\"id_standart\":\"3\"}', '2023-07-01', '06:35:41', '::1'),
(141, '0', NULL, 'Standart', 'Insert', 'standart', 6, 'data : {\"nama_standart\":\"1.1 Standart Mutu\",\"deskripsi\":\"\",\"id_periode\":\"29\"}', '2023-07-01', '06:38:35', '::1'),
(142, '0', NULL, 'Standart', 'Update', 'standart', 6, 'data : {\"nama_standart\":\"1.1 Standart Mutu\",\"deskripsi\":\"\",\"id_periode\":\"28\"}', '2023-07-01', '06:39:05', '::1'),
(143, '0', NULL, 'Standart', 'Update', 'standart', 6, 'data : {\"nama_standart\":\"1.1 Standart Mutu\",\"deskripsi\":\"\",\"id_periode\":\"29\"}', '2023-07-01', '06:39:29', '::1'),
(144, '0', NULL, 'Standart', 'Update', 'standart', 6, 'data : {\"nama_standart\":\"1.1.a Kejelasan dan kerealistikan visi, misi, tujuan, dan sasaran Program Studi\",\"deskripsi\":\"\",\"id_periode\":\"29\"}', '2023-07-01', '06:48:07', '::1'),
(145, '0', NULL, 'Standart', 'Insert', 'sub_standart', 10, 'data : {\"deskripsi_substandart\":\"1.1.a Kejelasan dan kerealistikan visi, misi, tujuan, dan sasaran Program Studi\",\"isi_substandart\":\"<p>1.1.a Kejelasan dan kerealistikan visi, misi,\\r\\ntujuan, dan sasaran Program Studi&nbsp;<br><\\/p>\",\"id_standart\":\"6\"}', '2023-07-01', '06:48:43', '::1'),
(146, '0', NULL, 'Standart', 'Insert', 'sub_standart', 11, 'data : {\"deskripsi_substandart\":\"1.2 Sosialisasi yang efektif tercermin dari tingkat pemahaman pihak terkait.\",\"isi_substandart\":\"<p>1.2 Sosialisasi yang efektif tercermin dari\\r\\ntingkat pemahaman pihak terkait.&nbsp;<br><\\/p>\",\"id_standart\":\"6\"}', '2023-07-01', '06:48:53', '::1'),
(147, '0', NULL, 'Standart', 'Insert', 'standart', 7, 'data : {\"nama_standart\":\"2.1 Tata pamong menjamin terwujudnya visi, terlaksanakannya misi, tercapainya tujuan, berhasilnya strategi yang digunakan secara kredibel, transparan, akuntabel, bertanggung jawab, dan adil\",\"deskripsi\":\"\",\"id_periode\":\"29\"}', '2023-07-01', '06:49:04', '::1'),
(148, '0', NULL, 'Standart', 'Insert', 'sub_standart', 12, 'data : {\"deskripsi_substandart\":\"2.2 Karakteristik kepemimpinan yang efektif\",\"isi_substandart\":\"<p>2.2 Karakteristik kepemimpinan yang efektif<br><\\/p>\",\"id_standart\":\"7\"}', '2023-07-01', '06:49:17', '::1'),
(149, '0', NULL, 'Standart', 'Insert', 'sub_standart', 13, 'data : {\"deskripsi_substandart\":\"2.3 Sistem pengelolaan fungsional dan operasional program studi mencakup: planning, organizing, staffing, leading, controlling yang efektif dilaksanakan.\",\"isi_substandart\":\"<p>2.3 Sistem pengelolaan fungsional dan\\r\\noperasional program studi mencakup: planning, organizing, staffing, leading, controlling\\r\\nyang efektif dilaksanakan.&nbsp;<br><\\/p>\",\"id_standart\":\"7\"}', '2023-07-01', '06:49:25', '::1'),
(150, '0', NULL, 'Standart', 'Insert', 'sub_standart', 14, 'data : {\"deskripsi_substandart\":\"2.4 Pelaksanaan penjaminan mutu di program studi Pelaksanaannya antara lain dengan adanya: kelompok dosen bidang ilmu yang menilai mutu soal ujian, silabus, dan tugas akhir, serta penguji luar (external examiner)\",\"isi_substandart\":\"<p>2.4 Pelaksanaan penjaminan mutu di program\\r\\nstudi Pelaksanaannya antara lain dengan adanya: kelompok dosen bidang ilmu yang menilai\\r\\nmutu soal ujian, silabus, dan tugas akhir, serta\\r\\npenguji luar (external examiner)&nbsp;&nbsp;<br><\\/p>\",\"id_standart\":\"7\"}', '2023-07-01', '06:49:34', '::1'),
(151, '0', NULL, 'Standart', 'Insert', 'sub_standart', 15, 'data : {\"deskripsi_substandart\":\"2.5 Penjaringan umpan balik dan tindak lanjutnya\",\"isi_substandart\":\"<p>&nbsp;2.5 Penjaringan umpan balik dan tindak lanjutnya.\\r\\nSumber umpan balik antara lain dari: (1) dosen,\\r\\n(2) mahasiswa, (3) alumni, (4) pengguna lulusan.\\r\\nUmpan balik digunakan untuk perbaikan kurikulum, pelaksanaan proses pembelajaran, dan\\r\\npeningkatan kegiatan program studi.&nbsp;<br><\\/p>\",\"id_standart\":\"7\"}', '2023-07-01', '06:49:53', '::1'),
(152, '0', NULL, 'Standart', 'Insert', 'sub_standart', 16, 'data : {\"deskripsi_substandart\":\"2.6 Upaya-upaya yang telah dilakukan penyelenggara program studi\",\"isi_substandart\":\"<p>&nbsp;2.6 Upaya-upaya yang telah dilakukan penyelenggara program studi untuk menjamin keberlanjutan (sustainability) program studi ini antara\\r\\nlain mencakup:\\r\\n<\\/p><p>a. Upaya untuk peningkatan animo calon\\r\\nmahasiswa\\r\\n<\\/p><p>b. Upaya peningkatan mutu manajemen\\r\\n<\\/p><p>c. Upaya untuk peningkatan mutu lulusan\\r\\n<\\/p><p>d. Upaya untuk pelaksanaan dan hasil\\r\\nkerjasama kemitraan\\r\\ne. Upaya dan prestasi dalam<br><\\/p>\",\"id_standart\":\"7\"}', '2023-07-01', '06:50:39', '::1'),
(153, '0', NULL, 'Standart', 'Delete', 'standart', 6, 'data : {\"id_standart\":\"6\"}', '2023-07-01', '06:54:44', '::1'),
(154, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-01', '06:55:19', '::1'),
(155, '0', NULL, 'Standart', 'Insert', 'standart', 8, 'data : {\"nama_standart\":\"1.1.a Kejelasan dan kerealistikan visi, misi, tujuan, dan sasaran Program Studi\",\"deskripsi\":\"\",\"id_periode\":\"29\"}', '2023-07-01', '06:55:52', '::1'),
(156, '0', NULL, 'Standart', 'Insert', 'sub_standart', 17, 'data : {\"deskripsi_substandart\":\"1.1.b Strategi pencapaian sasaran dengan rentang waktu yang jelas dan didukung oleh dokumen.\",\"isi_substandart\":\"<p>1.1.b Strategi pencapaian sasaran dengan\\r\\nrentang waktu yang jelas dan didukung oleh\\r\\ndokumen.<br><\\/p>\",\"id_standart\":\"8\"}', '2023-07-01', '06:56:05', '::1'),
(157, '0', NULL, 'Standart', 'Insert', 'sub_standart', 18, 'data : {\"deskripsi_substandart\":\"1.2 Sosialisasi yang efektif tercermin dari tingkat pemahaman pihak terkait.\",\"isi_substandart\":\"<p>1.2 Sosialisasi yang efektif tercermin dari\\r\\ntingkat pemahaman pihak terkait.&nbsp;<br><\\/p>\",\"id_standart\":\"8\"}', '2023-07-01', '06:56:16', '::1'),
(158, '0', NULL, 'Standart', 'Insert', 'standart', 2, 'data : null', '2023-07-01', '07:14:35', '::1'),
(159, '0', NULL, 'Standart', 'Insert', 'standart', NULL, 'data : null', '2023-07-01', '07:46:44', '::1'),
(160, '0', NULL, 'Standart', 'Insert', 'standart', NULL, 'data : null', '2023-07-01', '07:47:16', '::1'),
(161, '0', NULL, 'Standart', 'Insert', 'standart', NULL, 'data : null', '2023-07-01', '07:50:40', '::1'),
(162, '0', NULL, 'Standart', 'Delete', 'standart', 19, 'data : {\"id_standart\":\"19\"}', '2023-07-01', '08:02:03', '::1'),
(163, '0', NULL, 'Standart', 'Delete', 'standart', 20, 'data : {\"id_standart\":\"20\"}', '2023-07-01', '08:02:06', '::1'),
(164, '0', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-02', '03:16:19', '::1'),
(165, '0', NULL, 'Ami', 'Insert', 'AMI', 2, 'data : [{\"id_ami\":\"10\",\"id_auditor\":\"9\"},{\"id_ami\":\"10\",\"id_auditor\":\"6\"}]', '2023-07-02', '04:36:59', '::1'),
(166, '0', NULL, 'Ami', 'Delete', 'auditor_ami', 25, 'data : {\"id_auditor_ami\":\"25\"}', '2023-07-02', '04:40:26', '::1'),
(167, '0', NULL, 'Ami', 'Delete', 'auditor_ami', 26, 'data : {\"id_auditor_ami\":\"26\"}', '2023-07-02', '04:40:30', '::1'),
(168, '0', NULL, 'Admin', 'Insert', 'admin', 4, 'data : {\"nip\":\"199903232022031002\"}', '2023-07-02', '08:34:36', '::1'),
(169, '0', NULL, 'Ami', 'Insert', 'audit', 3, 'data : {\"id_substandart\":\"12\",\"id_ami\":\"10\"}', '2023-07-02', '08:42:41', '::1'),
(170, '0', NULL, 'Ami', 'Insert', 'audit', 4, 'data : {\"id_substandart\":\"16\",\"id_ami\":\"10\"}', '2023-07-02', '08:42:44', '::1'),
(171, '0', NULL, 'Ami', 'Insert', 'audit', 5, 'data : {\"id_substandart\":\"18\",\"id_ami\":\"10\"}', '2023-07-02', '08:42:48', '::1'),
(172, '0', NULL, 'Ami', 'Insert', 'audit', 6, 'data : {\"id_substandart\":\"14\",\"id_ami\":\"10\"}', '2023-07-02', '08:42:50', '::1'),
(173, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 7, 'data : {\"id_substandart\":\"15\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '08:46:51', '::1'),
(174, '????-J?gi?c', NULL, 'Ami', 'Delete', 'audit', 1, 'data : {\"id_audit\":\"1\"}', '2023-07-02', '08:50:10', '::1'),
(175, '????-J?gi?c', NULL, 'Ami', 'Delete', 'audit', 5, 'data : {\"id_audit\":\"5\"}', '2023-07-02', '08:50:12', '::1'),
(176, '????-J?gi?c', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : [{\"id_ami\":\"10\",\"id_auditor\":\"6\"}]', '2023-07-02', '08:52:34', '::1'),
(177, '????-J?gi?c', NULL, 'Ami', 'Delete', 'auditor_ami', 24, 'data : {\"id_auditor_ami\":\"24\"}', '2023-07-02', '08:54:14', '127.0.0.1'),
(178, '????-J?gi?c', NULL, 'Ami', 'Delete', 'auditor_ami', 24, 'data : {\"id_auditor_ami\":\"24\"}', '2023-07-02', '08:54:14', '127.0.0.1'),
(179, '????-J?gi?c', NULL, 'Ami', 'Delete', 'auditor_ami', 27, 'data : {\"id_auditor_ami\":\"27\"}', '2023-07-02', '08:54:21', '::1'),
(180, '????-J?gi?c', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : [{\"id_ami\":\"10\",\"id_auditor\":\"6\"}]', '2023-07-02', '08:54:27', '::1'),
(181, '????-J?gi?c', NULL, 'Ami', 'Delete', 'audit', 4, 'data : {\"id_audit\":\"4\"}', '2023-07-02', '08:55:02', '::1'),
(182, '????-J?gi?c', NULL, 'Ami', 'Delete', 'audit', 7, 'data : {\"id_audit\":\"7\"}', '2023-07-02', '08:57:17', '::1'),
(183, '????-J?gi?c', NULL, 'Ami', 'Delete', 'audit', 6, 'data : {\"id_audit\":\"6\"}', '2023-07-02', '08:57:20', '::1'),
(184, '????-J?gi?c', NULL, 'Ami', 'Delete', 'audit', 3, 'data : {\"id_audit\":\"3\"}', '2023-07-02', '08:57:23', '::1'),
(185, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 8, 'data : {\"id_substandart\":\"17\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '09:00:44', '::1'),
(186, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 9, 'data : {\"id_substandart\":\"18\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '09:00:46', '::1'),
(187, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 10, 'data : {\"id_substandart\":\"12\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '09:00:50', '::1'),
(188, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 11, 'data : {\"id_substandart\":\"13\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '09:00:51', '::1'),
(189, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 12, 'data : {\"id_substandart\":\"14\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '09:00:53', '::1'),
(190, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 13, 'data : {\"id_substandart\":\"15\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '09:00:55', '::1'),
(191, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 14, 'data : {\"id_substandart\":\"16\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '09:00:57', '::1'),
(192, '????-J?gi?c', NULL, 'Ami', 'Delete', 'audit', 14, 'data : {\"id_audit\":\"14\"}', '2023-07-02', '09:02:07', '::1'),
(193, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 15, 'data : {\"id_substandart\":\"16\",\"id_ami\":\"10\",\"created_by\":\"Refi Ridho Septian\"}', '2023-07-02', '09:02:11', '::1'),
(194, '????-J?gi?c', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"28\",\"id_unit\":\"2\",\"id_auditor\":[\"5\",\"7\"]}', '2023-07-02', '09:06:48', '::1'),
(195, '????-J?gi?c', NULL, 'Mekanisme', 'Insert', 'mekanisme', 2, 'data : null', '2023-07-02', '09:06:53', '::1'),
(196, '????-J?gi?c', NULL, 'Ami', 'Insert', 'mekanisme', 4, 'data : null', '2023-07-02', '09:07:14', '::1'),
(197, '????-J?gi?c', NULL, 'Ami', 'Insert', 'mekanisme', 8, 'data : null', '2023-07-02', '09:09:33', '::1'),
(198, '????-J?gi?c', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"28\",\"id_unit\":\"5\",\"id_auditor\":[\"8\",\"7\"]}', '2023-07-02', '09:26:58', '::1'),
(199, '????-J?gi?c', NULL, 'Ami', 'Insert', 'audit', 7, 'data : null', '2023-07-02', '09:35:00', '::1'),
(200, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '05:03:42', '::1'),
(201, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-03', '06:35:07', '::1'),
(202, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '06:56:45', '::1'),
(203, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 11, 'data : {\"nip\":\"150041910\",\"id_periode\":\"29\",\"level\":\"ketua\"}', '2023-07-03', '06:56:58', '::1'),
(204, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 12, 'data : {\"nip\":\"150022003\",\"id_periode\":\"29\",\"level\":\"anggota\"}', '2023-07-03', '06:58:21', '::1'),
(205, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 23, 'data : {\"id_auditor_ami\":\"23\"}', '2023-07-03', '06:58:36', '::1'),
(206, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 28, 'data : {\"id_auditor_ami\":\"28\"}', '2023-07-03', '06:58:39', '::1'),
(207, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 2, 'data : [{\"id_ami\":\"10\",\"id_auditor\":\"11\"},{\"id_ami\":\"10\",\"id_auditor\":\"12\"}]', '2023-07-03', '06:58:52', '::1'),
(208, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"2\",\"id_auditor\":[\"11\",\"12\"]}', '2023-07-03', '06:59:52', '::1'),
(209, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"3\",\"id_auditor\":[\"11\",\"12\"]}', '2023-07-03', '07:00:03', '::1'),
(210, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-03', '07:00:07', '::1'),
(211, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:04:19', '::1'),
(212, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:08:10', '::1'),
(213, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:09:33', '::1'),
(214, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-03', '07:09:38', '::1'),
(215, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:09:48', '::1'),
(216, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-03', '07:16:23', '::1'),
(217, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:25:41', '::1'),
(218, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:26:17', '::1'),
(219, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-03', '07:26:26', '::1'),
(220, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:26:39', '::1'),
(221, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-03', '07:43:22', '::1'),
(222, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:43:34', '::1'),
(223, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-03', '07:50:00', '::1'),
(224, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '07:50:14', '::1'),
(225, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '08:05:23', '::1'),
(226, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '08:06:07', '::1'),
(227, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-03', '14:29:29', '::1'),
(228, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '03:25:21', '::1'),
(229, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '05:26:30', '::1'),
(230, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '06:16:59', '::1'),
(231, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '06:17:28', '::1'),
(232, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '06:19:10', '::1'),
(233, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"9\",\"id_auditor\":[\"11\",\"6\"]}', '2023-07-04', '06:19:49', '::1'),
(234, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"7\",\"id_auditor\":[\"11\",\"10\"]}', '2023-07-04', '06:21:12', '::1'),
(235, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '06:37:42', '::1'),
(236, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '11:28:40', '::1'),
(237, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '15:07:14', '::1'),
(238, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '15:19:54', '::1'),
(239, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '15:28:20', '::1'),
(240, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-04', '15:28:29', '::1'),
(241, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-04', '15:28:40', '::1'),
(242, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-04', '15:29:00', '::1'),
(243, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 91, 'data : {\"jawaban\":\"Y\",\"update_at\":\"2023-07-04 15:47:07\"}', '2023-07-04', '15:47:07', '::1'),
(244, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 92, 'data : {\"jawaban\":\"N\",\"update_at\":\"2023-07-04 15:47:14\"}', '2023-07-04', '15:47:14', '::1'),
(245, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 92, 'data : {\"jawaban\":\"Y\",\"update_at\":\"2023-07-04 15:49:14\"}', '2023-07-04', '15:49:14', '::1'),
(246, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 90, 'data : {\"jawaban\":\"N\",\"update_at\":\"2023-07-04 15:50:33\"}', '2023-07-04', '15:50:33', '::1'),
(247, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 92, 'data : {\"jawaban\":\"N\",\"update_at\":\"2023-07-04 15:50:44\"}', '2023-07-04', '15:50:44', '::1'),
(248, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 91, 'data : {\"jawaban\":\"N\",\"update_at\":\"2023-07-04 15:50:50\"}', '2023-07-04', '15:50:50', '::1'),
(249, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 92, 'data : {\"jawaban\":\"Y\",\"update_at\":\"2023-07-04 15:51:28\"}', '2023-07-04', '15:51:28', '::1'),
(250, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 90, 'data : {\"jawaban\":\"N\",\"update_at\":\"2023-07-04 15:51:56\"}', '2023-07-04', '15:51:56', '::1'),
(251, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 92, 'data : {\"jawaban\":\"N\",\"update_at\":\"2023-07-04 15:52:09\"}', '2023-07-04', '15:52:09', '::1'),
(252, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 92, 'data : {\"jawaban\":\"Y\",\"update_at\":\"2023-07-04 15:52:39\"}', '2023-07-04', '15:52:39', '::1'),
(253, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 93, 'data : {\"jawaban\":\"Y\",\"update_at\":\"2023-07-04 15:54:33\"}', '2023-07-04', '15:54:33', '::1'),
(254, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 72, 'data : {\"jawaban\":\"Y\",\"update_at\":\"2023-07-04 16:09:54\"}', '2023-07-04', '16:09:54', '::1'),
(255, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 0, 'data : {\"id_ami\":\"16\",\"keterangan\":\"telat\",\"status_kesimpulan\":\"N\"}', '2023-07-04', '18:13:50', '::1'),
(256, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 0, 'data : {\"id_ami\":\"15\",\"keterangan\":\"\",\"status_kesimpulan\":\"Y\"}', '2023-07-04', '18:14:58', '::1'),
(257, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 1, 'data : {\"status_kesimpulan\":\"Y\",\"keterangan\":\"telat123\",\"updated_at\":\"2023-07-04 18:17:14\"}', '2023-07-04', '18:17:14', '::1'),
(258, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 2, 'data : {\"status_kesimpulan\":\"N\",\"keterangan\":\"sae\",\"updated_at\":\"2023-07-04 18:17:25\"}', '2023-07-04', '18:17:25', '::1'),
(259, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 2, 'data : {\"status_kesimpulan\":\"Y\",\"keterangan\":\"sae\",\"updated_at\":\"2023-07-04 18:18:21\"}', '2023-07-04', '18:18:21', '::1'),
(260, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 0, 'data : {\"id_ami\":\"14\",\"keterangan\":\"tt\",\"status_kesimpulan\":\"N\"}', '2023-07-04', '18:18:28', '::1'),
(261, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', NULL, 'data : {\"rtm\":\"2023-07-05\",\"updated_at\":\"2023-07-04 18:38:20\"}', '2023-07-04', '18:38:20', '::1'),
(262, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 16, 'data : {\"rtm\":\"2023-07-07\",\"updated_at\":\"2023-07-04 18:38:49\"}', '2023-07-04', '18:38:49', '::1'),
(263, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 15, 'data : {\"rtm\":\"2023-07-20\",\"updated_at\":\"2023-07-04 18:39:20\"}', '2023-07-04', '18:39:20', '::1'),
(264, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 14, 'data : {\"rtm\":\"2023-09-15\",\"updated_at\":\"2023-07-04 18:39:36\"}', '2023-07-04', '18:39:36', '::1'),
(265, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 10, 'data : {\"rtm\":\"2023-07-25\",\"updated_at\":\"2023-07-04 18:39:46\"}', '2023-07-04', '18:39:46', '::1'),
(266, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '05:14:11', '::1'),
(267, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '08:12:39', '::1'),
(268, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '08:14:05', '::1'),
(269, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '08:38:57', '::1'),
(270, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-05', '08:39:45', '::1'),
(271, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '08:40:07', '::1'),
(272, '?P?\rA', NULL, 'Unit', 'Insert', 'unit', 4, 'data : {\"nip\":\"150041910\",\"id_periode\":\"29\",\"id_unit\":\"6\"}', '2023-07-05', '08:40:22', '::1'),
(273, '?P?\rA', NULL, 'Unit', 'Insert', 'unit', 5, 'data : {\"nip\":\"150041910\",\"id_periode\":\"29\",\"id_unit\":\"5\"}', '2023-07-05', '08:40:46', '::1'),
(274, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '08:41:10', '::1'),
(275, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"29\",\"id_unit\":\"6\",\"id_auditor\":[\"9\",\"10\"]}', '2023-07-05', '10:25:30', '::1'),
(276, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '12:33:54', '::1'),
(277, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '12:34:25', '::1'),
(278, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '13:03:28', '::1'),
(279, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '13:24:11', '::1'),
(280, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '13:30:48', '::1'),
(281, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '13:51:16', '::1'),
(282, '?P?\rA', NULL, 'Unit', 'Delete', 'unit', 5, 'data : {\"id_user_unit\":\"5\"}', '2023-07-05', '14:23:15', '::1'),
(283, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '14:24:07', '::1'),
(284, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '14:32:13', '::1'),
(285, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'dokumentasi', 2, 'data : {\"nama_dokumentasi\":\"aaaaa\",\"id_ami\":\"17\",\"file_dokumentasi\":\"150041910_6a61b98809430924363e68d9d2c935ed.png\",\"created_by\":\"150041910\"}', '2023-07-05', '15:07:54', '::1'),
(286, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'dokumentasi', 3, 'data : {\"nama_dokumentasi\":\"dsfsdf\",\"id_ami\":\"17\",\"file_dokumentasi\":\"f2a42a2e88f7d238582e04e9d4a8bb3d.png\",\"created_by\":\"150041910\"}', '2023-07-05', '15:10:32', '::1'),
(287, '?P?\rA', NULL, 'Pengawasan', 'Delete', 'pengawasan', 0, 'data : {\"id_dokumentasi\":\"undefined\"}', '2023-07-05', '15:19:40', '::1'),
(288, '?P?\rA', NULL, 'Pengawasan', 'Delete', 'pengawasan', 2, 'data : {\"id_dokumentasi\":\"2\"}', '2023-07-05', '15:20:29', '::1'),
(289, '?P?\rA', NULL, 'Pengawasan', 'Delete', 'pengawasan', 3, 'data : {\"id_dokumentasi\":\"3\"}', '2023-07-05', '15:20:35', '::1'),
(290, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'dokumentasi', 4, 'data : {\"nama_dokumentasi\":\"test\",\"id_ami\":\"17\",\"file_dokumentasi\":\"304946c174f9808ebbda05ce113b9d3a.png\",\"created_by\":\"150041910\"}', '2023-07-05', '15:20:47', '::1'),
(291, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'dokumentasi', 5, 'data : {\"nama_dokumentasi\":\"aaaaa\",\"id_ami\":\"17\",\"file_dokumentasi\":\"8a631ea4309ad484547e992c3fb6d395.png\",\"created_by\":\"150041910\"}', '2023-07-05', '15:26:19', '::1'),
(292, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 2, 'data : [{\"id_ami\":\"17\",\"id_auditor\":\"11\"},{\"id_ami\":\"17\",\"id_auditor\":\"12\"}]', '2023-07-05', '15:45:02', '::1'),
(293, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 43, 'data : {\"id_auditor_ami\":\"43\"}', '2023-07-05', '15:45:26', '127.0.0.1'),
(294, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 44, 'data : {\"id_auditor_ami\":\"44\"}', '2023-07-05', '15:45:32', '::1'),
(295, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 23, 'data : {\"id_substandart\":\"17\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '15:45:46', '::1'),
(296, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 24, 'data : {\"id_substandart\":\"18\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '15:45:47', '::1'),
(297, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 25, 'data : {\"id_substandart\":\"12\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '15:45:48', '::1'),
(298, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 26, 'data : {\"id_substandart\":\"13\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '15:45:48', '::1'),
(299, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 27, 'data : {\"id_substandart\":\"14\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '15:45:49', '::1'),
(300, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 28, 'data : {\"id_substandart\":\"15\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '15:45:50', '::1'),
(301, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 29, 'data : {\"id_substandart\":\"16\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '15:45:51', '::1'),
(302, '?P?\rA', NULL, 'Ami', 'Delete', 'audit', 29, 'data : {\"id_audit\":\"29\"}', '2023-07-05', '15:47:00', '::1'),
(303, '?P?\rA', NULL, 'Ami', 'Delete', 'audit', 28, 'data : {\"id_audit\":\"28\"}', '2023-07-05', '15:47:03', '::1'),
(304, '?P?\rA', NULL, 'Ami', 'Delete', 'audit', 27, 'data : {\"id_audit\":\"27\"}', '2023-07-05', '15:47:09', '::1'),
(305, '?P?\rA', NULL, 'Ami', 'Delete', 'audit', 26, 'data : {\"id_audit\":\"26\"}', '2023-07-05', '15:47:42', '::1'),
(306, '?P?\rA', NULL, 'Ami', 'Delete', 'audit', 25, 'data : {\"id_audit\":\"25\"}', '2023-07-05', '15:47:44', '::1'),
(307, '?P?\rA', NULL, 'Ami', 'Delete', 'audit', 24, 'data : {\"id_audit\":\"24\"}', '2023-07-05', '15:47:46', '::1'),
(308, '?P?\rA', NULL, 'Ami', 'Delete', 'audit', 23, 'data : {\"id_audit\":\"23\"}', '2023-07-05', '15:47:48', '::1'),
(309, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 30, 'data : {\"id_substandart\":\"17\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '15:47:54', '::1'),
(310, '?P?\rA', NULL, 'Ami', 'Delete', 'audit', 30, 'data : {\"id_audit\":\"30\"}', '2023-07-05', '15:47:59', '::1'),
(311, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-05', '15:48:39', '::1'),
(312, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-05', '15:48:52', '::1'),
(313, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-05', '15:49:16', '::1'),
(314, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '15:50:11', '::1'),
(315, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 108, 'data : {\"jawaban\":\"Y\",\"update_at\":\"2023-07-05 15:50:31\"}', '2023-07-05', '15:50:31', '::1'),
(316, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 17, 'data : {\"rtm\":\"2023-07-14\",\"updated_at\":\"2023-07-05 15:50:51\"}', '2023-07-05', '15:50:51', '::1'),
(317, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '15:53:24', '::1'),
(318, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-05', '17:09:50', '::1'),
(319, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-05', '17:10:45', '::1'),
(320, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 31, 'data : {\"id_substandart\":\"17\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '17:10:58', '::1'),
(321, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 32, 'data : {\"id_substandart\":\"18\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '17:10:59', '::1');
INSERT INTO `t_logs` (`ID`, `user_id`, `user_name`, `info_modul`, `info_action`, `info_table`, `info_id`, `info_data`, `d_proses`, `t_proses`, `ip`) VALUES
(322, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 33, 'data : {\"id_substandart\":\"12\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '17:11:00', '::1'),
(323, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 34, 'data : {\"id_substandart\":\"13\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '17:11:00', '::1'),
(324, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 35, 'data : {\"id_substandart\":\"14\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '17:11:01', '::1'),
(325, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 36, 'data : {\"id_substandart\":\"15\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '17:11:02', '::1'),
(326, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 37, 'data : {\"id_substandart\":\"16\",\"id_ami\":\"17\",\"created_by\":\"150041910\"}', '2023-07-05', '17:11:03', '::1'),
(327, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-06', '03:36:02', '::1'),
(328, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-06', '03:43:11', '::1'),
(329, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 1, 'data : {\"nama_audit\":\"aaa\",\"id_audit\":\"33\",\"file_audit\":\"6b6198a506faccda23142700c4e13e77.png\",\"created_by\":\"150041910\"}', '2023-07-06', '05:23:48', '::1'),
(330, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 2, 'data : {\"nama_audit\":\"gdfgsdgdsg asgsadg\",\"id_audit\":\"33\",\"file_audit\":\"a0643415ae3c858c6e8e6faed46253c5.png\",\"created_by\":\"150041910\"}', '2023-07-06', '05:24:49', '::1'),
(331, '?P?\rA', NULL, 'Pengawasan', 'Delete', 'pengawasan', 1, 'data : {\"id_file_audit\":\"1\"}', '2023-07-06', '05:27:24', '::1'),
(332, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-06', '18:40:53', '::1'),
(333, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-06', '19:46:31', '::1'),
(334, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '03:47:39', '::1'),
(335, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 33, 'data : {\"uraian_kts\":\"uraian kts\",\"uraian_perbaikan\":\"uraian perbaikan\",\"target_waktu\":\"1 semester\",\"kts\":null,\"nilai_kts\":null,\"updated_at\":\"2023-07-07 04:23:13\",\"updated_by\":\"150041910\"}', '2023-07-07', '04:23:13', '::1'),
(336, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 33, 'data : {\"uraian_kts\":\"uraian kts\",\"uraian_perbaikan\":\"uraian perbaikan\",\"target_waktu\":\"1 semester\",\"kts\":\"Minor\",\"nilai_kts\":\"2\",\"updated_at\":\"2023-07-07 04:23:38\",\"updated_by\":\"150041910\"}', '2023-07-07', '04:23:38', '::1'),
(337, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 33, 'data : {\"uraian_kts\":\"uraian kts\",\"uraian_perbaikan\":\"uraian perbaikan\",\"target_waktu\":\"1 semester\",\"kts\":\"Minor\",\"nilai_kts\":\"2\",\"updated_at\":\"2023-07-07 04:27:39\",\"updated_by\":\"150041910\"}', '2023-07-07', '04:27:39', '::1'),
(338, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 33, 'data : {\"uraian_kts\":\"uraian kts\",\"uraian_perbaikan\":\"uraian perbaikan\",\"target_waktu\":\"1 semester\",\"kts\":\"Minor\",\"nilai_kts\":\"2\",\"status\":\"selesai\",\"updated_at\":\"2023-07-07 04:28:20\",\"updated_by\":\"150041910\"}', '2023-07-07', '04:28:20', '::1'),
(339, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 34, 'data : {\"uraian_kts\":\"a\",\"uraian_perbaikan\":\"dsa\",\"target_waktu\":\"1 semester\",\"kts\":\"Observasi\",\"nilai_kts\":\"3\",\"status\":\"selesai\",\"updated_at\":\"2023-07-07 04:28:35\",\"updated_by\":\"150041910\"}', '2023-07-07', '04:28:35', '::1'),
(340, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 35, 'data : {\"uraian_kts\":\"fasdfsdaf\",\"uraian_perbaikan\":\"fdasfsdf\",\"target_waktu\":\"1 semester\",\"kts\":\"Mayor\",\"nilai_kts\":\"1\",\"status\":\"proses\",\"updated_at\":\"2023-07-07 04:31:08\",\"updated_by\":\"150041910\"}', '2023-07-07', '04:31:08', '::1'),
(341, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 36, 'data : {\"uraian_kts\":\"dfsfs\",\"uraian_perbaikan\":\"fdsfsd\",\"target_waktu\":\"fsdfdsf\",\"kts\":\"Minor\",\"nilai_kts\":\"2\",\"status\":\"selesai\",\"updated_at\":\"2023-07-07 04:31:52\",\"updated_by\":\"150041910\"}', '2023-07-07', '04:31:52', '::1'),
(342, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 0, 'data : {\"id_ami\":\"17\",\"keterangan\":\"\",\"status_kesimpulan\":\"Y\"}', '2023-07-07', '04:40:15', '::1'),
(343, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '08:22:07', '::1'),
(344, '?P?\rA', NULL, 'Pengawasan', 'Update', 'ami', NULL, 'data : {\"status_akhir\":\"selesai\",\"updated_at\":\"2023-07-07 08:46:48\",\"updated_by\":\"150041910\"}', '2023-07-07', '08:46:49', '::1'),
(345, '?P?\rA', NULL, 'Pengawasan', 'Update', 'ami', 16, 'data : {\"status_akhir\":\"selesai\",\"updated_at\":\"2023-07-07 08:47:33\",\"updated_by\":\"150041910\"}', '2023-07-07', '08:47:33', '::1'),
(346, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 2, 'data : {\"status_kesimpulan\":\"Y\",\"keterangan\":\"sae4234234\",\"updated_at\":\"2023-07-07 09:20:21\"}', '2023-07-07', '09:20:21', '::1'),
(347, '?P?\rA', NULL, 'Pengawasan', 'Update', 'kesimpulan', 2, 'data : {\"status_kesimpulan\":\"N\",\"keterangan\":\"sae4234234\",\"updated_at\":\"2023-07-07 09:20:27\"}', '2023-07-07', '09:20:27', '::1'),
(348, '?P?\rA', NULL, 'Pengawasan', 'Update', 'ami', 15, 'data : {\"status_akhir\":\"selesai\",\"updated_at\":\"2023-07-07 09:20:35\",\"updated_by\":\"150041910\"}', '2023-07-07', '09:20:35', '::1'),
(349, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-07', '09:27:56', '::1'),
(350, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '09:28:08', '::1'),
(351, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '13:11:25', '::1'),
(352, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '13:26:06', '::1'),
(353, '?P?\rA', NULL, 'Format', 'Update', 'format_dokumen', 1, 'data : {\"tujuan\":\"<ol><li>Untuk mengaudit data Lembaga<\\/li><li>Untuk mengaudit data Lembaga<\\/li><li>Untuk mengaudit data Lembaga<\\/li><li>Untuk mengaudit data Lembaga<\\/li><\\/ol>\",\"lingkup\":\"<ol><li>Standart Pendidikan<\\/li><li>Standar<\\/li><\\/ol>\",\"manfaat\":\"<p>Sebagai Sarana penyempuranaan laporan AUDIT AMI<\\/p>\",\"updated_at\":\"2023-07-07 13:30:01\"}', '2023-07-07', '13:30:01', '::1'),
(354, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-07', '15:22:10', '::1'),
(355, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-07', '15:22:18', '::1'),
(356, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '15:22:37', '::1'),
(357, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-07', '16:58:31', '::1'),
(358, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-07', '16:59:02', '::1'),
(359, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '16:59:14', '::1'),
(360, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '17:00:37', '::1'),
(361, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '17:01:39', '::1'),
(362, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-07', '17:08:40', '::1'),
(363, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-08', '05:10:46', '::1'),
(364, '?P?\rA', NULL, 'Kategori', 'Insert', 'm_kategori', 17, 'data : {\"nama_kategori\":\"xxx\",\"desc_kategori\":\"sss\"}', '2023-07-08', '05:47:16', '::1'),
(365, '?P?\rA', NULL, 'Kategori', 'Update', 'm_kategori', 17, 'data : {\"nama_kategori\":\"xxx13\",\"desc_kategori\":\"sss123\"}', '2023-07-08', '05:47:23', '::1'),
(366, '?P?\rA', NULL, 'Kategori', 'Delete', 'm_kategori', 17, 'data : {\"id_kategori\":\"17\"}', '2023-07-08', '05:47:27', '::1'),
(367, '?P?\rA', NULL, 'Visi', 'Update', 'visi_misi', 1, 'data : {\"visi\":\"<p>visi iain kediri&nbsp; &nbsp; wwww<\\/p>\",\"misi\":\"misi iain kediriwwww\"}', '2023-07-08', '05:47:36', '::1'),
(368, '?P?\rA', NULL, 'Gallery', 'Update', 'web_gallery', 2, 'data : {\"title_gallery\":\"In voluptate perfere123\",\"subtitle_gallery\":\"Ducimus quibusdam e312\",\"img_gallery\":\"dbc9e6c071e92a1f2a766489d9b931c1.png\"}', '2023-07-08', '05:47:49', '::1'),
(369, '?P?\rA', NULL, 'Gallery', 'Delete', 'web_gallery', 1, 'data : {\"id_gallery\":\"1\"}', '2023-07-08', '05:47:56', '::1'),
(370, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-08', '06:20:20', '::1'),
(371, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-08', '08:05:19', '::1'),
(372, '?P?\rA', NULL, 'Hero', 'Insert', 'web_hero', 3, 'data : {\"title\":\"life easier for our customers.\",\"desc_hero\":\"make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged\",\"img_hero\":\"87bc61e652823e2467d7d1e113671a00.jpg\",\"show\":\"N\"}', '2023-07-08', '08:07:31', '::1'),
(373, '?P?\rA', NULL, 'Hero', 'Update', 'web_hero', 3, 'data : {\"title\":\"life easier for our customers.\",\"desc_hero\":\"make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged\",\"show\":\"Y\",\"updated_at\":\"2023-07-08 08:08:52\"}', '2023-07-08', '08:08:52', '::1'),
(374, '?P?\rA', NULL, 'Service', 'Update', 'web_service', 1, 'data : {\"title\":\"WHAT WE DO?\",\"subtitle\":\"The service we offer is specifically designed to meet your needs.\",\"service1_icon\":\"<i class=\\\"flaticon flaticon-customer-support\\\"><\\/i>\",\"service1_title\":\"Technical Services\",\"service1_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service2_icon\":\"<i class=\\\"flaticon flaticon-solar-panel\\\"><\\/i>\",\"service2_title\":\"Energy Panels\",\"service2_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service3_icon\":\"<i class=\\\"flaticon flaticon-wind-energy\\\"><\\/i>\",\"service3_title\":\"Wind Generators\",\"service3_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service4_icon\":\"<i class=\\\"flaticon flaticon-eco-home\\\"><\\/i>\",\"service4_title\":\"Solar As A Service\",\"service4_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service5_icon\":\"<i class=\\\"flaticon flaticon-charging-station\\\"><\\/i>\",\"service5_title\":\"Solar PV Systems\",\"service5_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service6_icon\":\"<i class=\\\"flaticon flaticon-clipboard\\\"><\\/i>\",\"service6_title\":\"Inspection Checklist\",\"service6_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\"}', '2023-07-08', '09:24:08', '::1'),
(375, '?P?\rA', NULL, 'Profile', 'Update', 'web_profile', 1, 'data : {\"title\":\"What\\u2019s Our Resources Story\",\"content\":\"<p>Praesent fringilla lorem tincidunt, commodo erat sit amet, eleifend neque. Etiam nec vestibulum turpis, quis tempus elit. Sed tempus elit porttitor odio gravida, sed maximus turpis mattis. Vivamus at urna ut libero ornare congue.<\\/p>\\r\\n\"}', '2023-07-08', '09:45:08', '::1'),
(376, '?P?\rA', NULL, 'Gallery', 'Insert', 'web_gallery', 4, 'data : {\"title_gallery\":\"sss\",\"subtitle_gallery\":\"asdfsaf\",\"img_gallery\":\"9d6f196862affde2c480dc5e8ea793bf.jpg\",\"id_unit\":0,\"id_user\":0}', '2023-07-08', '09:52:58', '::1'),
(377, '?P?\rA', NULL, 'Gallery', 'Insert', 'web_gallery', 5, 'data : {\"title_gallery\":\"fgdg\",\"subtitle_gallery\":\"Ducimus quibusdam e312\",\"img_gallery\":\"38e2a197f0bd94f3f445d94f6445d3a6.png\",\"id_unit\":0,\"id_user\":0}', '2023-07-08', '09:53:28', '::1'),
(378, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-08', '13:49:56', '::1'),
(379, '?P?\rA', NULL, 'News', 'Insert', 'news', 1, 'data : {\"title\":\"Cras et dictum nisl nulla vitae auctor diam\",\"konten\":\"<p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.&nbsp;Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.&nbsp;Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.&nbsp;Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra<\\/p>\",\"id_kategori\":\"2\",\"img\":\"6c5f741b2230158bd737378220cd4d60.jpg\",\"tampil\":\"Y\",\"tanggal\":\"2023-07-08\",\"id_unit\":null,\"id_user\":null,\"slug\":\"cras-et-dictum-nisl-nulla-vitae-auctor-diam\"}', '2023-07-08', '13:50:39', '::1'),
(380, '?P?\rA', NULL, 'News', 'Insert', 'news', 2, 'data : {\"title\":\"Cras et dictum nisl nulla vitae auctor diam\",\"konten\":\"<p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.<\\/p>\",\"id_kategori\":\"3\",\"img\":\"bb9090b543ba015dc89ca921723e0009.png\",\"tampil\":\"Y\",\"tanggal\":\"2023-07-08\",\"id_unit\":null,\"id_user\":null,\"slug\":\"cras-et-dictum-nisl-nulla-vitae-auctor-diam\"}', '2023-07-08', '13:52:52', '::1'),
(381, '?P?\rA', NULL, 'News', 'Insert', 'news', 3, 'data : {\"title\":\"Cras et dictum nisl nulla vitae auctor diam\",\"konten\":\"<p>Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.Suspendisse vulputate nibh eget eros darde rhoncus, id scelerisque libero reade aluam. Integer ullamcorper, ex ac ultrices pharetra.<\\/p>\",\"id_kategori\":\"1\",\"img\":\"8aac871be4cd7e3c69ffcb894d23aff7.png\",\"tampil\":\"Y\",\"tanggal\":\"2023-07-08\",\"id_unit\":null,\"id_user\":null,\"slug\":\"cras-et-dictum-nisl-nulla-vitae-auctor-diam\"}', '2023-07-08', '13:53:16', '::1'),
(382, '?P?\rA', NULL, 'News', 'Insert', 'news', 4, 'data : {\"title\":\"What is Lorem Ipsum?\",\"konten\":\"<p><strong>Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\",\"id_kategori\":\"1\",\"img\":\"4b1368d96f038a0ea986767747e635d3.png\",\"tampil\":\"Y\",\"tanggal\":\"2023-07-08\",\"id_unit\":null,\"id_user\":null,\"slug\":\"what-is-lorem-ipsum\"}', '2023-07-08', '13:53:54', '::1'),
(383, '?P?\rA', NULL, 'News', 'Insert', 'news', 5, 'data : {\"title\":\"Why do we use it?\",\"konten\":\"<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using &#39;Content here, content here&#39;, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for &#39;lorem ipsum&#39; will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/p>\",\"id_kategori\":\"1\",\"img\":\"5c32d1b0522234e709fc54b6f1a43cdd.png\",\"tampil\":\"Y\",\"tanggal\":\"2023-07-08\",\"id_unit\":null,\"id_user\":null,\"slug\":\"why-do-we-use-it\"}', '2023-07-08', '13:54:14', '::1'),
(384, '?P?\rA', NULL, 'News', 'Insert', 'news', 6, 'data : {\"title\":\"Where does it come from?\",\"konten\":\"<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.<\\/p>\\r\\n\\r\\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from &quot;de Finibus Bonorum et Malorum&quot; by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham<\\/p>\",\"id_kategori\":\"1\",\"img\":\"1fbf24ef88651ce3185eb221fac48105.jpg\",\"tampil\":\"Y\",\"tanggal\":\"2023-07-08\",\"id_unit\":null,\"id_user\":null,\"slug\":\"where-does-it-come-from\"}', '2023-07-08', '13:54:41', '::1'),
(385, '?P?\rA', NULL, 'News', 'Insert', 'news', 7, 'data : {\"title\":\"Where can I get some?\",\"konten\":\"<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don&#39;t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn&#39;t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.<\\/p>\",\"id_kategori\":\"1\",\"img\":\"3fa6df60df12f385e355f38845b94a94.png\",\"tampil\":\"Y\",\"tanggal\":\"2023-07-08\",\"id_unit\":null,\"id_user\":null,\"slug\":\"where-can-i-get-some\"}', '2023-07-08', '13:55:12', '::1'),
(386, '?P?\rA', NULL, 'Visi', 'Update', 'visi_misi', 1, 'data : {\"visi\":\"<p><strong style=\\\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\\\">Lorem Ipsum<\\/strong><span style=\\\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\\\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/span><br><\\/p>\",\"misi\":\"<span style=\\\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\\\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<\\/span>\"}', '2023-07-08', '14:00:48', '::1'),
(387, '?P?\rA', NULL, 'FAQ', 'Insert', 'faq', 3, 'data : {\"question\":\"Breaking The Rules Using SQLite To Demo Web?\",\"answer\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\"}', '2023-07-08', '14:50:12', '::1'),
(388, '?P?\rA', NULL, 'FAQ', 'Delete', 'faq', 2, 'data : {\"id_faq\":\"2\"}', '2023-07-08', '14:50:15', '::1'),
(389, '?P?\rA', NULL, 'FAQ', 'Insert', 'faq', 4, 'data : {\"question\":\"Monthly Web Development Update Pragmatic Releasing?\",\"answer\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\"}', '2023-07-08', '14:50:38', '::1'),
(390, '?P?\rA', NULL, 'FAQ', 'Insert', 'faq', 5, 'data : {\"question\":\"How To Use Underlined Text To Improve User Experience\",\"answer\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\"}', '2023-07-08', '14:51:02', '::1'),
(391, '?P?\rA', NULL, 'FAQ', 'Insert', 'faq', 6, 'data : {\"question\":\"Understanding CSS Layout And The Block Formatting\",\"answer\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip\"}', '2023-07-08', '14:51:21', '::1'),
(392, '?P?\rA', NULL, 'Hero', 'Update', 'web_hero', 1, 'data : {\"title\":\"We bring solutions to make life easier for our customers.\",\"desc_hero\":\"We have considered our solutions to support every stage of your growth.\",\"show\":\"Y\",\"updated_at\":\"2023-07-08 17:46:10\"}', '2023-07-08', '17:46:10', '::1'),
(393, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-09', '07:10:22', '::1'),
(394, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-09', '08:14:36', '::1'),
(395, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-09', '08:15:13', '::1'),
(396, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 37, 'data : {\"uraian_kts\":\"a\",\"uraian_perbaikan\":\"a\",\"target_waktu\":\"1smt\",\"kts\":\"Observasi\",\"nilai_kts\":\"3\",\"status\":\"proses\",\"updated_at\":\"2023-07-09 08:16:50\",\"updated_by\":\"150041910\"}', '2023-07-09', '08:16:50', '::1'),
(397, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 31, 'data : {\"uraian_kts\":\"a\",\"uraian_perbaikan\":\"a\",\"target_waktu\":\"a\",\"kts\":\"Observasi\",\"nilai_kts\":\"3\",\"status\":\"proses\",\"updated_at\":\"2023-07-09 08:17:00\",\"updated_by\":\"150041910\"}', '2023-07-09', '08:17:00', '::1'),
(398, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 32, 'data : {\"uraian_kts\":\"a\",\"uraian_perbaikan\":\"a\",\"target_waktu\":\"a\",\"kts\":\"Mayor\",\"nilai_kts\":\"1\",\"status\":\"proses\",\"updated_at\":\"2023-07-09 08:17:14\",\"updated_by\":\"150041910\"}', '2023-07-09', '08:17:14', '::1'),
(399, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-09', '09:51:22', '::1'),
(400, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-11', '17:14:41', '::1'),
(401, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-11', '17:15:21', '::1'),
(402, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-11', '18:10:48', '::1'),
(403, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-11', '18:12:02', '::1'),
(404, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-11', '18:12:34', '::1'),
(405, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-11', '18:12:46', '::1'),
(406, '?P?\rA', NULL, 'Mekanisme', 'Update', 'mekanisme', 5, 'data : {\"nama_mekanisme\":\"Apakah sudah dilaksanakan?\",\"id_periode\":\"29\"}', '2023-07-11', '18:13:00', '::1'),
(407, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-11', '18:15:02', '::1'),
(408, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-11', '18:15:13', '::1'),
(409, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-11', '18:16:50', '::1'),
(410, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-11', '18:17:06', '::1'),
(411, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-11', '18:17:41', '::1'),
(412, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-14', '14:47:24', '::1'),
(413, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-14', '14:48:01', '::1'),
(414, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-14', '14:59:02', '::1'),
(415, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-14', '14:59:16', '::1'),
(416, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-22', '15:25:59', '::1'),
(417, '?P?\rA', NULL, 'Hero', 'Insert', 'web_hero', 4, 'data : {\"title\":\"test\",\"desc_hero\":\"test tosy\",\"img_hero\":\"6e7a2892770babdfe76ee4aa17a99ffb.png\",\"show\":\"Y\"}', '2023-07-22', '15:26:27', '::1'),
(418, '?P?\rA', NULL, 'Service', 'Update', 'web_service', 1, 'data : {\"title\":\"WHAT WE DO? test\",\"subtitle\":\"The service we offer is specifically designed to meet your needs.\",\"service1_icon\":\"<i class=\\\"flaticon flaticon-customer-support\\\"><\\/i>\",\"service1_title\":\"Technical Services\",\"service1_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service2_icon\":\"<i class=\\\"flaticon flaticon-solar-panel\\\"><\\/i>\",\"service2_title\":\"Energy Panels\",\"service2_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service3_icon\":\"<i class=\\\"flaticon flaticon-wind-energy\\\"><\\/i>\",\"service3_title\":\"Wind Generators\",\"service3_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service4_icon\":\"<i class=\\\"flaticon flaticon-eco-home\\\"><\\/i>\",\"service4_title\":\"Solar As A Service\",\"service4_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service5_icon\":\"<i class=\\\"flaticon flaticon-charging-station\\\"><\\/i>\",\"service5_title\":\"Solar PV Systems\",\"service5_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\",\"service6_icon\":\"<i class=\\\"flaticon flaticon-clipboard\\\"><\\/i>\",\"service6_title\":\"Inspection Checklist\",\"service6_desc\":\"Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.\"}', '2023-07-22', '15:27:26', '::1'),
(419, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-22', '15:32:02', '::1'),
(420, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-22', '15:32:26', '::1'),
(421, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-22', '15:32:38', '::1'),
(422, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-25', '15:16:02', '::1'),
(423, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-25', '23:34:52', '::1'),
(424, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-07-26', '09:42:17', '::1'),
(425, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '09:44:13', '::1'),
(426, '?P?\rA', NULL, 'Hero', 'Delete', 'web_hero', 4, 'data : {\"id_hero\":\"4\"}', '2023-07-26', '09:44:22', '::1'),
(427, '?P?\rA', NULL, 'Admin', 'Delete', 'admin', 4, 'data : {\"id_admin\":\"4\"}', '2023-07-26', '10:00:40', '::1'),
(428, '?P?\rA', NULL, 'Admin', 'Delete', 'admin', 3, 'data : {\"id_admin\":\"3\"}', '2023-07-26', '10:00:45', '::1'),
(429, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 12, 'data : {\"id_auditor\":\"12\"}', '2023-07-26', '10:00:50', '::1'),
(430, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 11, 'data : {\"id_auditor\":\"11\"}', '2023-07-26', '10:00:54', '::1'),
(431, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 10, 'data : {\"id_auditor\":\"10\"}', '2023-07-26', '10:00:57', '::1'),
(432, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 9, 'data : {\"id_auditor\":\"9\"}', '2023-07-26', '10:01:00', '::1'),
(433, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 8, 'data : {\"id_auditor\":\"8\"}', '2023-07-26', '10:01:04', '::1'),
(434, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 7, 'data : {\"id_auditor\":\"7\"}', '2023-07-26', '10:01:08', '::1'),
(435, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 6, 'data : {\"id_auditor\":\"6\"}', '2023-07-26', '10:01:45', '::1'),
(436, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 5, 'data : {\"id_auditor\":\"5\"}', '2023-07-26', '10:01:48', '::1'),
(437, '?P?\rA', NULL, 'Unit', 'Delete', 'unit', 1, 'data : {\"id_user_unit\":\"1\"}', '2023-07-26', '10:02:17', '::1'),
(438, '?P?\rA', NULL, 'Unit', 'Delete', 'unit', 3, 'data : {\"id_user_unit\":\"3\"}', '2023-07-26', '10:02:19', '::1'),
(439, '?P?\rA', NULL, 'Unit', 'Delete', 'unit', 4, 'data : {\"id_user_unit\":\"4\"}', '2023-07-26', '10:02:22', '::1'),
(440, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-26', '10:14:40', '::1'),
(441, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '10:19:37', '::1'),
(442, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '10:20:41', '::1'),
(443, '?P?\rA', NULL, 'Periode', 'Insert', 'periode', 1, 'data : {\"nama_periode\":\"AMI Siklus ke 1\",\"tahun\":\"2022\",\"siklus\":\"1\",\"file_sk\":\"11fdc6b5884eb2347dfc1298616aaccb.pdf\",\"aktif\":\"Y\"}', '2023-07-26', '10:33:02', '::1'),
(444, '?P?\rA', NULL, 'Mekanisme', 'Insert', 'mekanisme', 1, 'data : {\"nama_mekanisme\":\"Pertemuan Dengan Mahasiswa?\",\"id_periode\":\"1\"}', '2023-07-26', '10:34:28', '::1'),
(445, '?P?\rA', NULL, 'Periode', 'Delete', 'periode', 1, 'data : {\"id_periode\":\"1\"}', '2023-07-26', '10:38:13', '::1'),
(446, '?P?\rA', NULL, 'Periode', 'Insert', 'periode', 2, 'data : {\"nama_periode\":\"AMI Siklus ke 1\",\"tahun\":\"2022\",\"siklus\":\"1\",\"file_sk\":\"79637878eddc43516e02104c9426c7b3.pdf\",\"aktif\":\"N\"}', '2023-07-26', '10:38:34', '::1'),
(447, '?P?\rA', NULL, 'Mekanisme', 'Insert', 'mekanisme', 2, 'data : {\"nama_mekanisme\":\"Apakah sudah di laksanakan22\",\"id_periode\":\"2\"}', '2023-07-26', '10:38:48', '::1'),
(448, '?P?\rA', NULL, 'Mekanisme', 'Delete', 'mekanisme', 2, 'data : {\"id_mekanisme\":\"2\"}', '2023-07-26', '10:38:52', '::1'),
(449, '?P?\rA', NULL, 'Mekanisme', 'Insert', 'mekanisme', 3, 'data : {\"nama_mekanisme\":\"Apakah Mempertemukan Mahasiswa ?\",\"id_periode\":\"2\"}', '2023-07-26', '10:39:09', '::1'),
(450, '?P?\rA', NULL, 'Standart', 'Insert', 'standart', 1, 'data : {\"nama_standart\":\"Pendidikan\",\"deskripsi\":\"\",\"id_periode\":\"2\"}', '2023-07-26', '10:42:55', '::1'),
(451, '?P?\rA', NULL, 'Standart', 'Insert', 'sub_standart', 1, 'data : {\"deskripsi_substandart\":\"1.1.b Strategi pencapaian sasaran dengan rentang waktu yang jelas dan didukung oleh dokumen.\",\"isi_substandart\":\"<p>1.1.b Strategi pencapaian sasaran dengan rentang waktu yang jelas dan didukung oleh dokumen.<br><\\/p>\",\"id_standart\":\"1\"}', '2023-07-26', '10:43:07', '::1'),
(452, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 13, 'data : {\"nip\":\"198306122008011009\",\"id_periode\":\"2\",\"level\":\"ketua\"}', '2023-07-26', '10:44:49', '::1'),
(453, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 14, 'data : {\"nip\":\"197304192000031002\",\"id_periode\":\"2\",\"level\":\"anggota\"}', '2023-07-26', '10:44:56', '::1'),
(454, '?P?\rA', NULL, 'Unit', 'Insert', 'unit', 6, 'data : {\"nip\":\"196907052009012003\",\"id_periode\":\"2\",\"id_unit\":\"2\"}', '2023-07-26', '10:45:25', '::1'),
(455, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:09:31', '::1'),
(456, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:12:07', '::1'),
(457, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-26', '15:16:24', '::1'),
(458, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:16:34', '::1'),
(459, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"2\",\"id_unit\":\"2\",\"id_auditor\":[\"13\",\"14\"]}', '2023-07-26', '15:16:54', '::1'),
(460, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 1, 'data : {\"id_substandart\":\"1\",\"id_ami\":\"1\",\"created_by\":\"150041910\"}', '2023-07-26', '15:18:47', '::1'),
(461, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 15, 'data : {\"nip\":\"150041910\",\"id_periode\":\"2\",\"level\":\"anggota\"}', '2023-07-26', '15:23:29', '::1'),
(462, '?P?\rA', NULL, 'Unit', 'Delete', 'unit', 6, 'data : {\"id_user_unit\":\"6\"}', '2023-07-26', '15:23:37', '::1'),
(463, '?P?\rA', NULL, 'Unit', 'Insert', 'unit', 7, 'data : {\"nip\":\"150041910\",\"id_periode\":\"2\",\"id_unit\":\"2\"}', '2023-07-26', '15:23:46', '::1'),
(464, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-26', '15:23:53', '::1'),
(465, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:24:07', '::1'),
(466, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-26', '15:24:28', '::1'),
(467, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:24:40', '::1'),
(468, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 13, 'data : {\"id_auditor\":\"13\"}', '2023-07-26', '15:24:49', '::1'),
(469, '?P?\rA', NULL, 'Auditor', 'Delete', 'auditor', 15, 'data : {\"id_auditor\":\"15\"}', '2023-07-26', '15:25:00', '::1'),
(470, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 16, 'data : {\"nip\":\"150041910\",\"id_periode\":\"2\",\"level\":\"ketua\"}', '2023-07-26', '15:25:08', '::1'),
(471, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-26', '15:25:13', '::1'),
(472, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:25:25', '::1'),
(473, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-26', '15:25:32', '::1'),
(474, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:25:51', '::1'),
(475, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : [{\"id_ami\":\"1\",\"id_auditor\":\"16\"}]', '2023-07-26', '15:26:11', '::1'),
(476, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 48, 'data : {\"id_auditor_ami\":\"48\"}', '2023-07-26', '15:26:42', '::1'),
(477, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : [{\"id_ami\":\"1\",\"id_auditor\":\"14\"}]', '2023-07-26', '15:26:48', '::1'),
(478, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 50, 'data : {\"id_auditor_ami\":\"50\"}', '2023-07-26', '15:27:34', '::1'),
(479, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : [{\"id_ami\":\"1\",\"id_auditor\":\"14\"}]', '2023-07-26', '15:27:41', '127.0.0.1'),
(480, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 51, 'data : {\"id_auditor_ami\":\"51\"}', '2023-07-26', '15:28:16', '::1'),
(481, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : [{\"id_ami\":\"1\",\"id_auditor\":\"14\"}]', '2023-07-26', '15:28:27', '::1'),
(482, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-26', '15:28:37', '::1'),
(483, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:28:50', '::1'),
(484, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-26', '15:36:44', '::1'),
(485, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-26', '15:36:54', '::1'),
(486, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-27', '04:56:59', '::1'),
(487, '?P?\rA', NULL, 'Periode', 'Insert', 'periode', 3, 'data : {\"nama_periode\":\"AMI Siklus 2\",\"tahun\":\"2023\",\"siklus\":\"2\",\"file_sk\":\"f14fcdce11e3ad852073056b255c5384.pdf\",\"aktif\":\"Y\"}', '2023-07-27', '04:58:02', '::1'),
(488, '?P?\rA', NULL, 'Mekanisme', 'Insert', 'mekanisme', 1, 'data : null', '2023-07-27', '05:01:42', '::1'),
(489, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 17, 'data : {\"nip\":\"197304192000031002\",\"id_periode\":\"3\",\"level\":\"ketua\"}', '2023-07-27', '05:03:57', '::1'),
(490, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 18, 'data : {\"nip\":\"197304122006041004\",\"id_periode\":\"3\",\"level\":\"anggota\"}', '2023-07-27', '05:04:08', '::1'),
(491, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 19, 'data : {\"nip\":\"196907052009012003\",\"id_periode\":\"3\",\"level\":\"anggota\"}', '2023-07-27', '05:04:39', '::1'),
(492, '?P?\rA', NULL, 'Unit', 'Insert', 'unit', 8, 'data : {\"nip\":\"150041910\",\"id_periode\":\"3\",\"id_unit\":\"2\"}', '2023-07-27', '05:07:01', '::1'),
(493, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 20, 'data : {\"nip\":\"150041910\",\"id_periode\":\"3\",\"level\":\"ketua\"}', '2023-07-27', '05:07:12', '::1'),
(494, '?P?\rA', NULL, 'Standart', 'Insert', 'standart', 2, 'data : {\"nama_standart\":\"Visi Misi\",\"deskripsi\":\"\",\"id_periode\":\"3\"}', '2023-07-27', '05:08:48', '::1'),
(495, '?P?\rA', NULL, 'Standart', 'Insert', 'sub_standart', 2, 'data : {\"deskripsi_substandart\":\"visi misi\",\"isi_substandart\":\"<p>&nbsp;visi dan misi<br><\\/p>\",\"id_standart\":\"2\"}', '2023-07-27', '05:12:29', '::1'),
(496, '?P?\rA', NULL, 'Standart', 'Insert', 'sub_standart', 3, 'data : {\"deskripsi_substandart\":\"sk visi misi\",\"isi_substandart\":\"<p>sk visi misi<\\/p>\",\"id_standart\":\"2\"}', '2023-07-27', '05:12:50', '::1'),
(497, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"3\",\"id_unit\":\"2\",\"id_auditor\":[\"16\",\"18\"]}', '2023-07-27', '05:15:56', '::1'),
(498, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 2, 'data : {\"id_substandart\":\"3\",\"id_ami\":\"2\",\"created_by\":\"150041910\"}', '2023-07-27', '05:16:59', '::1'),
(499, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 3, 'data : {\"id_substandart\":\"2\",\"id_ami\":\"2\",\"created_by\":\"150041910\"}', '2023-07-27', '05:17:00', '::1'),
(500, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-27', '05:17:25', '::1'),
(501, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-27', '05:17:43', '::1'),
(502, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-27', '05:18:44', '::1'),
(503, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-27', '05:25:28', '::1'),
(504, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-27', '05:25:40', '::1'),
(505, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 3, 'data : {\"nama_audit\":\"visi mosi\",\"id_audit\":\"3\",\"file_audit\":\"0eabcb115ac311d38c282d9d6c3c14f9.png\",\"created_by\":\"150041910\"}', '2023-07-27', '05:27:17', '::1'),
(506, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 4, 'data : {\"nama_audit\":\"visi mosi\",\"id_audit\":\"3\",\"file_audit\":\"d56b03c144c4c8665241080b6c07b3bb.png\",\"created_by\":\"150041910\"}', '2023-07-27', '05:27:30', '::1'),
(507, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 5, 'data : {\"nama_audit\":\"sk\",\"id_audit\":\"2\",\"file_audit\":\"fd874b6d806f25c5837f513ce6df0a16.png\",\"created_by\":\"150041910\"}', '2023-07-27', '05:28:30', '::1'),
(508, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-27', '05:32:14', '::1'),
(509, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-27', '05:32:23', '::1'),
(510, '?P?\rA', NULL, 'Kts', 'Update', 'kts', 2, 'data : {\"nama_kts\":\"KTS\",\"nilai_kts\":\"1\"}', '2023-07-27', '05:33:58', '::1'),
(511, '?P?\rA', NULL, 'Kts', 'Delete', 'kts', 1, 'data : {\"id_kts\":\"1\"}', '2023-07-27', '05:34:19', '::1'),
(512, '?P?\rA', NULL, 'Kts', 'Update', 'kts', 3, 'data : {\"nama_kts\":\"Observasi\",\"nilai_kts\":\"1\"}', '2023-07-27', '05:34:25', '::1'),
(513, '?P?\rA', NULL, 'Kts', 'Update', 'kts', 2, 'data : {\"nama_kts\":\"KTS\",\"nilai_kts\":\"0\"}', '2023-07-27', '05:34:30', '::1'),
(514, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 3, 'data : {\"uraian_kts\":\"-\",\"uraian_perbaikan\":\"-\",\"target_waktu\":\"1 minggu\",\"kts\":\"KTS\",\"nilai_kts\":\"0\",\"status\":\"proses\",\"updated_at\":\"2023-07-27 05:39:31\",\"updated_by\":\"150041910\"}', '2023-07-27', '05:39:31', '::1'),
(515, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 2, 'data : {\"uraian_kts\":\"test\",\"uraian_perbaikan\":\"test\",\"target_waktu\":\"1 hari\",\"kts\":\"Observasi\",\"nilai_kts\":\"1\",\"status\":\"proses\",\"updated_at\":\"2023-07-27 05:39:46\",\"updated_by\":\"150041910\"}', '2023-07-27', '05:39:46', '::1'),
(516, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 3, 'data : {\"uraian_kts\":\"-\",\"uraian_perbaikan\":\"-\",\"target_waktu\":\"1 minggu\",\"kts\":\"KTS\",\"nilai_kts\":\"0\",\"status\":\"selesai\",\"updated_at\":\"2023-07-27 05:40:02\",\"updated_by\":\"150041910\"}', '2023-07-27', '05:40:02', '::1'),
(517, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-27', '05:48:31', '::1'),
(518, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-27', '05:48:42', '::1'),
(519, '?P?\rA', NULL, 'Pengawasan', 'Update', 'ami', 2, 'data : {\"status_akhir\":\"selesai\",\"updated_at\":\"2023-07-27 05:52:01\",\"updated_by\":\"150041910\"}', '2023-07-27', '05:52:01', '::1'),
(520, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-07-27', '05:59:24', '::1'),
(521, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-07-27', '05:59:39', '::1'),
(522, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-08-20', '16:46:39', '::1'),
(523, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-08-20', '17:36:35', '::1'),
(524, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-08-20', '18:22:07', '::1'),
(525, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-08-21', '17:10:47', '::1'),
(526, '?P?\rA', NULL, 'Auditor', 'Insert', 'auditor', 21, 'data : {\"nip\":\"198304262011011010\",\"id_periode\":\"3\"}', '2023-08-21', '17:14:10', '::1'),
(527, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 54, 'data : {\"id_auditor_ami\":\"54\"}', '2023-08-21', '17:19:06', '::1'),
(528, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 53, 'data : {\"id_auditor_ami\":\"53\"}', '2023-08-21', '17:19:10', '::1'),
(529, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"3\",\"id_unit\":\"12\",\"id_auditor\":[\"21\",\"19\"]}', '2023-08-21', '17:26:26', '::1'),
(530, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 2, 'data : [{\"id_ami\":\"2\",\"id_auditor\":\"20\"},{\"id_ami\":\"2\",\"id_auditor\":\"18\"}]', '2023-08-21', '17:28:54', '::1'),
(531, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-08-22', '01:19:40', '::1'),
(532, '?P?\rA', NULL, 'Standart', 'Insert', 'sub_standart', 4, 'data : {\"deskripsi_substandart\":\"asd\",\"kode_instrumen\":\"acbv\",\"isi_substandart\":\"<p>dsdadada<\\/p>\",\"id_standart\":\"2\"}', '2023-08-22', '01:31:23', '::1'),
(533, '?P?\rA', NULL, 'Standart', 'Update', 'sub_standart', 4, 'data : {\"deskripsi_substandart\":\"asd21\",\"isi_substandart\":\"<p>dsdadada12<\\/p>\",\"kode_instrumen\":\"acbv11\"}', '2023-08-22', '01:31:55', '::1'),
(534, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-03', '06:56:19', '::1'),
(535, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-03', '06:58:07', '::1'),
(536, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-03', '08:46:34', '::1'),
(537, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-03', '08:49:32', '::1'),
(538, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 1, 'data : {\"uraian_kts\":\"tt\",\"uraian_perbaikan\":\"tt\",\"target_waktu\":\"1 minggu\",\"kts\":\"Observasi\",\"nilai_kts\":\"1\",\"status\":\"proses\",\"updated_at\":\"2023-09-03 08:58:49\",\"updated_by\":\"150041910\"}', '2023-09-03', '08:58:49', '::1'),
(539, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 1, 'data : {\"uraian_kts\":\"tt\",\"uraian_perbaikan\":\"tt\",\"target_waktu\":\"1 minggu\",\"kts\":\"Observasi\",\"nilai_kts\":\"1\",\"status\":\"selesai\",\"updated_at\":\"2023-09-03 09:13:51\",\"updated_by\":\"150041910\"}', '2023-09-03', '09:13:51', '::1'),
(540, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 6, 'data : {\"nama_audit\":\"mou\",\"id_audit\":\"1\",\"file_audit\":\"9a6342168abeb20eb487d13b974018ef.pdf\",\"created_by\":\"150041910\"}', '2023-09-03', '09:27:55', '::1'),
(541, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 7, 'data : {\"nama_audit\":\"aa\",\"id_audit\":\"1\",\"file_audit\":\"560c6d10916fbbd626e75d4ee2e79c76.pdf\",\"created_by\":\"150041910\"}', '2023-09-03', '09:28:09', '::1'),
(542, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 1, 'data : {\"uraian_kts\":\"tt\",\"uraian_perbaikan\":\"tt\",\"target_waktu\":\"1 minggu\",\"kts\":\"Observasi\",\"nilai_kts\":\"1\",\"status\":\"proses\",\"updated_at\":\"2023-09-03 09:29:55\",\"updated_by\":\"150041910\"}', '2023-09-03', '09:29:55', '::1'),
(543, '?P?\rA', NULL, 'Unit', 'Insert', 'unit', 9, 'data : {\"nip\":\"150041910\",\"id_periode\":\"3\",\"id_unit\":\"3\"}', '2023-09-03', '09:32:11', '::1');
INSERT INTO `t_logs` (`ID`, `user_id`, `user_name`, `info_modul`, `info_action`, `info_table`, `info_id`, `info_data`, `d_proses`, `t_proses`, `ip`) VALUES
(544, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : {\"id_periode\":\"3\",\"id_unit\":\"3\",\"id_auditor\":[\"20\",\"19\"]}', '2023-09-03', '09:32:43', '::1'),
(545, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 4, 'data : {\"id_substandart\":\"4\",\"id_ami\":\"4\",\"created_by\":\"150041910\"}', '2023-09-03', '09:34:33', '::1'),
(546, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 5, 'data : {\"id_substandart\":\"2\",\"id_ami\":\"4\",\"created_by\":\"150041910\"}', '2023-09-03', '09:34:34', '::1'),
(547, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 6, 'data : {\"id_substandart\":\"3\",\"id_ami\":\"4\",\"created_by\":\"150041910\"}', '2023-09-03', '09:34:35', '::1'),
(548, '?P?\rA', NULL, 'Ami', 'Delete', 'auditor_ami', 59, 'data : {\"id_auditor_ami\":\"59\"}', '2023-09-03', '09:36:53', '::1'),
(549, '?P?\rA', NULL, 'Ami', 'Insert', 'AMI', 1, 'data : [{\"id_ami\":\"4\",\"id_auditor\":\"16\"}]', '2023-09-03', '09:37:07', '::1'),
(550, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-03', '11:10:34', '::1'),
(551, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-09-03', '11:10:46', '::1'),
(552, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-03', '11:11:08', '::1'),
(553, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-09-03', '11:11:15', '::1'),
(554, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-03', '11:11:25', '::1'),
(555, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 8, 'data : {\"nama_audit\":\"a\",\"id_audit\":\"5\",\"file_audit\":\"cf92589d28ef7886c8e765ffc0f12c79.pdf\",\"created_by\":\"150041910\"}', '2023-09-03', '11:11:49', '::1'),
(556, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 9, 'data : {\"nama_audit\":\"sss\",\"id_audit\":\"6\",\"file_audit\":\"511e4b5a2d42d1d4ee156fb9f9ed9350.pdf\",\"created_by\":\"150041910\"}', '2023-09-03', '11:12:03', '::1'),
(557, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 10, 'data : {\"nama_audit\":\"dddd\",\"id_audit\":\"4\",\"file_audit\":\"c05eabc9b514ff4014d6da4414f6caca.pdf\",\"created_by\":\"150041910\"}', '2023-09-03', '11:12:18', '::1'),
(558, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"uraian_kts\":\"test\",\"uraian_perbaikan\":\"test\",\"target_waktu\":\"1 semester\",\"kts\":\"Observasi\",\"nilai_kts\":\"1\",\"status\":\"proses\",\"updated_at\":\"2023-09-03 11:14:22\",\"updated_by\":\"150041910\"}', '2023-09-03', '11:14:22', '::1'),
(559, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"uraian_kts\":\"tes\",\"uraian_perbaikan\":\"tes\",\"target_waktu\":\"1 semester\",\"kts\":\"KTS\",\"nilai_kts\":\"0\",\"status\":\"proses\",\"updated_at\":\"2023-09-03 11:14:32\",\"updated_by\":\"150041910\"}', '2023-09-03', '11:14:32', '::1'),
(560, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 4, 'data : {\"uraian_kts\":\"test\",\"uraian_perbaikan\":\"tt\",\"target_waktu\":\"1 semester\",\"kts\":\"Observasi\",\"nilai_kts\":\"1\",\"status\":\"proses\",\"updated_at\":\"2023-09-03 11:14:43\",\"updated_by\":\"150041910\"}', '2023-09-03', '11:14:43', '::1'),
(561, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"uraian_kts\":\"test\",\"uraian_perbaikan\":\"test\",\"target_waktu\":\"1 semester\",\"kts\":\"Observasi\",\"nilai_kts\":\"1\",\"status\":\"selesai\",\"updated_at\":\"2023-09-03 11:14:53\",\"updated_by\":\"150041910\"}', '2023-09-03', '11:14:53', '::1'),
(562, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"uraian_kts\":\"test\",\"uraian_perbaikan\":\"test\",\"target_waktu\":\"1 semester\",\"kts\":\"Observasi\",\"nilai_kts\":\"1\",\"status\":\"proses\",\"updated_at\":\"2023-09-03 11:15:21\",\"updated_by\":\"150041910\"}', '2023-09-03', '11:15:21', '::1'),
(563, '?P?\rA', NULL, 'Kts', 'Insert', 'kts', 4, 'data : {\"nama_kts\":\"ddddddd\",\"nilai_kts\":\"1\",\"id_periode\":\"2\"}', '2023-09-03', '11:46:01', '::1'),
(564, '', '150041910', 'login_admin', 'Login', 'sys_user', NULL, 'Failed', '2023-09-03', '19:17:45', '::1'),
(565, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-03', '19:18:08', '::1'),
(566, '?P?\rA', NULL, 'Urkts', 'Insert', 'm_temuan', 2, 'data : {\"template_temuan\":\"xxxxxxxxxxxxx\"}', '2023-09-03', '19:26:04', '::1'),
(567, '?P?\rA', NULL, 'Urkts', 'Update', 'm_temuan', 2, 'data : {\"template_temuan\":\"xxxxxxxxxxxxx123\"}', '2023-09-03', '19:26:11', '::1'),
(568, '?P?\rA', NULL, 'Urkts', 'Delete', 'm_temuan', 2, 'data : {\"id\":\"2\"}', '2023-09-03', '19:26:18', '::1'),
(569, '?P?\rA', NULL, 'Urkts', 'Insert', 'm_temuan', 3, 'data : {\"template_temuan\":\"fdafdasf\"}', '2023-09-03', '19:29:32', '::1'),
(570, '?P?\rA', NULL, 'Urkts', 'Update', 'm_temuan', 3, 'data : {\"template_temuan\":\"fdafdasfwwwww\"}', '2023-09-03', '19:29:45', '::1'),
(571, '?P?\rA', NULL, 'Urkts', 'Update', 'm_temuan', 3, 'data : {\"template_temuan\":\"fdafdasfwwwww1\"}', '2023-09-03', '19:30:22', '::1'),
(572, '?P?\rA', NULL, 'Urkts', 'Delete', 'm_temuan', 1, 'data : {\"id\":\"1\"}', '2023-09-03', '19:30:36', '::1'),
(573, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-04', '02:12:16', '::1'),
(574, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-04', '02:13:34', '::1'),
(575, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-04', '03:07:32', '::1'),
(576, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-04', '04:09:37', '::1'),
(577, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 7, 'data : {\"id_substandart\":\"2\",\"id_ami\":\"3\",\"created_by\":\"150041910\"}', '2023-09-04', '04:10:12', '::1'),
(578, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 8, 'data : {\"id_substandart\":\"3\",\"id_ami\":\"3\",\"created_by\":\"150041910\"}', '2023-09-04', '04:10:12', '::1'),
(579, '?P?\rA', NULL, 'Ami', 'Insert', 'audit', 9, 'data : {\"id_substandart\":\"4\",\"id_ami\":\"3\",\"created_by\":\"150041910\"}', '2023-09-04', '04:10:13', '::1'),
(580, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 7, 'data : {\"uraian_kts\":\"fdafdasfwwwww1\",\"uraian_perbaikan\":\"lainnya\",\"target_waktu\":\"1 smt\",\"kts\":\"KTS\",\"nilai_kts\":\"0\",\"status\":\"open\",\"uraian_perbaikan_lainnya\":\"yyyyyaaaaaaaaaaaa\",\"uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-04 05:54:24\",\"updated_by\":\"150041910\"}', '2023-09-04', '05:54:24', '::1'),
(581, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 7, 'data : {\"uraian_kts\":\"fdafdasfwwwww1\",\"uraian_perbaikan\":\"ddddddddddd\",\"target_waktu\":\"1 smt\",\"kts\":\"KTS\",\"nilai_kts\":\"0\",\"status\":\"open\",\"uraian_perbaikan_lainnya\":\"yyyyyaaaaaaaaaaaa\",\"uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-04 06:04:30\",\"updated_by\":\"150041910\"}', '2023-09-04', '06:04:30', '::1'),
(582, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-04', '15:50:00', '::1'),
(583, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-04', '15:50:56', '::1'),
(584, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '01:28:59', '::1'),
(585, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '06:02:16', '::1'),
(586, '?P?\rA', NULL, 'Pengawasan', 'Update', 'hasil_mekanisme', 4, 'data : {\"rtm\":\"2023-07-05\",\"updated_at\":\"2023-09-05 06:03:31\"}', '2023-09-05', '06:03:31', '::1'),
(587, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '11:29:10', '::1'),
(588, '?P?\rA', NULL, 'Ami', 'Update', 'ami', 2, 'data : {\"rtm\":\"2023-09-19\",\"file_rtm\":\"c153ea13d1aadd8468890976bd87dba5.pdf\"}', '2023-09-05', '11:48:01', '::1'),
(589, '?P?\rA', NULL, 'Ami', 'Update', 'ami', 2, 'data : {\"rtm\":\"2023-09-30\",\"file_rtm\":\"495b13f4d74167115e913a66b28fa79e.pdf\"}', '2023-09-05', '11:50:16', '::1'),
(590, '?P?\rA', NULL, 'Ami', 'Update', 'ami', 3, 'data : {\"rtm\":\"2023-09-25\",\"file_rtm\":\"45ed2d354ef8f50fe2a6469cb73fe614.pdf\"}', '2023-09-05', '11:50:35', '::1'),
(591, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '11:52:10', '::1'),
(592, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-09-05', '11:56:41', '::1'),
(593, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '11:56:52', '::1'),
(594, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-09-05', '13:00:33', '::1'),
(595, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '13:01:14', '::1'),
(596, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-09-05', '14:19:24', '::1'),
(597, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '14:21:48', '::1'),
(598, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-09-05', '14:49:28', '::1'),
(599, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '14:49:41', '::1'),
(600, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '14:53:57', '::1'),
(601, '?P?\rA', NULL, 'Pengawasan', 'Update', 'ba_update', 3, 'data : {\"berita_acara\":\"dddddddddddddddddd\",\"tanggal_ba\":\"2023-09-05\"}', '2023-09-05', '15:57:12', '::1'),
(602, '?P?\rA', NULL, '150041910', 'Logout', 'Logout', 0, 'Success', '2023-09-05', '17:04:20', '::1'),
(603, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '17:04:34', '::1'),
(604, '', NULL, '0', 'Logout', 'Logout', 0, 'Success', '2023-09-05', '17:49:41', '::1'),
(605, '?P?\rA', NULL, 'login_admin', 'Login', 'sys_user', 150041910, 'Success', '2023-09-05', '17:49:57', '::1'),
(606, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 1, 'data : {\"nama_atl\":\"cxxxxxxxxxxxxxxxx\",\"id_audit\":\"5\",\"file_atl\":\"f59e238cea8d412cb49809b7643be311.pdf\",\"created_by\":\"150041910\"}', '2023-09-05', '18:18:09', '::1'),
(607, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 2, 'data : {\"nama_atl\":\"ddddddddddddd\",\"id_audit\":\"6\",\"file_atl\":\"13d5221a61014a7f2d1a71d6b1c8bb59.pdf\",\"created_by\":\"150041910\"}', '2023-09-05', '18:20:47', '::1'),
(608, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"1ht\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"uraian_perbaikan_lainnya\":null,\"uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:09:28\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:09:28', '::1'),
(609, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"1ht\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"uraian_perbaikan_lainnya\":\"\",\"uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:10:39\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:10:39', '::1'),
(610, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"1ht\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:12:26\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:12:26', '::1'),
(611, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"sadsafasf\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"asdasdsad\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:13:05\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:13:05', '::1'),
(612, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"sadsafasf\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:13:14\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:13:14', '::1'),
(613, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"sadsafasf\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:14:34\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:14:34', '::1'),
(614, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"sadsafasf\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"sssssssssss\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:14:47\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:14:47', '::1'),
(615, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"sssssssssss\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:14:59\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:14:59', '::1'),
(616, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:15:11\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:15:11', '::1'),
(617, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 4, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"wwwwwwwwwwwwwww\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:15:36\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:15:36', '::1'),
(618, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:16:47\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:16:47', '::1'),
(619, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:16:55\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:16:55', '::1'),
(620, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:17:44\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:17:44', '::1'),
(621, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xx\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:17:59\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:17:59', '::1'),
(622, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xx\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:19:20\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:19:20', '::1'),
(623, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xx\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:19:29\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:19:29', '::1'),
(624, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xx\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:22:19\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:22:19', '::1'),
(625, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xx\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:23:23\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:23:23', '::1'),
(626, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:23:33\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:23:33', '::1'),
(627, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 4, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"wwwwwwwwwwwwwww\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:31:24\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:31:24', '::1'),
(628, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 4, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"wwwwwwwwwwwwwww\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:31:37\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:31:37', '::1'),
(629, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 4, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"ddddddddddd\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"wwwwwwwwwwwwwww\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:31:53\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:31:53', '::1'),
(630, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 4, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"wwwwwwwwwsdasgdsagsdagsdagwwwwww\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:32:02\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:32:02', '::1'),
(631, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:44:48\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:44:48', '::1'),
(632, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:45:00\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:45:00', '::1'),
(633, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:45:09\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:45:09', '::1'),
(634, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:46:32\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:46:32', '::1'),
(635, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:46:42\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:46:42', '::1'),
(636, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 4, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"wwwwwwwwwsdasgdsagsdagsdagwwwwww\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:48:07\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:48:07', '::1'),
(637, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"12\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"fggggggggggg\",\"updated_at\":\"2023-09-05 19:50:49\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:50:49', '::1'),
(638, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 4, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"wwwwwwwwwsdasgdsagsdagsdagwwwwww\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:50:58\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:50:58', '::1'),
(639, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"fggggggggggg\",\"updated_at\":\"2023-09-05 19:51:06\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:51:06', '::1'),
(640, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 5, 'data : {\"atl_uraian_kts\":\"fdafdasfwwwww1\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"KTS\",\"atl_nilai_kts\":\"0\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"sssssssssss\",\"atl_uraian_kts_lainnya\":\"\",\"updated_at\":\"2023-09-05 19:55:34\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:55:34', '::1'),
(641, '?P?\rA', NULL, 'Pengawasan', 'Update', 'audit', 6, 'data : {\"atl_uraian_kts\":\"lainnya\",\"atl_uraian_perbaikan\":\"lainnya\",\"atl_target_waktu\":\"1\",\"atl_kts\":\"Observasi\",\"atl_nilai_kts\":\"1\",\"atl_status\":\"open\",\"atl_uraian_perbaikan_lainnya\":\"xxsdafdfa\",\"atl_uraian_kts_lainnya\":\"fggggggggggg\",\"updated_at\":\"2023-09-05 19:55:41\",\"updated_by\":\"150041910\"}', '2023-09-05', '19:55:41', '::1'),
(642, '?P?\rA', NULL, 'Pengawasan', 'Insert', 'audit', 3, 'data : {\"nama_atl\":\"kkkkkk\",\"id_audit\":\"4\",\"file_atl\":\"0399a637f217d5e491756c36ff35bf1c.pdf\",\"created_by\":\"150041910\"}', '2023-09-05', '19:56:57', '::1');

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `id_user_unit` int(11) NOT NULL,
  `id_periode` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`id_user_unit`, `id_periode`, `id_unit`, `nip`, `created_at`) VALUES
(7, 2, 2, '150041910', '2023-07-26 13:23:46'),
(8, 3, 2, '150041910', '2023-07-27 03:07:01'),
(9, 3, 3, '150041910', '2023-09-03 07:32:11');

-- --------------------------------------------------------

--
-- Table structure for table `visi_misi`
--

CREATE TABLE `visi_misi` (
  `id_visi_misi` int(11) NOT NULL,
  `img_visi` varchar(225) DEFAULT NULL,
  `visi` text DEFAULT NULL,
  `misi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visi_misi`
--

INSERT INTO `visi_misi` (`id_visi_misi`, `img_visi`, `visi`, `misi`) VALUES
(1, '999f13a5ff29909d03f9c2ed9ee73d4d.jpg', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><br></p>', '<span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</span>');

-- --------------------------------------------------------

--
-- Table structure for table `web_gallery`
--

CREATE TABLE `web_gallery` (
  `id_gallery` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `img_gallery` varchar(225) NOT NULL,
  `title_gallery` varchar(225) NOT NULL,
  `subtitle_gallery` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_gallery`
--

INSERT INTO `web_gallery` (`id_gallery`, `id_unit`, `id_user`, `img_gallery`, `title_gallery`, `subtitle_gallery`, `created_at`) VALUES
(2, 3, 516, 'dbc9e6c071e92a1f2a766489d9b931c1.png', 'In voluptate perfere123', 'Ducimus quibusdam e312', '2022-10-31 08:10:52'),
(3, 0, 1, 'a9fb9df7059c5ca0cc9ab320345c50a1.jpg', 'Galeri3', 'kegiatan tahun 2023', '2023-04-10 21:56:12'),
(4, 0, 0, '9d6f196862affde2c480dc5e8ea793bf.jpg', 'sss', 'asdfsaf', '2023-07-08 07:52:58'),
(5, 0, 0, '38e2a197f0bd94f3f445d94f6445d3a6.png', 'fgdg', 'Ducimus quibusdam e312', '2023-07-08 07:53:28');

-- --------------------------------------------------------

--
-- Table structure for table `web_hero`
--

CREATE TABLE `web_hero` (
  `id_hero` int(11) NOT NULL,
  `img_hero` varchar(225) NOT NULL,
  `title` text NOT NULL,
  `desc_hero` text NOT NULL,
  `show` enum('N','Y') NOT NULL DEFAULT 'N',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_hero`
--

INSERT INTO `web_hero` (`id_hero`, `img_hero`, `title`, `desc_hero`, `show`, `created_at`, `updated_at`) VALUES
(1, '4cba1dd43317dbc84f903ba30f030bf6.jpg', 'We bring solutions to make life easier for our customers.', 'We have considered our solutions to support every stage of your growth.', 'Y', '2022-10-31 03:17:10', '2023-07-08 10:46:10'),
(3, '87bc61e652823e2467d7d1e113671a00.jpg', 'life easier for our customers.', 'make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', 'Y', '2023-07-08 06:07:31', '2023-07-08 01:08:52');

-- --------------------------------------------------------

--
-- Table structure for table `web_profile`
--

CREATE TABLE `web_profile` (
  `id` int(11) NOT NULL,
  `img` varchar(225) NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_profile`
--

INSERT INTO `web_profile` (`id`, `img`, `title`, `content`) VALUES
(1, '31b894c2f81608ca9ac6e1e1377b7db8.jpg', 'What’s Our Resources Story', '<p>Praesent fringilla lorem tincidunt, commodo erat sit amet, eleifend neque. Etiam nec vestibulum turpis, quis tempus elit. Sed tempus elit porttitor odio gravida, sed maximus turpis mattis. Vivamus at urna ut libero ornare congue.</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `web_service`
--

CREATE TABLE `web_service` (
  `id_service` int(11) NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `subtitle` text DEFAULT NULL,
  `service1_icon` varchar(225) DEFAULT NULL,
  `service1_title` varchar(225) DEFAULT NULL,
  `service1_desc` text DEFAULT NULL,
  `service2_icon` varchar(225) DEFAULT NULL,
  `service2_title` varchar(225) DEFAULT NULL,
  `service2_desc` text DEFAULT NULL,
  `service3_icon` varchar(225) DEFAULT NULL,
  `service3_title` varchar(225) DEFAULT NULL,
  `service3_desc` text DEFAULT NULL,
  `service4_icon` varchar(225) DEFAULT NULL,
  `service4_title` varchar(225) DEFAULT NULL,
  `service4_desc` text DEFAULT NULL,
  `service5_icon` varchar(225) NOT NULL,
  `service5_title` varchar(225) NOT NULL,
  `service5_desc` text NOT NULL,
  `service6_icon` varchar(225) NOT NULL,
  `service6_title` varchar(225) NOT NULL,
  `service6_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_service`
--

INSERT INTO `web_service` (`id_service`, `title`, `subtitle`, `service1_icon`, `service1_title`, `service1_desc`, `service2_icon`, `service2_title`, `service2_desc`, `service3_icon`, `service3_title`, `service3_desc`, `service4_icon`, `service4_title`, `service4_desc`, `service5_icon`, `service5_title`, `service5_desc`, `service6_icon`, `service6_title`, `service6_desc`) VALUES
(1, 'WHAT WE DO? test', 'The service we offer is specifically designed to meet your needs.', '<i class=\"flaticon flaticon-customer-support\"></i>', 'Technical Services', 'Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.', '<i class=\"flaticon flaticon-solar-panel\"></i>', 'Energy Panels', 'Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.', '<i class=\"flaticon flaticon-wind-energy\"></i>', 'Wind Generators', 'Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.', '<i class=\"flaticon flaticon-eco-home\"></i>', 'Solar As A Service', 'Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.', '<i class=\"flaticon flaticon-charging-station\"></i>', 'Solar PV Systems', 'Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.', '<i class=\"flaticon flaticon-clipboard\"></i>', 'Inspection Checklist', 'Donec vestibulum arcu a arcu scelerisque, quis dignissim turpis semper onec tortor mi, volutpat a iaculis sit amet.');

-- --------------------------------------------------------

--
-- Table structure for table `web_work`
--

CREATE TABLE `web_work` (
  `id_work` int(11) NOT NULL,
  `img_work` varchar(225) NOT NULL,
  `title` varchar(225) DEFAULT NULL,
  `subtitle` varchar(225) DEFAULT NULL,
  `work1_title` varchar(225) DEFAULT NULL,
  `work1_desc` text DEFAULT NULL,
  `work2_title` varchar(225) DEFAULT NULL,
  `work2_desc` text DEFAULT NULL,
  `work3_title` varchar(225) DEFAULT NULL,
  `work3_desc` text DEFAULT NULL,
  `work4_title` varchar(225) DEFAULT NULL,
  `work4_desc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `web_work`
--

INSERT INTO `web_work` (`id_work`, `img_work`, `title`, `subtitle`, `work1_title`, `work1_desc`, `work2_title`, `work2_desc`, `work3_title`, `work3_desc`, `work4_title`, `work4_desc`) VALUES
(1, '338239b1abfc11e5260552f994b8fcfc.png', 'How It Works?', 'We Work', 'Collect Ideas', 'Nulla vitae elit libero pharetra augue dapibus. Praesent commodo cursus.', 'Data Analysis', 'Vivamus sagittis lacus vel augue laoreet. Etiam porta sem malesuada magna.', 'Finalize Product', 'Cras mattis consectetur purus sit amet. Aenean lacinia bibendum nulla sed.', 'Finalize Product', 'Cras mattis consectetur purus sit amet. Aenean lacinia bibendum nulla sed.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `ami`
--
ALTER TABLE `ami`
  ADD PRIMARY KEY (`id_ami`),
  ADD KEY `fk_ami_periode` (`id_periode`),
  ADD KEY `dk_ami_unit` (`id_unit`);

--
-- Indexes for table `audit`
--
ALTER TABLE `audit`
  ADD PRIMARY KEY (`id_audit`),
  ADD KEY `fk_audt_ami` (`id_ami`),
  ADD KEY `fk_audit_stdr` (`id_substandart`);

--
-- Indexes for table `auditor`
--
ALTER TABLE `auditor`
  ADD PRIMARY KEY (`id_auditor`),
  ADD KEY `fk_aud_periode` (`id_periode`);

--
-- Indexes for table `auditor_ami`
--
ALTER TABLE `auditor_ami`
  ADD PRIMARY KEY (`id_auditor_ami`),
  ADD KEY `fk_auditor_ami` (`id_ami`),
  ADD KEY `fk_auditor_au` (`id_auditor`);

--
-- Indexes for table `detail_periode`
--
ALTER TABLE `detail_periode`
  ADD PRIMARY KEY (`id_detail_periode`) USING BTREE,
  ADD KEY `dk_dtl_periode` (`id_periode`);

--
-- Indexes for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  ADD PRIMARY KEY (`id_dokumentasi`),
  ADD KEY `fk_dok_ami` (`id_ami`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id_faq`);

--
-- Indexes for table `file_audit`
--
ALTER TABLE `file_audit`
  ADD PRIMARY KEY (`id_file_audit`),
  ADD KEY `fk_file_audt` (`id_audit`);

--
-- Indexes for table `file_audit_atl`
--
ALTER TABLE `file_audit_atl`
  ADD PRIMARY KEY (`id_file_atl`),
  ADD KEY `fk_file_audt` (`id_audit`);

--
-- Indexes for table `format_dokumen`
--
ALTER TABLE `format_dokumen`
  ADD PRIMARY KEY (`id_format`);

--
-- Indexes for table `hasil_mekanisme`
--
ALTER TABLE `hasil_mekanisme`
  ADD PRIMARY KEY (`id_hasil_mekanisme`),
  ADD KEY `fk_mekanisme` (`id_mekanisme`),
  ADD KEY `fk_mekanisme_ami` (`id_ami`);

--
-- Indexes for table `kesimpulan`
--
ALTER TABLE `kesimpulan`
  ADD PRIMARY KEY (`id_kesimpulan`),
  ADD KEY `fk_ksmpl_ami` (`id_ami`);

--
-- Indexes for table `kts`
--
ALTER TABLE `kts`
  ADD PRIMARY KEY (`id_kts`),
  ADD KEY `fk_kts_periode` (`id_periode`);

--
-- Indexes for table `mekanisme`
--
ALTER TABLE `mekanisme`
  ADD PRIMARY KEY (`id_mekanisme`),
  ADD KEY `fk_mk_periode` (`id_periode`);

--
-- Indexes for table `m_kategori`
--
ALTER TABLE `m_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `m_perbaikan`
--
ALTER TABLE `m_perbaikan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_subunit`
--
ALTER TABLE `m_subunit`
  ADD PRIMARY KEY (`id_subunit`) USING BTREE,
  ADD KEY `fk_fakultas` (`id_unit`);

--
-- Indexes for table `m_tahap`
--
ALTER TABLE `m_tahap`
  ADD PRIMARY KEY (`id_tahap`) USING BTREE;

--
-- Indexes for table `m_temuan`
--
ALTER TABLE `m_temuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_unit`
--
ALTER TABLE `m_unit`
  ADD PRIMARY KEY (`id_unit`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id_news`),
  ADD KEY `tulisan_kategori_id` (`id_kategori`),
  ADD KEY `tulisan_pengguna_id` (`id_user`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD UNIQUE KEY `pin` (`pin`),
  ADD UNIQUE KEY `nik` (`nik`),
  ADD UNIQUE KEY `nip` (`nip`);

--
-- Indexes for table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`id_periode`) USING BTREE;

--
-- Indexes for table `proses_ami`
--
ALTER TABLE `proses_ami`
  ADD PRIMARY KEY (`id_proses_ami`),
  ADD KEY `fk_proses_ami` (`id_ami`);

--
-- Indexes for table `standart`
--
ALTER TABLE `standart`
  ADD PRIMARY KEY (`id_standart`),
  ADD KEY `fk_std_periode` (`id_periode`);

--
-- Indexes for table `struktur_organisasi`
--
ALTER TABLE `struktur_organisasi`
  ADD PRIMARY KEY (`id_struktur`);

--
-- Indexes for table `sub_standart`
--
ALTER TABLE `sub_standart`
  ADD PRIMARY KEY (`id_substandart`),
  ADD KEY `fk_ssdrt` (`id_standart`);

--
-- Indexes for table `t_logs`
--
ALTER TABLE `t_logs`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id_user_unit`),
  ADD KEY `fk_aud_periode` (`id_periode`),
  ADD KEY `fk_unit` (`id_unit`);

--
-- Indexes for table `visi_misi`
--
ALTER TABLE `visi_misi`
  ADD PRIMARY KEY (`id_visi_misi`);

--
-- Indexes for table `web_gallery`
--
ALTER TABLE `web_gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indexes for table `web_hero`
--
ALTER TABLE `web_hero`
  ADD PRIMARY KEY (`id_hero`);

--
-- Indexes for table `web_profile`
--
ALTER TABLE `web_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_service`
--
ALTER TABLE `web_service`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `web_work`
--
ALTER TABLE `web_work`
  ADD PRIMARY KEY (`id_work`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ami`
--
ALTER TABLE `ami`
  MODIFY `id_ami` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `audit`
--
ALTER TABLE `audit`
  MODIFY `id_audit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `auditor`
--
ALTER TABLE `auditor`
  MODIFY `id_auditor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `auditor_ami`
--
ALTER TABLE `auditor_ami`
  MODIFY `id_auditor_ami` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `detail_periode`
--
ALTER TABLE `detail_periode`
  MODIFY `id_detail_periode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  MODIFY `id_dokumentasi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id_faq` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `file_audit`
--
ALTER TABLE `file_audit`
  MODIFY `id_file_audit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `file_audit_atl`
--
ALTER TABLE `file_audit_atl`
  MODIFY `id_file_atl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `format_dokumen`
--
ALTER TABLE `format_dokumen`
  MODIFY `id_format` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hasil_mekanisme`
--
ALTER TABLE `hasil_mekanisme`
  MODIFY `id_hasil_mekanisme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kesimpulan`
--
ALTER TABLE `kesimpulan`
  MODIFY `id_kesimpulan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kts`
--
ALTER TABLE `kts`
  MODIFY `id_kts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mekanisme`
--
ALTER TABLE `mekanisme`
  MODIFY `id_mekanisme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `m_kategori`
--
ALTER TABLE `m_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `m_perbaikan`
--
ALTER TABLE `m_perbaikan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_subunit`
--
ALTER TABLE `m_subunit`
  MODIFY `id_subunit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `m_tahap`
--
ALTER TABLE `m_tahap`
  MODIFY `id_tahap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `m_temuan`
--
ALTER TABLE `m_temuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `m_unit`
--
ALTER TABLE `m_unit`
  MODIFY `id_unit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id_news` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=665;

--
-- AUTO_INCREMENT for table `periode`
--
ALTER TABLE `periode`
  MODIFY `id_periode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `proses_ami`
--
ALTER TABLE `proses_ami`
  MODIFY `id_proses_ami` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `standart`
--
ALTER TABLE `standart`
  MODIFY `id_standart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `struktur_organisasi`
--
ALTER TABLE `struktur_organisasi`
  MODIFY `id_struktur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_standart`
--
ALTER TABLE `sub_standart`
  MODIFY `id_substandart` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_logs`
--
ALTER TABLE `t_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=643;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `id_user_unit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `visi_misi`
--
ALTER TABLE `visi_misi`
  MODIFY `id_visi_misi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_gallery`
--
ALTER TABLE `web_gallery`
  MODIFY `id_gallery` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `web_hero`
--
ALTER TABLE `web_hero`
  MODIFY `id_hero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `web_profile`
--
ALTER TABLE `web_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_service`
--
ALTER TABLE `web_service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `web_work`
--
ALTER TABLE `web_work`
  MODIFY `id_work` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ami`
--
ALTER TABLE `ami`
  ADD CONSTRAINT `dk_ami_unit` FOREIGN KEY (`id_unit`) REFERENCES `m_unit` (`id_unit`),
  ADD CONSTRAINT `fk_ami_periode` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id_periode`);

--
-- Constraints for table `audit`
--
ALTER TABLE `audit`
  ADD CONSTRAINT `fk_audit_stdr` FOREIGN KEY (`id_substandart`) REFERENCES `sub_standart` (`id_substandart`),
  ADD CONSTRAINT `fk_audt_ami` FOREIGN KEY (`id_ami`) REFERENCES `ami` (`id_ami`);

--
-- Constraints for table `auditor`
--
ALTER TABLE `auditor`
  ADD CONSTRAINT `fk_aud_periode` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id_periode`);

--
-- Constraints for table `auditor_ami`
--
ALTER TABLE `auditor_ami`
  ADD CONSTRAINT `fk_auditor_ami` FOREIGN KEY (`id_ami`) REFERENCES `ami` (`id_ami`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_auditor_au` FOREIGN KEY (`id_auditor`) REFERENCES `auditor` (`id_auditor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_periode`
--
ALTER TABLE `detail_periode`
  ADD CONSTRAINT `dk_dtl_periode` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id_periode`);

--
-- Constraints for table `dokumentasi`
--
ALTER TABLE `dokumentasi`
  ADD CONSTRAINT `fk_dok_ami` FOREIGN KEY (`id_ami`) REFERENCES `ami` (`id_ami`);

--
-- Constraints for table `file_audit`
--
ALTER TABLE `file_audit`
  ADD CONSTRAINT `fk_file_audt` FOREIGN KEY (`id_audit`) REFERENCES `audit` (`id_audit`);

--
-- Constraints for table `hasil_mekanisme`
--
ALTER TABLE `hasil_mekanisme`
  ADD CONSTRAINT `fk_mekanisme` FOREIGN KEY (`id_mekanisme`) REFERENCES `mekanisme` (`id_mekanisme`),
  ADD CONSTRAINT `fk_mekanisme_ami` FOREIGN KEY (`id_ami`) REFERENCES `ami` (`id_ami`);

--
-- Constraints for table `kesimpulan`
--
ALTER TABLE `kesimpulan`
  ADD CONSTRAINT `fk_ksmpl_ami` FOREIGN KEY (`id_ami`) REFERENCES `ami` (`id_ami`);

--
-- Constraints for table `kts`
--
ALTER TABLE `kts`
  ADD CONSTRAINT `fk_kts_periode` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id_periode`);

--
-- Constraints for table `mekanisme`
--
ALTER TABLE `mekanisme`
  ADD CONSTRAINT `fk_mk_periode` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id_periode`);

--
-- Constraints for table `proses_ami`
--
ALTER TABLE `proses_ami`
  ADD CONSTRAINT `fk_proses_ami` FOREIGN KEY (`id_ami`) REFERENCES `ami` (`id_ami`);

--
-- Constraints for table `standart`
--
ALTER TABLE `standart`
  ADD CONSTRAINT `fk_std_periode` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id_periode`);

--
-- Constraints for table `sub_standart`
--
ALTER TABLE `sub_standart`
  ADD CONSTRAINT `fk_ssdrt` FOREIGN KEY (`id_standart`) REFERENCES `standart` (`id_standart`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `unit`
--
ALTER TABLE `unit`
  ADD CONSTRAINT `fk_u_p` FOREIGN KEY (`id_periode`) REFERENCES `periode` (`id_periode`),
  ADD CONSTRAINT `fk_unit` FOREIGN KEY (`id_unit`) REFERENCES `m_unit` (`id_unit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
