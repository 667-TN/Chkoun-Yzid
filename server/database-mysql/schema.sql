

DROP DATABASE IF EXISTS chkounyzid;

CREATE DATABASE chkounyzid;

USE chkounyzid;

CREATE TABLE User (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  front_id_img VARCHAR(255) NOT NULL,
  back_id_img VARCHAR(255) NOT NULL,
  email VARCHAR(45) NOT NULL,
  password_ VARCHAR(45) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Car (
  id INT NOT NULL AUTO_INCREMENT,
  car_name VARCHAR(45) NOT NULL,
  start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP  NOT NULL,
  end_date TIMESTAMP  NOT NULL,
  car_price VARCHAR(45)NOT NULL,
  location_ VARCHAR(45) NOT NULL,
  user_id INT NOT NULL,
  status_ VARCHAR(45) NOT NULL,
  nb_bids VARCHAR(45) NOT NULL,
  make VARCHAR(45) NOT NULL,
  model VARCHAR(45) NOT NULL,
  VIN VARCHAR(45) NOT NULL,
  description_ VARCHAR(255) NOT NULL,
  mileage INT NOT NULL,
  transimission VARCHAR(45) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Bid (
  id INT NOT NULL AUTO_INCREMENT,
  amount INT NOT NULL,
  time_stamp VARCHAR(45) NOT NULL,
  car_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (car_id) REFERENCES Car(id),
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE QuestionAndAnswers (
  id INT NOT NULL AUTO_INCREMENT,
  question VARCHAR(45) NOT NULL,
  answer VARCHAR(45) NOT NULL,
  car_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (id),
 FOREIGN KEY (car_id) REFERENCES Car(id),
 FOREIGN KEY (user_id) REFERENCES User(id)
);



CREATE TABLE Images (
  id INT NOT NULL AUTO_INCREMENT,
  url_ VARCHAR(255) NOT NULL,
  car_id int NOT NULL,
  PRIMARY KEY (id),
 FOREIGN KEY (car_id) REFERENCES Car(id)
);

INSERT INTO User (first_name,last_name,front_id_img,back_id_img,email,password_)
 VALUES  ('Aziz','Tounsi','https://c2.staticflickr.com/4/3195/3138309008_4477dc54ca.jpg','https://c2.staticflickr.com/4/3195/3138309008_4477dc54ca.jpg','ba3bas@gmail.com',123456);
    
    
   
    
INSERT INTO User (first_name,last_name,front_id_img,back_id_img,email,password_)
 VALUES    ('Karim','Zargouni','https://c2.staticflickr.com/4/3195/3138309008_4477dc54ca.jpg','https://c2.staticflickr.com/4/3195/3138309008_4477dc54ca.jpg','ba3bas@gmail.com',123456);

INSERT INTO User (first_name,last_name,front_id_img,back_id_img,email,password_)
 VALUES     ('Aziz','Saad','https://c2.staticflickr.com/4/3195/3138309008_4477dc54ca.jpg','https://c2.staticflickr.com/4/3195/3138309008_4477dc54ca.jpg','ba3bas@gmail.com',123456);

 INSERT INTO User (first_name,last_name,front_id_img,back_id_img,email,password_)
 VALUES      ('Achref','Gallah','https://c2.staticflickr.com/4/3195/3138309008_4477dc54ca.jpg','https://c2.staticflickr.com/4/3195/3138309008_4477dc54ca.jpg','ba3bas@gmail.com',123456);
/*  Execute this file from the command line by typing:
 *    mysql -u root -p <database-mysql/schema.sql
 *  to create the database and the tables.*/

-- ////////////////////// Cars /////////////////////////////////////////////////////////////
 INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("2005 Porsche Boxster S", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$13,311','tunis', 2, 'good', 50, 'Porsche', 'boxster', 'WP0CA29865U711670','nice', 115000, 'AUTO');
  INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("BMW 320i", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$10,500','Sousse', 1, 'sold', 50, 'BMW', 'F30', 'AP0MA29865B711670','nice', 200000, 'MANUAL');
   INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("Range Rover Supercharged", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$20,500','beja', 2, 'available', 12, 'Range Rover', '2006 LandRover', 'AP0MA29865B75555',' Rare model, low mileage, Supercharged V8', 80000, 'MANUAL');
    INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("2006 BMW M5", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$50,500','Zarzis', 4, 'available', 4, 'BMW', 'E60', 'AP0MA2986D4F7F','No Major Modifications, Extensive Service History', 17000, 'AUTO');
     INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("1998 BMW 318i Sedan", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$4.000','Grand Tunis', 3, 'available', 14, 'BMW', 'E36', 'AP0MA2986F74127F','Clean title, 2 owners', 44000, 'MANUAL');
      INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("2002 BMW 330xi Sedan", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$8.500','Ben Arous', 2, 'available', 8, 'BMW', 'E46', 'AP0MA2986F74786562ML',' 1 Family-Owned Since New, AWD, Largely Stock E46', 128000, 'AUTO');
       INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("MINI Cooper ", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$16.500','La Marsa', 4, 'available', 10, 'MINI Cooper ', '2019 MINI Cooper John Cooper Works', 'AB56PA2986F74786562ML',' 6-Speed , Unmodified', 148000, 'MANUAL');
         INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("Golf", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$20.500','Manzah', 3, 'sold', 9, 'Volkswagen', '2017 Golf R', 'AB56PA2986F747866314L','1 Owner,  Extensive Service History, Some Modifications', 168000, 'AUTO');
          INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("BMW Coupe", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$17.500','Bizert', 1, 'Available', 15, 'BMW', '1998 BMW M3 Coupe', 'A2986F747866314L','5-Speed , Largely Stock, Vader Seats, Cosmos Black', 200000, 'MANUAL');