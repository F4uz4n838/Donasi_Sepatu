-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 11 Jul 2025 pada 11.23
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
-- Database: `donasisepatu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'alif', 'rahasia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `distribusi`
--

CREATE TABLE `distribusi` (
  `id_distribusi` int(11) NOT NULL,
  `id_penerima` int(11) DEFAULT NULL,
  `id_sepatu` int(11) DEFAULT NULL,
  `tanggal_distribusi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `distribusi`
--

INSERT INTO `distribusi` (`id_distribusi`, `id_penerima`, `id_sepatu`, `tanggal_distribusi`) VALUES
(1, 2, 1, '2025-07-09'),
(2, 3, 3, '2025-07-10'),
(3, 4, 4, '2025-07-10'),
(4, 5, 5, '2025-07-10'),
(5, 2, 2, '2025-07-11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `donasi`
--

CREATE TABLE `donasi` (
  `id_donasi` int(11) NOT NULL,
  `id_donor` int(11) DEFAULT NULL,
  `id_sepatu` int(11) DEFAULT NULL,
  `tanggal_donasi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `donasi`
--

INSERT INTO `donasi` (`id_donasi`, `id_donor`, `id_sepatu`, `tanggal_donasi`) VALUES
(1, 3, 1, '2025-07-09'),
(2, 5, 3, '2025-07-10'),
(3, 7, 4, '2025-07-10'),
(4, 8, 5, '2025-07-10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `donor`
--

CREATE TABLE `donor` (
  `id_donor` int(11) NOT NULL,
  `nama_donor` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `donor`
--

INSERT INTO `donor` (`id_donor`, `nama_donor`, `alamat`, `no_hp`) VALUES
(1, 'Fahri', 'JL. Kenanga 2', '087876545467'),
(2, 'Heri', 'Jl. Kamboja', '086567543676'),
(3, 'Alif', 'Cikarang, Jl. Kamboja', '087876555434'),
(4, 'Alif', 'Cikarang, Jl. Kamboja', '087876885676'),
(5, 'Wahyu', 'Jl. Mana Aja', '088767546354'),
(6, 'Wahyu', 'Jl. Raya Bebek No.98', '081234567890'),
(7, 'Abdul', 'Cakung', '098637337'),
(8, 'Rivzan', 'Jakarta', '08765463746'),
(9, 'Abdur', 'Jl. hajat', 'jakjaskjsa'),
(10, 'yuda', 'Jl.cemoa', 'shshs');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penerima`
--

CREATE TABLE `penerima` (
  `id_penerima` int(11) NOT NULL,
  `nama_penerima` varchar(100) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penerima`
--

INSERT INTO `penerima` (`id_penerima`, `nama_penerima`, `alamat`, `no_hp`) VALUES
(1, 'Afif', 'Jl. Angsana 3', '0987564848'),
(2, 'Fahri', 'Bekasi', '08767645323'),
(3, 'Abdur', 'Jl. Raya Ayam No.12', '081234567890'),
(4, 'Ibnu', 'Kalideres ', '097373826'),
(5, 'Susi', 'Jakarta', '08978653425');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sepatu`
--

CREATE TABLE `sepatu` (
  `id_sepatu` int(11) NOT NULL,
  `merk` varchar(100) DEFAULT NULL,
  `ukuran` int(11) DEFAULT NULL,
  `kondisi` enum('Baru','Bekas') DEFAULT NULL,
  `warna` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sepatu`
--

INSERT INTO `sepatu` (`id_sepatu`, `merk`, `ukuran`, `kondisi`, `warna`) VALUES
(1, 'Nike', 43, 'Bekas', 'Putih'),
(2, 'Adidas', 39, 'Baru', 'Hitam Putih'),
(3, 'Abdul Shoes ', 43, 'Bekas', 'Merah'),
(4, 'MLB', 43, 'Bekas', 'Putih'),
(5, 'Yonex', 37, 'Baru', 'Biru Putih'),
(6, 'Adidas', 78, 'Baru', 'Merah');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`id_distribusi`),
  ADD KEY `id_penerima` (`id_penerima`),
  ADD KEY `id_sepatu` (`id_sepatu`);

--
-- Indeks untuk tabel `donasi`
--
ALTER TABLE `donasi`
  ADD PRIMARY KEY (`id_donasi`),
  ADD KEY `id_donor` (`id_donor`),
  ADD KEY `id_sepatu` (`id_sepatu`);

--
-- Indeks untuk tabel `donor`
--
ALTER TABLE `donor`
  ADD PRIMARY KEY (`id_donor`);

--
-- Indeks untuk tabel `penerima`
--
ALTER TABLE `penerima`
  ADD PRIMARY KEY (`id_penerima`);

--
-- Indeks untuk tabel `sepatu`
--
ALTER TABLE `sepatu`
  ADD PRIMARY KEY (`id_sepatu`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `distribusi`
--
ALTER TABLE `distribusi`
  MODIFY `id_distribusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `donasi`
--
ALTER TABLE `donasi`
  MODIFY `id_donasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `donor`
--
ALTER TABLE `donor`
  MODIFY `id_donor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `penerima`
--
ALTER TABLE `penerima`
  MODIFY `id_penerima` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `sepatu`
--
ALTER TABLE `sepatu`
  MODIFY `id_sepatu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `distribusi`
--
ALTER TABLE `distribusi`
  ADD CONSTRAINT `distribusi_ibfk_1` FOREIGN KEY (`id_penerima`) REFERENCES `penerima` (`id_penerima`),
  ADD CONSTRAINT `distribusi_ibfk_2` FOREIGN KEY (`id_sepatu`) REFERENCES `sepatu` (`id_sepatu`);

--
-- Ketidakleluasaan untuk tabel `donasi`
--
ALTER TABLE `donasi`
  ADD CONSTRAINT `donasi_ibfk_1` FOREIGN KEY (`id_donor`) REFERENCES `donor` (`id_donor`),
  ADD CONSTRAINT `donasi_ibfk_2` FOREIGN KEY (`id_sepatu`) REFERENCES `sepatu` (`id_sepatu`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
