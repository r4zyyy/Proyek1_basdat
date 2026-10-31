-- Harus BERHASIL
INSERT INTO salam.mahasiswas (nim, nama, email, ipk, semester)
VALUES ('2023001', 'Budi', 'budi@mail.com', 3.50, 3);

-- Harus GAGAL: UNIQUE (nim duplikat)
INSERT INTO salam.mahasiswas (nim, nama, email, ipk, semester)
VALUES ('2023001', 'Ani', 'ani@mail.com', 3.00, 3);

-- Harus GAGAL: CHECK (ipk > 4)
INSERT INTO salam.mahasiswas (nim, nama, email, ipk, semester)
VALUES ('2023002', 'Citra', 'citra@mail.com', 5.00, 3);

-- Harus GAGAL: PRIMARY KEY (id duplikat)
INSERT INTO salam.mahasiswas (id, nim, nama, ipk, semester)
VALUES (1, '2023003', 'Dedi', 3.00, 2);