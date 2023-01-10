--ODEV1--
/*
1-film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
2-film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
3-film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
4-customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
5-film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.
*/


--1-
SELECT title,description FROM film;
--2-
SELECT * FROM film WHERE length > 60 AND length < 75;
--3-
SELECT * FROM film WHERE rental_rate = 0.99 AND (replacement_cost = 12.99 OR replacement_cost = 28.99);
--4-
SELECT last_name FROM customer WHERE first_name = 'Mary';
--5-
SELECT * FROM film WHERE NOT (length > 50 AND rental_rate = 2.99 OR rental_rate = 4.99);

--ODEV2--
/*
1- film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit ve 16.99 küçük olma koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
2- .actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya 'Nick' veya 'Ed' değerleri olması koşuluyla sıralayınız. ( IN operatörünü kullanınız.)
3- film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99 VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız. ( IN operatörünü kullanınız.)
*/

--1-
SELECT * FROM film WHERE replacement_cost BETWEEN 12.99 AND 16.99;

--2-
SELECT first_name, last_name FROM actor WHERE first_name IN ('Penelope', 'Nick', 'Ed');

--3-
SELECT * FROM film WHERE rental_rate IN (0.99, 2.99, 4.99) AND replacement_cost IN (12.99, 15.99, 28.99);


--ODEV 3--
/*
1-country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
2-country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
3-film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
4-film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.
*/

--1-
SELECT * FROM country WHERE country LIKE 'A%a';

--2-
SELECT * FROM country WHERE country LIKE '&_____n';

--3-
SELECT title FROM film WHERE title ILIKE '%t%t%t%t%';

--4-
SELECT * FROM film WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99;



--ODEV 4--
/*
1- film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
2- film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
3- film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
4- country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
5- city tablosundaki şehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?
*/

--1-
SELECT DISTINCT replacement_cost FROM film;

--2-
SELECT COUNT (DISTINCT replacement_cost) FROM film;

--3-
SELECT COUNT (*) FROM film WHERE title LIKE 'T%' AND rating = 'G';

--4-
SELECT COUNT(*) FROM country WHERE country LIKE '_____';

--5-
SELECT COUNT(*) FROM city WHERE city ILIKE '%r';


--ODEV 5--
/*
1- film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
2- film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sıralayınız.
3- customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.
*/

--1-
SELECT * FROM film 
WHERE title LIKE '%n'
ORDER BY length DESC
LIMIT 5;

--2-
SELECT * FROM film
WHERE title LIKE '%n'
ORDER BY length
OFFSET 5
LIMIT 5;

--3-
SELECT * FROM customer
WHERE store_id = 1
ORDER BY last_name DESC
LIMIT 4;


--ODEV 6--
/*
1- film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
2- film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
3- film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
4- film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
*/

--1-
SELECT AVG (rental_rate) FROM film;

--2-
SELECT COUNT(*) FROM film
WHERE title LIKE 'C%';

--3-
SELECT MAX(length) FROM film
WHERE rental_rate = 0.99;

--4-
SELECT COUNT(DISTINCT replacement_cost) FROM film
WHERE length > 150;


--ODEV 7--
/*
1- film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
2- film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı 50 den fazla olan replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
3- customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir? 
4- city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra en fazla şehir sayısı barındıran country_id bilgisini ve şehir sayısını paylaşınız.
*/

--1-
SELECT rating FROM film
GROUP BY rating;

--2-
SELECT replacement_cost, COUNT(*) FROM film
GROUP BY replacement_cost
HAVING COUNT(*) > 50;

--3-
SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id;

--4-
SELECT country_id, COUNT(country_id) FROM city
GROUP BY country_id
ORDER BY COUNT(country_id) DESC
LIMIT 1;


--ODEV 8--
/*
1- test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.
2- Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
3- Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
4- Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
*/

--1-
CREATE TABLE employee (
    id INTEGER NOT NULL,
    name VARCHAR(50) NOT NULL,
    birthday DATE,
    email VARCHAR(100)
);

