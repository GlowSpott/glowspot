-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 21, 2021 at 05:45 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `glowspot`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_tel` int(15) NOT NULL,
  `special notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(2, 'Cerave'),
(3, 'Cetaphil'),
(5, 'MGL'),
(1, 'Palmers'),
(4, 'Tea Tree');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(11) NOT NULL,
  `ip_add` varchar(50) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`p_id`, `ip_add`, `c_id`, `qty`) VALUES
(12, '::1', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `user_role` int(11) NOT NULL DEFAULT 2,
  `customer_pass` varchar(150) NOT NULL,
  `customer_country` varchar(30) NOT NULL,
  `customer_city` varchar(30) NOT NULL,
  `customer_contact` varchar(15) NOT NULL,
  `customer_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `user_role`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_image`) VALUES
(1, 'admin', 'admin@gmail.com', 1, 'admin', 'GHana', 'Tema', '021479852', NULL),
(9, 'Lawrencia Efua S. Cobbina', 'phone@gmail.com', 2, '$2y$10$xk3W62uXr8n0DYEXu7Tmj.6YA2syPdIc10RaY3FDM6XwP3bVtq4Fa', 'Ghana', 'Berekuso', '0227744336', NULL),
(10, 'Faith', 'afua@yelo.com', 2, '$2y$10$JtzVwZXAM/iOP8p9vDclhuKoazY82Yn7mFBbP4T0noq8iWoJXXcXa', 'Ghana', 'Tema', '5452446', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doc_id` int(11) NOT NULL,
  `doc_name` varchar(100) NOT NULL,
  `specialization` varchar(800) NOT NULL,
  `Times_available` varchar(100) NOT NULL,
  `charges` double NOT NULL,
  `clinics` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doc_id`, `doc_name`, `specialization`, `Times_available`, `charges`, `clinics`) VALUES
(1, 'Dr. Ryans', 'Dermatology', '9:00am - 10:00am', 150, 'Akai House Clinic'),
(2, 'Dr. Precious', 'Dermatology', '8:00am - 10:00am', 200, 'Rabito Clinic'),
(3, 'Dr. Luis', 'Dermatology', '1:00am - 3:00pm', 150, 'Korle Bu Dermatology'),
(4, 'Dr. Lee', 'Dermatology', '10:00am - 12:00pm', 100, 'D\'EL Mazor Skin Consultant'),
(5, 'Dr. Mary', 'Dermatology', '8:00am - 10:00am', 100, 'Rabito Clinic'),
(7, 'Dr. Carroline', 'Dermatology', '11:00am - 12:00pm', 100, 'Akai House Clinic'),
(8, 'Dr. Harriet', 'Dermatology', '2:00pm - 3:00pm', 150, 'D\'EL Mazor Skin Consultant');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` varchar(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `amt` double NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_status` text NOT NULL DEFAULT 'success'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `product_id`, `invoice_no`, `qty`, `amt`, `order_date`, `order_status`) VALUES
(2, '::1', 12, 563625508, 1, 20, '2021-11-21 12:22:24', 'success');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `pay_id` int(11) NOT NULL,
  `amt` double NOT NULL,
  `customer_id` text NOT NULL,
  `order_id` int(11) NOT NULL,
  `currency` text NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`pay_id`, `amt`, `customer_id`, `order_id`, `currency`, `payment_date`) VALUES
