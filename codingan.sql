CREATE TABLE Mahasiswa (
    NIM VARCHAR(9) PRIMARY KEY,
    Nama VARCHAR(50),
    Alamat VARCHAR(50),
    Jurusan VARCHAR(50),
    Umur INT
);

INSERT INTO Mahasiswa (NIM, Nama, Alamat, Jurusan, Umur) VALUES
("123456", 'John', 'Jl. Merdeka No. 1', 'Teknik Informatika', 21),
("234567", 'Alice', 'Jl. Gatot Subroto', 'Sistem Informasi', 23),
("345678", 'Bob', 'Jl. Sudirman No. 5', 'Teknik Informatika', 20),
("456789", 'Cindy', 'Jl. Pahlawan No. 2', 'Manajemen', 22),
("567890", 'David', 'Jl. Diponegoro No. 3', 'Teknik Elektro', 25),
("678901", 'Emily', 'Jl. Cendrawasih No. 4', 'Manajemen', 24),
("789012", 'Frank', 'Jl. Ahmad Yani No. 6', 'Teknik Informatika', 19);

SELECT * FROM mahasiswa;

CREATE TABLE MataKuliah (
    ID INT PRIMARY KEY,
    MataKuliah VARCHAR(50),
    NIM VARCHAR(9),
    Nilai INT,
    DosenPengajar VARCHAR(50),
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

INSERT INTO MataKuliah (ID, MataKuliah, NIM, Nilai, DosenPengajar) VALUES
(1, 'Pemrograman Web', "123456", 85, 'Pak Budi'),
(2, 'Basis Data', "234567", 70, 'Ibu Ani'),
(3, 'Jaringan Komputer', "345678", 75, 'Pak Dodi'),
(4, 'Sistem Operasi', "123456", 90, 'Pak Budi'),
(5, 'Manajemen Proyek', "456789", 80, 'Ibu Desi'),
(6, 'Bahasa Inggris', "567890", 85, 'Ibu Eka'),
(7, 'Statistika', "678901", 75, 'Pak Farhan'),
(8, 'Algoritma', "789012", 65, 'Pak Galih'),
(9, 'Pemrograman Java', "123456", 95, 'Pak Budi');

-- NOMOR 1
UPDATE mahasiswa
SET alamat = "Jl. Raya No.5"
WHERE nim = "123456";

SELECT * FROM mahasiswa;

-- NOMOR 2
SELECT DISTINCT mh.nim, mh.nama, mh.jurusan, mt.dosenpengajar
FROM mahasiswa AS mh
INNER JOIN matakuliah AS mt
ON mh.NIM = mt.NIM
WHERE mh.jurusan = "Teknik Informatika";

-- NOMOR 3
SELECT nama FROM mahasiswa ORDER BY umur DESC LIMIT 5

-- NOMOR 4
SELECT mh.nama, mt.matakuliah, mt.nilai
FROM mahasiswa AS mh
INNER JOIN
matakuliah AS mt
ON mh.NIM = mt.NIM
WHERE mt.nilai > 70
ORDER BY nilai desc;