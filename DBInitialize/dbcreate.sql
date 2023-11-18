-- create database
CREATE DATABASE IF NOT EXISTS team18 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE team18;

-- Country Table Create
CREATE TABLE IF NOT EXISTS country (
	country_id INT AUTO_INCREMENT PRIMARY KEY,
	country_name VARCHAR(50)
)

-- City Table Create
CREATE TABLE IF NOT EXISTS city (
	city_id INT AUTO_INCREMENT PRIMARY KEY,
	city_name VARCHAR(50), 
	country_id INT,
	CONSTRAINT city_ibfk_1 FOREIGN KEY (country_id) REFERENCES country(country_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Travel Table Create
CREATE TABLE IF NOT EXISTS travel (
	travel_id INT AUTO_INCREMENT PRIMARY KEY,
	traveler_name VARCHAR(50), 
	travel_start_date DATE NOT NULL,
	travel_end_date DATE NOT NULL,
	city_id INT,
	CONSTRAINT travel_ibfk_1 FOREIGN KEY (city_id) REFERENCES city(city_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- User Travel Table Create
CREATE TABLE myTravel (
    travel_id INT PRIMARY KEY,
    FOREIGN KEY (travel_id) REFERENCES travel(travel_id)
);



-- Weather Table Create
CREATE TABLE IF NOT EXISTS weather (
    weather_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    date DATE NOT NULL,
    temperature INT,
    conditions VARCHAR(50),
    CONSTRAINT weather_ibfk_1 FOREIGN KEY (city_id) REFERENCES city(city_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Hotel Table Create
CREATE TABLE IF NOT EXISTS hotel (
    hotel_id INT AUTO_INCREMENT PRIMARY KEY,
    city_id INT,
    hotel_name VARCHAR(50) NOT NULL,
    price INT,
    accomodation_number INT,
    CONSTRAINT hotel_ibfk_1 FOREIGN KEY (city_id) REFERENCES city(city_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Transportation Table Create
CREATE TABLE IF NOT EXISTS transportation
(
     transportation_id INT NOT NULL,
     country_id INT NOT NULL,
     method CHAR(50),
     price FLOAT,
     PRIMARY KEY(transportation_id),
     FOREIGN KEY(country_id) REFERENCES country(country_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- city_id에서 country_id로 변경했습니다

-- Restaurant Table Create
CREATE TABLE IF NOT EXISTS restaurant
(
     restaurant_id INT NOT NULL PRIMARY KEY,
     country_id INT NOT NULL,
     restaurant_name CHAR(50),
     cuisine_type CHAR(50),
		 address CHAR(50),
     city_id INT NOT NULL,
     FOREIGN KEY (city_id) REFERENCES city(city_id),
     FOREIGN KEY(country_id) REFERENCES country(country_id)
);

-- expense Table Create 
CREATE TABLE IF NOT EXISTS expense (
    travel_id INT,
    budget INT,
    number_of_travelers INT,
    FOREIGN KEY (travel_id) REFERENCES travel(travel_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Hotel Rating Table Create
CREATE TABLE IF NOT EXISTS hotel_rating (
hotel_rating_id INT PRIMARY KEY,
hotel_id INT,
hotel_rating DECIMAL(3, 1),
FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

-- Restaurant Rating Table Create
CREATE TABLE IF NOT EXISTS restaurant_rating (
restaurant_rating_id INT AUTO_INCREMRIMAR PRIMARY KEY,
restaurant_id INT,
restaurant_rating DECIMAL(3, 1),
restaurant_review TEXT,
FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

-- City Rating Table Create
CREATE TABLE IF NOT EXISTS city_rating (
city_rating_id INT AUTO_INCREMENT PRIMARY KEY,
city_id INT,
city_rating DECIMAL(3, 1),
FOREIGN KEY (city_id) REFERENCES city(city_id)
);

-- souvenir Table Create
CREATE TABLE IF NOT EXISTS souvenir (
souvenir_id INT AUTO_INCREMENT PRIMARY KEY,
souvenir_name VARCHAR(50) NOT NULL,
city_id INT FOREIGN KEY,
price INT,
sale INT,
CONSTRAINT souvenir_ibfk_1 FOREIGN KEY (city_id) REFERENCES city(city_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Language Table Create
CREATE TABLE IF NOT EXISTS languages (
    language_id INT PRIMARY KEY,
    language_name VARCHAR(50),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Restaurant Discount Table Create
CREATE TABLE IF NOT EXISTS restaurant_discount (
    restaurant_discount_Id INT PRIMARY KEY,
    restaurant_id INT,
    restaurant_discount_available BOOLEAN,
    restaurant_discount_rate INT,
    restaurant_discount_period INT, 
    FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

-- Hotel Discount Table Create
CREATE TABLE IF NOT EXISTS hotel_discount (
    hotel_discount_Id INT PRIMARY KEY,
    hotel_id INT,
    hotel_discount_available BOOLEAN,
    hotel_discount_rate INT,
    hotel_discount_period INT, 
   FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id)
);

-- Currency Exchange Table Create
CREATE TABLE IF NOT EXISTS currency_exchange (
	exchange_id INT PRIMARY KEY,
	currency VARCHAR(50),
	exchange_rate DECIMAL(10, 2),
	country_id INT,
	FOREIGN KEY (country_id) REFERENCES country(country_id)
);
