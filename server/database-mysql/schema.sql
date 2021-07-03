

-- DROP DATABASE IF EXISTS chkounyzid;

-- CREATE DATABASE chkounyzid;

USE chkounyzid;

-- CREATE TABLE User (
--   id INT NOT NULL AUTO_INCREMENT,
--   first_name VARCHAR(45) NOT NULL,
--   last_name VARCHAR(45) NOT NULL,
--   front_id_img VARCHAR(255) NOT NULL,
--   back_id_img VARCHAR(255) NOT NULL,
--   email VARCHAR(45) NOT NULL,
--   password VARCHAR(255) NOT NULL,
--   PRIMARY KEY (id)
-- );

-- CREATE TABLE Car (
--   id INT NOT NULL AUTO_INCREMENT,
--   car_name VARCHAR(45) NOT NULL,
--   start_date TIMESTAMP DEFAULT NOW()  NOT NULL,
--   end_date  TIMESTAMP DEFAULT (NOW()+ INTERVAL 7 DAY)  NOT NULL,
--   car_price INT NOT NULL,
--   location VARCHAR(45) NOT NULL,
--   user_id INT NOT NULL,
--   url VARCHAR(255) NOT NULL, 
--   status VARCHAR(45) DEFAULT "Availble" NOT NULL,
--   nb_bids INT DEFAULT 0 NOT NULL,
--   make VARCHAR(45) NOT NULL,
--   model VARCHAR(45) NOT NULL,
--   VIN VARCHAR(45) NOT NULL,
--   description VARCHAR(255) NOT NULL,
--   mileage INT NOT NULL,
--   transimission VARCHAR(45) NOT NULL,
--   PRIMARY KEY (id),
--   FOREIGN KEY (user_id) REFERENCES User(id)
-- );

-- CREATE TABLE Bid (
--   id INT NOT NULL AUTO_INCREMENT,
--   amount INT NOT NULL,
--   time_stamp VARCHAR(45) NOT NULL,
--   car_id INT NOT NULL,
--   user_id INT NOT NULL,
--   PRIMARY KEY (id),
--    FOREIGN KEY (car_id) REFERENCES Car(id),
--    FOREIGN KEY (user_id) REFERENCES User(id)
-- );

-- CREATE TABLE QuestionAndAnswers (
--   id INT NOT NULL AUTO_INCREMENT,
--   question VARCHAR(45) NOT NULL,
--   answer VARCHAR(45) NOT NULL,
--   car_id INT NOT NULL,
--   user_id INT NOT NULL,
--   PRIMARY KEY (id),
--  FOREIGN KEY (car_id) REFERENCES Car(id),
--  FOREIGN KEY (user_id) REFERENCES User(id)
-- ); 



/*  Execute this file from the command line by typing:
 *    mysql -u root -p <database-mysql/schema.sql
 *  to create the database and the tables.*/

