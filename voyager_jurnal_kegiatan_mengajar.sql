-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2020 at 07:59 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `voyager_jurnal_kegiatan_mengajar`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2020-10-20 02:03:15', '2020-10-20 02:03:15'),
(2, NULL, 1, 'Category 2', 'category-2', '2020-10-20 02:03:16', '2020-10-20 02:03:16');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, '{}', 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap beri tahu nama anda !\"}}}', 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi email !\"}}}', 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, '{\"validation\":{\"edit\":{\"rule\":\"nullable\"},\"add\":{\"rule\":\"required\"},\"messages\":{\"required\":\"Harap isi password !\"}}}', 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, '{}', 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 13),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(8, 1, 'avatar', 'image', 'Foto Profil', 0, 1, 1, 1, 1, 1, '{}', 6),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Jabatan', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Jabatan Lainnya', 0, 0, 0, 0, 0, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 9),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, '{}', 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Jabatan', 0, 1, 1, 1, 1, 1, '{}', 7),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(62, 8, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(63, 8, 'nama_mapel', 'text', 'Nama Mapel', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap Isi Nama Mapel ini !\"}}}', 2),
(66, 8, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 7),
(67, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(81, 10, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(82, 10, 'tanggal', 'timestamp', 'Tanggal Pertemuan KBM:', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi tanggal pertemuan !\"}},\"inputtoday\":true,\"display\":{\"width\":\"6\",\"id\":\"tanggal\"}}', 5),
(83, 10, 'semester', 'select_dropdown', 'Semester:', 0, 1, 1, 1, 1, 1, '{\"options\":{\"\":\"- Pilih Semester -\",\"Ganjil\":\"1 - Ganjil\",\"Genap\":\"2 - Genap\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu semester ini !\"}},\"display\":{\"width\":\"6\",\"id\":\"semester\"}}', 6),
(86, 10, 'id_mapel', 'hidden', 'Id Mapel', 0, 0, 1, 1, 1, 1, '{}', 10),
(88, 10, 'muatan_mapel', 'text', 'Materi Mapel:', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi materi mapel !\"}},\"display\":{\"width\":\"4\",\"id\":\"materi\"}}', 13),
(89, 10, 'kompetensi_dasar', 'number', 'Kompetensi Dasar (KD):', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|numeric\",\"messages\":{\"required\":\"Harap beri tahu KD keberapa saat ini !\",\"numeric\":\"Isian harus angka !\"}},\"min\":0,\"display\":{\"width\":\"4\",\"id\":\"kd\"}}', 12),
(90, 10, 'jurnal', 'rich_text_box', 'Jurnal KBM', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi jurnal KBM saat ini !\"}},\"tinymceOptions\":{\"height\":200,\"min_height\":200},\"display\":{\"id\":\"jurnal\"}}', 14),
(91, 10, 'permasalahan', 'rich_text_box', 'Permasalahan Dalam Proses KBM', 0, 0, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi permasalahan\\/kendala pada saat KBM saat ini !\"}},\"tinymceOptions\":{\"height\":200,\"min_height\":200},\"display\":{\"id\":\"permasalahan\"}}', 15),
(92, 10, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 18),
(93, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 19),
(106, 10, 'tb_jurnal_belongsto_tb_mapel_relationship', 'relationship', 'Mata Pelajaran:', 0, 1, 1, 1, 1, 1, '{\"display\":{\"width\":\"4\",\"id\":\"mapel\"},\"scope\":\"mapel\",\"model\":\"App\\\\Models\\\\TbMapel\",\"table\":\"tb_mapels\",\"type\":\"belongsTo\",\"column\":\"id_mapel\",\"key\":\"id\",\"label\":\"nama_mapel\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(107, 10, 'tingkat', 'select_dropdown', 'Tingkat:', 0, 1, 1, 1, 1, 1, '{\"options\":{\"\":\"- Pilih Tingkat -\",\"X\":\"10 - X\",\"XI\":\"11 - XI\",\"XII\":\"12 - XII\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu tingkat kelas ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"tingkat\"}}', 7),
(108, 10, 'jurusan', 'select_dropdown', 'Jurusan:', 0, 1, 1, 1, 1, 1, '{\"options\":{\"\":\"- Pilih Jurusan -\",\"MM\":\"MM - Multimedia\",\"BC\":\"BC - Broadcast\",\"RPL\":\"RPL - Rekayasa Perangkat Lunak\",\"TKJ\":\"TKJ - Teknik Komputer dan Jaringan\",\"TEI\":\"TEI - Teknik Elektronikan Industri\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu jurusan ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"jurusan\"}}', 8),
(109, 10, 'rombel', 'select_dropdown', 'Rombel:', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"\":\"- Pilih Rombel -\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu rombel kelas ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"rombel\"}}', 9),
(112, 1, 'email_verified_at', 'timestamp', 'Email Verified At', 0, 0, 0, 0, 0, 0, '{}', 15),
(117, 1, 'user_belongsto_tb_mapel_relationship', 'relationship', 'Mengajar Mapel:', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\TbMapel\",\"table\":\"tb_mapels\",\"type\":\"belongsTo\",\"column\":\"id_mapel\",\"key\":\"id\",\"label\":\"nama_mapel\",\"pivot_table\":\"tb_mapels\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(118, 1, 'id_mapel', 'hidden', 'Id Mapel', 0, 1, 1, 1, 1, 1, '{}', 10),
(121, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(122, 19, 'jurusan', 'text', 'Jurusan', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi nama jurusan !\"}}}', 2),
(123, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(124, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(125, 20, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(126, 20, 'tingkat', 'text', 'Tingkat kelas', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi tingkat kelas !\"}}}', 2),
(127, 20, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(128, 20, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(129, 8, 'tb_mapel_belongstomany_tb_tingkat_relationship', 'relationship', 'Untuk Kelas:', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\TbTingkat\",\"table\":\"tb_tingkats\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"tingkat\",\"pivot_table\":\"tb_pivot_mapel_tingkats\",\"pivot\":\"1\",\"taggable\":\"0\"}', 4),
(130, 8, 'tb_mapel_belongstomany_tb_jurusan_relationship', 'relationship', 'Untuk Jurusan:', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\TbJurusan\",\"table\":\"tb_jurusans\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"jurusan\",\"pivot_table\":\"tb_pivot_mapel_jurusans\",\"pivot\":\"1\",\"taggable\":\"0\"}', 6),
(131, 8, 'id_tingkat', 'hidden', 'Id Tingkat', 0, 0, 0, 0, 0, 0, '{}', 3),
(132, 8, 'id_jurusan', 'hidden', 'Id Jurusan', 0, 0, 0, 0, 0, 0, '{}', 5),
(133, 21, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(134, 21, 'nama_semester', 'text', 'Nama Semester', 0, 1, 1, 1, 1, 1, '{}', 2),
(135, 21, 'dari_bulan', 'select_dropdown', 'Dari Bulan:', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"Januari\",\"2\":\"Februari\",\"3\":\"Maret\",\"4\":\"April\",\"5\":\"Mei\",\"6\":\"Juni\",\"7\":\"Juli\",\"8\":\"Agustus\",\"9\":\"September\",\"10\":\"Oktober\",\"11\":\"November\",\"12\":\"Desember\",\"\":\"- Pilih Bulan -\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu bulan ini !\"}},\"display\":{\"width\":\"6\"}}', 3),
(136, 21, 'sampai_bulan', 'select_dropdown', 'Sampai Bulan:', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"Januari\",\"2\":\"Februari\",\"3\":\"Maret\",\"4\":\"April\",\"5\":\"Mei\",\"6\":\"Juni\",\"7\":\"Juli\",\"8\":\"Agustus\",\"9\":\"September\",\"10\":\"Oktober\",\"11\":\"November\",\"12\":\"Desember\",\"\":\"- Pilih Bulan -\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu bulan ini !\"}},\"display\":{\"width\":\"6\"}}', 4),
(137, 21, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 5),
(138, 21, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(139, 22, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(140, 22, 'id_tingkat', 'hidden', 'Id Tingkat', 0, 0, 0, 0, 0, 0, '{}', 2),
(141, 22, 'id_jurusan', 'hidden', 'Id Jurusan', 0, 0, 0, 0, 0, 0, '{}', 4),
(142, 22, 'id_semester', 'hidden', 'Id Semester', 0, 0, 0, 0, 0, 0, '{}', 6),
(143, 22, 'id_mapel', 'hidden', 'Id Mapel', 0, 0, 0, 0, 0, 0, '{}', 8),
(144, 22, 'kd', 'number', 'Kd', 0, 1, 1, 1, 1, 1, '{}', 10),
(145, 22, 'nama_materi', 'text', 'Nama Materi', 0, 1, 1, 1, 1, 1, '{}', 11),
(146, 22, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 12),
(147, 22, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 13),
(148, 22, 'tb_materi_belongsto_tb_tingkat_relationship', 'relationship', 'Untuk Tingkat:', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\TbTingkat\",\"table\":\"tb_tingkats\",\"type\":\"belongsTo\",\"column\":\"id_tingkat\",\"key\":\"id\",\"label\":\"tingkat\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(149, 22, 'tb_materi_belongstomany_tb_jurusan_relationship', 'relationship', 'Untuk Jurusan:', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\TbJurusan\",\"table\":\"tb_jurusans\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"jurusan\",\"pivot_table\":\"tb_pivot_materi_jurusans\",\"pivot\":\"1\",\"taggable\":\"0\"}', 5),
(150, 22, 'tb_materi_belongsto_tb_mapel_relationship', 'relationship', 'Untuk Mapel:', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\TbMapel\",\"table\":\"tb_mapels\",\"type\":\"belongsTo\",\"column\":\"id_mapel\",\"key\":\"id\",\"label\":\"nama_mapel\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 9),
(151, 22, 'tb_materi_belongsto_tb_semester_relationship', 'relationship', 'Untuk Semester:', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\TbSemester\",\"table\":\"tb_semesters\",\"type\":\"belongsTo\",\"column\":\"id_semester\",\"key\":\"id\",\"label\":\"nama_semester\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 7),
(153, 23, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(154, 23, 'nama_tugas', 'rich_text_box', 'Isi Tugas:', 0, 1, 1, 1, 1, 1, '{}', 8),
(155, 23, 'untuk_kd', 'hidden', 'Untuk Kd', 0, 1, 1, 1, 1, 1, '{}', 2),
(156, 23, 'untuk_kelas', 'select_dropdown', 'Untuk Kelas', 0, 1, 1, 1, 1, 1, '{\"options\":{\"\":\"- Pilih Tingkat -\",\"X\":\"10 - X\",\"XI\":\"11 - XI\",\"XII\":\"12 - XII\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu tingkat kelas ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"jurusan\"}}', 4),
(157, 23, 'untuk_jurusan', 'select_dropdown', 'Untuk Jurusan', 0, 1, 1, 1, 1, 1, '{\"options\":{\"\":\"- Pilih Jurusan -\",\"MM\":\"MM - Multimedia\",\"BC\":\"BC - Broadcast\",\"RPL\":\"RPL - Rekayasa Perangkat Lunak\",\"TKJ\":\"TKJ - Teknik Komputer dan Jaringan\",\"TEI\":\"TEI - Teknik Elektronikan Industri\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu jurusan ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"jurusan\"}}', 5),
(158, 23, 'untuk_rombel', 'select_dropdown', 'Untuk Rombel', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"\":\"- Pilih Rombel -\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu rombel kelas ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"jurusan\"}}', 6),
(159, 23, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 9),
(160, 23, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(161, 23, 'tb_penugasan_belongsto_tb_jurnal_relationship', 'relationship', 'Untuk KD:', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\TbJurnal\",\"table\":\"tb_jurnals\",\"type\":\"belongsTo\",\"column\":\"untuk_kd\",\"key\":\"id\",\"label\":\"kompetensi_dasar\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(162, 23, 'id_user', 'hidden', 'Id User', 0, 0, 0, 0, 0, 0, '{\"ShowCurrentlyUseridLoggedIn\":true}', 10),
(163, 23, 'file_penugasan', 'file', 'File Penugasan (opsional):', 0, 1, 1, 1, 1, 1, '{\"allow_upload\":true,\"allowed\":[\"file\\/pdf\",\"file\\/docx\",\"file\\/ppt\"]}', 7),
(164, 10, 'departemen', 'hidden', 'Departemen', 0, 0, 1, 0, 0, 0, '{}', 3),
(165, 10, 'tahun_ajaran', 'hidden', 'Tahun Ajaran', 0, 0, 1, 0, 0, 0, '{}', 4),
(166, 10, 'status', 'checkbox', 'Status', 0, 1, 1, 0, 0, 0, '{\"off\":\"Menunggu Konfirmasi\",\"on\":\"Terkonfirmasi\",\"checked\":false}', 2),
(168, 10, 'id_userguru', 'hidden', 'id_userguru', 0, 1, 1, 0, 1, 1, '{\"ShowCurrentlyUseridLoggedIn\":true}', 16),
(169, 10, 'id_userkurikulum', 'hidden', 'Id Userkurikulum', 0, 0, 0, 0, 0, 0, '{}', 17),
(170, 24, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(171, 24, 'id_jurnal', 'hidden', 'Id Jurnal', 0, 0, 0, 0, 0, 0, '{}', 2),
(172, 24, 'tanggal', 'date', 'Tanggal', 0, 1, 1, 0, 0, 0, '{}', 6),
(173, 24, 'semester', 'text', 'Semester', 0, 1, 1, 0, 0, 0, '{}', 7),
(174, 24, 'tingkat', 'text', 'Tingkat', 0, 1, 1, 0, 0, 0, '{}', 8),
(175, 24, 'jurusan', 'text', 'Jurusan', 0, 1, 1, 0, 0, 0, '{}', 9),
(176, 24, 'rombel', 'text', 'Rombel', 0, 1, 1, 0, 0, 0, '{}', 10),
(177, 24, 'muatan_mapel', 'text', 'Muatan Mapel', 0, 1, 1, 0, 0, 0, '{}', 11),
(178, 24, 'kompetensi_dasar', 'text', 'Kompetensi Dasar', 0, 1, 1, 0, 0, 0, '{}', 12),
(179, 24, 'jurnal', 'text', 'Jurnal', 0, 1, 1, 0, 0, 0, '{}', 13),
(180, 24, 'permasalahan', 'text', 'Permasalahan', 0, 1, 1, 0, 0, 0, '{}', 14),
(181, 24, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 15),
(182, 24, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 16),
(183, 24, 'id_userguru', 'hidden', 'Id Userguru', 0, 0, 0, 0, 0, 0, '{}', 17),
(184, 24, 'departemen', 'text', 'Departemen', 0, 1, 1, 0, 0, 0, '{}', 4),
(185, 24, 'tahun_ajaran', 'text', 'Tahun Ajaran', 0, 1, 1, 0, 0, 0, '{}', 5),
(186, 24, 'status', 'checkbox', 'Status', 0, 1, 1, 1, 0, 0, '{\"on\":\"Terkonfirmasi\",\"off\":\"Menunggu Konfirmasi\",\"checked\":false}', 3),
(187, 24, 'id_userkurikulum', 'hidden', 'Id Userkurikulum', 0, 1, 1, 1, 0, 0, '{\"ShowCurrentlyUseridLoggedIn\":true}', 18),
(188, 25, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(189, 25, 'id_jurnal', 'hidden', 'Id Jurnal', 0, 0, 0, 0, 0, 0, '{}', 2),
(190, 25, 'tanggal', 'date', 'Tanggal', 0, 1, 1, 1, 0, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi tanggal pertemuan !\"}},\"format\":\"%d %B %Y\",\"display\":{\"width\":\"6\",\"id\":\"tanggal\"}}', 6),
(191, 25, 'semester', 'select_dropdown', 'Semester', 0, 1, 1, 1, 0, 0, '{\"options\":{\"\":\"- Pilih Semester -\",\"Ganjil\":\"1 - Ganjil\",\"Genap\":\"2 - Genap\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu semester ini !\"}},\"display\":{\"width\":\"6\",\"id\":\"semester\"}}', 7),
(192, 25, 'tingkat', 'select_dropdown', 'Tingkat', 0, 1, 1, 1, 0, 0, '{\"options\":{\"\":\"- Pilih Tingkat -\",\"X\":\"10 - X\",\"XI\":\"11 - XI\",\"XII\":\"12 - XII\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu tingkat kelas ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"tingkat\"}}', 8),
(193, 25, 'jurusan', 'select_dropdown', 'Jurusan', 0, 1, 1, 1, 0, 0, '{\"options\":{\"\":\"- Pilih Jurusan -\",\"MM\":\"MM - Multimedia\",\"BC\":\"BC - Broadcast\",\"RPL\":\"RPL - Rekayasa Perangkat Lunak\",\"TKJ\":\"TKJ - Teknik Komputer dan Jaringan\",\"TEI\":\"TEI - Teknik Elektronikan Industri\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu jurusan ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"jurusan\"}}', 9),
(194, 25, 'rombel', 'select_dropdown', 'Rombel', 0, 1, 1, 1, 0, 0, '{\"options\":{\"1\":\"1\",\"2\":\"2\",\"3\":\"3\",\"4\":\"4\",\"5\":\"5\",\"\":\"- Pilih Rombel -\"},\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap pilih salah satu rombel kelas ini !\"}},\"display\":{\"width\":\"4\",\"id\":\"rombel\"}}', 10),
(195, 25, 'muatan_mapel', 'text', 'Muatan Mapel', 0, 1, 1, 1, 0, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi materi mapel !\"}},\"display\":{\"width\":\"4\",\"id\":\"materi\"}}', 14),
(196, 25, 'kompetensi_dasar', 'number', 'Kompetensi Dasar', 0, 1, 1, 1, 0, 0, '{\"validation\":{\"rule\":\"required|numeric\",\"messages\":{\"required\":\"Harap beri tahu KD keberapa saat ini !\",\"numeric\":\"Isian harus angka !\"}},\"min\":0,\"display\":{\"width\":\"4\",\"id\":\"kd\"}}', 13),
(197, 25, 'jurnal', 'rich_text_box', 'Jurnal', 0, 1, 1, 1, 0, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi jurnal KBM saat ini !\"}},\"tinymceOptions\":{\"height\":200,\"min_height\":200},\"display\":{\"id\":\"jurnal\"}}', 15),
(198, 25, 'permasalahan', 'rich_text_box', 'Permasalahan', 0, 1, 1, 1, 0, 0, '{\"validation\":{\"rule\":\"required\",\"messages\":{\"required\":\"Harap isi permasalahan\\/kendala pada saat KBM saat ini !\"}},\"tinymceOptions\":{\"height\":200,\"min_height\":200},\"display\":{\"id\":\"permasalahan\"}}', 16),
(199, 25, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 19),
(200, 25, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 20),
(201, 25, 'id_userguru', 'hidden', 'Id Userguru', 0, 0, 0, 0, 0, 0, '{}', 17),
(202, 25, 'departemen', 'text', 'Departemen', 0, 0, 1, 0, 0, 0, '{}', 4),
(203, 25, 'tahun_ajaran', 'text', 'Tahun Ajaran', 0, 0, 1, 0, 0, 0, '{}', 5),
(204, 25, 'status', 'checkbox', 'Status', 0, 1, 1, 0, 0, 0, '{\"on\":\"Terkonfirmasi\",\"off\":\"Menunggu Konfirmasi\",\"checked\":false}', 3),
(205, 25, 'id_userkurikulum', 'hidden', 'Id Userkurikulum', 0, 0, 0, 0, 0, 0, '{}', 18),
(206, 25, 'id_mapel', 'hidden', 'Id Mapel', 0, 0, 1, 1, 0, 0, '{}', 11),
(207, 25, 'tb_jurnal_waitkonfirmasi_belongsto_tb_mapel_relationship', 'relationship', 'Mata Pelajaran:', 0, 1, 1, 1, 0, 0, '{\"display\":{\"width\":\"4\",\"id\":\"mapel\"},\"scope\":\"mapel\",\"model\":\"App\\\\Models\\\\TbMapel\",\"table\":\"tb_mapels\",\"type\":\"belongsTo\",\"column\":\"id_mapel\",\"key\":\"id\",\"label\":\"nama_mapel\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"desc\",\"default_search_key\":null,\"scope\":null}', '2020-10-20 02:03:04', '2020-11-13 23:42:07'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2020-10-20 02:03:04', '2020-10-20 02:03:04'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2020-10-20 02:03:04', '2020-10-20 02:03:04'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2020-10-20 02:03:14', '2020-10-20 02:03:14'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2020-10-20 02:03:16', '2020-10-20 02:03:16'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(8, 'tb_mapels', 'mapel', 'Mapel', 'Mapel', 'voyager-file-text', 'App\\Models\\TbMapel', NULL, NULL, 'CRUD Mata Pelajaran', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-10-23 00:12:45', '2020-11-08 08:56:22'),
(10, 'tb_jurnals', 'jurnal', 'Jurnal', 'Jurnal', 'voyager-pen', 'App\\Models\\TbJurnal', NULL, 'App\\Http\\Controllers\\Voyager\\TbJurnalController', 'CRUD Jurnal', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":\"currentUser\"}', '2020-10-23 00:54:32', '2020-12-02 23:33:05'),
(13, 'tb_jurusan', 'tb-jurusan', 'Tb Jurusan', 'Tb Jurusans', NULL, 'App\\TbJurusan', NULL, NULL, 'CRUD Jurusan', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-10-25 06:21:45', '2020-10-25 06:21:45'),
(14, 'tb_tingkat', 'tb-tingkat', 'Tb Tingkat', 'Tb Tingkats', NULL, 'App\\TbTingkat', NULL, NULL, 'CRUD Tingkat', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-10-25 06:23:45', '2020-10-25 06:23:45'),
(19, 'tb_jurusans', 'jurusan', 'Jurusan', 'Jurusan', NULL, 'App\\TbJurusan', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-08 08:22:16', '2020-11-08 08:26:09'),
(20, 'tb_tingkats', 'tingkat', 'Tingkat', 'Tingkat', NULL, 'App\\TbTingkat', NULL, NULL, 'CRUD Tingkat', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2020-11-08 08:29:46', '2020-11-08 08:29:46'),
(21, 'tb_semesters', 'semester', 'Semester', 'Semester', NULL, 'App\\TbSemester', NULL, NULL, 'CRUD Semester', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-09 05:11:23', '2020-11-09 05:15:25'),
(22, 'tb_materis', 'materi', 'Materi', 'Materi', NULL, 'App\\TbMateri', NULL, 'App\\Http\\Controllers\\TbMateri', 'CRUD Materi', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-11-09 07:47:45', '2020-11-12 23:24:42'),
(23, 'tb_penugasans', 'penugasan', 'Penugasan', 'Penugasan', NULL, 'App\\TbPenugasan', NULL, NULL, 'CRUD Penugasan', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":\"currentUser\"}', '2020-11-20 21:35:21', '2020-11-23 08:11:18'),
(24, 'tb_jurnal_konfirmasis', 'konfirmasi_jurnal', 'Konfirmasi Jurnal', 'Konfirmasi Jurnal', 'voyager-check', 'App\\TbJurnalKonfirmasi', NULL, NULL, 'konfirmasi jurnal', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":\"status\"}', '2020-12-01 08:08:34', '2020-12-02 22:53:45'),
(25, 'tb_jurnal_waitkonfirmasis', 'antri_jurnal', 'Antri Jurnal', 'Antri Jurnal', 'voyager-new', 'App\\TbJurnalWaitkonfirmasi', NULL, NULL, 'menunggu konfirmasi jurnal', 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2020-12-02 08:54:48', '2020-12-02 09:19:07');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2020-10-20 02:03:06', '2020-10-20 02:03:06'),
(2, 'pengajar', '2020-10-25 23:40:07', '2020-10-25 23:40:07'),
(3, 'kurikulum', '2020-12-01 08:09:56', '2020-12-01 08:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2020-10-20 02:03:06', '2020-10-20 02:03:06', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 6, '2020-10-20 02:03:06', '2020-11-20 21:35:52', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 5, '2020-10-20 02:03:06', '2020-11-20 21:35:51', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 4, '2020-10-20 02:03:06', '2020-11-20 21:35:51', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 10, '2020-10-20 02:03:06', '2020-11-20 21:35:52', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 1, '2020-10-20 02:03:06', '2020-10-22 23:30:04', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 2, '2020-10-20 02:03:06', '2020-10-22 23:30:04', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 3, '2020-10-20 02:03:06', '2020-10-22 23:30:04', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 4, '2020-10-20 02:03:06', '2020-10-22 23:30:04', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 11, '2020-10-20 02:03:06', '2020-11-20 21:35:52', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 9, '2020-10-20 02:03:15', '2020-11-20 21:35:52', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, NULL, 7, '2020-10-20 02:03:17', '2020-11-20 21:35:52', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, NULL, 8, '2020-10-20 02:03:18', '2020-11-20 21:35:52', 'voyager.pages.index', NULL),
(14, 1, 'Hooks', '', '_self', 'voyager-hook', NULL, 5, 5, '2020-10-20 02:03:21', '2020-10-22 23:30:04', 'voyager.hooks', NULL),
(16, 1, 'tugas jurnal', '', '_self', 'voyager-window-list', '#000000', NULL, 2, '2020-10-22 23:28:23', '2020-10-22 23:31:22', NULL, ''),
(17, 1, 'Mapel', '', '_self', NULL, '#000000', 21, 4, '2020-10-23 00:12:46', '2020-11-09 07:48:07', 'voyager.mapel.index', 'null'),
(19, 1, 'Jurnal', '', '_self', 'voyager-pen', '#000000', 16, 1, '2020-10-23 00:54:32', '2020-10-30 04:25:14', 'voyager.jurnal.index', 'null'),
(21, 1, 'data jurnal', '', '_self', 'voyager-data', '#000000', NULL, 3, '2020-10-25 06:22:30', '2020-10-25 06:22:42', NULL, ''),
(25, 2, 'Tugas Jurnal', '', '_self', 'voyager-window-list', '#000000', NULL, 1, '2020-10-25 23:40:55', '2020-10-25 23:41:55', NULL, ''),
(26, 2, 'Jurnal', '', '_self', 'voyager-pen', '#000000', 25, 1, '2020-10-25 23:40:55', '2020-10-30 04:26:24', 'voyager.jurnal.index', 'null'),
(27, 1, 'Jurusan', '', '_self', NULL, '#000000', 21, 2, '2020-11-08 08:22:16', '2020-11-30 07:34:11', 'voyager.jurusan.index', 'null'),
(28, 1, 'Tingkat', '', '_self', NULL, NULL, 21, 1, '2020-11-08 08:29:46', '2020-11-30 07:34:11', 'voyager.tingkat.index', NULL),
(29, 1, 'Semester', '', '_self', NULL, NULL, 21, 3, '2020-11-09 05:11:23', '2020-11-09 07:48:07', 'voyager.semester.index', NULL),
(30, 1, 'Materi', '', '_self', NULL, NULL, 21, 5, '2020-11-09 07:47:45', '2020-11-09 07:48:07', 'voyager.materi.index', NULL),
(31, 1, 'Penugasan', '', '_self', 'voyager-book', '#000000', 16, 4, '2020-11-20 21:35:22', '2020-12-02 08:55:06', 'voyager.penugasan.index', 'null'),
(32, 1, 'Konfirmasi Jurnal', '', '_self', 'voyager-check', NULL, 16, 3, '2020-12-01 08:08:34', '2020-12-02 08:55:06', 'voyager.konfirmasi_jurnal.index', NULL),
(33, 3, 'Tugas Jurnal', '', '_self', NULL, '#000000', NULL, 1, '2020-12-01 08:10:19', '2020-12-01 08:10:59', NULL, ''),
(34, 3, 'Konfirmasi Jurnal', '/admin/konfirmasi_jurnal', '_self', 'voyager-check', '#000000', 33, 1, '2020-12-01 08:10:57', '2020-12-01 08:11:15', NULL, ''),
(35, 1, 'Antri Jurnal', '', '_self', 'voyager-new', NULL, 16, 2, '2020-12-02 08:54:48', '2020-12-02 08:55:03', 'voyager.antri_jurnal.index', NULL),
(36, 2, 'Antri Jurnal', '', '_self', 'voyager-new', '#000000', 25, 2, '2020-12-02 08:56:06', '2020-12-02 08:56:13', 'voyager.antri_jurnal.index', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2016_01_01_000000_create_pages_table', 2),
(25, '2016_01_01_000000_create_posts_table', 2),
(26, '2016_02_15_204651_create_categories_table', 2),
(27, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2020-10-20 02:03:18', '2020-10-20 02:03:18');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(2, 'browse_bread', NULL, '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(3, 'browse_database', NULL, '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(4, 'browse_media', NULL, '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(5, 'browse_compass', NULL, '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(6, 'browse_menus', 'menus', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(7, 'read_menus', 'menus', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(8, 'edit_menus', 'menus', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(9, 'add_menus', 'menus', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(10, 'delete_menus', 'menus', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(11, 'browse_roles', 'roles', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(12, 'read_roles', 'roles', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(13, 'edit_roles', 'roles', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(14, 'add_roles', 'roles', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(15, 'delete_roles', 'roles', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(16, 'browse_users', 'users', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(17, 'read_users', 'users', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(18, 'edit_users', 'users', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(19, 'add_users', 'users', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(20, 'delete_users', 'users', '2020-10-20 02:03:08', '2020-10-20 02:03:08'),
(21, 'browse_settings', 'settings', '2020-10-20 02:03:08', '2020-10-20 02:03:08'),
(22, 'read_settings', 'settings', '2020-10-20 02:03:08', '2020-10-20 02:03:08'),
(23, 'edit_settings', 'settings', '2020-10-20 02:03:08', '2020-10-20 02:03:08'),
(24, 'add_settings', 'settings', '2020-10-20 02:03:08', '2020-10-20 02:03:08'),
(25, 'delete_settings', 'settings', '2020-10-20 02:03:08', '2020-10-20 02:03:08'),
(26, 'browse_categories', 'categories', '2020-10-20 02:03:15', '2020-10-20 02:03:15'),
(27, 'read_categories', 'categories', '2020-10-20 02:03:15', '2020-10-20 02:03:15'),
(28, 'edit_categories', 'categories', '2020-10-20 02:03:15', '2020-10-20 02:03:15'),
(29, 'add_categories', 'categories', '2020-10-20 02:03:15', '2020-10-20 02:03:15'),
(30, 'delete_categories', 'categories', '2020-10-20 02:03:15', '2020-10-20 02:03:15'),
(31, 'browse_posts', 'posts', '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(32, 'read_posts', 'posts', '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(33, 'edit_posts', 'posts', '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(34, 'add_posts', 'posts', '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(35, 'delete_posts', 'posts', '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(36, 'browse_pages', 'pages', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(37, 'read_pages', 'pages', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(38, 'edit_pages', 'pages', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(39, 'add_pages', 'pages', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(40, 'delete_pages', 'pages', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(41, 'browse_hooks', NULL, '2020-10-20 02:03:21', '2020-10-20 02:03:21'),
(47, 'browse_tb_mapels', 'tb_mapels', '2020-10-23 00:12:46', '2020-10-23 00:12:46'),
(48, 'read_tb_mapels', 'tb_mapels', '2020-10-23 00:12:46', '2020-10-23 00:12:46'),
(49, 'edit_tb_mapels', 'tb_mapels', '2020-10-23 00:12:46', '2020-10-23 00:12:46'),
(50, 'add_tb_mapels', 'tb_mapels', '2020-10-23 00:12:46', '2020-10-23 00:12:46'),
(51, 'delete_tb_mapels', 'tb_mapels', '2020-10-23 00:12:46', '2020-10-23 00:12:46'),
(57, 'browse_tb_jurnals', 'tb_jurnals', '2020-10-23 00:54:32', '2020-10-23 00:54:32'),
(58, 'read_tb_jurnals', 'tb_jurnals', '2020-10-23 00:54:32', '2020-10-23 00:54:32'),
(59, 'edit_tb_jurnals', 'tb_jurnals', '2020-10-23 00:54:32', '2020-10-23 00:54:32'),
(60, 'add_tb_jurnals', 'tb_jurnals', '2020-10-23 00:54:32', '2020-10-23 00:54:32'),
(61, 'delete_tb_jurnals', 'tb_jurnals', '2020-10-23 00:54:32', '2020-10-23 00:54:32'),
(62, 'browse_tb_jurusan', 'tb_jurusan', '2020-10-25 06:21:45', '2020-10-25 06:21:45'),
(63, 'read_tb_jurusan', 'tb_jurusan', '2020-10-25 06:21:45', '2020-10-25 06:21:45'),
(64, 'edit_tb_jurusan', 'tb_jurusan', '2020-10-25 06:21:45', '2020-10-25 06:21:45'),
(65, 'add_tb_jurusan', 'tb_jurusan', '2020-10-25 06:21:45', '2020-10-25 06:21:45'),
(66, 'delete_tb_jurusan', 'tb_jurusan', '2020-10-25 06:21:45', '2020-10-25 06:21:45'),
(67, 'browse_tb_tingkat', 'tb_tingkat', '2020-10-25 06:23:45', '2020-10-25 06:23:45'),
(68, 'read_tb_tingkat', 'tb_tingkat', '2020-10-25 06:23:45', '2020-10-25 06:23:45'),
(69, 'edit_tb_tingkat', 'tb_tingkat', '2020-10-25 06:23:45', '2020-10-25 06:23:45'),
(70, 'add_tb_tingkat', 'tb_tingkat', '2020-10-25 06:23:45', '2020-10-25 06:23:45'),
(71, 'delete_tb_tingkat', 'tb_tingkat', '2020-10-25 06:23:45', '2020-10-25 06:23:45'),
(82, 'browse_tb_jurusans', 'tb_jurusans', '2020-11-08 08:22:16', '2020-11-08 08:22:16'),
(83, 'read_tb_jurusans', 'tb_jurusans', '2020-11-08 08:22:16', '2020-11-08 08:22:16'),
(84, 'edit_tb_jurusans', 'tb_jurusans', '2020-11-08 08:22:16', '2020-11-08 08:22:16'),
(85, 'add_tb_jurusans', 'tb_jurusans', '2020-11-08 08:22:16', '2020-11-08 08:22:16'),
(86, 'delete_tb_jurusans', 'tb_jurusans', '2020-11-08 08:22:16', '2020-11-08 08:22:16'),
(87, 'browse_tb_tingkats', 'tb_tingkats', '2020-11-08 08:29:46', '2020-11-08 08:29:46'),
(88, 'read_tb_tingkats', 'tb_tingkats', '2020-11-08 08:29:46', '2020-11-08 08:29:46'),
(89, 'edit_tb_tingkats', 'tb_tingkats', '2020-11-08 08:29:46', '2020-11-08 08:29:46'),
(90, 'add_tb_tingkats', 'tb_tingkats', '2020-11-08 08:29:46', '2020-11-08 08:29:46'),
(91, 'delete_tb_tingkats', 'tb_tingkats', '2020-11-08 08:29:46', '2020-11-08 08:29:46'),
(92, 'browse_tb_semesters', 'tb_semesters', '2020-11-09 05:11:23', '2020-11-09 05:11:23'),
(93, 'read_tb_semesters', 'tb_semesters', '2020-11-09 05:11:23', '2020-11-09 05:11:23'),
(94, 'edit_tb_semesters', 'tb_semesters', '2020-11-09 05:11:23', '2020-11-09 05:11:23'),
(95, 'add_tb_semesters', 'tb_semesters', '2020-11-09 05:11:23', '2020-11-09 05:11:23'),
(96, 'delete_tb_semesters', 'tb_semesters', '2020-11-09 05:11:23', '2020-11-09 05:11:23'),
(97, 'browse_tb_materis', 'tb_materis', '2020-11-09 07:47:45', '2020-11-09 07:47:45'),
(98, 'read_tb_materis', 'tb_materis', '2020-11-09 07:47:45', '2020-11-09 07:47:45'),
(99, 'edit_tb_materis', 'tb_materis', '2020-11-09 07:47:45', '2020-11-09 07:47:45'),
(100, 'add_tb_materis', 'tb_materis', '2020-11-09 07:47:45', '2020-11-09 07:47:45'),
(101, 'delete_tb_materis', 'tb_materis', '2020-11-09 07:47:45', '2020-11-09 07:47:45'),
(102, 'browse_tb_penugasans', 'tb_penugasans', '2020-11-20 21:35:21', '2020-11-20 21:35:21'),
(103, 'read_tb_penugasans', 'tb_penugasans', '2020-11-20 21:35:21', '2020-11-20 21:35:21'),
(104, 'edit_tb_penugasans', 'tb_penugasans', '2020-11-20 21:35:21', '2020-11-20 21:35:21'),
(105, 'add_tb_penugasans', 'tb_penugasans', '2020-11-20 21:35:21', '2020-11-20 21:35:21'),
(106, 'delete_tb_penugasans', 'tb_penugasans', '2020-11-20 21:35:21', '2020-11-20 21:35:21'),
(107, 'browse_tb_jurnal_konfirmasis', 'tb_jurnal_konfirmasis', '2020-12-01 08:08:34', '2020-12-01 08:08:34'),
(108, 'read_tb_jurnal_konfirmasis', 'tb_jurnal_konfirmasis', '2020-12-01 08:08:34', '2020-12-01 08:08:34'),
(109, 'edit_tb_jurnal_konfirmasis', 'tb_jurnal_konfirmasis', '2020-12-01 08:08:34', '2020-12-01 08:08:34'),
(110, 'add_tb_jurnal_konfirmasis', 'tb_jurnal_konfirmasis', '2020-12-01 08:08:34', '2020-12-01 08:08:34'),
(111, 'delete_tb_jurnal_konfirmasis', 'tb_jurnal_konfirmasis', '2020-12-01 08:08:34', '2020-12-01 08:08:34'),
(112, 'browse_tb_jurnal_waitkonfirmasis', 'tb_jurnal_waitkonfirmasis', '2020-12-02 08:54:48', '2020-12-02 08:54:48'),
(113, 'read_tb_jurnal_waitkonfirmasis', 'tb_jurnal_waitkonfirmasis', '2020-12-02 08:54:48', '2020-12-02 08:54:48'),
(114, 'edit_tb_jurnal_waitkonfirmasis', 'tb_jurnal_waitkonfirmasis', '2020-12-02 08:54:48', '2020-12-02 08:54:48'),
(115, 'add_tb_jurnal_waitkonfirmasis', 'tb_jurnal_waitkonfirmasis', '2020-12-02 08:54:48', '2020-12-02 08:54:48'),
(116, 'delete_tb_jurnal_waitkonfirmasis', 'tb_jurnal_waitkonfirmasis', '2020-12-02 08:54:48', '2020-12-02 08:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(103, 3),
(107, 1),
(107, 4),
(108, 1),
(108, 4),
(109, 1),
(109, 4),
(110, 1),
(111, 1),
(112, 1),
(112, 2),
(113, 1),
(113, 2),
(114, 1),
(114, 2),
(115, 1),
(116, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\r\n                <h2>We can use all kinds of format!</h2>\r\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-20 02:03:17', '2020-10-20 02:03:17'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\r\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\r\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2020-10-20 02:03:17', '2020-10-20 02:03:17');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2020-10-20 02:03:07', '2020-10-20 02:03:07'),
(2, 'guru', 'Guru Pelajaran', '2020-10-20 02:03:07', '2020-11-06 00:00:19'),
(3, 'siswa', 'siswa', '2020-11-23 08:48:31', '2020-11-23 08:48:31'),
(4, 'kurikulum', 'Petugas Kurikulum', '2020-11-30 07:28:06', '2020-11-30 07:28:29');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Jurnal.in', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Selamat Datang di Jurnal.in. aplikasi tugas kelompok project jurnal', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\October2020\\FW7ivK3CnACIl8aofq7x.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings\\October2020\\Zzwpe5JXa6q3R071Wc6m.jpeg', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Jurnal.in', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Selamat Datang di Jurnal.in. aplikasi tugas kelompok project jurnal', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\October2020\\FdbMAmVxxg8sculZsWxb.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\October2020\\ZOtps8ibFocTntui9hWK.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurnals`
--

CREATE TABLE `tb_jurnals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` timestamp NULL DEFAULT NULL,
  `semester` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkat` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rombel` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_mapel` bigint(20) DEFAULT NULL,
  `muatan_mapel` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kompetensi_dasar` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurnal` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permasalahan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_userguru` bigint(20) DEFAULT NULL,
  `departemen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'SMK',
  `tahun_ajaran` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2020/2021',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `id_userkurikulum` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_jurnals`
--

INSERT INTO `tb_jurnals` (`id`, `tanggal`, `semester`, `tingkat`, `jurusan`, `rombel`, `id_mapel`, `muatan_mapel`, `kompetensi_dasar`, `jurnal`, `permasalahan`, `created_at`, `updated_at`, `id_userguru`, `departemen`, `tahun_ajaran`, `status`, `id_userkurikulum`) VALUES
(10, '2020-11-23 17:00:00', 'Ganjil', 'XII', 'RPL', '2', 12, 'qwerty', '2.0', '<p>qwerty</p>', '<p>-</p>', '2020-12-01 08:29:24', '2020-12-01 19:25:32', 2, 'SMK', '2020/2021', '1', 4),
(11, '2020-11-24 17:00:00', 'Ganjil', 'XII', 'RPL', '2', 1, 'qwerty', '1.0', '<p>qwerty</p>', '<p>-</p>', '2020-12-01 08:33:17', '2020-12-01 08:37:54', 2, 'SMK', '2020/2021', '1', 4),
(12, '2020-12-01 17:00:00', 'Ganjil', 'XII', 'RPL', '2', 12, 'ujian pas', '3', '<p>ujian pas</p>', '<p>-</p>', '2020-12-02 09:22:25', '2020-12-02 09:22:25', 3, 'SMK', '2020/2021', '1', 4),
(14, '2020-12-03 17:00:00', 'Ganjil', 'XI', 'RPL', '3', 3, '1', '1', '<p>12</p>', '<p>1</p>', '2020-12-02 22:48:14', '2020-12-02 22:59:40', 22, 'SMK', '2020/2021', '1', 2),
(16, '2020-03-11 23:44:00', 'Ganjil', 'X', 'BC', '3', 3, '1', '1', '<p>1</p>', '<p>1</p>', '2020-12-02 23:44:46', '2020-12-02 23:44:46', 2, 'SMK', '2020/2021', '0', NULL);

--
-- Triggers `tb_jurnals`
--
DELIMITER $$
CREATE TRIGGER `duplikat_tbjurnal_forKonfirmasi` AFTER INSERT ON `tb_jurnals` FOR EACH ROW BEGIN
    INSERT INTO tb_jurnal_konfirmasis set 
    id_jurnal = NEW.id,
    tanggal = NEW.tanggal,
    semester = NEW.semester,
    tingkat = NEW.tingkat,
    jurusan = NEW.jurusan,
    rombel = NEW.rombel,
    muatan_mapel = NEW.muatan_mapel,
    kompetensi_dasar = NEW.kompetensi_dasar,
    jurnal = NEW.jurnal,
    permasalahan = NEW.permasalahan,
    id_userguru = NEW.id_userguru,
    status = NEW.status; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `duplikat_tbjurnal_forWaitKonfirmasi` AFTER INSERT ON `tb_jurnals` FOR EACH ROW BEGIN
    INSERT INTO tb_jurnal_waitkonfirmasis set 
    id_jurnal = NEW.id,
    tanggal = NEW.tanggal,
    semester = NEW.semester,
    tingkat = NEW.tingkat,
    jurusan = NEW.jurusan,
    rombel = NEW.rombel,
    muatan_mapel = NEW.muatan_mapel,
    kompetensi_dasar = NEW.kompetensi_dasar,
    jurnal = NEW.jurnal,
    permasalahan = NEW.permasalahan,
    id_userguru = NEW.id_userguru,
    status = NEW.status,
    id_mapel = NEW.id_mapel;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurnal_konfirmasis`
--

CREATE TABLE `tb_jurnal_konfirmasis` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_jurnal` bigint(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rombel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `muatan_mapel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kompetensi_dasar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurnal` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permasalahan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_userguru` bigint(20) DEFAULT NULL,
  `departemen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'SMK',
  `tahun_ajaran` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2020/2021',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `id_userkurikulum` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_jurnal_konfirmasis`
--

INSERT INTO `tb_jurnal_konfirmasis` (`id`, `id_jurnal`, `tanggal`, `semester`, `tingkat`, `jurusan`, `rombel`, `muatan_mapel`, `kompetensi_dasar`, `jurnal`, `permasalahan`, `created_at`, `updated_at`, `id_userguru`, `departemen`, `tahun_ajaran`, `status`, `id_userkurikulum`) VALUES
(3, 10, '2020-12-24', 'Ganjil', 'XII', 'RPL', '2', 'qwerty', '2', '<p>qwerty</p>', '<p>-</p>', NULL, '2020-12-01 08:30:23', NULL, 'SMK', '2020/2021', '1', NULL),
(4, 11, '2020-11-25', 'Ganjil', 'XII', 'RPL', '2', 'qwerty', '1', '<p>qwerty</p>', '<p>-</p>', NULL, '2020-12-01 08:33:51', 2, 'SMK', '2020/2021', '1', 4),
(5, 12, '2020-12-02', 'Ganjil', 'XII', 'RPL', '2', 'ujian pas', '3', '<p>ujian pas</p>', '<p>-</p>', NULL, '2020-12-02 09:34:32', 3, 'SMK', '2020/2021', '1', 4),
(7, 14, '2020-12-04', 'Ganjil', 'XI', 'RPL', '3', '1', '1', '<p>1</p>', '<p>1</p>', NULL, '2020-12-02 22:58:29', 22, 'SMK', '2020/2021', '1', 2),
(8, 15, NULL, 'Ganjil', 'X', 'BC', '3', '3', '3', '<p>3</p>', '<p>3</p>', NULL, '2020-12-02 23:45:31', 2, 'SMK', '2020/2021', '1', 2),
(9, 16, '2020-03-12', 'Ganjil', 'X', 'BC', '3', '1', '1', '<p>1</p>', '<p>1</p>', NULL, NULL, 2, 'SMK', '2020/2021', '0', NULL);

--
-- Triggers `tb_jurnal_konfirmasis`
--
DELIMITER $$
CREATE TRIGGER `update_tbjurnal_afterUpKonfirmasi` AFTER UPDATE ON `tb_jurnal_konfirmasis` FOR EACH ROW BEGIN
    UPDATE tb_jurnals set 
    id_userkurikulum = NEW.id_userkurikulum,
    status = NEW.status,
    updated_at = NEW.updated_at
    WHERE
 	id = NEW.id_jurnal;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_tbwaitkonfirmasi_afterUpKonfirmasi` AFTER UPDATE ON `tb_jurnal_konfirmasis` FOR EACH ROW BEGIN
    UPDATE tb_jurnal_waitkonfirmasis set 
    id_userkurikulum = NEW.id_userkurikulum,
    status = NEW.status,
    updated_at = NEW.updated_at
    WHERE
 	id_jurnal = NEW.id_jurnal;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurnal_waitkonfirmasis`
--

CREATE TABLE `tb_jurnal_waitkonfirmasis` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_jurnal` bigint(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rombel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `muatan_mapel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kompetensi_dasar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jurnal` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permasalahan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_userguru` bigint(20) DEFAULT NULL,
  `departemen` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'SMK',
  `tahun_ajaran` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '2020/2021',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_userkurikulum` bigint(20) DEFAULT NULL,
  `id_mapel` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_jurnal_waitkonfirmasis`
--

INSERT INTO `tb_jurnal_waitkonfirmasis` (`id`, `id_jurnal`, `tanggal`, `semester`, `tingkat`, `jurusan`, `rombel`, `muatan_mapel`, `kompetensi_dasar`, `jurnal`, `permasalahan`, `created_at`, `updated_at`, `id_userguru`, `departemen`, `tahun_ajaran`, `status`, `id_userkurikulum`, `id_mapel`) VALUES
(3, 14, '2020-12-04', 'Ganjil', 'XI', 'RPL', '3', '1', '1', '<p>1</p>', '<p>1</p>', NULL, '2020-12-02 22:58:29', 22, 'SMK', '2020/2021', '1', 2, 3),
(4, 15, NULL, 'Ganjil', 'X', 'BC', '3', '3', '3', '<p>3</p>', '<p>3</p>', NULL, '2020-12-02 23:45:31', 2, 'SMK', '2020/2021', '1', 2, 1),
(5, 16, '2020-03-12', 'Ganjil', 'X', 'BC', '3', '1', '1', '<p>1</p>', '<p>1</p>', NULL, NULL, 2, 'SMK', '2020/2021', '0', NULL, 3);

--
-- Triggers `tb_jurnal_waitkonfirmasis`
--
DELIMITER $$
CREATE TRIGGER `update_tbjurnal_afterUpWaitKonfirmasi` AFTER UPDATE ON `tb_jurnal_waitkonfirmasis` FOR EACH ROW BEGIN
    UPDATE tb_jurnals set 
    tanggal = NEW.tanggal,
    semester = NEW.semester,
    tingkat = NEW.tingkat,
    jurusan = NEW.jurusan,
    rombel = NEW.rombel,
    muatan_mapel = NEW.muatan_mapel,
    kompetensi_dasar = NEW.kompetensi_dasar,
    jurnal = NEW.jurnal,
    permasalahan = NEW.permasalahan
    WHERE
 	id = NEW.id_jurnal;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusans`
--

CREATE TABLE `tb_jurusans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_jurusans`
--

INSERT INTO `tb_jurusans` (`id`, `jurusan`, `created_at`, `updated_at`) VALUES
(1, 'MM - Multimedia', '2020-11-08 08:26:55', '2020-11-08 08:26:55'),
(2, 'BC - Broadcast', '2020-11-08 08:27:15', '2020-11-08 08:27:15'),
(3, 'RPL - Rekayasa Perangkat Lunak', '2020-11-08 08:27:38', '2020-11-08 08:27:38'),
(4, 'TKJ - Teknik Komputer dan Jaringan', '2020-11-08 08:28:05', '2020-11-08 08:28:05'),
(5, 'TEI - Teknik Elektronika Industri', '2020-11-08 08:28:39', '2020-11-08 08:28:39');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mapels`
--

CREATE TABLE `tb_mapels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_mapel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_tingkat` bigint(20) DEFAULT NULL,
  `id_jurusan` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_mapels`
--

INSERT INTO `tb_mapels` (`id`, `nama_mapel`, `created_at`, `updated_at`, `id_tingkat`, `id_jurusan`) VALUES
(1, 'Bahasa Indonesia', '2020-10-25 06:03:33', '2020-10-25 06:03:33', NULL, NULL),
(2, 'Bahasa Inggris', '2020-10-25 06:03:43', '2020-10-25 06:03:43', NULL, NULL),
(3, 'Bahasa Sunda', '2020-10-25 06:03:51', '2020-10-25 06:03:51', NULL, NULL),
(4, 'Matematika', '2020-10-25 06:04:02', '2020-10-25 06:04:02', NULL, NULL),
(5, 'PAI - Pendidikan Agama Islam', '2020-10-25 06:04:27', '2020-11-02 19:45:12', NULL, NULL),
(6, 'PAK - Pendidikan Agama Kristen', '2020-10-25 06:04:39', '2020-11-02 19:44:57', NULL, NULL),
(7, 'Fisika', '2020-10-25 06:05:11', '2020-10-25 06:05:11', NULL, NULL),
(8, 'Kimia', '2020-10-25 06:05:17', '2020-10-25 06:05:17', NULL, NULL),
(9, 'SBK - Seni Budaya dan Prakarya', '2020-10-25 06:05:00', '2020-11-02 19:44:32', NULL, NULL),
(10, 'PKN - Pendidikan Kewarganegaraan', '2020-10-25 06:05:59', '2020-11-02 19:44:13', NULL, NULL),
(11, 'PJOK - Pendidikan Jasmani, Olahraga dan Kesehatan', '2020-10-25 06:07:29', '2020-11-02 19:41:08', NULL, NULL),
(12, 'PBO - Pemrograman Berorientasi Objek', '2020-10-25 06:08:56', '2020-11-02 19:40:49', NULL, NULL),
(13, 'PWPB - Pemograman Web dan Perangkat Bergerak', '2020-10-25 06:09:21', '2020-11-02 19:40:32', NULL, NULL),
(14, 'ProgDas - Pemrograman Dasar', '2020-10-25 06:09:43', '2020-11-02 19:40:15', NULL, NULL),
(15, 'Basis Data', '2020-10-25 06:09:52', '2020-10-25 06:09:52', NULL, NULL),
(16, 'DDG - Dasar Desain Grafis', '2020-10-25 07:18:16', '2020-11-02 19:43:54', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tb_materis`
--

CREATE TABLE `tb_materis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_tingkat` bigint(20) DEFAULT NULL,
  `id_jurusan` bigint(20) DEFAULT NULL,
  `id_semester` bigint(20) DEFAULT NULL,
  `id_mapel` bigint(20) DEFAULT NULL,
  `kd` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_materi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_materis`
--

INSERT INTO `tb_materis` (`id`, `id_tingkat`, `id_jurusan`, `id_semester`, `id_mapel`, `kd`, `nama_materi`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, NULL, NULL, '[{\"key\":\"1.0\",\"value\":\"1.0\"},{\"key\":\"1.1\",\"value\":\"1.1\"},{\"key\":\"1.2\",\"value\":\"1.2\"}]', NULL, '2020-11-10 05:19:04', '2020-11-10 05:19:04');

-- --------------------------------------------------------

--
-- Table structure for table `tb_penugasans`
--

CREATE TABLE `tb_penugasans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_tugas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `untuk_kd` bigint(20) DEFAULT NULL,
  `untuk_kelas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `untuk_jurusan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `untuk_rombel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_user` bigint(20) DEFAULT NULL,
  `file_penugasan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_penugasans`
--

INSERT INTO `tb_penugasans` (`id`, `nama_tugas`, `untuk_kd`, `untuk_kelas`, `untuk_jurusan`, `untuk_rombel`, `created_at`, `updated_at`, `id_user`, `file_penugasan`) VALUES
(1, '<p>tugas ada di file modil 2 pwpb</p>', 2, 'XII', 'RPL', '2', '2020-11-23 08:42:27', '2020-11-23 08:42:27', NULL, '[]'),
(2, '<p>-</p>', 4, 'XII', 'RPL', '2', '2020-11-23 19:51:25', '2020-11-23 19:51:25', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pivot_mapel_jurusans`
--

CREATE TABLE `tb_pivot_mapel_jurusans` (
  `tb_mapel_id` bigint(20) UNSIGNED NOT NULL,
  `tb_jurusan_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_pivot_mapel_jurusans`
--

INSERT INTO `tb_pivot_mapel_jurusans` (`tb_mapel_id`, `tb_jurusan_id`) VALUES
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(12, 3),
(13, 3),
(14, 3),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pivot_mapel_tingkats`
--

CREATE TABLE `tb_pivot_mapel_tingkats` (
  `tb_mapel_id` bigint(20) UNSIGNED NOT NULL,
  `tb_tingkat_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_pivot_mapel_tingkats`
--

INSERT INTO `tb_pivot_mapel_tingkats` (`tb_mapel_id`, `tb_tingkat_id`) VALUES
(11, 1),
(12, 3),
(13, 3),
(14, 2),
(9, 1),
(17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pivot_materi_jurusans`
--

CREATE TABLE `tb_pivot_materi_jurusans` (
  `tb_materi_id` bigint(20) UNSIGNED NOT NULL,
  `tb_jurusan_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_semesters`
--

CREATE TABLE `tb_semesters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_semester` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dari_bulan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sampai_bulan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_semesters`
--

INSERT INTO `tb_semesters` (`id`, `nama_semester`, `dari_bulan`, `sampai_bulan`, `created_at`, `updated_at`) VALUES
(1, '1 - Ganjil', '7', '12', '2020-11-09 05:13:39', '2020-11-09 05:13:39'),
(2, '2 - Genap', '1', '6', '2020-11-09 05:14:01', '2020-11-09 05:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tingkats`
--

CREATE TABLE `tb_tingkats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tingkat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tb_tingkats`
--

INSERT INTO `tb_tingkats` (`id`, `tingkat`, `created_at`, `updated_at`) VALUES
(1, '10 - X', '2020-11-08 08:30:26', '2020-11-08 08:30:26'),
(2, '11 - XI', '2020-11-08 08:30:36', '2020-11-08 08:30:36'),
(3, '12 - XII', '2020-11-08 08:30:46', '2020-11-08 08:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2020-10-20 02:03:18', '2020-10-20 02:03:18'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2020-10-20 02:03:19', '2020-10-20 02:03:19'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2020-10-20 02:03:20', '2020-10-20 02:03:20'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2020-10-20 02:03:20', '2020-10-20 02:03:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_mapel` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `id_mapel`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, '$2y$10$lYT6sdRHFblzgjnWYjcJbeGbczmbdDJ22nHoAczJcu0fKbPGGjjuK', 'SLmYcFoK7neW2ANS5ivgY2YQ7Tv9V7jW0AZh8gos0FE98DCvU2zDN7wLGdUS', NULL, '2020-10-20 02:03:16', '2020-10-20 02:03:16', NULL),
(2, 1, 'Bayu Admin', 'bayu@admin.com', 'users\\October2020\\mPrVGWKeF0mddE0PWzMx.jpg', NULL, '$2y$10$uPvuRMfS1FSZ4U7NypguneBvJNyaJ/yrkaaBmi0PQ83a84V.9Ruo6', 'PofgRyanWGomtPWCM7K47ci6noj4Inx99osDaA4Lm9Jgl2yWPNrThl0w2Ehb', '{\"locale\":\"id\"}', '2020-10-20 04:56:20', '2020-10-30 05:28:31', NULL),
(3, 2, 'Bayu Guru', 'bayu@guru.com', 'users/default.png', NULL, '$2y$10$4e2v0ObI32/TS1dXoR1T8.TMWR9ocEpvsmdlPTHehLBwA2UVf8iZW', NULL, '{\"locale\":\"id\"}', '2020-10-23 08:17:13', '2020-11-05 20:14:13', 12),
(4, 4, 'Bayu Kurikulum', 'bayu@kurikulum.com', 'users/default.png', NULL, '$2y$10$zmf.lkoEb7wDgz53xV9iluiz8fErVmDlalVzdpbPoHZHuxhJ/.r0u', NULL, NULL, '2020-11-30 07:31:14', '2020-11-30 07:31:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voyager_themes`
--

CREATE TABLE `voyager_themes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voyager_theme_options`
--

CREATE TABLE `voyager_theme_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `voyager_theme_id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `tb_jurnals`
--
ALTER TABLE `tb_jurnals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_jurnal_konfirmasis`
--
ALTER TABLE `tb_jurnal_konfirmasis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_jurnal_waitkonfirmasis`
--
ALTER TABLE `tb_jurnal_waitkonfirmasis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_jurusans`
--
ALTER TABLE `tb_jurusans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mapels`
--
ALTER TABLE `tb_mapels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_materis`
--
ALTER TABLE `tb_materis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_penugasans`
--
ALTER TABLE `tb_penugasans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pivot_mapel_jurusans`
--
ALTER TABLE `tb_pivot_mapel_jurusans`
  ADD KEY `tb_pivot_mapel_jurusans_tb_mapel_id_index` (`tb_mapel_id`),
  ADD KEY `tb_pivot_mapel_jurusans_tb_jurusan_id_index` (`tb_jurusan_id`);

--
-- Indexes for table `tb_pivot_mapel_tingkats`
--
ALTER TABLE `tb_pivot_mapel_tingkats`
  ADD KEY `tb_pivot_mapel_id_mapel_index` (`tb_mapel_id`),
  ADD KEY `tb_pivot_mapel_id_tingkat_index` (`tb_tingkat_id`);

--
-- Indexes for table `tb_pivot_materi_jurusans`
--
ALTER TABLE `tb_pivot_materi_jurusans`
  ADD KEY `tb_pivot_materi_jurusans_tb_materi_id_index` (`tb_materi_id`);

--
-- Indexes for table `tb_semesters`
--
ALTER TABLE `tb_semesters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_tingkats`
--
ALTER TABLE `tb_tingkats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indexes for table `voyager_themes`
--
ALTER TABLE `voyager_themes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `voyager_themes_folder_unique` (`folder`);

--
-- Indexes for table `voyager_theme_options`
--
ALTER TABLE `voyager_theme_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voyager_theme_options_voyager_theme_id_index` (`voyager_theme_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_jurnals`
--
ALTER TABLE `tb_jurnals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tb_jurnal_konfirmasis`
--
ALTER TABLE `tb_jurnal_konfirmasis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_jurnal_waitkonfirmasis`
--
ALTER TABLE `tb_jurnal_waitkonfirmasis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_jurusans`
--
ALTER TABLE `tb_jurusans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_mapels`
--
ALTER TABLE `tb_mapels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_materis`
--
ALTER TABLE `tb_materis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_penugasans`
--
ALTER TABLE `tb_penugasans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_semesters`
--
ALTER TABLE `tb_semesters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_tingkats`
--
ALTER TABLE `tb_tingkats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `voyager_themes`
--
ALTER TABLE `voyager_themes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voyager_theme_options`
--
ALTER TABLE `voyager_theme_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `voyager_theme_options`
--
ALTER TABLE `voyager_theme_options`
  ADD CONSTRAINT `voyager_theme_options_voyager_theme_id_foreign` FOREIGN KEY (`voyager_theme_id`) REFERENCES `voyager_themes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