(3, 20, '::1', 2, 'GHS', '2021-11-21 15:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_brand` varchar(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_price` double NOT NULL,
  `product_desc` varchar(500) DEFAULT NULL,
  `product_image` text DEFAULT NULL,
  `product_keywords` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_brand`, `product_name`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(2, 'Cerave', 'Acne Control Cleanser', 50, 'CeraVe is the #1 dermatologist-recommended moisturizer brand for acne*, and our new Acne Control Cleanser with 2% salicylic acid is formulated to clear acne, reduce blackheads and improve the appearance of pores, while purifying clay helps absorb excess oil.', 'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products/acne-salicylic-acid-cleanser/700x875/acnecontrolcleanser_8oz-white_front-700x875-v1.jpg?rev=6cf2f7582f6c4118a9f69f5a0267b7c5?w=500&hash=1210E502ABB0004F2EDB8AA12F81B936', 'Acne Control Cleanser'),
(3, 'Cerave', 'Hydrating Facial Cleanser', 60, ' CeraVe Hydrating Facial Cleanser is a gentle face wash with ingredients like ceramides and hyaluronic acid that work to restore the skin’s natural barrier to help the skin lock in moisture.', 'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products-v3/hydrating-facial-cleanser/700x875/cerave_daily_hydrating-cleanser_12oz_front-700x875-v2.jpg?rev=95eb5a5216954b49ba37ab96f98f826d?w=800&hash=2DA159CDD62DF14AC8FB75FDF0D8090D', 'Hydrating Facial Cleanser'),
(4, 'Cerave', 'Foaming Facial Cleanser', 50, 'CeraVe Foaming Facial Cleanser features ceramides, hyaluronic acid and niacinamide to help restore the skin’s barrier, attract hydration and calm the skin.', 'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products-v3/foaming-facial-cleanser/700x875/cerave_foaming-facial-cleanser-12oz_front-700x875-v2.jpg?rev=65284ac19a2b43fa9a03b8b4bd555826?w=800&hash=34ACA2658E9628F4F315C360953491F5', 'Foaming Facial Cleanser'),
(5, 'Cerave', 'Renewing SA Cleanser', 80, 'CeraVe Renewing SA Cleanser provides gentle, non-irritating exfoliation without harsh microbeads that can scratch your skin. Suitable for use on your face and body as well as acne-prone skin, our salicylic acid cleanser not only exfoliates the skin, but with three essential ceramides, hyaluronic acid and niacinamide, it also helps soften and smooth the skin without disrupting its protective barrier. ', 'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products-v3/renewing-sa-cleanser/700x875/renewing_sa_cleanser_8oz_front_new-700x875-v2.jpg?rev=58ba4445d72b4b86b0c2ac7bc0e2f7ef?w=500&hash=E8C3D1F73869CB6C32B3E62A4E93B138', 'Renewing SA Cleanser'),
(6, 'Cerave', 'Hydrating Micellar Water', 40, 'CeraVe Hydrating Micellar Water is an ultra-gentle way to remove eye makeup, excess oil, and dirt without having to rinse. Our micellar water contains a nourishing ceramide and niacinamide blend. It restores and maintains your skin barrier.', 'https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products/hydrating-micellar-water/700x875/hydrating-micellar-water-front-700x875-v1.jpg?rev=63b6534b28b14285813605274a04a53d?w=500&hash=554D49FA693BB94C40B0F2BBF928980D', 'Hydrating Micellar Water'),
(7, 'Cetaphil', 'Daily Facial Cleanser', 20, 'This deep cleansing, gentle foaming formula now with hydrating glycerin and B5 & B3, reinforces the skin\'s moisture barrier, balances skin and is clinically tested to remove dirt, excess oils and makeup without leaving skin dry or tight.', 'https://s3.images-iherb.com/cet/cet92708/v/18.jpg', 'Facial Cleanser'),
(8, 'Cetaphil', 'Advanced Relief Cream with Shea Butter', 30, 'This nourishing cream is clinically proven to hydrate and replenish skin for 48 hours to help prevent visibly dry skin from coming back.', 'https://www.cetaphil.com/dw/image/v2/BGGN_PRD/on/demandware.static/-/Sites-galderma-us-m-catalog/default/dw5546a5b5/Advance%20lotion/302990116045_1.png?sw=800&sh=800&sm=fit', 'Advanced Relief Cream'),
(9, 'Cetaphil', 'Advanced Relief Lotion With Shea Butter', 50, 'The nourishing lotion is clinically proven to smooth roughness and reveal more radiant skin in 1 use. Specially formulated with a dermatologist-backed blend of niacinamide (vitamin B3), panthenol (vitamin B5), and hydrating glycerin to improve the resilience of sensitive skin', 'https://www.cetaphil.com/dw/image/v2/BGGN_PRD/on/demandware.static/-/Sites-galderma-us-m-catalog/default/dw8a4c28ab/Advance%20lotion/302993914280_1.png?sw=800&sh=800&sm=fit', 'Relief Lotion with Shea Butter'),
(10, 'Cetaphil', 'Baby Daily Lotion', 70, 'This gentle baby lotion is designed to soothe and nourish while moisturizing and protecting your baby’s skin from dryness. Formulated with organic calendula to soothe plus sweet almond oil, sunflower oil, and vitamin E to soften and smooth skin', 'https://www.cetaphil.com/dw/image/v2/BGGN_PRD/on/demandware.static/-/Sites-galderma-us-m-catalog/default/dw17f06d9c/baby-ceta/302993936039_1.png?sw=800&sh=800&sm=fit', 'Baby Lotion'),
(11, 'Cetaphil', 'Baby Gentle Wash', 60, 'This rich lathering wash contains ⅓ baby lotion and is designed to leave a baby’s skin soft and smooth. Formulated with soothing organic calendula extract, derived from the marigold flower and used for centuries to soothe dry, sensitive skin.', 'https://www.cetaphil.com/dw/image/v2/BGGN_PRD/on/demandware.static/-/Sites-galderma-us-m-catalog/default/dw1faf1361/Baby%20Gentle%20Wash%20with%20natural%20Calendula,%207.8%20fl%20oz/302993936091_1.png?sw=800&sh=800&sm=fit', 'Gentle Wash'),
(12, 'MGL', 'Coconut Oil & Shea Butter Natural Hair Food', 20, 'MGL Naturals Coconut Oil & Shea Butter Natural Hair Food is 90% natural. Made with nature’s best kept secret for growing hair longer, lustrous and healthier. It gives hair incredible moisture, shine, softness, thickness and conditions the scalp.', 'https://firebasestorage.googleapis.com/v0/b/mgl-naturals.appspot.com/o/productinfo%2Fcoconutoilandsheabutter.png?alt=media&token=9308a383-8704-4777-b43e-bd3eb33bd2cd', 'Natural Hair Food'),
(13, 'MGL', 'Virgin Coconut Oil Natural Hair Food', 30, 'MGL Naturals Coconut Oil Natural Hair Food is 90% natural, made with organic virgin coconut oil. It absorbs easily to nourish hair from the roots for healthy hair growth, intense treatment for thin fragile hair, and enhances hair manageability. ', 'https://firebasestorage.googleapis.com/v0/b/mgl-naturals.appspot.com/o/productinfo%2FCOCONUTOILHAIRPOMADE.png?alt=media&token=e51fa6b5-5b81-457d-8e1c-a6479b9dde8a', 'Virgin Coconut Oil Hair Food'),
(14, 'MGL', 'Herbal Hair Treatment', 40, 'MGL Naturals Herbal Hair Treatment is an excellent formula for super hair growth and scalp treatment. It provides nature’s best-kept remedies that fertilize, nourish and moisturize the hair to become thicker and stronger.', 'https://firebasestorage.googleapis.com/v0/b/mgl-naturals.appspot.com/o/productinfo%2FHERBAL%20HAIR%20TREATMENT.jpg?alt=media&token=3ef8422e-75e7-48e0-974a-72184a902228', 'Herbal Hair Treatment '),
(15, 'MGL', 'Organic Baby Care', 60, 'Baby’s skin is the most sensitive of all and deserves the purest natural care. Use MGL naturals Organic Baby Care as your baby’s daily body moisturizer to nourish, protect and soothe the skin. Made with 100% pure organic Shea Butter and Cocoa Butter that contains maximum amount of healing and moisturizing properties needed for the baby’s healthy skincare. ', 'https://firebasestorage.googleapis.com/v0/b/mgl-naturals.appspot.com/o/productinfo%2FORGANIC%20BABY%20CARE.jpg?alt=media&token=44bc2aa9-330d-4cb0-9e09-eee8a7dbf0cc', 'Organic Baby Care'),
(16, 'MGL', 'Cocoa Butter Black Soap', 70, 'MGL Naturals Cocoa Butter Black Soap is an organic traditional handcrafted soap made entirely from natural ingredients and enriched with unrefined cocoa butter for its sustaining, conditioning, and moisturizing properties. This 100% natural soap cleanses the face and body thoroughly, helps treat and prevent minor skin problems, and wash off makeup, leaving the skin revitalized and smooth.', 'https://firebasestorage.googleapis.com/v0/b/mgl-naturals.appspot.com/o/productinfo%2FCOCOA%20BUTTER%20BLACK%20SOAP.jpg?alt=media&token=9c347e57-fb75-48a7-a222-799c5a6abf10', 'Cocoa Butter Black Soap'),
(17, 'Palmers', 'Original Solid Jar', 20, 'Heal and Soften extremely rough, dry skin with Palmer\'s Cocoa Butter Formula Original Solid, crafted with intensively moisturizing Cocoa Butter and Vitamin E. This unique concentrated solid melts into skin to lock in moisture.', 'https://www.palmers.com/2495-large_default/solid-formula-cocoa-butter.jpg', 'Solid Jar'),
(18, 'Palmers', 'Natural Vitamin E body Oil', 10, 'Palmer\'s Natural Vitamin E Body Oil instantly moisturizes to improve the appearance of dry, damaged, or cracked skin, uneven skin tone and chafed skin. Made with natural Vitamin E (tocopherol), Cocoa Butter, and our advanced botanical blend to effectively soothe, and nourish the skin', 'https://www.palmers.com/912-large_default/vitamin-e-body-oil.jpg', 'Natural Vitamin E'),
(19, 'Palmers', 'Natural Vitamin E Body Butter', 15, 'Palmer\'s Natural Vitamin E Body Butter improves the appearance of dry, damaged, or cracked skin, uneven skin tone, and chafed skin. Made with natural Vitamin E (Tocopherol), Cocoa Butter, and our advanced botanical blend to effectively soothe, and nourish the skin', 'https://www.palmers.com/958-large_default/vitamin-e-body-butter.jpg', 'Natural Vitamin E Body Butter'),
(20, 'Palmers', 'Anti-Dark Spot Night Fade Cream', 25, 'Palmer\'s Skin Success Night Fade Cream boosts radiance and replenishes skin while you sleep so you can wake up to a brighter, more luminous and balanced complexion.  Powerful tone correcting ingredients and anti-aging Retinol help improve the visible signs of aging so with continued use, your skin\'s youthful glow is restored.', 'https://www.palmers.com/1507-large_default/anti-dark-spot-night-fade-cream.jpg', 'Anti-Dark Spot Night Fade Cream'),
(21, 'Palmers', 'Firming Body Lotion', 20, 'Visibly Firm & Tone skin with Palmer\'s Cocoa Butter Formula Firming Lotion, specially crafted with Cocoa Butter, Vitamin E plus Collagen, Elastin & Q10 to address loss of tightness, elasticity or dimpled appearance.', 'https://www.palmers.com/2456-large_default/firming-body-lotion.jpg', 'Firming Body Lotion'),
(22, 'Tea Tree', 'Tea Tree Skin Clearing Clay Mask', 20, 'This vegan trouble-shooter has been named a bestseller and one of many in our much-loved Tea Tree range. From The Body Shop’s Tea Tree Clay Mask to the Tea Tree Skin Clearing Foaming Cleanser, you’ll find a whole team of blemish-fighting machines.', 'https://media.thebodyshop.com/i/thebodyshop/TEA_TREE_SKIN_CLEARING_CLAY_MASK_100ML_1_INRSDPS193.jpg?$product-zoom$', 'Skin Clearing Clay Mask'),
(25, 'Tea Tree', 'Tea Tree Purifying Soap', 15, 'Lather up with our purifying vegetable-based bar cleanser. Made with purifying tea tree oil, it leaves skin feeling soft, refreshed and thoroughly cleansed.\r\n', 'https://media.thebodyshop.com/i/thebodyshop/TEA_TREE_PURIFYING_SOAP_100G_1_INCHRPS320.jpg?$product-zoom$', 'Purifying soap'),
(26, 'Tea Tree', 'Tea Tree Oil Balm', 30, 'Earth’s Care Tea Tree Oil Balm includes Shea Butter, Natural Vitamin E and Sweet Almond Oil.  Our Tea Tree Oil Balm\'s proprietary formula acts as a natural moisturizer for problem skin.', 'https://s3.images-iherb.com/erc/erc00338/v/6.jpg', 'Oil Balm'),
(27, 'Tea Tree', 'Desert Essence Tea Tree Oil Skin Ointment', 50, 'Desert Essence Tea Tree Oil Skin Ointment contains a blend of natural oils enriched with Vitamin E and infused with relaxing and soothing Lavender oil.', 'https://s3.images-iherb.com/des/des00003/v/18.jpg', 'Tea Tree Oil Skin Ointment'),
(28, 'Tea Tree', 'Tea Tree Therapy, Tea Tree Oil', 40, 'Tea tree oil is an essential oil that can be used for several purposes, including keeping skin, hair and nails healthy.', 'https://s3.images-iherb.com/ttt/ttt12260/v/1.jpg', 'Tea Tree Therapy Oil'),
(30, 'MGL', 'Oil Blend', 50, 'Create oil mix', 'data:image/jpeg;base64,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', 'oil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `doc_ref` (`doc_id`),
  ADD KEY `cust_email` (`customer_email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `cart_ibfk_1` (`p_id`),
  ADD KEY `cart_ibfk_2` (`c_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `customer_email` (`customer_email`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`pay_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `pr_br` (`product_brand`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `pay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `cust_email` FOREIGN KEY (`customer_email`) REFERENCES `customer` (`customer_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `doc_ref` FOREIGN KEY (`doc_id`) REFERENCES `doctors` (`doc_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `pr_br` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