--2-
insert into employee (id, name, birthday, email) values (1, 'Cristionna', '1989-07-20', null);
insert into employee (id, name, birthday, email) values (2, 'Brandyn', '1994-08-14', 'bmillington1@amazon.co.uk');
insert into employee (id, name, birthday, email) values (3, 'Averell', '1981-07-03', null);
insert into employee (id, name, birthday, email) values (4, 'Mikel', null, 'mkevlin3@linkedin.com');
insert into employee (id, name, birthday, email) values (5, 'Reeta', '1969-12-08', null);
insert into employee (id, name, birthday, email) values (6, 'Palm', '1964-12-11', 'prawlison5@elegantthemes.com');
insert into employee (id, name, birthday, email) values (7, 'Jordana', null, 'jsutty6@reverbnation.com');
insert into employee (id, name, birthday, email) values (8, 'Giusto', '2018-01-06', 'gattenbrow7@histats.com');
insert into employee (id, name, birthday, email) values (9, 'Elysia', '1938-01-10', 'elissandri8@free.fr');
insert into employee (id, name, birthday, email) values (10, 'Gaylor', '1965-02-27', 'gstener9@blogspot.com');
insert into employee (id, name, birthday, email) values (11, 'Maximilianus', '2021-08-21', 'mhardwina@dyndns.org');
insert into employee (id, name, birthday, email) values (12, 'Jobi', '1955-03-09', 'jabelsonb@photobucket.com');
insert into employee (id, name, birthday, email) values (13, 'Theo', '1961-10-17', 'tdignanc@diigo.com');
insert into employee (id, name, birthday, email) values (14, 'Britte', '1933-08-08', 'bstookd@bing.com');
insert into employee (id, name, birthday, email) values (15, 'Rockwell', '2022-01-25', 'rdetoilee@photobucket.com');
insert into employee (id, name, birthday, email) values (16, 'Sherlocke', '1978-12-24', 'sbargef@mac.com');
insert into employee (id, name, birthday, email) values (17, 'Shel', '1968-03-20', 'sshrimpling@yahoo.co.jp');
insert into employee (id, name, birthday, email) values (18, 'Eleanore', '1970-12-09', 'echampnissh@google.ru');
insert into employee (id, name, birthday, email) values (19, 'Findlay', '1955-01-29', null);
insert into employee (id, name, birthday, email) values (20, 'Margo', '2019-11-13', 'mthrowerj@arstechnica.com');
insert into employee (id, name, birthday, email) values (21, 'Felike', '1944-09-02', 'fswitlandk@pcworld.com');
insert into employee (id, name, birthday, email) values (22, 'Elysia', '1966-03-21', 'emckilroel@craigslist.org');
insert into employee (id, name, birthday, email) values (23, 'Antony', '1900-01-05', null);
insert into employee (id, name, birthday, email) values (24, 'Madeline', '1981-07-12', 'mmariotn@europa.eu');
insert into employee (id, name, birthday, email) values (25, 'Harbert', '1949-10-15', 'hordisho@abc.net.au');
insert into employee (id, name, birthday, email) values (26, 'Ben', '1938-08-10', 'bfenkelp@va.gov');
insert into employee (id, name, birthday, email) values (27, 'Naoma', '1952-04-13', 'nstrickettq@indiegogo.com');
insert into employee (id, name, birthday, email) values (28, 'Mandel', '1952-08-12', 'mfullomr@topsy.com');
insert into employee (id, name, birthday, email) values (29, 'Roanna', '1983-06-02', 'rrawcliffes@ihg.com');
insert into employee (id, name, birthday, email) values (30, 'Nonah', '1918-12-05', 'namsbergert@unesco.org');
insert into employee (id, name, birthday, email) values (31, 'Billie', '2014-07-27', null);
insert into employee (id, name, birthday, email) values (32, 'Pippy', '1979-04-06', 'pdemorenav@creativecommons.org');
insert into employee (id, name, birthday, email) values (33, 'Douglas', '1945-10-21', 'dengallw@cdc.gov');
insert into employee (id, name, birthday, email) values (34, 'Ferdy', '1930-02-13', 'farnholtzx@yellowpages.com');
insert into employee (id, name, birthday, email) values (35, 'Stirling', '2005-07-05', 'sgingoldy@symantec.com');
insert into employee (id, name, birthday, email) values (36, 'Feodor', '1994-06-18', 'fbinnyz@printfriendly.com');
insert into employee (id, name, birthday, email) values (37, 'Adey', '1982-09-18', 'ablyden10@de.vu');
insert into employee (id, name, birthday, email) values (38, 'Sullivan', '1980-10-09', 'sdorgon11@youtube.com');
insert into employee (id, name, birthday, email) values (39, 'Barron', '1943-03-09', 'bgeater12@dell.com');
insert into employee (id, name, birthday, email) values (40, 'Jacinthe', '1930-05-01', null);
insert into employee (id, name, birthday, email) values (41, 'Umberto', '1908-02-25', 'uelphee14@nydailynews.com');
insert into employee (id, name, birthday, email) values (42, 'Imelda', '1983-08-24', 'iharsnep15@foxnews.com');
insert into employee (id, name, birthday, email) values (43, 'Tabbie', '1911-09-17', 'tdubble16@howstuffworks.com');
insert into employee (id, name, birthday, email) values (44, 'Felix', '1907-03-05', 'fperotti17@kickstarter.com');
insert into employee (id, name, birthday, email) values (45, 'Filberto', '2008-02-04', 'fwakefield18@archive.org');
insert into employee (id, name, birthday, email) values (46, 'Arney', '1984-05-07', 'ashorbrook19@lycos.com');
insert into employee (id, name, birthday, email) values (47, 'Laurice', '2022-09-17', 'llamberto1a@sourceforge.net');
insert into employee (id, name, birthday, email) values (48, 'Elsa', '1921-07-26', 'edrake1b@va.gov');
insert into employee (id, name, birthday, email) values (49, 'Sada', '1941-06-26', 'ssharpous1c@twitter.com');
insert into employee (id, name, birthday, email) values (50, 'Devland', '1921-07-02', 'dchillcot1d@independent.co.uk');

