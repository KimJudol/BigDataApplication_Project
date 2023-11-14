-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 23-11-14 05:02
-- 서버 버전: 10.4.28-MariaDB
-- PHP 버전: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- 테이블의 덤프 데이터 `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"team18\",\"table\":\"city_rating\"},{\"db\":\"team18\",\"table\":\"country\"},{\"db\":\"team18\",\"table\":\"hotel\"},{\"db\":\"team18\",\"table\":\"weather\"},{\"db\":\"team18\",\"table\":\"travel\"},{\"db\":\"team18\",\"table\":\"transportation\"},{\"db\":\"team18\",\"table\":\"souvenir\"},{\"db\":\"team18\",\"table\":\"restaurant\"},{\"db\":\"team18\",\"table\":\"languages\"},{\"db\":\"team18\",\"table\":\"hotel_rating\"}]');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- 테이블의 덤프 데이터 `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-11-14 04:02:36', '{\"lang\":\"ko\",\"Console\\/Mode\":\"show\",\"Console\\/Height\":166.98637500000000954969436861574649810791015625}');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- 테이블의 인덱스 `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- 테이블의 인덱스 `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- 테이블의 인덱스 `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- 테이블의 인덱스 `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- 테이블의 인덱스 `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- 테이블의 인덱스 `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- 테이블의 인덱스 `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- 테이블의 인덱스 `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- 테이블의 인덱스 `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- 테이블의 인덱스 `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 테이블의 AUTO_INCREMENT `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 데이터베이스: `team18`
--
CREATE DATABASE IF NOT EXISTS `team18` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `team18`;

-- --------------------------------------------------------

--
-- 테이블 구조 `city`
--

CREATE TABLE `city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `city`
--

INSERT INTO `city` (`city_id`, `city_name`, `country_id`) VALUES
(1, 'Marseille', 1),
(2, 'Bordeaux', 1),
(3, 'Caen', 1),
(4, 'Prague', 2),
(5, 'Karlovy-vary', 2),
(6, 'Zurich', 3),
(7, 'Geneva', 3),
(8, 'London', 4),
(9, 'Manchester', 4),
(10, 'Florence', 5),
(11, 'Rome', 5),
(12, 'Venezia', 5);

-- --------------------------------------------------------

--
-- 테이블 구조 `city_rating`
--

CREATE TABLE `city_rating` (
  `city_rating_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `city_rating` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `city_rating`
--

INSERT INTO `city_rating` (`city_rating_id`, `city_id`, `city_rating`) VALUES
(1, 7, 46.0),
(2, 4, 16.0),
(3, 6, 21.0),
(4, 6, 19.0),
(5, 3, 55.0),
(6, 2, 47.0),
(7, 7, 30.0),
(8, 11, 42.0),
(9, 1, 55.0),
(10, 8, 13.0),
(11, 4, 46.0),
(12, 1, 42.0);

-- --------------------------------------------------------

--
-- 테이블 구조 `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `country`
--

INSERT INTO `country` (`country_id`, `country_name`) VALUES
(1, 'France'),
(2, 'Czech Republic'),
(3, 'Swiss'),
(4, 'UK'),
(5, 'Italia');

-- --------------------------------------------------------

--
-- 테이블 구조 `currency_exchange`
--

CREATE TABLE `currency_exchange` (
  `exchange_id` int(11) NOT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `exchange_rate` decimal(10,2) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `currency_exchange`
--

INSERT INTO `currency_exchange` (`exchange_id`, `currency`, `exchange_rate`, `country_id`) VALUES
(1, 'EUR', 1405.42, 1),
(2, 'CZK', 57.58, 2),
(3, 'CHF', 1456.09, 3),
(4, 'GBP', 1620.10, 4),
(5, 'EUR', 1405.42, 5);

-- --------------------------------------------------------

--
-- 테이블 구조 `expense`
--

CREATE TABLE `expense` (
  `travel_id` int(11) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `number_of_travelers` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `expense`
--

INSERT INTO `expense` (`travel_id`, `budget`, `number_of_travelers`) VALUES
(1, 360709, 4),
(2, 2906292, 4),
(3, 1773150, 3),
(4, 833221, 1),
(5, 1872866, 6),
(6, 1085467, 2),
(7, 2868077, 2),
(8, 324247, 6),
(9, 2648015, 7),
(10, 2994062, 2),
(11, 255028, 5),
(12, 198995, 2),
(13, 585657, 1),
(14, 2636530, 2),
(15, 423143, 1),
(16, 810969, 7),
(17, 2000123, 5),
(18, 803610, 3),
(19, 2167489, 5),
(20, 1149798, 5),
(21, 1438773, 2),
(22, 1588498, 1),
(23, 1832515, 7),
(24, 2221296, 7);

-- --------------------------------------------------------

--
-- 테이블 구조 `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `hotel_name` varchar(50) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `temperature` int(11) DEFAULT NULL,
  `accomodation_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `city_id`, `hotel_name`, `price`, `temperature`, `accomodation_number`) VALUES
(1, 1, 'Hotel Dieu', 70463, NULL, 3),
(2, 1, 'Sofitel Marseille Vieux Port Hotel', 216857, NULL, 2),
(3, 2, 'Intercontinental Bordeaux Le Grand Hotel', 66104, NULL, 4),
(4, 2, 'Renaissance Bordeaux Hotel', 204268, NULL, 3),
(5, 3, 'Kyriad Direct Caen Nord Memorial', 106158, NULL, 5),
(6, 3, 'Séjours & Affaires Caen Le Clos Beaumois', 118601, NULL, 6),
(7, 4, 'Grandium Hotel Prague', 277994, NULL, 5),
(8, 4, 'Grand Hotel Bohemia', 74472, NULL, 2),
(9, 5, 'Spa Hotel Imperial', 293026, NULL, 5),
(10, 5, 'Hotel Romance', 277244, NULL, 3),
(11, 6, 'Central Plaza', 170394, NULL, 4),
(12, 6, 'Ruby Mimi Hotel Zurich', 202301, NULL, 2),
(13, 7, 'Nash Suites Airport Hotel', 90161, NULL, 2),
(14, 7, 'InterContinental Genève, an IHG Hotel', 72355, NULL, 2),
(15, 8, 'Zedwell Piccadilly Circus', 263310, NULL, 3),
(16, 8, 'The Tower Hotel', 211677, NULL, 4),
(17, 9, 'Citysuites Aparthotel', 152074, NULL, 4),
(18, 9, 'Delta Hotels Worsley Park Country Club', 204309, NULL, 3),
(19, 10, 'Hotel Machiavelli Palace', 293207, NULL, 5),
(20, 10, 'Hostel Archi Rossi', 72136, NULL, 6),
(21, 11, 'Sina Bernini Bristol', 111740, NULL, 4),
(22, 11, 'NH Collection Palazzo Cinquecento', 213828, NULL, 6),
(23, 12, 'Venice Times Hotel', 117062, NULL, 5),
(24, 12, 'SHG Hotel Salute Palace', 239744, NULL, 5);

-- --------------------------------------------------------

--
-- 테이블 구조 `hotel_discount`
--

CREATE TABLE `hotel_discount` (
  `hotel_discount_Id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `hotel_discount_available` tinyint(1) DEFAULT NULL,
  `hotel_discount_rate` int(11) DEFAULT NULL,
  `hotel_discount_period` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `hotel_discount`
--

INSERT INTO `hotel_discount` (`hotel_discount_Id`, `hotel_id`, `hotel_discount_available`, `hotel_discount_rate`, `hotel_discount_period`) VALUES
(1, 1, 1, 45, 30),
(2, 2, 0, NULL, NULL),
(3, 3, 1, 20, 30),
(4, 4, 0, NULL, NULL),
(5, 5, 1, 60, 20),
(6, 6, 0, NULL, NULL),
(7, 7, 1, 35, 40),
(8, 8, 0, NULL, NULL),
(9, 9, 1, 10, 10),
(10, 10, 0, NULL, NULL),
(11, 11, 1, 50, 35),
(12, 12, 0, NULL, NULL),
(13, 13, 1, 15, 5),
(14, 14, 0, NULL, NULL),
(15, 15, 1, 30, 30),
(16, 16, 0, NULL, NULL),
(17, 17, 1, 70, 25),
(18, 18, 0, NULL, NULL),
(19, 19, 1, 25, 40),
(20, 20, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `hotel_rating`
--

CREATE TABLE `hotel_rating` (
  `hotel_rating_id` int(11) NOT NULL,
  `hotel_id` int(11) DEFAULT NULL,
  `hotel_rating` decimal(3,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `hotel_rating`
--

INSERT INTO `hotel_rating` (`hotel_rating_id`, `hotel_id`, `hotel_rating`) VALUES
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

-- --------------------------------------------------------

--
-- 테이블 구조 `languages`
--

CREATE TABLE `languages` (
  `language_id` int(11) NOT NULL,
  `language_name` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `languages`
--

INSERT INTO `languages` (`language_id`, `language_name`, `country_id`) VALUES
(1, '프랑스어', 1),
(2, '체코어', 2),
(3, '실레시아어', 2),
(4, '독일어', 3),
(5, '영어', 4),
(6, '이탈리아어', 5);

-- --------------------------------------------------------

--
-- 테이블 구조 `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurant_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `restaurant_name` char(50) DEFAULT NULL,
  `cuisine_type` char(50) DEFAULT NULL,
  `address` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `restaurant`
--

INSERT INTO `restaurant` (`restaurant_id`, `country_id`, `restaurant_name`, `cuisine_type`, `address`) VALUES
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

-- --------------------------------------------------------

--
-- 테이블 구조 `restaurant_discount`
--

CREATE TABLE `restaurant_discount` (
  `restaurant_discount_Id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `restaurant_discount_available` tinyint(1) DEFAULT NULL,
  `restaurant_discount_rate` int(11) DEFAULT NULL,
  `restaurant_discount_period` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `restaurant_discount`
--

INSERT INTO `restaurant_discount` (`restaurant_discount_Id`, `restaurant_id`, `restaurant_discount_available`, `restaurant_discount_rate`, `restaurant_discount_period`) VALUES
(1, 1, 1, 10, 30),
(2, 2, 0, NULL, NULL),
(3, 3, 1, 25, 30),
(4, 4, 0, NULL, NULL),
(5, 5, 1, 30, 20),
(6, 6, 0, NULL, NULL),
(7, 7, 1, 20, 40),
(8, 8, 0, NULL, NULL),
(9, 9, 1, 15, 10),
(10, 10, 0, NULL, NULL),
(11, 11, 1, 10, 35),
(12, 12, 0, NULL, NULL),
(13, 13, 1, 5, 15),
(14, 14, 0, NULL, NULL),
(15, 15, 1, 35, 30),
(16, 16, 0, NULL, NULL),
(17, 17, 1, 40, 25),
(18, 18, 0, NULL, NULL),
(19, 19, 1, 45, 40),
(20, 20, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- 테이블 구조 `restaurant_rating`
--

CREATE TABLE `restaurant_rating` (
  `restaurant_rating_id` int(11) NOT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `restaurant_rating` decimal(3,1) DEFAULT NULL,
  `restaurant_review` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `restaurant_rating`
--

INSERT INTO `restaurant_rating` (`restaurant_rating_id`, `restaurant_id`, `restaurant_rating`, `restaurant_review`) VALUES
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

-- --------------------------------------------------------

--
-- 테이블 구조 `souvenir`
--

CREATE TABLE `souvenir` (
  `souvenir_id` int(11) NOT NULL,
  `souvenir_name` varchar(50) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `souvenir`
--

INSERT INTO `souvenir` (`souvenir_id`, `souvenir_name`, `city_id`, `price`, `sale`) VALUES
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

-- --------------------------------------------------------

--
-- 테이블 구조 `transportation`
--

CREATE TABLE `transportation` (
  `transportation_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `method` char(50) DEFAULT NULL,
  `price` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `transportation`
--

INSERT INTO `transportation` (`transportation_id`, `country_id`, `method`, `price`) VALUES
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

-- --------------------------------------------------------

--
-- 테이블 구조 `travel`
--

CREATE TABLE `travel` (
  `travel_id` int(11) NOT NULL,
  `traveler_name` varchar(50) DEFAULT NULL,
  `travel_start_date` date NOT NULL,
  `travel_end_date` date NOT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `travel`
--

INSERT INTO `travel` (`travel_id`, `traveler_name`, `travel_start_date`, `travel_end_date`, `city_id`) VALUES
(1, 'James Smith', '2020-05-03', '2020-05-06', 1),
(2, 'Robert Johnson', '2020-05-03', '2020-05-09', 1),
(3, 'Mary Williams', '2020-05-06', '2020-05-09', 2),
(4, 'Patricia Brown', '2020-05-06', '2020-05-08', 2),
(5, 'Jennifer Jones', '2020-05-06', '2020-05-14', 3),
(6, 'Linda Garcia', '2020-05-07', '2020-05-10', 3),
(7, 'Michael Miller', '2020-05-07', '2020-05-11', 4),
(8, 'John Davis', '2020-05-10', '2020-05-11', 4),
(9, 'David Rodriguez', '2020-05-10', '2020-05-13', 5),
(10, 'William Martinez', '2020-05-13', '2020-05-18', 5),
(11, 'Barbara Hernandez', '2020-05-13', '2020-05-20', 6),
(12, 'Elizabeth Lopez', '2020-05-14', '2020-06-14', 6),
(13, 'Susan Gonzalez', '2020-05-14', '2020-05-31', 7),
(14, 'Jessica Wilson', '2020-05-18', '2020-05-25', 7),
(15, 'Richard Anderson', '2020-05-18', '2020-05-21', 8),
(16, 'Joseph Thomas', '2020-05-19', '2020-05-30', 8),
(17, 'Thomas Taylor', '2020-05-20', '2020-05-31', 9),
(18, 'Christopher Moore', '2020-05-21', '2020-05-22', 9),
(19, 'Sarah Jackson', '2020-05-21', '2020-05-31', 10),
(20, 'Karen Martin', '2020-05-21', '2020-05-25', 10),
(21, 'Lisa Lee', '2020-05-22', '2020-05-06', 11),
(22, 'Nancy Perez', '2020-05-22', '2020-07-01', 11),
(23, 'Charles Thompson', '2020-05-24', '2020-05-26', 12),
(24, 'Daniel White', '2020-05-26', '2020-07-26', 12);

-- --------------------------------------------------------

--
-- 테이블 구조 `weather`
--

CREATE TABLE `weather` (
  `weather_id` int(11) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `temperature` int(11) DEFAULT NULL,
  `conditions` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 테이블의 덤프 데이터 `weather`
--

INSERT INTO `weather` (`weather_id`, `city_id`, `date`, `temperature`, `conditions`) VALUES
(1, 1, '2023-11-13', 12, 'Sunny'),
(2, 2, '2023-02-04', -9, 'Windy'),
(3, 3, '2023-03-15', 7, 'Rainy'),
(4, 4, '2023-07-27', -6, 'Windy'),
(5, 5, '2023-11-17', 25, 'Rainy'),
(6, 6, '2023-10-13', 26, 'Sunny'),
(7, 7, '2023-09-25', 7, 'Windy'),
(8, 8, '2023-06-27', 12, 'Cloudy'),
(9, 9, '2023-12-29', 29, 'Windy'),
(10, 10, '2023-03-11', 10, 'Windy'),
(11, 11, '2023-05-17', 27, 'Rainy'),
(12, 12, '2023-10-03', -1, 'Windy');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `country_id` (`country_id`);

--
-- 테이블의 인덱스 `city_rating`
--
ALTER TABLE `city_rating`
  ADD PRIMARY KEY (`city_rating_id`),
  ADD KEY `city_id` (`city_id`);

--
-- 테이블의 인덱스 `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- 테이블의 인덱스 `currency_exchange`
--
ALTER TABLE `currency_exchange`
  ADD PRIMARY KEY (`exchange_id`),
  ADD KEY `country_id` (`country_id`);

--
-- 테이블의 인덱스 `expense`
--
ALTER TABLE `expense`
  ADD KEY `travel_id` (`travel_id`);

--
-- 테이블의 인덱스 `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `city_id` (`city_id`);

--
-- 테이블의 인덱스 `hotel_discount`
--
ALTER TABLE `hotel_discount`
  ADD PRIMARY KEY (`hotel_discount_Id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- 테이블의 인덱스 `hotel_rating`
--
ALTER TABLE `hotel_rating`
  ADD PRIMARY KEY (`hotel_rating_id`),
  ADD KEY `hotel_id` (`hotel_id`);

--
-- 테이블의 인덱스 `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `country_id` (`country_id`);

--
-- 테이블의 인덱스 `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurant_id`),
  ADD KEY `country_id` (`country_id`);

--
-- 테이블의 인덱스 `restaurant_discount`
--
ALTER TABLE `restaurant_discount`
  ADD PRIMARY KEY (`restaurant_discount_Id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- 테이블의 인덱스 `restaurant_rating`
--
ALTER TABLE `restaurant_rating`
  ADD PRIMARY KEY (`restaurant_rating_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- 테이블의 인덱스 `souvenir`
--
ALTER TABLE `souvenir`
  ADD PRIMARY KEY (`souvenir_id`),
  ADD KEY `city_id` (`city_id`);

--
-- 테이블의 인덱스 `transportation`
--
ALTER TABLE `transportation`
  ADD PRIMARY KEY (`transportation_id`),
  ADD KEY `country_id` (`country_id`);

--
-- 테이블의 인덱스 `travel`
--
ALTER TABLE `travel`
  ADD PRIMARY KEY (`travel_id`),
  ADD KEY `city_id` (`city_id`);

--
-- 테이블의 인덱스 `weather`
--
ALTER TABLE `weather`
  ADD PRIMARY KEY (`weather_id`),
  ADD KEY `city_id` (`city_id`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `city`
--
ALTER TABLE `city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 테이블의 AUTO_INCREMENT `city_rating`
--
ALTER TABLE `city_rating`
  MODIFY `city_rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 테이블의 AUTO_INCREMENT `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 테이블의 AUTO_INCREMENT `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 테이블의 AUTO_INCREMENT `restaurant_rating`
--
ALTER TABLE `restaurant_rating`
  MODIFY `restaurant_rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- 테이블의 AUTO_INCREMENT `souvenir`
--
ALTER TABLE `souvenir`
  MODIFY `souvenir_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 테이블의 AUTO_INCREMENT `travel`
--
ALTER TABLE `travel`
  MODIFY `travel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 테이블의 AUTO_INCREMENT `weather`
--
ALTER TABLE `weather`
  MODIFY `weather_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- 테이블의 제약사항 `city_rating`
--
ALTER TABLE `city_rating`
  ADD CONSTRAINT `city_rating_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- 테이블의 제약사항 `currency_exchange`
--
ALTER TABLE `currency_exchange`
  ADD CONSTRAINT `currency_exchange_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- 테이블의 제약사항 `expense`
--
ALTER TABLE `expense`
  ADD CONSTRAINT `expense_ibfk_1` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`travel_id`);

--
-- 테이블의 제약사항 `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- 테이블의 제약사항 `hotel_discount`
--
ALTER TABLE `hotel_discount`
  ADD CONSTRAINT `hotel_discount_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- 테이블의 제약사항 `hotel_rating`
--
ALTER TABLE `hotel_rating`
  ADD CONSTRAINT `hotel_rating_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- 테이블의 제약사항 `languages`
--
ALTER TABLE `languages`
  ADD CONSTRAINT `languages_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- 테이블의 제약사항 `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- 테이블의 제약사항 `restaurant_discount`
--
ALTER TABLE `restaurant_discount`
  ADD CONSTRAINT `restaurant_discount_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- 테이블의 제약사항 `restaurant_rating`
--
ALTER TABLE `restaurant_rating`
  ADD CONSTRAINT `restaurant_rating_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`restaurant_id`);

--
-- 테이블의 제약사항 `souvenir`
--
ALTER TABLE `souvenir`
  ADD CONSTRAINT `souvenir_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- 테이블의 제약사항 `transportation`
--
ALTER TABLE `transportation`
  ADD CONSTRAINT `transportation_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- 테이블의 제약사항 `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `travel_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);

--
-- 테이블의 제약사항 `weather`
--
ALTER TABLE `weather`
  ADD CONSTRAINT `weather_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`);
--
-- 데이터베이스: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
