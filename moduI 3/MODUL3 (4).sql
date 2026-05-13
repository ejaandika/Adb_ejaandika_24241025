-- Nama : Eja Andika
-- Nim : 24241025
-- Kelas : A 
-- Modul : 3

-- Nilai Literal, Operator Matematika, Perbandingan, Logika
-- Fungsi Matematika dan Tanggal (Date)
-- Klausal WHERE , LIKE

-- Praktek 1
-- Menggunakan nilai literal pada SELECT
SELECT 77;

-- Praktek 2
-- Menggunakan SELECT untuk menampilkan nilai literal dengan tipe data yang berbeda
SELECT 77 AS angka, false AS nilai_logika, 'PTI' As teks;


-- Null
-- Berarti tidak memiliki nilai apapun atau kosong

-- Praktek 3
-- Menggunakan SELECT untuk menampilkan NULL
SELECT NULL AS kosong;

-- Operatror Matematika
-- Praktek 4
SELECT 5%2 AS sisa_bagi, 5/2 AS hasil_bagi_1, 5 DIV 2 AS hasil_bagi_2;

-- Praktek 5
-- Menggunakan Database

-- Praktek 6
-- operator matematika untuk dua kolom dalam tabel penjualan
-- Ambil data hasil perkalian kolom qyt dan harga simpan dalam total beli

-- Praktek 7
-- Operator Perbandingan
-- Simbol untuk membandingkan nilai dari nilai literal ataupun hasil ekspresi 
SELECT 1 = TRUE, 1 = FALSE, 5 >= 5, 5.2  = 5.20000, NULL = NULL;

-- praktik 8
-- Fungsi 
-- proses yang memiliki nama, bukan simbol seperti operator
SELECT POW(3,2), ROUND(3.14), ROUND(3.54), ROUND(3.155, 1),
ROUND(3.155,2), FLOOR(4.28), FLOOR(4.78), CEILING(4.39), CEILING (4.55);

-- PRAKTEK 9
SELECT NOW(), YEAR('2022-05-03'),
DATEDIFF(NOW(), '2022-05-03') / 30,
DAY('2022-05-03');