--3-
UPDATE employee
SET name = 'Aleyna'
WHERE id = 6;

UPDATE employee
SET birthday = '1997-11-12'
WHERE name = 'Umberto';

UPDATE employee
SET name = 'anonim'
WHERE email IS NULL;

UPDATE employee
SET email = 'xxxx'
WHERE id = 50;

UPDATE employee
SET birthday = '2023-01-06'
WHERE id = 47;

--4-
DELETE FROM employee
WHERE name LIKE '%y';

DELETE FROM employee
WHERE email IS NULL;

DELETE FROM employee
WHERE birthday = '1980-09-12';

DELETE FROM employee
WHERE id = 13;

DELETE FROM employee
WHERE id = 1;


--ODEV 9--
/*
1- city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
2- customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
3- customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
*/

--1-
SELECT city, country FROM city
INNER JOIN country ON city.country_id = city.country_id;

--2-
SELECT payment_id, first_name, last_name FROM customer
INNER JOIN payment ON customer.payment_id = payment.payment_id;

--3-
SELECT rental_id, first_name, last_name FROM customer
INNER JOIN rental ON customer.rental_id = rental.rental_id;


--ODEV 10--
/*
1- city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte görebileceğimiz LEFT JOIN sorgusunu yazınız.
2- customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz RIGHT JOIN sorgusunu yazınız.
3- customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki first_name ve last_name isimlerini birlikte görebileceğimiz FULL JOIN sorgusunu yazınız.
*/

--1-
SELECT city, country FROM city
LEFT JOIN country ON city.country_id = city.country_id;

--2-
SELECT payment_id, first_name, last_name FROM payment
RIGHT JOIN customer ON customer.payment_id = payment.payment_id;

--3-
SELECT rental_id, first_name, last_name FROM customer
FULL JOIN rental ON customer.rental_id = rental.rental_id;



--ODEV 11--
/*
1- actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım.
2- actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.
3- actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.
4- İlk 3 sorguyu tekrar eden veriler için de yapalım.
*/

--1-
(SELECT first_name FROM actor)
UNION
(SELECT first_name FROM customer);

--2-
(SELECT first_name FROM actor)
INTERSECT
(SELECT first_name FROM customer);

--3-
(SELECT first_name FROM actor)
EXCEPT
(SELECT first_name FROM customer);

--4-
(SELECT first_name FROM actor)
UNION ALL
(SELECT first_name FROM customer);

(SELECT first_name FROM actor)
EXCEPT ALL
(SELECT first_name FROM customer);



--ODEV 12--
/*
1- film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
2- film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
3- film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
4- payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
*/

--1-
SELECT COUNT(*) FROM film
WHERE length > 
(SELECT AVG(length) FROM film);

--2-
SELECT COUNT(*) FROM film
WHERE rental_rate =
(SELECT MAX(rental_rate) FROM film);

--3-

--4 but im not sure-
SELECT customer.first_name, customer.last_name FROM payment
INNER JOIN customer ON payment.customer_id = customer.customer_id
WHERE payment.amount =
(
    SELECT MAX(amount) FROM payment
);
