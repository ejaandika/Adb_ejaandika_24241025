-- Nama : Eja Andika
-- NIM  : 24241025
-- Kelas : A
-- Modul : 5

-- menggunakan database
USE pti_mart;

-- JOIN
-- Fungsinya menggabungkan dua buah atau lebih tabel
-- Praktek #1
-- Ambil pembelian dari setiap pelanggan
-- Nama Pelanggan, tgl_transaksinya, namaproduk, qty
SELECT pl.nama_pelanggan, trp.tgl_transaksi, trp.nama_produk, trp.qty
FROM pelanggan AS pl JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan;

-- Praktek #2
-- Join tanpa relational keys 
SELECT pl.nama_pelanggan, trp.tgl_transaksi, trp.nama_produk, trp.qty
FROM pelanggan AS pl JOIN tr_penjualan AS trp
ON true;

-- Praktek #3 
-- Penggunaan INNER JOIN
SELECT pl.nama_pelanggan, trp.tgl_transaksi, trp.nama_produk, trp.qty
FROM pelanggan AS pl INNER JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan;

-- Praktek #4
-- LEFT OUTER JOIN
-- Ambil semua nama pelanggan yang pernah belanja dan tidak pernah
-- Keb kolom : kode_pelanggan nama_pelanggan, qty
SELECT trp.kode_pelanggan, pl.nama_pelanggan, trp.qty
FROM pelanggan AS pl LEFT JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan ORDER BY trp.qty DESC;

-- Praktek #5
-- RIGHT OUTER JOIN
-- Ambil semua nama pelanggan yang tidak pernah belanja
-- Keb kolom : kode_pelanggan nama_pelanggan qty
SELECT trp.kode_pelanggan, pl.nama_pelanggan, trp.qty
FROM tr_penjualan AS trp RIGHT OUTER JOIN pelanggan AS pl
ON trp.kode_pelanggan = pl.kode_pelanggan
WHERE trp.kode_pelanggan is NULL;

-- Praktek #6
-- LEFT JOIN 3 Tabel
-- Cari tahu apa saja produk yang dibeli oleh pelanggan
-- Keb kolom: kode pelanggan, nama pelanggan, kategori_produk, nama produk, qty
SELECT trp.kode_pelanggan, pl.nama_pelanggan, pr.kategori_produk, trp.nama_produk, trp.qty
FROM pelanggan AS pl LEFT OUTER JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan
LEFT OUTER JOIN produk AS pr ON pr.kode_produk = trp.kode_produk
WHERE trp.kode_pelanggan IS NOT NULL;

-- Praktek #7
-- LEFT JOIN 3 Tabel
-- Cari tahu apa saja produk yang dibeli oleh pelanggan urut qty tertinggi
-- Keb kolom: kode pelanggan, nama pelanggan, kategori_produk, nama produk, qty
SELECT trp.kode_pelanggan, pl.nama_pelanggan, pr.kategori_produk, trp.nama_produk, trp.qty
FROM pelanggan AS pl LEFT OUTER JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan
LEFT OUTER JOIN produk AS pr ON pr.kode_produk = trp.kode_produk
WHERE trp.kode_pelanggan IS NOT NULL ORDER BY trp.qty DESC;

-- Praktek #8
-- GROUPING dan Fungsi Agregasi pada JOIN
-- Carti tahu berapa banyak total produk yang terjual dikelompokkan berdasarkan kategori 
-- keb kolom: Kategori produk, nama produk, qty
SELECT pr.kategori_produk, trp.nama_produk, SUM(qty) AS qty
FROM tr_penjualan AS trp LEFT OUTER JOIN produk AS pr
ON trp.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk, trp.nama_produk
ORDER BY sum(qty) DESC;

-- Latihan Soal 
-- Soal 1
-- Ambil kode_pelanggan, nama_pelanggan, dan total qty belanja tiap pelanggan
-- urut dari yang paling banyak belanja
SELECT pl.kode_pelanggan, pl.nama_pelanggan, SUM(trp.qty) AS total_qty
FROM pelanggan AS pl JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan
GROUP BY pl.kode_pelanggan, pl.nama_pelanggan
ORDER BY total_qty DESC;

-- Soal 2
-- Ambil nama_pelanggan, nama_produk, qty, harga, dan total belanja (qty*harga)
-- dari seluruh transaksi
SELECT pl.nama_pelanggan, trp.nama_produk, trp.qty, trp.harga, 
       trp.qty * trp.harga AS total_belanja
FROM pelanggan AS pl JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan
ORDER BY total_belanja DESC;

-- Soal 3
-- Cari kategori produk apa saja yang paling banyak diminati (total qty terbanyak)
-- Keb kolom: kategori_produk, total qty
SELECT pr.kategori_produk, SUM(trp.qty) AS total_qty
FROM tr_penjualan AS trp JOIN produk AS pr
ON trp.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk
ORDER BY total_qty DESC;

-- Soal 4
-- Ambil daftar pelanggan beserta jumlah transaksi yang pernah dilakukan
-- termasuk pelanggan yang belum pernah bertransaksi (jumlah = 0)
-- Keb kolom: kode_pelanggan, nama_pelanggan, jumlah_transaksi
SELECT pl.kode_pelanggan, pl.nama_pelanggan, COUNT(trp.no_urut) AS jumlah_transaksi
FROM pelanggan AS pl LEFT OUTER JOIN tr_penjualan AS trp
ON pl.kode_pelanggan = trp.kode_pelanggan
GROUP BY pl.kode_pelanggan, pl.nama_pelanggan
ORDER BY jumlah_transaksi DESC;
