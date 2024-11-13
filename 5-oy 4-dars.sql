"""1-vazifa"""

CREATE TABLE avtomobillar (
    id SERIAL PRIMARY KEY,
    nomi VARCHAR(100) NOT NULL,
    model TEXT,
    yil INTEGER,
    narx NUMERIC(12, 2),
    mavjudmi BOOL DEFAULT TRUE
);

"""2-vazifa"""

CREATE TABLE clientlar (
    id SERIAL PRIMARY KEY,
    ism VARCHAR(50) NOT NULL,
    familiya VARCHAR(50),
    telefon CHAR(13),
    manzil TEXT
);

"""3-vazifa"""

CREATE TABLE buyurtmalar (
    id SERIAL PRIMARY KEY,
    avtomobil_id INTEGER REFERENCES avtomobillar(id),
    client_id INTEGER REFERENCES clientlar(id),
    sana DATE NOT NULL,
    umumiy_narx NUMERIC(12, 2)
);

"""4-vazifa"""

CREATE TABLE xodimlar (
    id SERIAL PRIMARY KEY,
    ism VARCHAR(50) NOT NULL,
    lavozim VARCHAR(50),
    maosh NUMERIC(10, 2)
);

"""Jadvalga O‘zgartirish Kiritish"""

"""2.1-vazifa"""

ALTER TABLE clientlar
ADD COLUMN email VARCHAR(100);

"""2.2-vazifa"""

ALTER TABLE clientlar
RENAME COLUMN ism TO ismi;

"""2.3-vazifa"""

ALTER TABLE clientlar
RENAME TO mijozlar;

""" Ma'lumot Kiritish """

"""3.1-vazifa"""

INSERT INTO avtomobillar (nomi, model, yil, narx) VALUES
('Chevrolet Malibu', 'Premier', 2022, 25000),
('BMW X5', 'M Sport', 2021, 50000),
('Tesla Model S', 'Plaid', 2023, 80000);


INSERT INTO mijozlar (ismi, familiya, telefon, manzil, email) VALUES
('Ali', 'Valiyev', '+998901234567', 'Toshkent', 'ali@gmail.com'),
('Olim', 'Karimov', '+998909876543', 'Samarqand', 'olim@gmail.com');

INSERT INTO buyurtmalar (avtomobil_id, client_id, sana, umumiy_narx) VALUES
(1, 1, '2024-11-10', 25000),
(2, 2, '2024-11-11', 50000);


INSERT INTO xodimlar (ism, lavozim, maosh) VALUES
('Jasur', 'Menejer', 3000),
('Dilshod', 'Sotuvchi', 2000);

"""4-vazifa"""

UPDATE xodimlar
SET ism = 'Bekzod'
WHERE id = 1;

UPDATE xodimlar
SET ism = 'Akmal'
WHERE id = 2;

"""5-vazifa"""

DELETE FROM xodimlar
WHERE id = 1;

"""6-vazifa"""

SELECT * FROM avtomobillar;
SELECT * FROM mijozlar;
SELECT * FROM buyurtmalar;
SELECT * FROM xodimlar;
