-- Insert Data into country Table
INSERT INTO country (country_name) 
VALUES ('France'), ('Czech Republic'), ('Swiss'), ('UK'), ('Italia');

-- Insert Data into city Table
INSERT INTO city (city_id, city_name, country_id)
VALUES
    (1, 'Marseille', 1), (2, 'Bordeaux', 1), (3, 'Caen', 1),
    (4, 'Prague', 2), (5, 'Karlovy-vary', 2),
    (6, 'Zurich', 3), (7, 'Geneva', 3),
    (8, 'London', 4), (9, 'Manchester', 4),
    (10, 'Florence', 5), (11, 'Rome', 5), (12, 'Venezia', 5);

-- Insert Data into travel Table
INSERT INTO travel (travel_id, city_id, traveler_name, travel_start_date, travel_end_date)
VALUES
    (1, 1, 'James Smith', '2020-05-03', '2020-05-06'),
    (2, 1, 'Robert Johnson', '2020-05-03', '2020-05-09'),
    (3, 2, 'Mary Williams', '2020-05-06', '2020-05-09'),
    (4, 2, 'Patricia Brown', '2020-05-06', '2020-05-08'),
    (5, 3, 'Jennifer Jones', '2020-05-06', '2020-05-14'),
    (6, 3, 'Linda Garcia', '2020-05-07', '2020-05-10'),
    (7, 4, 'Michael Miller', '2020-05-07', '2020-05-11'),
    (8, 4, 'John Davis', '2020-05-10', '2020-05-11'),
    (9, 5, 'David Rodriguez', '2020-05-10', '2020-05-13'),
    (10, 5, 'William Martinez', '2020-05-13', '2020-05-18'),
    (11, 6, 'Barbara Hernandez', '2020-05-13', '2020-05-20'),
    (12, 6, 'Elizabeth Lopez', '2020-05-14', '2020-06-14'),
    (13, 7, 'Susan Gonzalez', '2020-05-14', '2020-05-31'),
    (14, 7, 'Jessica Wilson', '2020-05-18', '2020-05-25'),
    (15, 8, 'Richard Anderson', '2020-05-18', '2020-05-21'),
    (16, 8, 'Joseph Thomas', '2020-05-19', '2020-05-30'),
    (17, 9, 'Thomas Taylor', '2020-05-20', '2020-05-31'),
    (18, 9, 'Christopher Moore', '2020-05-21', '2020-05-22'),
    (19, 10, 'Sarah Jackson', '2020-05-21', '2020-05-31'),
    (20, 10, 'Karen Martin', '2020-05-21', '2020-05-25'),
    (21, 11, 'Lisa Lee', '2020-05-22', '2020-05-06'),
    (22, 11, 'Nancy Perez', '2020-05-22', '2020-07-01'),
    (23, 12, 'Charles Thompson', '2020-05-24', '2020-05-26'),
    (24, 12, 'Daniel White', '2020-05-26', '2020-07-26');



-- Insert Random Data into weather Table
INSERT INTO weather (city_id, date, temperature, conditions)
SELECT
    city_id,
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 366) DAY),
    FLOOR(RAND() * 41) - 10, -- Random temperature range -10 ~ 30
    CASE (FLOOR(RAND() * 4))
        WHEN 0 THEN 'Sunny'
        WHEN 1 THEN 'Cloudy'
        WHEN 2 THEN 'Rainy'
        ELSE 'Windy'
    END
FROM
    (SELECT 1 AS city_id UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10 UNION SELECT 11 UNION SELECT 12) AS Cities;

