-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 08:22 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignment_second_attempt`
--

-- --------------------------------------------------------

--
-- Table structure for table `adress`
--

CREATE TABLE `adress` (
  `address_id` int(11) NOT NULL,
  `first_line` varchar(255) NOT NULL,
  `second_line` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `post_code_or_zip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `adress`
--

INSERT INTO `adress` (`address_id`, `first_line`, `second_line`, `city`, `post_code_or_zip`) VALUES
(2, '19 Carmorn road', 'Toomebridge CO.Antrim', 'Antrim', 'BT413NX'),
(3, '24 The Brambles\r\n\r\n', 'CO. Derry/londonderry\r\n', 'Magherafelt', 'BT9 7X1'),
(4, '24 balfour street', 'malone road CO.Antrim', 'Belfast', 'BT8132'),
(5, '16 oldtown road', 'Castledawson', 'Magherafelt', 'BT9 7X1'),
(6, '21 hollywood street', 'Holly wood california', 'California', '10298392'),
(7, '25 the paddock', 'Kirkby', 'liverpool', 'BT2586X'),
(8, 'Belfast', '', 'Belfast', 'BT39JH'),
(9, 'birmingham', '', 'birmingham airport', ''),
(10, 'melia', 'palma bay', 'palma', ''),
(11, 'bulgaria\r\n', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `board_basis`
--

CREATE TABLE `board_basis` (
  `board_basis_id` int(11) NOT NULL,
  `all_inclusive` tinyint(1) NOT NULL,
  `half_board` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `board_basis`
--

INSERT INTO `board_basis` (`board_basis_id`, `all_inclusive`, `half_board`) VALUES
(1, 1, 0),
(2, 0, -110);

-- --------------------------------------------------------

--
-- Table structure for table `booker`
--

CREATE TABLE `booker` (
  `booker_id` int(11) NOT NULL,
  `booker_logon_details_id` int(11) NOT NULL,
  `passengers_id` int(11) NOT NULL,
  `first_passenger_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booker`
--

INSERT INTO `booker` (`booker_id`, `booker_logon_details_id`, `passengers_id`, `first_passenger_id`, `address_id`) VALUES
(14, 1, 1, 1, 2),
(15, 1, 9, 1, 2),
(16, 3, 2, 4, 3),
(17, 3, 7, 4, 6),
(18, 3, 10, 4, 6),
(19, 3, 9, 4, 6),
(20, 4, 9, 5, 2),
(21, 4, 8, 5, 7),
(22, 4, 2, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `booker_logon_details`
--

CREATE TABLE `booker_logon_details` (
  `booker_logon_details_id` int(11) NOT NULL,
  `username` varbinary(255) NOT NULL,
  `password` varbinary(255) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booker_logon_details`
--

INSERT INTO `booker_logon_details` (`booker_logon_details_id`, `username`, `password`, `company_name`, `email`) VALUES
(1, 0x54686f6d61734d636b6565313233, 0x34363065633365633135396364313261393530613066626238373230323731333162663366623962313130663063, 'company', 'Tmckee123@qub.ac.uk'),
(2, 0x54686f6d61734d636b6565313233, 0x37356338643964393238643661643562353238323561346635376435336539363731646662653565616435373064, 'company', 'Tmckee123@qub.ac.uk'),
(3, 0x4b6469616d6f6e643239, 0x31366132336536643735633834333239326166626631353462636435303332333339336634333634663432393534, 'Queens', 'kdiamond33@gmail.com'),
(4, 0x6a63656e613233, 0x35613831336465376262313530313864623961353665613438636261663761396266373461393539353664376164, 'wrestler', 'jcena27@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booker_logon_details_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL,
  `booking_airport_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booker_logon_details_id`, `destination_id`, `booking_airport_id`, `hotel_id`) VALUES
(8, 1, 4, 2, 5),
(9, 2, 5, 2, 6),
(10, 3, 6, 3, 7);

-- --------------------------------------------------------

--
-- Table structure for table `booking_airport`
--

CREATE TABLE `booking_airport` (
  `booking_airport_id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL,
  `departure_time` varchar(255) NOT NULL,
  `departure_date` date NOT NULL,
  `plane_id` int(11) NOT NULL,
  `destination_airport_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_airport`
--

INSERT INTO `booking_airport` (`booking_airport_id`, `country`, `address_id`, `departure_time`, `departure_date`, `plane_id`, `destination_airport_id`) VALUES
(2, 'Northern Ireland', 8, '6:50', '2023-05-02', 6, 0),
(3, 'Northern Ireland', 9, '12:40', '2022-11-16', 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `booking_recipt`
--

CREATE TABLE `booking_recipt` (
  `booking_recipt` int(11) NOT NULL,
  `booking_ref` varchar(255) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `booker_name` varchar(255) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_recipt`
--

INSERT INTO `booking_recipt` (`booking_recipt`, `booking_ref`, `total_cost`, `booker_name`, `booking_id`) VALUES
(10, 'a3a762', 1988, 'johncena11', 10),
(11, '007e2e', 1988, 'Kdiamond29', 10);

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE `checkout` (
  `checkout_id` int(11) NOT NULL,
  `total_cost` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`checkout_id`, `total_cost`, `payment_id`) VALUES
(11, 1988, 5),
(12, 2628, 2),
(13, 2318, 2);

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE `destination` (
  `destination_id` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city/location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`destination_id`, `country`, `city/location`) VALUES
(4, 'Ibiza', 'San Antonio Bay'),
(5, 'Bulgaria', 'Bourgais area'),
(6, 'Mallorca', 'la Palma');

-- --------------------------------------------------------

--
-- Table structure for table `destination_airport`
--

CREATE TABLE `destination_airport` (
  `destination_airport_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `arrival_time` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `plane_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `destination_airport`
--

INSERT INTO `destination_airport` (`destination_airport_id`, `address_id`, `arrival_time`, `date`, `hotel_id`, `plane_id`, `destination_id`) VALUES
(1, 10, '3:30', '2022-11-16', 7, 9, 6);

-- --------------------------------------------------------

--
-- Table structure for table `facilities`
--

CREATE TABLE `facilities` (
  `facilites_id` int(11) NOT NULL,
  `board_basis_id` int(11) NOT NULL,
  `restraunts_and_bars` varchar(255) NOT NULL,
  `pool_areas` varchar(255) NOT NULL,
  `sports_and_lesure` varchar(255) NOT NULL,
  `entertainment` varchar(255) NOT NULL,
  `other_activities` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `facilities`
--

INSERT INTO `facilities` (`facilites_id`, `board_basis_id`, `restraunts_and_bars`, `pool_areas`, `sports_and_lesure`, `entertainment`, `other_activities`) VALUES
(4, 0, 'Ryans Pub\r\nA la carte. Serves international cuisine for breakfast, lunch, dinner and snacks. Located on the poolside.', 'Outdoor freshwater pool. Sunbathing area with sunbeds and parasols. Towels (refundable deposit).\r\nWhirlpool on rooftop terrace* open from mid-May reservation required, maximum 2 hours per visit. (weather dependant).', 'Reception - equipment for hire includes motorised scooter*. Services available include luggage storage and towel hire.', 'none', 'none'),
(5, 0, 'A-La-Carte Restaurant\r\nA la carte. Serves international cuisine for dinner (open between 01 May and 15 Oct). Please note that the hotel requests that beach wear is not worn and that gentlemen wear long trousers.\r\nMain Restaurant\r\nBuffet. Serves breakfast,', 'Overview\r\nOutdoor pool with children\'s section (freshwater). Indoor adult only pool.\r\nOutdoor freshwater pool with children\'s section and whirlpool. Sunbathing area with sunbeds and parasols. Towels (refundable deposit) (open between 01 May and 15 Oct).\r\n', 'Air conditioned gym with cardio fitness training equipment, free weights area, sauna and steam room (min age 16yrs).\r\nAerobics, aqua aerobics, badminton, darts, mini-golf, table tennis and yoga.', 'Frequent daytime entertainment (available between 01 May and 15 Oct) including small team games, team sports, family and water-based activities.\r\nFrequent evening entertainment (available between 01 May and 15 Oct) including bingo, in-house entertainment ', 'Reception - equipment for hire includes kettle, pushchair* and wheelchair*. Services available include concierge service, currency exchange, luggage storage and towel hire.'),
(6, 0, 'Trasluz\r\nA la carte. Serves a range of international, Spanish and local cuisine for breakfast, lunch, snacks and dinner. Please note that the hotel requests that beach wear is not worn.\r\nBar\r\nPool bar located on the roof terrace (open between 01 Jun and 3', 'Outdoor freshwater pool. Sunbathing area with hammocks and parasols. Free towels. Located on the roof terrace (open between 01 Apr and 30 Sep).', 'Air conditioned gym with cardio fitness training equipment, aerobics studio and free weights area.', '', 'Reception - services available include concierge service, English newspapers and luggage storage.');

-- --------------------------------------------------------

--
-- Table structure for table `first_passenger`
--

CREATE TABLE `first_passenger` (
  `first_passenger_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `first_passenger`
--

INSERT INTO `first_passenger` (`first_passenger_id`, `passenger_id`) VALUES
(7, 1),
(6, 2),
(4, 7),
(5, 9),
(1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `hotel_id` int(11) NOT NULL,
  `hotel_name` varchar(255) NOT NULL,
  `hotel_media_id` int(11) NOT NULL,
  `review_id` int(11) NOT NULL,
  `facilities_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `hotel_cost_id` int(11) NOT NULL,
  `destination_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`hotel_id`, `hotel_name`, `hotel_media_id`, `review_id`, `facilities_id`, `room_id`, `hotel_cost_id`, `destination_id`) VALUES
(5, 'Ryan\'s Ibiza apartments', 7, 1, 4, 16, 3, 4),
(6, 'Sentido Neptun Beach', 8, 8, 5, 17, 4, 5),
(7, 'Melia Palma bay', 9, 9, 6, 20, 5, 6);

-- --------------------------------------------------------

--
-- Table structure for table `hotel_cost_id`
--

CREATE TABLE `hotel_cost_id` (
  `hotel_cost_id` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `total_hotel_cost` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel_cost_id`
--

INSERT INTO `hotel_cost_id` (`hotel_cost_id`, `currency`, `total_hotel_cost`) VALUES
(3, 'euro', '507'),
(4, 'euro', '509'),
(5, 'euro', '667');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_media`
--

CREATE TABLE `hotel_media` (
  `hotel_image_id` int(11) NOT NULL,
  `image_1` varchar(255) NOT NULL,
  `image_2` varchar(255) NOT NULL,
  `image_3` varchar(255) NOT NULL,
  `image_4` varchar(255) NOT NULL,
  `image_5` varchar(255) NOT NULL,
  `image_6` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hotel_media`
--

INSERT INTO `hotel_media` (`hotel_image_id`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`, `image_6`) VALUES
(7, 'https://www.jet2holidays.com/HotelImages/Web/IBZ_244_Azuline_Mar_Amantis_Hotel_0320_04.jpg', 'https://www.jet2holidays.com/HotelImages/Web/IBZ_244_Azuline_Mar_Amantis_Hotel_0320_11.jpg', 'https://www.jet2holidays.com/HotelImages/Web/IBZ_244_Azuline_Mar_Amantis_Hotel_1019_16.jpg', 'https://www.jet2holidays.com/HotelImages/Web/IBZ_244_Azuline_Mar_Amantis_Hotel_1019_22.jpg', 'https://www.jet2holidays.com/HotelImages/Web/IBZ_244_Azuline_Mar_Amantis_Hotel_0722_03.jpg', 'https://www.jet2holidays.com/HotelImages/Web/IBZ_244_Azuline_Mar_Amantis_1016_11.jpg'),
(8, 'https://www.jet2holidays.com/HotelImages/Web/BOJ_82506_Sentido_Neptun_Beach_1120_01.jpg', 'https://www.jet2holidays.com/HotelImages/Web/BOJ_82506_Sentido_Neptun_Beach_1120_04.jpg', 'https://www.jet2holidays.com/HotelImages/Web/BOJ_82506_Sentido_Neptun_Beach_1220_01.jpg', 'https://www.jet2holidays.com/HotelImages/Web/BOJ_82506_Sentido_Neptun_Beach_1120_16.jpg', 'https://www.jet2holidays.com/HotelImages/Web/BOJ_82506_Sentido_Neptun_Beach_1120_21.jpg', 'https://www.jet2holidays.com/HotelImages/Web/BOJ_82506_Sentido_Neptun_Beach_1120_03.jpg'),
(9, 'https://www.jet2holidays.com/HotelImages/Web/PMI_82951_Aubamar_Suites_&_Spa_0421_01.jpg', 'https://www.jet2holidays.com/HotelImages/Web/PMI_82951_Aubamar_Suites_&_Spa_0421_28.jpg', 'https://www.jet2holidays.com/HotelImages/Web/PMI_82951_Aubamar_Suites_&_Spa_0421_18.jpg', 'https://www.jet2holidays.com/HotelImages/Web/PMI_82951_Aubamar_Suites_&_Spa_0421_31.jpg', 'https://www.jet2holidays.com/HotelImages/Web/PMI_82951_Aubamar_Suites_&_Spa_0421_22.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `luggage`
--

CREATE TABLE `luggage` (
  `luggage_id` int(11) NOT NULL,
  `weight` varchar(255) NOT NULL,
  `extra_baggage` varchar(255) NOT NULL,
  `added_cost` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `luggage`
--

INSERT INTO `luggage` (`luggage_id`, `weight`, `extra_baggage`, `added_cost`, `seat_id`) VALUES
(4, '20', '20', 20, 17),
(5, '20', '20', 20, 17),
(10, '40', '30', 30, 19),
(11, '25', '39', 35, 22),
(12, '15', '24', 22, 23);

-- --------------------------------------------------------

--
-- Table structure for table `numgoing`
--

CREATE TABLE `numgoing` (
  `numgoing_id` int(11) NOT NULL,
  `numbergoing` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `numgoing`
--

INSERT INTO `numgoing` (`numgoing_id`, `numbergoing`) VALUES
(1, '4'),
(2, '2'),
(5, '3');

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `passengers_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `passport_id` int(11) NOT NULL,
  `date_of_birth` date NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passengers`
--

INSERT INTO `passengers` (`passengers_id`, `first_name`, `middle_name`, `last_name`, `passport_id`, `date_of_birth`, `email_address`, `address_id`) VALUES
(1, 'Kevin', 'Martin', 'Diamond', 2, '2000-01-12', 'kevindiamond88@gmail.com', 3),
(2, 'Michael ', 'Jude', 'Kearney', 4, '2000-09-10', 'michaelkearney345@hotmail.com', 5),
(7, 'Thomas', 'Martin', 'Mckee', 3, '2000-04-10', 'tmckee392@gmail.com', 2),
(8, 'jake ', 'john', 'jones', 5, '2002-11-08', 'jakejones21@yahoo.com', 7),
(9, 'John', 'peter', 'Cena', 6, '1988-11-08', 'johncena23@hotmail.com', 6),
(10, 'Phil', 'jack', 'collins', 7, '1966-11-08', 'philcollins21@hotmail.com', 4);

-- --------------------------------------------------------

--
-- Table structure for table `passport`
--

CREATE TABLE `passport` (
  `passport_id` int(11) NOT NULL,
  `passport_number` varchar(255) NOT NULL,
  `passport_country` varchar(255) NOT NULL,
  `expiration_date` date NOT NULL,
  `passport_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passport`
--

INSERT INTO `passport` (`passport_id`, `passport_number`, `passport_country`, `expiration_date`, `passport_name`) VALUES
(2, '0140 029 1029 ', 'Ireland', '2028-01-10', 'Kevin Diamond'),
(3, '0982 402 1049 ', 'Ireland', '2028-12-13', 'Thomas Mckee'),
(4, '0772 401 3039 ', 'United Kingdom', '2025-12-18', 'Michael Kearney'),
(5, '0784 491 2019 ', 'United Kingdom', '2019-10-06', 'Jake Jones'),
(6, '1965 301 2752 ', 'USA', '2030-11-13', 'John Cena'),
(7, '8985 301 2792 ', 'USA', '2024-11-02', 'Phil Collins');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `card_no` varchar(255) NOT NULL,
  `expiration_date` varchar(255) NOT NULL,
  `sort_code` varchar(255) NOT NULL,
  `billing_address` varchar(255) NOT NULL,
  `card_holder_type` varchar(255) NOT NULL,
  `paypal` varchar(255) NOT NULL,
  `payment_type` varchar(255) NOT NULL,
  `card_holder_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `bank_name`, `card_no`, `expiration_date`, `sort_code`, `billing_address`, `card_holder_type`, `paypal`, `payment_type`, `card_holder_name`) VALUES
(1, 'Santander', '??:??v??8U>+??An?<^?\0?????\r', '2025-10-08', '??(?/if?m?_?/(', '19 Carmorn Road', 'student', 'mckeethomas293@gmail.com', 'monthly', 'MR T M MCKEE'),
(2, 'Santander', '???\n?c???????V', '2030-12-09', '03-01-22', '55 Carmel street', 'student', 'michaelkearney293@gmail.com', 'monthly', 'MR M Kearney'),
(3, 'bank of Ireland', 'f(?T?9??Q?9V?????5????a;.1', '2028-12-09', 'x繿2\rQ??r3!?6`?', '55 Carmel street', 'student', 'jakejones211@yahoo.com', 'weekly', 'MR J JONES'),
(4, 'Santander', '??_/`???Q\"??8HK.?\ZWF?????\"', '2040-12-09', 'fGi??ȎTz???d??', '32 blackthorn drive', 'worker', 'kevindiamond88@yahoo.com', 'daily', 'MR K DIAMOND'),
(5, 'monzobank', 'T?ÝI6\'l?Z??|?Q[?g>???@?i??2', '2040-12-09', 'fGi??ȎTz???d??', '32 blackthorn drive', 'priveleged', 'johncena217@gmail.com', 'daily', 'MR J CENA'),
(25, 'goldman sachs', 'Pu?F_????????ӻ???0?v?TЩGL2?O', '2022-12-09', '??hmq/??????0?', '32 laganvale court', 'priveleged', 'philcollins217@gmail.com', 'daily', 'MR P COLLINS');

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

CREATE TABLE `plane` (
  `plane_id` int(11) NOT NULL,
  `seat_id` int(11) NOT NULL,
  `luggage_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plane`
--

INSERT INTO `plane` (`plane_id`, `seat_id`, `luggage_id`, `booking_id`) VALUES
(6, 17, 5, 5),
(8, 22, 10, 6),
(9, 24, 11, 7);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `author` varchar(255) NOT NULL,
  `star_rating` varchar(255) NOT NULL,
  `review` text NOT NULL,
  `author_2` varchar(255) NOT NULL,
  `rating_2` varchar(255) NOT NULL,
  `review_2` text NOT NULL,
  `author_3` varchar(255) NOT NULL,
  `rating_3` varchar(255) NOT NULL,
  `review_3` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `author`, `star_rating`, `review`, `author_2`, `rating_2`, `review_2`, `author_3`, `rating_3`, `review_3`) VALUES
(1, 'emmalh34', '4', 'Hotel is in a good location with good sized rooms and a nice view of the sea (for extra cost). The all inclusive food and drinks were what I’d expect for a 3 star hotel and good choice of food each day. Food was well cooked and presented nicely plus and egg chef at breakfast was a plus. Reception staff were friendly and checked us in quickly. Boat taxi right outside which was ideal for getting over to San Antonio at 4 euros each way. Or the walk was about 20 mins with lovely views. Downsides: Bathroom wasn’t very clean on arrival, lots of long hair in the corners on the floor and air con didn’t work in our room. Some of the waitresses had a real issue with us sitting together as a group in the dining area. Most tables were set for 2 people with only 2 big tables at the back which were often occupied. We moved 2 tables together and got quite a telling off but we couldn’t understand the issue as we weren’t blocking anyone and put them back when we were done. We ended up having to negotiate each day to put tables together which was a pain. Quite a strange set up for a hotel in Ibiza where lots of groups come for a holiday. Overall the hotel was good for what we paid and the location right on the water was fab.', 'Collette2312', '4', 'We stayed here for 8 nights with a 10 month old baby. Hotel is very clean and maids were brilliant and always very smiley and friendly! Sea view was barely a view but we barely spent any time in the room anyway. We went half board and the food wasn’t to our taste but you can’t please everyone! Overall we had a great stay and would return. Unfortunately I left something behind and have been trying to contact the hotel since the day we checked out but had no response which is very frustrating!! I know the hotel closes but would have thought there was someone answering the phone, emails or Facebook messages ', 'Helen A', '3', 'My daughter and I stayed here from 23-30th October. We have been to this Hotel 5 years ago so we sort of knew what we were getting. However things have changed. The food is fine, plenty of it and a good choices. The snack bar food is nice but it’s very minimal choice. And if you are in the beach front hotel it’s a pain having to cross a busy street to dine. There is now a system that you pay €1 deposit per plastic cup and the maximum of 2 drinks per person. Which is frustrating if you are by the pool and have to go to the bar because of the distance. The entertainment was diabolical and very lacking, don’t sell a holiday that includes entertainment if there is none. I understand that it’s the end of season. But for thoes with children it is not ideal in October. The hotel is clean and the staff are usually pleased to help. Unfortunately I won’t return to this hotel. No fridge, kettle. I will rate this 4/10 as a holiday is what you make it.'),
(8, 'Coastal792457', '5', 'My old hotel was cancelled so was put in this hotel and I was absolutely stunned how beautiful it was for 4* and im glad my previous hotel was cancelled. This hotel is definitely worth in the 5* league compared to other places I have visited. My first visit with my wife and two kids (Toddler and Baby) to Bulgaria. My conclusion for all features: - Room - We got a sea side view. Large spacious and modern. Very nice 5* Wifi- The WiFi was excellent coverage and no disconnection 5* Pool - We went in October so outdoor pool was very cold but looks nice and clean however the indoor pool was good. Not very warm but did swim a few times. 4* Staff- Overall staff was nice and friendly 5* Food - I\'m a vegetarian so I was quite limited to what I could eat but they did accommodate well for vegetarian. mostly cheese base stuff. The lentil soup if you they have it is a must try. 4* Drinks- I don\'t drink alcohol so won\'t be able to comment but soft drinks, coffee and non alcoholic cocktails was excellent. I assume the alcoholic drinks was very good too from what people say. They had all drinks including champagne throughout the day. 5* Decor- Very modern decor from the chairs, rooms and terrace. Very relaxing 5* Entertainment- While I was there they had the same singer everyday singing English/ European songs. It was nice to sit a watch while having a coffee and cake however I\'m not sure if they have other entertainment at more busy times of year. I saw the animation team who seems very friendly but I decided to visit places with the kids so no comments regaring animation team (Old Town Nessebar and Camel Park see my reviews)', 'Terje R', 'Spotlessly clean rooms, newly renovated hotel, great location. Me, my wife and our two teenage sons stayed here one week in the beginning of october 2022. We often choose four or five star hotels with all inclusive when we book holidays, and we were very ', '5', '948alanm\r\nBelfast', 'This hotel was pure luxury for me. I requested a sea view room and i got one on the upper floor with a view to die for, I read reviews that hotel catered for mainly Germans and Russians but when i got there over half the guests were from the UK, evening e', '5'),
(9, 'Chloe G', '1', 'If it looks bad on the outside, it’s bad inside too The “swimming pool” r hides fumes of chlorine and is deceptively small. The rooms are decent but the bathrooms badly designed and the staff simply appalling. Asides from being like La Croisette in Cannes walk- distance wise, this is not a hotel I would ever recommend. Daylight robbery, in a concrete block too far to comfortably walk to Palma City centre.', 'lloydc366', '5', 'Wonderful- a superb hotel with great minimalist architecture in a good location close to the beach and a short walk into the old city, the quietest air conditioning, so many beautiful design details throughout the room, very attentive staff and amazing views from the rooftop bar/pool. It’s our second time at the Melia Palma Bay and I can’t praise it enough.', 'dawnmU4923IO', '4', 'We arrived early morning and checked in straight away. We caught the A1 bus from the airport which stopped right outside the hotel, it took 5 mins and cost €5 each. Spacious room, comfy beds, Rituals toiletries, great view. The beach is across the main road and has sun loungers, toilet facilities and restaurants. Nice 20 min walk along the promenade into town or you can get a bus from hotel for €2 each.');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sleeps` varchar(255) NOT NULL,
  `facilities` varchar(255) NOT NULL,
  `rooms_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `name`, `sleeps`, `facilities`, `rooms_id`) VALUES
(1, 'room 1 2 adults', 'Minimum 2 \r\nMaximum 3\r\nplus one infant', '\r\nFlat screen television\r\nWi-fi*\r\nSafety deposit box*\r\nBalcony or terrace\r\nHairdryer\r\nBathroom containing a bath with shower attachment.\r\nAir conditioning.\r\nDaily room cleaning service\r\nTowel change on request', 11),
(2, 'Twin Mar Amantis Room', 'minimum 2 \r\nmaximum 3\r\n(plus 1 infants)', 'Flat screen television\r\nWi-fi*\r\nSafety deposit box*\r\nBalcony or terrace\r\nHairdryer\r\nBathroom containing a bath with shower attachment.\r\nAir conditioning.\r\nDaily room cleaning service\r\nTowel change on request', 11),
(3, 'Premium double or twin room with sea view', 'Minimum 2 Maximum 3', 'Room facilities:\r\nFlat screen television\r\nWi-fi*\r\nSafety deposit box*\r\nHairdryer\r\nTerrace\r\nBathroom containing a shower.\r\nAir conditioning.\r\nDaily room cleaning service\r\nTowel change on request', 11),
(16, '5 adults', 'minimum 1\r\nminimum 6', 'Flat screen television\r\nWi-fi\r\nSafety deposit box\r\nBalcony or terrace\r\nHairdryer\r\nCoffee making facilities\r\nKettle\r\nFridge\r\nDouble cooking rings\r\nMicrowave\r\nBathroom containing a shower.\r\nAir conditioning.', 10),
(17, 'Three bedroom apartment with sea view', 'minimum 1 \r\nmaximum 8', 'Flat screen television\r\nWi-fi\r\nSafety deposit box\r\nBalcony or terrace\r\nHairdryer\r\nCoffee making facilities\r\nKettle\r\nFridge\r\nDouble cooking rings\r\nMicrowave\r\nBathroom containing a shower.\r\nAir conditioning.', 10),
(18, 'Studio', 'Minimum 3 | Maximum 4', 'Room facilities:\r\nFlat screen television\r\nWi-fi\r\nSafety deposit box\r\nBalcony or terrace\r\nHairdryer\r\nMini bar*\r\nBathroom containing a shower.\r\nAir conditioning (between 01 May and 15 Oct).\r\nDaily room cleaning service and towel change', 10),
(19, 'Superior double or clean room', 'Minimum 2 \r\nMaximum 3', 'Room facilities:\r\nFlat screen television\r\nWi-fi\r\nSafety deposit box\r\nBalcony or terrace\r\nHairdryer\r\nMini bar*\r\nBathroom containing a shower.\r\nAir conditioning (between 01 May and 15 Oct).\r\nDaily room cleaning service and towel change', 9),
(20, 'Two bedroom suite', 'minimum 1 maximum 5', 'Room facilities:\r\nFlat screen television\r\nWi-fi\r\nSafety deposit box\r\nHairdryer\r\nKettle\r\nMini bar*\r\n2 bathrooms containing a bath or shower.\r\nAir conditioning (between 01 May and 31 Oct).\r\nDaily room cleaning service\r\nLinen changes and towel change on requ', 9);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `rooms_id` int(11) NOT NULL,
  `booker_id` int(11) NOT NULL,
  `hotel_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`rooms_id`, `booker_id`, `hotel_id`) VALUES
(9, 19, 7),
(10, 20, 6),
(11, 14, 5);

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `seat_id` int(11) NOT NULL,
  `seat_cost` varchar(255) NOT NULL,
  `row_number` varchar(255) NOT NULL,
  `near_emergency_exits` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seat`
--

INSERT INTO `seat` (`seat_id`, `seat_cost`, `row_number`, `near_emergency_exits`) VALUES
(17, '28', '16', 0),
(19, '35', '20', 1),
(21, '28', '34', 1),
(22, '10', '20', 0),
(23, '15', '22', 0),
(24, '20', '24', 1);

-- --------------------------------------------------------

--
-- Table structure for table `total_plane_cost`
--

CREATE TABLE `total_plane_cost` (
  `total_plane_cost_id` int(11) NOT NULL,
  `flight_cost` int(11) NOT NULL,
  `return_cost` varchar(255) NOT NULL,
  `total_cost` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `total_plane_cost`
--

INSERT INTO `total_plane_cost` (`total_plane_cost_id`, `flight_cost`, `return_cost`, `total_cost`) VALUES
(31, 55, '45', '100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `board_basis`
--
ALTER TABLE `board_basis`
  ADD PRIMARY KEY (`board_basis_id`);

--
-- Indexes for table `booker`
--
ALTER TABLE `booker`
  ADD PRIMARY KEY (`booker_id`),
  ADD KEY `FK_booker_address_id` (`address_id`),
  ADD KEY `FK_booker_to_first_passenger` (`first_passenger_id`),
  ADD KEY `FK_booker_booker_logon_details` (`booker_logon_details_id`),
  ADD KEY `FK_passenger_first_passenger` (`passengers_id`);

--
-- Indexes for table `booker_logon_details`
--
ALTER TABLE `booker_logon_details`
  ADD PRIMARY KEY (`booker_logon_details_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `FK_booking_destination_id` (`destination_id`),
  ADD KEY `FK_booking_booking_airport_id` (`booking_airport_id`),
  ADD KEY `FK_hotel_to_booking` (`hotel_id`),
  ADD KEY `FK_booker_booker_id` (`booker_logon_details_id`);

--
-- Indexes for table `booking_airport`
--
ALTER TABLE `booking_airport`
  ADD PRIMARY KEY (`booking_airport_id`),
  ADD KEY `FK_address_booking_airport_id` (`address_id`),
  ADD KEY `FK_booking_table_plane_id` (`plane_id`);

--
-- Indexes for table `booking_recipt`
--
ALTER TABLE `booking_recipt`
  ADD PRIMARY KEY (`booking_recipt`),
  ADD KEY `FK_booking_booking_id` (`booking_id`);

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkout_id`),
  ADD KEY `FK_checkout_payment_id` (`payment_id`);

--
-- Indexes for table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`destination_id`);

--
-- Indexes for table `destination_airport`
--
ALTER TABLE `destination_airport`
  ADD PRIMARY KEY (`destination_airport_id`),
  ADD KEY `FK_destination_airport_address_id` (`address_id`),
  ADD KEY `FK_destination_airport_hotel` (`hotel_id`),
  ADD KEY `FK_destination_destination_id` (`destination_id`),
  ADD KEY `FK_destination_airport_plane_id` (`plane_id`);

--
-- Indexes for table `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`facilites_id`);

--
-- Indexes for table `first_passenger`
--
ALTER TABLE `first_passenger`
  ADD PRIMARY KEY (`first_passenger_id`),
  ADD KEY `FK_firstpassenger_passengerID` (`passenger_id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`hotel_id`),
  ADD KEY `FK_hotel_facilities_id` (`facilities_id`),
  ADD KEY `FK_hotel_hotel_images_id` (`hotel_media_id`),
  ADD KEY `FK_destination_hotel_id` (`destination_id`),
  ADD KEY `FK_hotel_review_id` (`review_id`),
  ADD KEY `FK_hotel_rooms_id` (`room_id`),
  ADD KEY `FK_hotel_hotel_cost_id` (`hotel_cost_id`);

--
-- Indexes for table `hotel_cost_id`
--
ALTER TABLE `hotel_cost_id`
  ADD PRIMARY KEY (`hotel_cost_id`);

--
-- Indexes for table `hotel_media`
--
ALTER TABLE `hotel_media`
  ADD PRIMARY KEY (`hotel_image_id`);

--
-- Indexes for table `luggage`
--
ALTER TABLE `luggage`
  ADD PRIMARY KEY (`luggage_id`),
  ADD KEY `FK_seat_seat_id` (`seat_id`);

--
-- Indexes for table `numgoing`
--
ALTER TABLE `numgoing`
  ADD PRIMARY KEY (`numgoing_id`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`passengers_id`),
  ADD KEY `FK_passenger_address_id` (`address_id`),
  ADD KEY `FK_passenger_passport_id` (`passport_id`);

--
-- Indexes for table `passport`
--
ALTER TABLE `passport`
  ADD PRIMARY KEY (`passport_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `plane`
--
ALTER TABLE `plane`
  ADD PRIMARY KEY (`plane_id`),
  ADD KEY `FK_plane_seat_id` (`seat_id`),
  ADD KEY `FK_luggage_plane_id` (`luggage_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`rooms_id`),
  ADD KEY `FK_booker_rooms_id` (`booker_id`),
  ADD KEY `FK_hotel_rooms_id` (`hotel_id`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`seat_id`);

--
-- Indexes for table `total_plane_cost`
--
ALTER TABLE `total_plane_cost`
  ADD PRIMARY KEY (`total_plane_cost_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adress`
--
ALTER TABLE `adress`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `board_basis`
--
ALTER TABLE `board_basis`
  MODIFY `board_basis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booker`
--
ALTER TABLE `booker`
  MODIFY `booker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `booker_logon_details`
--
ALTER TABLE `booker_logon_details`
  MODIFY `booker_logon_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `booking_airport`
--
ALTER TABLE `booking_airport`
  MODIFY `booking_airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `booking_recipt`
--
ALTER TABLE `booking_recipt`
  MODIFY `booking_recipt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `destination`
--
ALTER TABLE `destination`
  MODIFY `destination_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `destination_airport`
--
ALTER TABLE `destination_airport`
  MODIFY `destination_airport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `facilities`
--
ALTER TABLE `facilities`
  MODIFY `facilites_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `first_passenger`
--
ALTER TABLE `first_passenger`
  MODIFY `first_passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hotel`
--
ALTER TABLE `hotel`
  MODIFY `hotel_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hotel_cost_id`
--
ALTER TABLE `hotel_cost_id`
  MODIFY `hotel_cost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hotel_media`
--
ALTER TABLE `hotel_media`
  MODIFY `hotel_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `luggage`
--
ALTER TABLE `luggage`
  MODIFY `luggage_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `numgoing`
--
ALTER TABLE `numgoing`
  MODIFY `numgoing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `passengers`
--
ALTER TABLE `passengers`
  MODIFY `passengers_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `passport`
--
ALTER TABLE `passport`
  MODIFY `passport_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `plane`
--
ALTER TABLE `plane`
  MODIFY `plane_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `rooms_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `seat`
--
ALTER TABLE `seat`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `total_plane_cost`
--
ALTER TABLE `total_plane_cost`
  MODIFY `total_plane_cost_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booker`
--
ALTER TABLE `booker`
  ADD CONSTRAINT `FK_booker_address_id` FOREIGN KEY (`address_id`) REFERENCES `adress` (`address_id`),
  ADD CONSTRAINT `FK_booker_booker_logon_details` FOREIGN KEY (`booker_logon_details_id`) REFERENCES `booker_logon_details` (`booker_logon_details_id`),
  ADD CONSTRAINT `FK_booker_firstpassenger_id` FOREIGN KEY (`first_passenger_id`) REFERENCES `first_passenger` (`first_passenger_id`),
  ADD CONSTRAINT `FK_passenger_first_passenger` FOREIGN KEY (`passengers_id`) REFERENCES `passengers` (`passengers_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `FK_booking_booking_airport_id` FOREIGN KEY (`booking_airport_id`) REFERENCES `booking_airport` (`booking_airport_id`),
  ADD CONSTRAINT `FK_booking_destination_id` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`destination_id`),
  ADD CONSTRAINT `FK_hotel_to_booking` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);

--
-- Constraints for table `booking_airport`
--
ALTER TABLE `booking_airport`
  ADD CONSTRAINT `FK_address_booking_airport_id` FOREIGN KEY (`address_id`) REFERENCES `adress` (`address_id`),
  ADD CONSTRAINT `FK_booking_table_plane_id` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`plane_id`);

--
-- Constraints for table `booking_recipt`
--
ALTER TABLE `booking_recipt`
  ADD CONSTRAINT `FK_booking_booking_id` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`);

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
  ADD CONSTRAINT `FK_checkout_payment_id` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`);

--
-- Constraints for table `destination_airport`
--
ALTER TABLE `destination_airport`
  ADD CONSTRAINT `FK_destination_airport_address_id` FOREIGN KEY (`address_id`) REFERENCES `adress` (`address_id`),
  ADD CONSTRAINT `FK_destination_airport_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  ADD CONSTRAINT `FK_destination_airport_plane_id` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`plane_id`),
  ADD CONSTRAINT `FK_destination_destination_id` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`destination_id`);

--
-- Constraints for table `first_passenger`
--
ALTER TABLE `first_passenger`
  ADD CONSTRAINT `FK_firstpassenger_passengerID` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passengers_id`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `FK_destination_hotel_id` FOREIGN KEY (`destination_id`) REFERENCES `destination` (`destination_id`),
  ADD CONSTRAINT `FK_hotel_facilities_id` FOREIGN KEY (`facilities_id`) REFERENCES `facilities` (`facilites_id`),
  ADD CONSTRAINT `FK_hotel_hotel_cost_id` FOREIGN KEY (`hotel_cost_id`) REFERENCES `hotel_cost_id` (`hotel_cost_id`),
  ADD CONSTRAINT `FK_hotel_hotel_images_id` FOREIGN KEY (`hotel_media_id`) REFERENCES `hotel_media` (`hotel_image_id`),
  ADD CONSTRAINT `FK_hotel_review_id` FOREIGN KEY (`review_id`) REFERENCES `review` (`review_id`);

--
-- Constraints for table `luggage`
--
ALTER TABLE `luggage`
  ADD CONSTRAINT `FK_seat_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`);

--
-- Constraints for table `passengers`
--
ALTER TABLE `passengers`
  ADD CONSTRAINT `FK_passenger_address_id` FOREIGN KEY (`address_id`) REFERENCES `adress` (`address_id`),
  ADD CONSTRAINT `FK_passenger_passport_id` FOREIGN KEY (`passport_id`) REFERENCES `passport` (`passport_id`);

--
-- Constraints for table `plane`
--
ALTER TABLE `plane`
  ADD CONSTRAINT `FK_luggage_plane_id` FOREIGN KEY (`luggage_id`) REFERENCES `luggage` (`luggage_id`),
  ADD CONSTRAINT `FK_plane_seat_id` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`);

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `FK_booker_rooms_id` FOREIGN KEY (`booker_id`) REFERENCES `booker` (`booker_id`),
  ADD CONSTRAINT `FK_hotel_rooms_id` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
