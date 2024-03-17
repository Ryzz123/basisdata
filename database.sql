# 1 Buat database rumah_sakit
CREATE DATABASE rumah_sakit;

# 2 Buat tabel dokter
CREATE TABLE dokter
(
    kode_dokter VARCHAR(6) NOT NULL PRIMARY KEY,
    nama_dokter VARCHAR(50)  DEFAULT NULL,
    spesialis   VARCHAR(30)  DEFAULT NULL,
    alamat      VARCHAR(100) DEFAULT NULL,
    telpon      VARCHAR(14)  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

# 3 Buat tabel pasien
CREATE TABLE pasien
(
    kode_pasien VARCHAR(6) NOT NULL PRIMARY KEY,
    nama_pasien VARCHAR(50)  DEFAULT NULL,
    alamat      VARCHAR(100) DEFAULT NULL,
    telpon      VARCHAR(14)  DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

# 4 Buat tabel kelas_kamar
CREATE TABLE kelas_kamar
(
    kode_kelas     VARCHAR(3) NOT NULL PRIMARY KEY,
    kelas          VARCHAR(10) DEFAULT NULL,
    harga_permalam INT(11)     DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

# 5 Buat tabel kamar
CREATE TABLE kamar
(
    kode_kamar VARCHAR(6) NOT NULL PRIMARY KEY,
    nama_kamar VARCHAR(30) DEFAULT NULL,
    kode_kelas VARCHAR(3)  DEFAULT NULL,
    FOREIGN KEY (kode_kelas) REFERENCES kelas_kamar (kode_kelas)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

# 6 Buat tabel opname
CREATE TABLE opname
(
    kode_opname    VARCHAR(6) NOT NULL PRIMARY KEY,
    kode_pasien    VARCHAR(6)  DEFAULT NULL,
    kode_dokter    VARCHAR(6)  DEFAULT NULL,
    kode_kamar     VARCHAR(6)  DEFAULT NULL,
    tanggal_masuk  DATE        DEFAULT NULL,
    tanggal_keluar DATE        DEFAULT NULL,
    sakit          VARCHAR(30) DEFAULT NULL,
    FOREIGN KEY (kode_pasien) REFERENCES pasien (kode_pasien),
    FOREIGN KEY (kode_dokter) REFERENCES dokter (kode_dokter),
    FOREIGN KEY (kode_kamar) REFERENCES kamar (kode_kamar)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

# 7 Masukkan data ke dalam tabel dokter
INSERT INTO dokter (kode_dokter, nama_dokter, spesialis, alamat, telpon)
VALUES ('D01', 'Muhammad Yusuf', 'Penyakit Dalam', 'Yogyakarta', '089995345'),
       ('D02', 'Taufik', 'Jantung', 'Sleman', '082534533'),
       ('D03', 'Ismail', 'Anak', 'Sleman', '087823222'),
       ('D04', 'Tuti Hartati', 'Umum', 'Solo', '087234222');

# 8 Masukkan data ke dalam tabel pasien
INSERT INTO pasien (kode_pasien, nama_pasien, alamat, telpon)
VALUES ('P01', 'Beni', 'Wates', '089923422'),
       ('P02', 'Budi', 'Sleman', '083453332'),
       ('P03', 'Cepi', 'Gamping', '085623429'),
       ('P04', 'Citra', 'Gejayan', '088543258'),
       ('P05', 'Desi', 'Solo', '089912341'),
       ('P06', 'Feri', 'Klaten', '089912332'),
       ('P07', 'Rangga', 'Magelang', '087672341');

# 9 Masukkan data ke dalam tabel kelas_kamar
INSERT INTO kelas_kamar (kode_kelas, kelas, harga_permalam)
VALUES ('1', 'VVIP', 200000),
       ('2', 'VIP', 150000),
       ('3', 'Standard', 100000),
       ('4', 'Ekonomi', 50000);

# 10 Masukkan data ke dalam tabel kamar
INSERT INTO kamar (kode_kamar, nama_kamar, kode_kelas)
VALUES ('K01', 'Melati 1', '1'),
       ('K02', 'Melati 2', '1'),
       ('K03', 'Melati 3', '2'),
       ('K04', 'Flamboyan 1', '2'),
       ('K05', 'Flamboyan 2', '1'),
       ('K06', 'Flamboyan 3', '3'),
       ('K07', 'Anggrek 1', '4'),
       ('K08', 'Anggrek 2', '2'),
       ('K09', 'Anggrek 3', '3'),
       ('K10', 'Anggrek 4', '4'),
       ('K11', 'Mawar 1', '3'),
       ('K12', 'Mawar 2', '4'),
       ('K13', 'Mawar 3', '3');

# 11 Masukkan data ke dalam tabel opname
INSERT INTO opname (kode_opname, kode_pasien, kode_dokter, kode_kamar, tanggal_masuk, tanggal_keluar, sakit)
VALUES (1, 'P01', 'D02', 'K01', '2018-02-28', '2018-03-09', 'Jantung'),
       (2, 'P02', 'D03', 'K10', '2018-03-03', '2018-03-21', 'Hati'),
       (3, 'P03', 'D02', 'K13', '2018-03-01', '2018-03-11', 'Jantung'),
       (4, 'P04', 'D04', 'K07', '2018-03-03', '2018-03-14', 'Demam Berdarah'),
       (5, 'P05', 'D01', 'K05', '2018-03-03', '2018-03-15', 'Liver'),
       (6, 'P06', 'D04', 'K08', '2018-03-03', '2018-03-13', 'Demam'),
       (7, 'P07', 'D03', 'K11', '2018-03-03', '2018-03-16', 'Pusing');

# 12 Tambah data pasien baru
INSERT INTO pasien (kode_pasien, nama_pasien, alamat, telpon)
VALUES ('P08', 'Mustofa', 'Semarang', '087810012');

# 13 Tampilkan dokter berasal dari sleman
SELECT * FROM dokter WHERE alamat = 'Sleman';

# 14 Edit harga kelas VIP
UPDATE kelas_kamar SET harga_permalam = 500000 WHERE kode_kelas = '1';

# 15 Urutkan kamar berdasarkan harga Ekonomi ke VVIP
SELECT * FROM kamar ORDER BY kode_kelas DESC;
