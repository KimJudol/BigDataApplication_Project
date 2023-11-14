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
    (24, 12, 'SHG Hotel Salute Palace', FLOOR(RAND() * (300000 - 60000 + 1) + 60000), FLOOR(RAND() * (6 - 2 + 1) + 2));



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
INSERT INTO restaurant (restaurant_id, country_id, restaurant_name, cuisine_type, address)
VALUES
     (1, 1, 'Han Cook Mat Jib', '한식', '123 Rue de la Liberté, Paris, 75001, France'),
     (2, 2, 'Go Yo Han Mat', '한식', '123 Prague Street, Prague, 110 00, Czech Republic'),
     (3, 3, 'Han Kki Byeol Mi', '한식', '123 Alpine Street, Zurich, 8001, Switzerland'),
     (4, 4, 'Han Ok Chef', '한식', '123 Oxford Street, London, W1D 1AA, United Kingdom'),
     (5, 5, 'Gam Dong Han Sik', '한식', '123 Via del Corso, Rome, 00186, Italy'),
     (6, 1, 'Hanaki', '일식', '456 Avenue des Champs-Élysées, Nice, 06000, France'),
     (7, 2, 'Sora', '일식', '456 Avenue, Karlovy Vary, 360 01, Czech Republic'),
     (8, 3, 'Mizu', '일식', '456 Lake Geneva Road, Geneva, 1201, Switzerland'),
     (9, 4, 'Sakura', '일식', '456 Abbey Road, Liverpool, L1 9EE, United Kingdom'),
     (10, 5, 'Ichigo', '일식', '789 Via Condotti, Rome, 00187, Italy'),
     (11, 1, 'Geumryong', '중식', '789 Boulevard Saint-Germain, Lyon, 69001, France'),
     (12, 2, 'Dalma', '중식', '789 Brno Boulevard, Brno, 602 00, Czech Republic'),
     (13, 3, 'Manli', '중식', '789 Matterhorn Avenue, Zermatt, 3920, Switzerland'),
     (14, 4, 'Cheongryong', '중식', '789 Baker Street, London, NW1 6XE, United Kingdom'),
     (15, 5, 'Hyangto', '중식', '101 Via Montenapoleone, Milan, 20121, Italy'),
     (16, 1, 'La Cucina', '양식', 'Rue du Saint-Honoré, Marseille, 13001, France'),
     (17, 2, 'Bourgogne', '양식', '101 Ostrava Lane, Ostrava, 702 00, Czech Republic'),
     (18, 3, 'The Table', '양식', '101 Rhine River Drive, Basel, 4001, Switzerland'),
     (19, 4, 'Garden', '양식', '101 Regent, Manchester, M1 5TA, United Kingdom'),
     (20, 5, 'Bistro Bleu', '양식', '567 Via dei Fori Imperiali, Rome, 00186, Italy'),
     (21, 5, 'Gallery Table', '양식', '111 Via Veneto, Rome, 00187, Italy'),
     (22, 4, 'Oriental Delights', '중식', '234 Bucking Road, London, SW1W 0RP, United Kingdom'),
     (23, 3, 'Lantern Lane', '중식', '234 Jungfrau Lane, Interlaken, 3800, Switzerland'),
     (24, 2, 'Tokyo Taste', '일식', '333 Pardubice, Pardubice, 530 02, Czech Republic'),
     (25, 1, 'Han Cook', '한식', '234 Quai des Chartrons, Bordeaux, 33000, France'),
     (26, 5, 'Han Kitchen', '한식', '222 Piazzale Michelangelo, Florence, 50125, Italy'),
     (27, 4, 'Sushi House', '일식', '567 KingRoad, London, SW10 0BB, United Kingdom'),
     (28, 3, 'Chopsticks Fortune', '중식', '567 Lucerne Boulevard, Lucerne, 6000, Switzerland'),
     (29, 2, 'Maison Mimi', '양식', '222 Olomouc Road, Olomouc, 771 00, Czech Republic'),
     (30, 1, 'Gourmet Galaxy', '양식', '567 Place de la République, Lille, 59000, France'),
     (31, 2, 'Culinary Canvas', '양식', '555 Masaryk Square, Brno, 600 01, Czech Republic'),
     (32, 5, 'Dragon Palace', '중식', '333 Via Appia Antica, Rome, 00179, Italy'),
     (33, 4, 'Palace', '중식', '890 Princes, Edinburgh, EH2 2ER, United Kingdom'),
     (34, 3, 'The Table', '일식', '890 Bernese Oberland, Bern, 3011, Switzerland'),
     (35, 2, 'Umi', '일식', '1111 Boulevard, Vary, 361 00, Czech Republic'),
     (36, 3, 'Gam Dong', '한식', '111 Swiss National Park, Zernez, 7530, Switzerland'),
     (37, 4, 'K-Food', '한식', '111 Portland, London, W1W 6QQ, United Kingdom'),
     (38, 1, 'Sushi Bar', '일식', '890 Rue du Mont-Cenis, Grenoble, 38000, France'),
     (39, 5, 'Sushi Lounge', '일식', '444 Via Garibaldi, Naples, 80142, Italy'),
     (40, 1, 'EdelBite', '양식', '111 Rue du Temple, Strasbourg, 67000, France');

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
    (20, 20, 2.3, 'Not bad, but could be better.');


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
    (20, 20, FALSE, NULL, NULL);

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
    (20, 20, FALSE, NULL, NULL);

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
    (20, 20, 2.3);