

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
  description_ VARCHAR(45) NOT NULL,
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

 INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("2005 Porsche Boxster S", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$13,311','tunis', 1, 'good', 50, 'Porsche', 'boxster', 'WP0CA29865U711670','nice', 115, 'AUTO');
  INSERT INTO Car (car_name, end_date,car_price, location_,  user_id, status_, nb_bids,make, model, VIN, description_, mileage, transimission)
 VALUES ("", TIMESTAMPADD(WEEK, 1,CURRENT_TIMESTAMP),   '$13,311','tunis', 1, 'good', 50, 'Porsche', 'boxster', 'WP0CA29865U711670','nice', 115, 'AUTO');