-- Insert Data to hotel Table
INSERT INTO hotel (hotel_id, city_id, hotel_name, price, accomodation_number)
VALUES
    (1, 1, 'Hotel Dieu', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (2, 1, 'Sofitel Marseille Vieux Port Hotel', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (3, 2, 'Intercontinental Bordeaux Le Grand Hotel', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (4, 2, 'Renaissance Bordeaux Hotel', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (5, 3, 'Kyriad Direct Caen Nord Memorial', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (6, 3, 'Séjours & Affaires Caen Le Clos Beaumois', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (7, 4, 'Grandium Hotel Prague', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (8, 4, 'Grand Hotel Bohemia', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (9, 5, 'Spa Hotel Imperial', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (10, 5, 'Hotel Romance', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (11, 6, 'Central Plaza', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (12, 6, 'Ruby Mimi Hotel Zurich', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (13, 7, 'Nash Suites Airport Hotel', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (14, 7, 'InterContinental Genève, an IHG Hotel', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (15, 8, 'Zedwell Piccadilly Circus', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (16, 8, 'The Tower Hotel', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (17, 9, 'Citysuites Aparthotel', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (18, 9, 'Delta Hotels Worsley Park Country Club', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (19, 10, 'Hotel Machiavelli Palace', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (20, 10, 'Hostel Archi Rossi', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (21, 11, 'Sina Bernini Bristol', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (22, 11, 'NH Collection Palazzo Cinquecento', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (23, 12, 'Venice Times Hotel', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (24, 12, 'SHG Hotel Salute Palace', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2)),
    (25, 1, 'Grand Hotel in City 1', 95000, 4),
    (26, 1, 'Sunset Resort in City 1', 180000, 5),
    (27, 1, 'Golden Sands in City 1', 230000, 6),
    (28, 1, 'Mountain View in City 1', 120000, 3),
    (29, 2, 'Seaside Palace in City 2', 270000, 6),
    (30, 2, 'Central Plaza in City 2', 125000, 4),
    (31, 2, 'Riverfront Suites in City 2', 200000, 5),
    (32, 2, 'Tranquil Haven in City 2', 150000, 4),
    (33, 3, 'Urban Escape in City 3', 135000, 3),
    (34, 3, 'Harbor Lights in City 3', 165000, 4),
    (35, 3, 'Elegant Oasis in City 3', 145000, 5),
    (36, 3, 'Parkside Inn in City 3', 110000, 3),
    (37, 4, 'Grandium Hotel in City 4', 250000, 6),
    (38, 4, 'Grand Hotel Bohemia in City 4', 190000, 5),
    (39, 4, 'Spa Hotel Imperial in City 4', 280000, 6),
    (40, 4, 'Hotel Romance in City 4', 210000, 5),
    (41, 5, 'Citysuites Aparthotel in City 5', 195000, 5),
    (42, 5, 'Delta Hotels Worsley Park in City 5', 170000, 4),
    (43, 5, 'Hotel Machiavelli Palace in City 5', 225000, 6),
    (44, 5, 'Hostel Archi Rossi in City 5', 185000, 5),
    (45, 6, 'Central Plaza in City 6', 280000, 6),
    (46, 6, 'Ruby Mimi Hotel Zurich in City 6', 155000, 4),
    (47, 6, 'Nash Suites Airport Hotel in City 6', 210000, 5),
    (48, 6, 'InterContinental Genève in City 6', 245000, 6),
    (49, 7, 'Zedwell Piccadilly Circus in City 7', 165000, 4),
    (50, 7, 'The Tower Hotel in City 7', 230000, 5),
    (51, 7, 'Riverfront Oasis in City 7', 200000, 5),
    (52, 7, 'Tranquil Gardens in City 7', 260000, 6),
    (53, 8, 'Lakeside Lodge in City 8', 235000, 6),
    (54, 8, 'Pinecrest Retreat in City 8', 180000, 5),
    (55, 8, 'Mountain View Manor in City 8', 195000, 5),
    (56, 8, 'Hillside Haven in City 8', 195000, 5),
    (57, 9, 'Villa Verde in City 9', 170000, 4),
    (58, 9, 'Sapphire Skies in City 9', 230000, 5),
    (59, 9, 'Seaview Sanctuary in City 9', 200000, 5),
    (60, 9, 'Riverside Resort in City 9', 260000, 6),
    (61, 10, 'Sunset Serenade in City 10', 235000, 6),
    (62, 10, 'Golden Gate in City 10', 190000, 5),
    (63, 10, 'Emerald Escapes in City 10', 300000, 6),
    (64, 10, 'Royal Retreat in City 10', 180000, 5),
    (65, 11, 'Central Suites in City 11', 195000, 5),
    (66, 11, 'Tranquility Terrace in City 11', 220000, 5),
    (67, 11, 'Marina View in City 11', 240000, 5),
    (68, 11, 'Majestic Heights in City 11', 270000, 6),
    (69, 12, 'Lighthouse Bay in City 12', 185000, 5),
    (70, 12, 'Ocean Breeze in City 12', 200000, 5),
    (71, 12, 'Palm Grove in City 12', 160000, 4),
    (72, 12, 'Seaview Plaza in City 12', 175000, 4);



INSERT INTO transportation (transportation_id, country_id, method, price)
VALUES
     (1, 1, 'subway', 1.9),
     (2, 1, 'bus', 2),
     (3, 1, 'train', 60),
     (4, 1, 'airplane', 150),
     (5, 1, 'ship', 80),
     (6, 1, 'taxi', 20),
     (7, 1, 'ferry', 70),
     (8, 1, 'bicycle', 1.5),
     (9, 2, 'bus', 20),
     (10, 2, 'train', 300),
     (11, 2, 'airplane', 1500),
     (12, 2, 'ship', 1000),
     (13, 2, 'taxi', 30),
     (14, 2, 'ferry', 800),
     (15, 2, 'subway', 24),
     (16, 2, 'bicycle', 1.7),
     (17, 3, 'train', 60),
     (18, 3, 'airplane', 200),
     (19, 3, 'ship', 80),
     (20, 3, 'taxi', 7),
     (21, 3, 'ferry', 70),
     (22, 3, 'subway', 2.7),
     (23, 3, 'bus', 2.6),
     (24, 3, 'bicycle', 4),
     (25, 4, 'airplane', 160),
     (26, 4, 'ship', 40),
     (27, 4, 'taxi', 3),
     (28, 4, 'ferry', 35),
     (29, 4, 'subway', 2.5),
     (30, 4, 'bus', 3),
     (31, 4, 'train', 100),
     (32, 4, 'bicycle', 2),
     (33, 5, 'ship', 77),
     (34, 5, 'taxi', 4),
     (35, 5, 'ferry', 65),
     (36, 5, 'subway', 1.7),
     (37, 5, 'bus', 2),
     (38, 5, 'train', 80),
     (39, 5, 'airplane', 170),
     (40, 5, 'bicycle', 2.2);

-- Insert Data to restaurant Table
INSERT INTO restaurant (restaurant_id, country_id, restaurant_name, cuisine_type, address, city_id)
VALUES
     (1, 1, 'Han Cook Mat Jib', '한식', '123 Rue de la Liberté, Marseille, 75001, France',1),
     (2, 2, 'Go Yo Han Mat', '한식', '123 Prague Street, Prague, 110 00, Czech Republic',4),
     (3, 3, 'Han Kki Byeol Mi', '한식', '123 Alpine Street, Zurich, 8001, Switzerland',6),
     (4, 4, 'Han Ok Chef', '한식', '123 Oxford Street, London, W1D 1AA, United Kingdom',8),
     (5, 5, 'Gam Dong Han Sik', '한식', '123 Via del Corso, Florence, 00186, Italy',10),
     (6, 1, 'Hanaki', '일식', '456 Avenue des Champs-Élysées, Bordeaux, 06000, France',2),
     (7, 2, 'Sora', '일식', '456 Avenue, Karlovy Vary, 360 01, Czech Republic',5),
     (8, 3, 'Mizu', '일식', '456 Lake Geneva Road, Geneva, 1201, Switzerland',7),
     (9, 4, 'Sakura', '일식', '456 Abbey Road, Manchester, L1 9EE, United Kingdom',9),
     (10, 5, 'Ichigo', '일식', '789 Via Condotti, Rome, 00187, Italy',11),
     (11, 1, 'Geumryong', '중식', '789 Boulevard Saint-Germain, Caen, 69001, France',3),
     (12, 2, 'Dalma', '중식', '789 Brno Boulevard, Prague, 602 00, Czech Republic',4),
     (13, 3, 'Manli', '중식', '789 Matterhorn Avenue, Zurich, 3920, Switzerland',6),
     (14, 4, 'Cheongryong', '중식', '789 Baker Street, London, NW1 6XE, United Kingdom',8),
     (15, 5, 'Hyangto', '중식', '101 Via Montenapoleone, Venezia, 20121, Italy',12),
     (16, 1, 'La Cucina', '양식', 'Rue du Saint-Honoré, Marseille, 13001, France',1),
     (17, 2, 'Bourgogne', '양식', '101 Ostrava Lane, Karlovy-vary, 702 00, Czech Republic',5),
     (18, 3, 'The Table', '양식', '101 Rhine River Drive, Geneva, 4001, Switzerland',7),
     (19, 4, 'Garden', '양식', '101 Regent, Manchester, M1 5TA, United Kingdom',9),
     (20, 5, 'Bistro Bleu', '양식', '567 Via dei Fori Imperiali, Florence, 00186, Italy',10),
     (21, 5, 'Gallery Table', '양식', '111 Via Veneto, Rome, 00187, Italy',11),
     (22, 4, 'Oriental Delights', '중식', '234 Bucking Road, London, SW1W 0RP, United Kingdom',8),
     (23, 3, 'Lantern Lane', '중식', '234 Jungfrau Lane, Zurich, 3800, Switzerland',6),
     (24, 2, 'Tokyo Taste', '일식', '333 Pardubice, Prague, 530 02, Czech Republic',4),
     (25, 1, 'Han Cook', '한식', '234 Quai des Chartrons, Bordeaux, 33000, France',2),
     (26, 5, 'Han Kitchen', '한식', '222 Piazzale Michelangelo, Venezia, 50125, Italy',12),
     (27, 4, 'Sushi House', '일식', '567 KingRoad, Manchester, SW10 0BB, United Kingdom',9),
     (28, 3, 'Chopsticks Fortune', '중식', '567 Lucerne Boulevard, Geneva, 6000, Switzerland',7),
     (29, 2, 'Maison Mimi', '양식', '222 Olomouc Road, Karlovy-vary, 771 00, Czech Republic',5),
     (30, 1, 'Gourmet Galaxy', '양식', '567 Place de la République, Caen, 59000, France',3),
     (31, 2, 'Culinary Canvas', '양식', '555 Masaryk Square, Prague, 600 01, Czech Republic',4),
     (32, 5, 'Dragon Palace', '중식', '333 Via Appia Antica, Florence, 00179, Italy',10),
     (33, 4, 'Palace', '중식', '890 Princes, London, EH2 2ER, United Kingdom',8),
     (34, 3, 'The Table', '일식', '890 Bernese Oberland, Zurich, 3011, Switzerland',6),
     (35, 2, 'Umi', '일식', '1111 Boulevard, Karlovy-vary, 361 00, Czech Republic',5),
     (36, 3, 'Gam Dong', '한식', '111 Swiss National Park, Geneva, 7530, Switzerland',7),
     (37, 4, 'K-Food', '한식', '111 Portland, Manchester, W1W 6QQ, United Kingdom',9),
     (38, 1, 'Sushi Bar', '일식', '890 Rue du Mont-Cenis, Marseille, 38000, France',1),
     (39, 5, 'Sushi Lounge', '일식', '444 Via Garibaldi, Rome, 80142, Italy',11),
     (40, 1, 'Delicious Food', '양식', '111 Rue du Temple, Bordeaux, 67000, France',2),
     (41, 1, 'Han Cook', '한식', '100 Rue de la Liberté, Marseille, 75001, France',1),
     (42, 2, 'Delicious Korean Food', '한식', '100 Prague Street, Prague, 110 00, Czech Republic',4),
     (43, 3, 'Mat', '한식', '100 Alpine Street, Zurich, 8001, Switzerland',6),
     (44, 4, 'KFOOD', '한식', '100 Oxford Street, London, W1D 1AA, United Kingdom',8),
     (45, 5, 'Han Sik', '한식', '100 Via del Corso, Rome, 00186, Italy',10),
     (46, 1, 'Japanese Food', '일식', '444 Avenue des Champs-Élysées, Bordeaux, 06000, France',2),
     (47, 2, 'JFOOD', '일식', '444 Avenue, Karlovy-vary, 360 01, Czech Republic',5),
     (48, 3, 'Sushi', '일식', '444 Lake Geneva Road, Geneva, 1201, Switzerland',7),
     (49, 4, 'Osaka Oasis', '일식', '444 Abbey Road, Manchester, L1 9EE, United Kingdom',9),
     (50, 5, 'Ninja Nosh', '일식', '777 Via Condotti, Rome, 00187, Italy',11),
     (51, 1, 'Emperors Feast', '중식', '777 Boulevard Saint-Germain, Caen, 69001, France',3),
     (52, 2, 'Jade Garden Joy', '중식', '777 Brno Boulevard, Prague, 602 00, Czech Republic',4),
     (53, 3, 'CFOOD', '중식', '777 Matterhorn Avenue, Zurich, 3920, Switzerland',6),
     (54, 4, 'Chinese Food', '중식', '777 Baker Street, London, NW1 6XE, United Kingdom',8),
     (55, 5, 'Silk Road Eats', '중식', '100 Via Montenapoleone, Venezia, 20121, Italy',12),
     (56, 1, 'Fusion Feast', '양식', 'Rue du Saint-Honoré, Marseille, 13000, France',1),
     (57, 2, 'Palate Pavilion', '양식', '100 Ostrava Lane, Karlovy-vary, 702 00, Czech Republic',5),
     (58, 3, 'WesternTable', '양식', '100 Rhine River Drive, Geneva, 4001, Switzerland',7),
     (59, 4, 'Delicious Garden', '양식', '100 Regent, Manchester, M1 5TA, United Kingdom',9),
     (60, 5, 'Epicure Express', '양식', '500 Via dei Fori Imperiali, Florence, 00186, Italy',10),
     (61, 5, 'Truffle Temptations', '양식', '100 Via Veneto, Rome, 00187, Italy',11),
     (62, 4, 'Oriental', '중식', '200 Bucking Road, London, SW1W 0RP, United Kingdom',8),
     (63, 3, 'Panda Palace', '중식', '200 Jungfrau Lane, Zurich, 3800, Switzerland',6),
     (64, 2, 'Tsuki Sushi Lounge', '일식', '300 Pardubice, Prague, 530 02, Czech Republic',4),
     (65, 1, 'Kimchi', '한식', '200 Quai des Chartrons, Bordeaux, 33000, France',2),
     (66, 5, 'Hanul Harmony', '한식', '200 Piazzale Michelangelo, Venezia, 50125, Italy',12),
     (67, 4, 'Miso Magic', '일식', '500 KingRoad, Manchester, SW10 0BB, United Kingdom',9),
     (68, 3, 'Chopsticks', '중식', '500 Lucerne Boulevard, Geneva, 6000, Switzerland',7),
     (69, 2, 'Epicurean Elegance', '양식', '200 Olomouc Road, Karlovy-vary, 771 00, Czech Republic',5),
     (70, 1, 'Basil Bloom Bistro', '양식', '500 Place de la République, Caen, 59000, France',3),
     (71, 2, 'Savory Seasons', '양식', '567 Masaryk Square, Prague, 600 01, Czech Republic',4),
     (72, 5, 'Panda World', '중식', '345 Via Appia Antica, Florence, 00179, Italy',10),
     (73, 4, 'Golden Dumpling Delight', '중식', '899 Princes, Edinburgh, EH2 2ER, United Kingdom',8),
     (74, 3, 'Sashimi Symphony', '일식', '899 Bernese Oberland, Zurich, 3011, Switzerland',6),
     (75, 2, 'Tempura Twist', '일식', '1234 Boulevard, Karlovy-vary, 361 00, Czech Republic',5),
     (76, 3, 'Jeon Joy', '한식', '123 Swiss National Park, Geneva, 7530, Switzerland',7),
     (77, 4, 'Mandu Mansion', '한식', '123 Portland, Manchester, W1W 6QQ, United Kingdom',9),
     (78, 1, 'Sushi World', '일식', '888 Rue du Mont-Cenis, Marseille, 38000, France',1),
     (79, 5, 'Nippon Bites', '일식', '456 Via Garibaldi, Rome, 80142, Italy',11),
     (80, 1, 'Tasty', '양식', '123 Rue du Temple, Bordeaux, 67000, France',2);

INSERT INTO expense (travel_id, budget, number_of_travelers)
VALUES 
    (1, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (2, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (3, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (4, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (5, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (6, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (7, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (8, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (9, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (10, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (11, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (12, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (13, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (14, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (15, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (16, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (17, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (18, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (19, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (20, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (21, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (22, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (23, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1)),
    (24, FLOOR(RAND() * (3000000 - 100000 + 1) + 100000), FLOOR(RAND() * (7 - 1 + 1) + 1));


-- Insert Data to city_rating Table
INSERT INTO city_rating (city_id, city_rating)
VALUES 
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10)),
		(FLOOR(RAND() * (12 - 1 + 1) + 1), FLOOR(RAND() * 6 * 10));


-- Insert Data to souvenir Table
INSERT INTO souvenir (souvenir_id, souvenir_name, city_id, price, sale) 
VALUES
    (1, '수제 비누', 1, 35000, 3),
    (2, '와인', 1, 50000, 7),
    (3, '향수', 2, 80000, 2),
    (4, '지도 티셔츠', 2, 35000, 8),
    (5, '미술관 아트북', 2, 50000, 1),
    (6, '프랑스 치즈 세트', 3, 80000, 5),
    (7, '프랑스 명품 가방', 3, 3000000, 0),
    (8, '프랑스 유럽 여행 가이드북', 3, 25000, 10),
    (9, '프라하 성 액자', 4, 40000, 4),
    (10, '카를교 포스터', 4, 20000, 6),
    (11, '보헤미안 크리스탈 장식품', 5, 100000, 9),
    (12, '체코 맥주 세트', 5, 60000, 3),
    (13, '프라하 도보 여행 맵', 4, 15000, 10),
    (14, '베를린 벽 조각품', 6, 60000, 2),
    (15, '독일 전통복식 인형', 6, 45000, 7),
    (16, '뮌헨 맥주가품 세트', 7, 70000, 8),
    (17, '독일 전통가구 모형', 6, 90000, 1),
    (18, '독일 전쟁 역사 서적', 7, 40000, 5),
    (19, '버킹엄 궁전 모형', 8, 55000, 6),
    (20, '런던 전통 차 세트', 9, 60000, 9),
    (21, '해리포터 시리즈 컬렉션', 8, 120000, 3),
    (22, '코튼 대학교 기념품', 9, 450, 4);

-- Insert Data to restaurant_rating Table
INSERT INTO restaurant_rating (restaurant_rating_id, restaurant_id, restaurant_rating, restaurant_review)
VALUES
    (1, 1, 3.5, 'Good food, nice atmosphere.'),
    (2, 2, 4.2, 'Excellent service and tasty dishes.'),
    (3, 3, 2.8, 'Average experience, could be better.'),
    (4, 4, 5.0, 'Outstanding! Highly recommended.'),
    (5, 5, 1.5, 'Disappointing, will not come back.'),
    (6, 6, 3.0, 'Decent food but slow service.'),
    (7, 7, 4.7, 'Fantastic place with a great view.'),
    (8, 8, 2.5, 'Below expectations, needs improvement.'),
    (9, 9, 0.8, 'Terrible experience, would not recommend.'),
    (10, 10, 5.0, 'Absolutely amazing! A must-visit.'),
    (11, 11, 3.2, 'Good value for money.'),
    (12, 12, 4.0, 'Delicious food and friendly staff.'),
    (13, 13, 1.9, 'Mediocre, would not go again.'),
    (14, 14, 2.1, 'Fair, but nothing special.'),
    (15, 15, 4.5, 'Impressive menu and great service.'),
    (16, 16, 0.5, 'Awful experience, avoid at all costs.'),
    (17, 17, 3.8, 'Pleasant dining experience.'),
    (18, 18, 1.2, 'Poor quality, not worth the price.'),
    (19, 19, 4.8, 'Exceptional service and top-notch cuisine.'),
    (20, 20, 2.3, 'Not bad, but could be better.'),
    (21, 21, 3.6, 'Solid choice for a casual meal.'),
    (22, 22, 4.1, 'Great ambiance and diverse menu.'),
    (23, 23, 2.7, 'Okay, but nothing extraordinary.'),
    (24, 24, 4.9, 'Exquisite flavors, a true gem.'),
    (25, 25, 1.3, 'Unpleasant experience, not recommended.'),
    (26, 26, 3.4, 'Satisfying meal with prompt service.'),
    (27, 27, 4.6, 'Wonderful flavors and attentive staff.'),
    (28, 28, 2.4, 'Needs improvement in both food and service.'),
    (29, 29, 0.9, 'Avoid at all costs, terrible service.'),
    (30, 30, 5.0, 'An absolute delight, exceeded expectations.'),
    (31, 31, 3.1, 'Fair prices and tasty dishes.'),
    (32, 32, 4.3, 'Delicious food paired with excellent service.'),
    (33, 33, 1.8, 'Underwhelming experience, wouldn\'t return.'),
    (34, 34, 2.2, 'Average at best, nothing outstanding.'),
    (35, 35, 4.4, 'Impressive variety and attentive service.'),
    (36, 36, 0.6, 'Terrible service, do not recommend.'),
    (37, 37, 3.9, 'Enjoyable dining experience overall.'),
    (38, 38, 1.1, 'Subpar quality, not worth the price.'),
    (39, 39, 4.7, 'Exceptional service and culinary delights.'),
    (40, 40, 2.5, 'Not bad, but room for improvement.'),
    (41, 41, 3.5, 'Good food, pleasant atmosphere.'),
    (42, 42, 4.2, 'Excellent service and flavorful dishes.'),
    (43, 43, 2.8, 'Average experience, could use improvement.'),
    (44, 44, 5.0, 'Outstanding! Highly recommend this place.'),
    (45, 45, 1.5, 'Disappointing, won\'t be returning.'),
    (46, 46, 3.0, 'Decent food, but service was slow.'),
    (47, 47, 4.7, 'Fantastic place with a breathtaking view.'),
    (48, 48, 2.5, 'Below expectations, needs enhancements.'),
    (49, 49, 0.8, 'Terrible experience, strongly advise against.'),
    (50, 50, 5.0, 'Absolutely amazing! A must-visit spot.'),
    (51, 51, 3.2, 'Good value for money, enjoyed the meal.'),
    (52, 52, 4.0, 'Delicious food and a welcoming staff.'),
    (53, 53, 1.9, 'Mediocre experience, not likely to return.'),
    (54, 54, 2.1, 'Fair, but nothing stood out.'),
    (55, 55, 4.5, 'Impressive menu and exceptional service.'),
    (56, 56, 0.5, 'Awful experience, strongly advise avoiding.'),
    (57, 57, 3.8, 'Pleasant dining experience with tasty options.'),
    (58, 58, 1.2, 'Poor quality, not justified by the price.'),
    (59, 59, 4.8, 'Exceptional service and top-tier cuisine.'),
    (60, 60, 2.3, 'Not bad, but there\'s room for improvement.'),
    (61, 61, 3.6, 'Solid choice for those seeking a casual meal.'),
    (62, 62, 4.1, 'Great ambiance and a diverse menu to explore.'),
    (63, 63, 2.7, 'Okay, but lacks the wow factor.'),
    (64, 64, 4.9, 'Exquisite flavors, a culinary masterpiece.'),
    (65, 65, 1.3, 'Unpleasant experience, avoid at all costs.'),
    (66, 66, 3.4, 'Satisfying meal with prompt and friendly service.'),
    (67, 67, 4.6, 'Wonderful flavors and exceptional service.'),
    (68, 68, 2.4, 'Needs improvement in both culinary offerings and service.'),
    (69, 69, 0.9, 'Terrible service, would not recommend.'),
    (70, 70, 5.0, 'An absolute delight, exceeded all expectations.'),
    (71, 71, 3.1, 'Fair prices and consistently tasty dishes.'),
    (72, 72, 4.3, 'Delicious food paired with outstanding service.'),
    (73, 73, 1.8, 'Underwhelming experience, unlikely to return.'),
    (74, 74, 2.2, 'Average at best, nothing to write home about.'),
    (75, 75, 4.4, 'Impressive variety and attentive service.'),
    (76, 76, 0.6, 'Terrible service, strongly advise against.'),
    (77, 77, 3.9, 'Enjoyable dining experience overall.'),
    (78, 78, 1.1, 'Subpar quality, not worth the price.'),
    (79, 79, 4.7, 'Exceptional service and culinary delights.'),
    (80, 80, 2.5, 'Not bad, but there\'s room for improvement.');

-- Insert Data to language Table
INSERT INTO languages (language_id, language_name, country_id)
VALUES 
    (1, '프랑스어', 1),
    (2, '체코어', 2),
    (3, '실레시아어', 2),
    (4, '독일어', 3),
    (5, '영어', 4),
    (6, '이탈리아어', 5);

-- Insert Data restaurant_discount Table
INSERT INTO restaurant_discount (restaurant_discount_Id, restaurant_id, restaurant_discount_available, restaurant_discount_rate, restaurant_discount_period)
VALUES
    (1, 1, TRUE, 10, 30),
    (2, 2, FALSE, NULL, NULL),
    (3, 3, TRUE, 25, 30),
    (4, 4, FALSE, NULL, NULL),
    (5, 5, TRUE, 30, 20),
    (6, 6, FALSE, NULL, NULL),
    (7, 7, TRUE, 20, 40),
    (8, 8, FALSE, NULL, NULL),
    (9, 9, TRUE, 15, 10),
    (10, 10, FALSE, NULL, NULL),
    (11, 11, TRUE, 10, 35),
    (12, 12, FALSE, NULL, NULL),
    (13, 13, TRUE, 5, 15),
    (14, 14, FALSE, NULL, NULL),
    (15, 15, TRUE, 35, 30),
    (16, 16, FALSE, NULL, NULL),
    (17, 17, TRUE, 40, 25),
    (18, 18, FALSE, NULL, NULL),
    (19, 19, TRUE, 45, 40),
    (20, 20, FALSE, NULL, NULL),
    (21, 21, TRUE, 10, 30),
    (22, 22, FALSE, NULL, NULL),
    (23, 23, TRUE, 25, 30),
    (24, 24, FALSE, NULL, NULL),
    (25, 25, TRUE, 30, 20),
    (26, 26, FALSE, NULL, NULL),
    (27, 27, TRUE, 20, 40),
    (28, 28, FALSE, NULL, NULL),
    (29, 29, TRUE, 15, 10),
    (30, 30, FALSE, NULL, NULL),
    (31, 31, TRUE, 10, 35),
    (32, 32, FALSE, NULL, NULL),
    (33, 33, TRUE, 5, 15),
    (34, 34, FALSE, NULL, NULL),
    (35, 35, TRUE, 35, 30),
    (36, 36, FALSE, NULL, NULL),
    (37, 37, TRUE, 40, 25),
    (38, 38, FALSE, NULL, NULL),
    (39, 39, TRUE, 45, 40),
    (40, 40, FALSE, NULL, NULL),
    (41, 41, TRUE, 10, 30),
    (42, 42, FALSE, NULL, NULL),
    (43, 43, TRUE, 25, 30),
    (44, 44, FALSE, NULL, NULL),
    (45, 45, TRUE, 30, 20),
    (46, 46, FALSE, NULL, NULL),
    (47, 47, TRUE, 20, 40),
    (48, 48, FALSE, NULL, NULL),
    (49, 49, TRUE, 15, 10),
    (50, 50, FALSE, NULL, NULL),
    (51, 51, TRUE, 10, 35),
    (52, 52, FALSE, NULL, NULL),
    (53, 53, TRUE, 5, 15),
    (54, 54, FALSE, NULL, NULL),
    (55, 55, TRUE, 35, 30),
    (56, 56, FALSE, NULL, NULL),
    (57, 57, TRUE, 40, 25),
    (58, 58, FALSE, NULL, NULL),
    (59, 59, TRUE, 45, 40),
    (60, 60, FALSE, NULL, NULL),
    (61, 61, TRUE, 10, 30),
    (62, 62, FALSE, NULL, NULL),
    (63, 63, TRUE, 25, 30),
    (64, 64, FALSE, NULL, NULL),
    (65, 65, TRUE, 30, 20),
    (66, 66, FALSE, NULL, NULL),
    (67, 67, TRUE, 20, 40),
    (68, 68, FALSE, NULL, NULL),
    (69, 69, TRUE, 15, 10),
    (70, 70, FALSE, NULL, NULL),
    (71, 71, TRUE, 10, 35),
    (72, 72, FALSE, NULL, NULL),
    (73, 73, TRUE, 5, 15),
    (74, 74, FALSE, NULL, NULL),
    (75, 75, TRUE, 35, 30),
    (76, 76, FALSE, NULL, NULL),
    (77, 77, TRUE, 40, 25),
    (78, 78, FALSE, NULL, NULL),
    (79, 79, TRUE, 45, 40),
    (80, 80, FALSE, NULL, NULL);

-- Insert Data to hotel_discount Table
INSERT INTO hotel_discount (hotel_discount_Id, hotel_id, hotel_discount_available, hotel_discount_rate, hotel_discount_period)
VALUES
    (1, 1, TRUE, 45, 30),
    (2, 2, FALSE, NULL, NULL),
    (3, 3, TRUE, 20, 30),
    (4, 4, FALSE, NULL, NULL),
    (5, 5, TRUE, 60, 20),
    (6, 6, FALSE, NULL, NULL),
    (7, 7, TRUE, 35, 40),
    (8, 8, FALSE, NULL, NULL),
    (9, 9, TRUE, 10, 10),
    (10, 10, FALSE, NULL, NULL),
    (11, 11, TRUE, 50, 35),
    (12, 12, FALSE, NULL, NULL),
    (13, 13, TRUE, 15, 5),
    (14, 14, FALSE, NULL, NULL),
    (15, 15, TRUE, 30, 30),
    (16, 16, FALSE, NULL, NULL),
    (17, 17, TRUE, 70, 25),
    (18, 18, FALSE, NULL, NULL),
    (19, 19, TRUE, 25, 40),
    (20, 20, FALSE, NULL, NULL),
    (25, 1, TRUE, 45, 30),
    (26, 2, FALSE, NULL, NULL),
    (27, 3, TRUE, 20, 30),
    (28, 4, FALSE, NULL, NULL),
    (29, 5, TRUE, 60, 20),
    (30, 6, FALSE, NULL, NULL),
    (31, 7, TRUE, 35, 40),
    (32, 8, FALSE, NULL, NULL),
    (33, 9, TRUE, 10, 10),
    (34, 10, FALSE, NULL, NULL),
    (35, 11, TRUE, 50, 35),
    (36, 12, FALSE, NULL, NULL),
    (37, 13, TRUE, 15, 5),
    (38, 14, FALSE, NULL, NULL),
    (39, 15, TRUE, 30, 30),
    (40, 16, FALSE, NULL, NULL),
    (41, 17, TRUE, 70, 25),
    (42, 18, FALSE, NULL, NULL),
    (43, 19, TRUE, 25, 40),
    (44, 20, FALSE, NULL, NULL),
    (45, 21, TRUE, 25, 20),
    (46, 22, FALSE, NULL, NULL),
    (47, 23, TRUE, 30, 15),
    (48, 24, FALSE, NULL, NULL),
    (49, 25, TRUE, 40, 25),
    (50, 26, FALSE, NULL, NULL),
    (51, 27, TRUE, 15, 30),
    (52, 28, FALSE, NULL, NULL),
    (53, 29, TRUE, 20, 20),
    (54, 30, FALSE, NULL, NULL),
    (55, 31, TRUE, 50, 35),
    (56, 32, FALSE, NULL, NULL),
    (57, 33, TRUE, 30, 25),
    (58, 34, FALSE, NULL, NULL),
    (59, 35, TRUE, 60, 30),
    (60, 36, FALSE, NULL, NULL),
    (61, 37, TRUE, 45, 40),
    (62, 38, FALSE, NULL, NULL),
    (63, 39, TRUE, 10, 15),
    (64, 40, FALSE, NULL, NULL),
    (65, 41, TRUE, 25, 20),
    (66, 42, FALSE, NULL, NULL),
    (67, 43, TRUE, 30, 15),
    (68, 44, FALSE, NULL, NULL),
    (69, 45, TRUE, 40, 25),
    (70, 46, FALSE, NULL, NULL),
    (71, 47, TRUE, 15, 30),
    (72, 48, FALSE, NULL, NULL);

-- Insert Data to exchange_currency Table (11월 5일 기준)
INSERT INTO currency_exchange (exchange_id, currency, exchange_rate, country_id)
VALUES
    (1, 'EUR', 1405.42, 1),
    (2, 'CZK', 57.58, 2),
    (3, 'CHF', 1456.09, 3),
    (4, 'GBP', 1620.10, 4),
    (5, 'EUR', 1405.42, 5);

-- Insert Data to hotel_rating Table
INSERT INTO hotel_rating (hotel_rating_id, hotel_id, hotel_rating)
VALUES
    (1, 1, 3.5),
    (2, 2, 4.2),
    (3, 3, 2.8),
    (4, 4, 5.0),
    (5, 5, 1.5),
    (6, 6, 3.0),
    (7, 7, 4.7),
    (8, 8, 2.5),
    (9, 9, 0.8),
    (10, 10, 5.0),
    (11, 11, 3.2),
    (12, 12, 4.0),
    (13, 13, 1.9),
    (14, 14, 2.1),
    (15, 15, 4.5),
    (16, 16, 0.5),
    (17, 17, 3.8),
    (18, 18, 1.2),
    (19, 19, 4.8),
    (20, 20, 2.3),
    (21, 21, 4.1),
    (22, 22, 3.7),
    (23, 23, 2.6),
    (24, 24, 4.6),
    (25, 25, 3.3),
    (26, 26, 1.8),
    (27, 27, 4.9),
    (28, 28, 2.4),
    (29, 29, 0.9),
    (30, 30, 4.3),
    (31, 31, 3.1),
    (32, 32, 4.0),
    (33, 33, 1.7),
    (34, 34, 2.2),
    (35, 35, 4.4),
    (36, 36, 0.6),
    (37, 37, 3.9),
    (38, 38, 1.3),
    (39, 39, 4.7),
    (40, 40, 2.0),
    (41, 41, 4.2),
    (42, 42, 3.6),
    (43, 43, 2.5),
    (44, 44, 4.5),
    (45, 45, 3.2),
    (46, 46, 1.5),
    (47, 47, 4.8),
    (48, 48, 2.3),
    (49, 49, 4.0),
    (50, 50, 3.0),
    (51, 51, 2.7),
    (52, 52, 4.6),
    (53, 53, 3.5),
    (54, 54, 1.7),
    (55, 55, 4.9),
    (56, 56, 2.1),
    (57, 57, 4.3),
    (58, 58, 3.3),
    (59, 59, 1.9),
    (60, 60, 4.7),
    (61, 61, 2.5),
    (62, 62, 4.5),
    (63, 63, 3.0),
    (64, 64, 2.8),
    (65, 65, 4.6),
    (66, 66, 3.2),
    (67, 67, 1.8),
    (68, 68, 4.8),
    (69, 69, 2.0),
    (70, 70, 4.1),
    (71, 71, 3.7),
    (72, 72, 2.6);

INSERT INTO users (id, password) VALUES
('team18', 'team18');

ALTER TABLE users
  ADD UNIQUE KEY ID (id) USING HASH;