-- ////////////////////// Cars /////////////////////////////////////////////////////////////
 INSERT INTO Car (car_name,car_price, location,  user_id, url, make, model, VIN, description, mileage, transimission)
 VALUES ("2005 Porsche Boxster S", 13311 ,'tunis', 2, "https://media.carsandbids.com/cdn-cgi/image/width=1800,quality=70/ee7f173e46ec801a48d1673c50f9cebaa1bf2854/photos/361PLygW.8iqZ21sl2-(edit).jpg?t=162249376862", 'Porsche', 'boxster', 'WP0CA29865U711670','nice', 115000, 'AUTO');
  INSERT INTO Car (car_name,car_price, location,  user_id, url,make, model, VIN, description, mileage, transimission)
 VALUES ("BMW 320i",   10500,'Sousse', 1, "https://media.carsandbids.com/cdn-cgi/image/width=1800,quality=70/1477bbe21e8d6b5e719c7c3ccab577fd47dd8cc3/photos/3Rv6QV1R-7Xg7hqeN41h.kbXvw-j4m.jpg?t=162265720388", 'BMW', 'F30', 'AP0MA29865B711670','nice', 200000, 'MANUAL');
   INSERT INTO Car (car_name,car_price, location,  user_id, url,make, model, VIN, description, mileage, transimission)
 VALUES ("Range Rover Supercharged", 20500,'beja', 2, "https://media.carsandbids.com/cdn-cgi/image/width=1800,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/OnUQdZ1-oS2.WZwc4eMXd.jpg?t=161351057303",  'Range Rover', '2006 LandRover', 'AP0MA29865B75555',' Rare model, low mileage, Supercharged V8', 80000, 'MANUAL');
    INSERT INTO Car (car_name,car_price, location,  user_id, url,make, model, VIN, description, mileage, transimission)
 VALUES ("2006 BMW M5",   50500,'Zarzis', 4, "https://media.carsandbids.com/cdn-cgi/image/width=1800,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/di6qT4_2WU2-2.yLKB1KNP2.jpg?t=160436638377", 'BMW', 'E60', 'AP0MA2986D4F7F','No Major Modifications, Extensive Service History', 17000, 'AUTO');
     INSERT INTO Car (car_name,car_price, location,  user_id, url,make, model, VIN, description, mileage, transimission)
 VALUES ("1998 BMW 318i Sedan",   4000,'Grand Tunis', 3, "https://media.carsandbids.com/cdn-cgi/image/width=1800,quality=70/c51905b0000b639a185eeb080dd879bf007f5604/photos/9lDRoYZz.JNIIq6GVl-(edit).jpg?t=162278623121", 'BMW', 'E36', 'AP0MA2986F74127F','Clean title, 2 owners', 44000, 'MANUAL');
      INSERT INTO Car (car_name,car_price, location,  user_id, url,make, model, VIN, description, mileage, transimission)
 VALUES ("2002 BMW 330xi Sedan",   8500,'Ben Arous', 2, "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/KHN6cNqFB2PS3qdafHASn2%202.AUIdnlUmY.jpeg?t=159786383918",  'BMW', 'E46', 'AP0MA2986F74786562ML',' 1 Family-Owned Since New, AWD, Largely Stock E46', 128000, 'AUTO');
       INSERT INTO Car (car_name,car_price, location,  user_id, url,make, model, VIN, description, mileage, transimission)
 VALUES ("MINI Cooper",   16500,'La Marsa', 4, "https://media.carsandbids.com/cdn-cgi/image/width=2080,quality=80/d9b636c2ec84ddc3bc7f2eb32861b39bdd5f9683/photos/rMkoD7R4.HMA0eIsRD-(edit).jpg?t=162292015983",  'MINI Cooper ', '2019 MINI Cooper John Cooper Works', 'AB56PA2986F74786562ML',' 6-Speed , Unmodified', 148000, 'MANUAL');
         INSERT INTO Car (car_name,car_price, location,  user_id, url,make, model, VIN, description, mileage, transimission)
 VALUES ("Golf",   20500,'Manzah', 3, "https://media.carsandbids.com/cdn-cgi/image/width=1800,quality=70/da4b9237bacccdf19c0760cab7aec4a8359010b0/photos/Vo08qRoU7b.xeT-yvrpf.jpg?t=161076940748", 'Volkswagen', '2017 Golf R', 'AB56PA2986F747866314L','1 Owner,  Extensive Service History, Some Modifications', 168000, 'AUTO');
          INSERT INTO Car (car_name,car_price, location,  user_id, url,make, model, VIN, description, mileage, transimission)
 VALUES ("BMW Coupe",   17500,'Bizert', 1, "https://media.carsandbids.com/cdn-cgi/image/width=1800,quality=70/1477bbe21e8d6b5e719c7c3ccab577fd47dd8cc3/photos/rbJ5n4lJ-m51UMw0Is.FrORdN1Jn.jpg?t=162275495140", 'BMW', '1998 BMW M3 Coupe', 'A2986F747866314L','5-Speed , Largely Stock, Vader Seats, Cosmos Black', 200000, 'MANUAL');



