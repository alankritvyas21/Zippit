
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');


CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'Lenovo'),
(5, 'LG'),
(6, 'Cloth Brand'),
(7, 'SkullCandy');


CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', 26, 1);



CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Ladies Wears'),
(3, 'Mens Wear'),
(4, 'Kids Wear'),
(5, 'Furnitures'),
(6, 'Home Appliances'),
(7, 'Camera'),
(8, 'Covid Essentials');



CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'av3h.vyas@gmail.com'),
(5, 'sdshivang@gmail.com');



CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 1, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 2, 2, 1, '07M47684BS5725041', 'Completed'),
(3, 3, 4, 1, '07M47684BS5725041', 'Out for delivery');



CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 1, 'Alankrit', 'av3h.vyas@gmail.com', 'Waghbil Naka,Ghodbunder Road', 'Thane', 'Maharashtra', 400615, 'pokjhgfcxc', '0000 0000 0000 0000', '12/90', 1, 93799, 1),
(2, 2, 'Shivang', 'sdshivang@gmail.com', 'Malviya Nagar', 'Jaipur', 'Rajasthan', 3003014, 'abcdefg', '0000 0000 0000 0001', '12/90', 1, 79899, 2),
(3, 3, 'Aditya', 'aditya1495@gmail.com', 'Indira nagar', 'Nashik', 'Maharashtra', 400689, 'bcfdgsjasd', '0000 0000 0000 0003', '12/90', 1, 2499, 3);



CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 7, 1, 93799),
(74, 2, 2, 1, 79899),
(75, 3, 4, 1, 2499);


CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Realme Narzo 20', 12299, 'Realme Phones ', 'product07.png', 'Realme Phones'),
(2, 1, 3, 'iPhone 11 Pro', 79899, 'Apple iPhone', 'http___pluspng.com_img-png_iphone-hd-png-iphone-apple-png-file-550.png', 'mobile iphone apple'),
(3, 1, 3, 'iPad Pro', 99900, 'iPad Pro', 'da4371ffa192a115f922b1c0dff88193.png', 'ipad'),
(4, 1, 3, 'Boat Airdopes 443', 2499, 'Boat Airdopes', 'airdopes.png', 'Boat'),
(5, 1, 7, 'SkullCandy Earphones', 2999, 'Skull Candy Earphones', 'skullcandyset.png', 'Skull'),
(6, 1, 1, 'Electric Kettle', 3500, 'Electric Kettle', 'kettle.png', 'kettle'),
(7, 1, 4, 'Lenovo Legion Y540', 93799, 'Lenovo Laptops', 'lenovolegion.png', 'Lenovo Laptops'),
(8, 1, 1, 'HP Pavillion', 63155, 'HP Laptop', 'hppav.png', 'HP'),
(9, 1, 2, 'Samsung Galaxy Note 20', 74999, 'Samsung Mobiles', 'note20.png', 'Samsung'),
(10, 2, 6, 'Red dress', 1000, 'Red party dress', 'reddress.jpg', 'red dress '),
(11, 2, 6, 'Black dress', 1200, 'Black Part dress', 'blackdress.jpg', 'black dress'),
(12, 2, 6, 'Summer Dress- Ladies', 1500, 'ladies casual summer dress', 'summer.jpg', 'girl dress cloths casual'),
(13, 2, 6, 'Kurta', 800, 'Kurta', 'Kurta.jpg', 'kurta'),
(14, 2, 6, 'Casual Dress', 699, 'girl dress', 'casual.jpg', 'ladies casual'),
(15, 2, 6, 'Formal Dress', 1500, 'Formal wear for ladies', 'formal.jpg', 'fromal'),
(16, 3, 6, 'Wine Red Suit for men', 3499, 'Red Suit', 'suit1.png', 'suit'),
(17, 3, 6, 'Black Suit for men', 4999, 'Black Suit', 'suit2.png', 'suit'),
(19, 3, 6, 'Star Wars T-shirt', 699, 'Star Wars T-shirt', 'starwars.jpg', 'tshirt'),
(20, 3, 6, 'Men\'s Hoodie', 1600, 'Hoodie', 'hoodie.jpeg', 'hoodie'),
(21, 3, 6, 'Pullover Hoodie', 1499, 'hoodie', 'hoodie2.jpg', 'hoodie'),
(22, 4, 6, 'Yellow T shirt ', 1300, 'yello t shirt with pant', '1.0x0.jpg', 'kids yellow t shirt'),
(23, 4, 6, 'Girls cloths', 1900, 'sadsf', 'GirlsClothing_Widgets.jpg', 'formal kids wear dress'),
(24, 4, 6, 'Blue T shirt', 700, 'g', 'images.jpg', 'kids dress'),
(25, 4, 6, 'Yellow girls dress', 750, 'as', 'images (3).jpg', 'yellow kids dress'),
(27, 4, 6, 'Formal look', 690, 'sd', 'image28.jpg', 'formal kids dress'),
(32, 5, 0, 'Book Shelf', 2499, 'book shelf', 'bookshelf.jpg', 'book shelf furniture'),
(33, 6, 2, 'Refrigerator', 35000, 'Refrigerator', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', 'refrigerator samsung'),
(34, 6, 4, 'Emergency Light', 1000, 'Emergency Light', 'emergency light.JPG', 'emergency light'),
(35, 6, 0, 'Vaccum Cleaner', 6000, 'Vaccum Cleaner', 'images (2).jpg', 'Vaccum Cleaner'),
(36, 6, 5, 'Iron', 1500, 'gj', 'iron.JPG', 'iron'),
(37, 6, 5, 'LED TV', 20000, 'LED TV', 'images (4).jpg', 'led tv lg'),
(38, 6, 4, 'Microwave Oven', 3500, 'Microwave Oven', 'images.jpg', 'Microwave Oven'),
(39, 6, 5, 'Mixer Grinder', 2500, 'Mixer Grinder', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder'),
(40, 2, 6, 'Kurta', 2000, 'Kurta', 'kurta2.jpg', 'ladies'),
(48, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony'),
(49, 1, 7, 'Headphones', 250, 'Headphones', 'product05.png', 'Headphones Sony'),
(63, 3, 6, 'Black Jeans', 999, 'Jeans', 'jeans.jpg', 'jeans'),
(64, 3, 6, 'Blue Jeans', 999, 'Jeans', 'denims.JPG', 'jeans'),
(65, 3, 6, 'Ripped Jeans', 799, 'Jeans', 'ripped.jpg', 'jeans'),
(66, 3, 6, 'Light Brown pants', 1499, 'Pants', 'pant.jpg', 'Pant'),
(71, 1, 2, 'Samsung galaxy s7', 5000, 'Samsung galaxy s7', 'product07.png', 'samsung mobile electronics'),
(72, 7, 2, 'sony Headphones', 3500, 'sony Headphones', 'product02.png', 'sony Headphones electronics gadgets'),
(73, 7, 2, 'samsung Headphones', 3500, 'samsung Headphones', 'product05.png', 'samsung Headphones electronics gadgets'),
(74, 1, 1, 'HP i5 laptop', 5500, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics'),
(75, 1, 1, 'HP i7 laptop 8gb ram', 5500, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(76, 1, 5, 'sony note 6gb ram', 4500, 'sony note 6gb ram', 'product04.png', 'sony note 6gb ram mobile electronics'),
(77, 1, 4, 'MSV laptop 16gb ram NVIDEA Graphics', 5499, 'MSV laptop 16gb ram', 'product06.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'dell laptop 8gb ram intel integerated Graphics', 4579, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(79, 7, 2, 'camera with 3D pixels', 2569, 'camera with 3D pixels', 'product09.png', 'camera with 3D pixels camera electronics gadgets'),
(80, 1, 1, 'ytrfdkjsd', 12343, 'sdfhgh', '1542455446_thythtf .jpeg', 'dfgh'),
(81, 4, 6, 'Kids blue dress', 300, 'blue dress', '1543993724_pg4.jpg', 'kids blue dress'),
(82, 5, 0, 'Portable desk', 1799, 'Desk', 'desk.jpg', 'desk'),
(83, 5, 0, 'Table', 1899, 'Side Table', 'table.jpg', 'table');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Alankrit ', 'Vyas', 'av3h.vyas@gmail.com', 'Password123', '9876543210', 'Waghbil Naka', 'Thane'),
(2, 'Shivang ', 'Swivedi', 'sdshivang@gmail.com', 'Password456', '8529630147', 'Malviya Nagar', 'Jaipur'),
(3, 'Aditya', 'Patil', 'aditya1495@gmail.com', 'Password789', '7894561230', 'Indira Nagar', 'Nashik');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(1, 'Alankrit', 'Vyas', 'av3h.vyas@gmail.com', 'Password123', '9876543210', 'Waghbil Naka', 'Thane'),
(2, 'Shivang', 'Dwivedi', 'sdshivang@gmail.com', 'Password456', '8529630147', 'Malviya Nagar', 'Jaipur'),
(3, 'Aditya', 'Patil', 'aditya1495@gmail.com', 'Password789', '7894561230', 'Indira Nagar', 'Nashik');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
