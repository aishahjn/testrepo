-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2025 at 01:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kiulu`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodations`
--

CREATE TABLE `accommodations` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `max_capacity` int(11) NOT NULL,
  `availability_status` enum('available','booked','unavailable') DEFAULT 'available',
  `contact_info` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accommodations`
--

INSERT INTO `accommodations` (`id`, `name`, `description`, `location`, `price`, `max_capacity`, `availability_status`, `contact_info`, `created_at`, `updated_at`) VALUES
(1, 'Camping', 'The campsite at RS Kamandus View provides an excellent outdoor experience for families, friends, and groups. Surrounded by nature, the campsite is ideal for activities like barbecuing, picnicking, swimming, and team-building exercises', 'RS Kamandus View, Jalan Tamparuli Kiulu, 89250 Tamparuli, Sabah, Malaysia.', 10.00, 4, 'available', '013-866 5811', '2025-01-20 21:06:15', '2025-01-22 02:07:06'),
(2, 'Kuhub-Kuhub', 'Kuhub-Kuhub, also known as A-shaped huts, are charming accommodations at RS Kamandus View designed to offer a unique glamping experience. Each hut can accommodate 4-5 people and is equipped with a fan, two pillows, a queen-sized mattress, and electrical sockets', 'RS Kamandus View, Jalan Tamparuli Kiulu, 89250 Tamparuli, Sabah, Malaysia.', 50.00, 2, 'available', '013-866 5811', '2025-01-20 21:06:15', '2025-01-22 02:07:12'),
(3, 'Sulap', 'The Sulap at RS Kamandus View are traditional Kadazan-Dusun houses that provide a comfortable and rustic experience. They are designed to reflect the local culture and offer a unique opportunity to immerse oneself in the natural and traditional surroundings. Perfect for families or groups looking for an authentic stay.', 'RS Kamandus View, Jalan Tamparuli Kiulu, 89250 Tamparuli, Sabah, Malaysia', 200.00, 8, 'booked', '013-866 5811', '2025-01-20 21:06:15', '2025-01-21 13:10:46'),
(4, 'Kuhub-kuhub RS', 'Kuhub-Kuhub are A-shaped huts designed to offer a unique glamping experience. Each hut can accommodate up to 20 people and is equipped with a fan, two pillows, a queen-sized mattress, and electrical sockets. These huts provide a cozy and memorable stay for large groups.', 'RS Kamandus View, Jalan Tamparuli Kiulu, 89250 Tamparuli, Sabah, Malaysia.', 30.00, 20, 'available', '013-866 5811', '2025-01-21 13:13:45', '2025-01-21 13:13:45');

-- --------------------------------------------------------

--
-- Table structure for table `accommodation_limit`
--

CREATE TABLE `accommodation_limit` (
  `id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accommodation_limit`
--

INSERT INTO `accommodation_limit` (`id`, `accommodation_id`, `quantity`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2025-01-21 06:07:55', '2025-01-21 06:13:34'),
(2, 2, 3, '2025-01-21 06:07:55', '2025-01-21 06:07:55'),
(3, 3, 8, '2025-01-21 06:07:55', '2025-01-21 06:07:55');

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `activityID` int(11) NOT NULL,
  `activityName` varchar(100) NOT NULL,
  `activityDescription` text DEFAULT NULL,
  `activityDate` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `accommodationID` int(11) NOT NULL,
  `maxParticipants` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`activityID`, `activityName`, `activityDescription`, `activityDate`, `startTime`, `endTime`, `accommodationID`, `maxParticipants`, `price`) VALUES
(1, 'Hiking', 'A guided hiking tour through the Kiulu forest, exploring wildlife and scenic views.', '2025-02-01', '08:00:00', '12:00:00', 1, 20, 50.00),
(2, 'Water Rafting', 'An adventurous water rafting experience in the Kiulu river, suitable for all skill levels.', '2025-02-02', '09:00:00', '14:00:00', 1, 15, 80.00);

-- --------------------------------------------------------

--
-- Table structure for table `activity_bookings`
--

CREATE TABLE `activity_bookings` (
  `id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `booking_date` datetime NOT NULL,
  `guest_name` varchar(255) NOT NULL,
  `guest_email` varchar(255) NOT NULL,
  `guest_phone` varchar(50) NOT NULL,
  `num_guests` int(11) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `booking_status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) DEFAULT 0.00,
  `unit` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `name`, `description`, `price`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'Chair', 'Standard chair rental', 0.70, 'each', '2025-01-21 10:39:41', '2025-01-21 10:39:41'),
(2, 'Table', 'Standard table rental', 15.00, 'each', '2025-01-21 10:39:41', '2025-01-21 10:39:41'),
(3, 'PA System', 'Public address system rental including speakers and microphones', 250.00, 'per day', '2025-01-21 10:39:41', '2025-01-21 10:39:41'),
(4, 'Open Hall', 'Open hall rental inclusive of tables, chairs and electricity fee', 200.00, 'per booking', '2025-01-21 10:39:41', '2025-01-21 10:39:41'),
(5, 'Kitchen < 25 pax', 'Kitchen facilities for groups up to 25 people', 30.00, 'per booking', '2025-01-21 10:39:41', '2025-01-21 10:39:41'),
(6, 'Kitchen > 25 pax', 'Kitchen facilities for groups larger than 25 people', 1.00, 'per person', '2025-01-21 10:39:41', '2025-01-21 10:39:41'),
(7, 'BBQ Kitchen', 'For groups up to 25 people', 150.00, 'per session', '2025-01-21 12:21:40', '2025-01-21 12:21:40'),
(8, 'Extra BBQ Kitchen', 'For groups larger than 25 people', 6.00, 'per person', '2025-01-21 12:21:40', '2025-01-21 12:21:40'),
(9, 'Additional Tables', 'Extra dining tables', 10.00, 'each', '2025-01-21 12:21:40', '2025-01-21 12:21:40'),
(10, 'Additional Chairs', 'Extra chairs', 5.00, 'each', '2025-01-21 12:21:40', '2025-01-21 12:21:40'),
(11, 'Tent Setup', 'Additional tent setup', 50.00, 'each', '2025-01-21 12:21:40', '2025-01-21 12:21:40');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blogID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `shortDesc` text DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `publishDate` date NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blogID`, `title`, `image`, `shortDesc`, `content`, `publishDate`, `createdAt`, `updatedAt`, `categoryID`) VALUES
(1, 'Delicious Camping Recipes: Easy and Nutritious Meals for the Outdoors', 'uploads/blogs/blog1.png', 'Discover a variety of easy-to-prepare and nutritious recipes perfect for your camping adventures.', 'When it comes to enjoying the great outdoors, nothing beats a delicious meal cooked over a campfire. Here are some camping recipes that are easy to prepare, nutritious, and perfect for any outdoor adventure.\r\n\r\nCampfire Breakfast Burritos\r\nStart your day with a hearty breakfast burrito. You\'ll need tortillas, scrambled eggs, cheese, and your choice of fillings such as sautéed vegetables, beans, or cooked sausage. Simply wrap the ingredients in a tortilla, wrap it in foil, and heat it over the campfire until warm and the cheese is melted.\r\n\r\nFoil Packet Dinners\r\nFoil packet dinners are a camping classic. They\'re easy to prepare and require minimal cleanup. Fill a piece of heavy-duty foil with your choice of proteins (such as chicken, beef, or tofu), vegetables (like bell peppers, onions, and zucchini), and seasonings. Seal the packet and cook it over the campfire or on a portable grill for 15-20 minutes until everything is cooked through.\r\n\r\nS\'mores Nachos\r\nThis fun twist on a classic dessert is sure to be a hit. Layer graham crackers, chocolate chips, and mini marshmallows in a cast-iron skillet. Place the skillet over the campfire until the chocolate and marshmallows are melted and gooey. Serve with a scoop of ice cream or a drizzle of caramel sauce.\r\n\r\nCampfire Chili\r\nFor a warm and hearty meal, try campfire chili. In a large pot, combine ground meat, beans, tomatoes, and your favorite spices. Let it simmer over the campfire until the flavors meld together. Serve with cornbread or over a bed of rice.\r\n\r\nGrilled Fruits\r\nFor a healthy and delicious dessert, try grilling your favorite fruits. Pineapple, peaches, and apples all work well. Simply slice the fruit, skewer it, and grill it over the campfire until caramelized. Enjoy on its own or with a dollop of yogurt or honey.\r\n\r\nWith these camping recipes, your outdoor adventures can be both delicious and nutritious. Happy cooking!', '2025-03-01', '2024-12-30 22:30:00', '2025-01-23 11:31:35', 4),
(2, 'Gourmet Camping: Elevate Your Outdoor Dining Experience', 'uploads/blogs/blog2.png', 'Bring a touch of gourmet to your camping trip with these delicious and sophisticated recipes.', 'Who says you can\'t enjoy gourmet food while camping? With a little preparation, you can create sophisticated outdoor meals that will impress fellow campers.\r\n\r\nCampfire Paella\r\nThis Spanish classic can be made over a campfire with a large skillet or paella pan. You\'ll need rice, saffron, chicken, seafood (such as shrimp and clams), chorizo, bell peppers, onions, garlic, and tomatoes. Cook the meats and vegetables first, then add the rice and saffron-infused broth. Let it simmer over the fire until the rice is tender and the flavors meld together.\r\n\r\nGourmet Hot Dogs\r\nElevate the humble hot dog with gourmet toppings. Use high-quality sausages and artisan buns. Top with caramelized onions, gourmet mustard, sautéed mushrooms, and a sprinkle of truffle oil. You can also add a layer of cheese for an extra indulgent touch.\r\n\r\nCampfire Fondue\r\nTurn your campsite into a Swiss chalet with campfire fondue. You\'ll need a pot or cast-iron Dutch oven, cheese (such as Gruyère and Emmental), white wine, garlic, and a splash of kirsch. Heat the wine and garlic in the pot, then slowly add the cheese, stirring until melted and smooth. Serve with chunks of bread, apples, and vegetables for dipping.\r\n\r\nGrilled Steak with Herb Butter\r\nA perfectly grilled steak is always a campsite favorite. Season your steaks with salt and pepper, then grill them over the campfire to your desired doneness. Top with a homemade herb butter made from softened butter, minced garlic, chopped fresh herbs (such as parsley and thyme), and a squeeze of lemon juice. Let the herb butter melt over the hot steaks before serving.\r\n\r\nDutch Oven Peach Cobbler\r\nFor a sweet ending to your gourmet camping meal, try a Dutch oven peach cobbler. You\'ll need fresh or canned peaches, sugar, flour, baking powder, butter, and milk. Place the peach mixture in the bottom of a greased Dutch oven, top with the biscuit dough, and bake over hot coals until golden brown and bubbly. Serve with a scoop of vanilla ice cream for an extra treat.\r\n\r\nWith these gourmet camping recipes, you can enjoy the finer things in life even while out in the wilderness. Bon appétit!', '2025-04-22', '2025-01-21 23:30:00', '2025-01-23 11:30:53', 4),
(4, 'Essential Camping Tips for Beginners: A Guide to Your First Adventure', 'uploads/blogs/blog3.png', 'A comprehensive guide filled with practical tips to help beginners have a successful and enjoyable camping experience.', 'Camping is a fantastic way to connect with nature, relax, and explore the great outdoors. If you\\\'re new to camping, here are some essential tips to ensure a smooth and enjoyable adventure.\\r\\n\\r\\n Choose the Right Campsite\\r\\nResearch campsites in advance and choose one that matches your preferences and experience level. Look for locations with necessary amenities such as restrooms, potable water, and designated fire pits. For beginners, established campgrounds are ideal.\\r\\n\\r\\n Pack Smart\\r\\nMake a checklist of essential items to bring, including a tent, sleeping bag, camp stove, food, water, first aid kit, and appropriate clothing. Check the weather forecast and pack accordingly. Don\\\'t forget to bring a map, compass, or GPS device.\\r\\n\\r\\n Practice Setting Up Your Tent\\r\\nBefore you head out, practice setting up your tent at home. Familiarize yourself with the assembly process to avoid any surprises at the campsite. This will save you time and prevent frustration.\\r\\n\\r\\n Plan Your Meals\\r\\nMeal planning is crucial for a successful camping trip. Choose easy-to-cook meals and bring pre-packaged or pre-prepared food to save time. Remember to pack a portable stove, fuel, and cooking utensils. Don’t forget snacks and plenty of water.\\r\\n Dress in Layers\\r\\nWeather can be unpredictable, especially in the great outdoors. Dress in layers to stay comfortable throughout the day. Start with a moisture-wicking base layer, add an insulating mid-layer, and top it off with a waterproof outer layer.\\r\\n\\r\\n Follow Leave No Trace Principles\\r\\nRespect nature by following the Leave No Trace principles: pack out all trash, minimize campfire impact, respect wildlife, and be considerate of other visitors. Leave the campsite better than you found it.\\r\\n\\r\\n Stay Safe\\r\\nAlways inform someone of your camping plans and expected return date. Carry a first aid kit and know how to use it. Be aware of your surroundings and potential hazards, such as wildlife, uneven terrain, and weather changes.\\r\\n\\r\\n Enjoy the Experience\\r\\nTake time to relax and enjoy the peacefulness of nature. Go on hikes, stargaze, and disconnect from technology. Capture memories with photos and journaling.\\r\\n\\r\\nBy following these essential tips, beginners can feel confident and prepared for their first camping adventure. Happy camping!', '2025-01-22', '2025-01-23 11:46:10', '2025-01-23 11:46:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `accommodation_id` int(11) NOT NULL,
  `booking_date` date NOT NULL,
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `guest_name` varchar(255) NOT NULL,
  `guest_email` varchar(255) NOT NULL,
  `guest_phone` varchar(50) NOT NULL,
  `num_guests` int(11) NOT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `booking_status` enum('pending','confirmed','cancelled') DEFAULT 'confirmed',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `accommodation_id`, `booking_date`, `check_in_date`, `check_out_date`, `guest_name`, `guest_email`, `guest_phone`, `num_guests`, `total_price`, `booking_status`, `created_at`, `updated_at`) VALUES
(1, 1, '2025-01-22', '2025-01-22', '2025-01-23', 'aishah', 'aishah@gmail.com', '012345678', 2, 60.00, 'cancelled', '2025-01-22 10:28:58', '2025-01-22 12:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `booking_amenities`
--

CREATE TABLE `booking_amenities` (
  `id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `amenity_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `price_at_booking` decimal(10,2) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking_amenities`
--

INSERT INTO `booking_amenities` (`id`, `booking_id`, `amenity_id`, `quantity`, `price_at_booking`, `total_amount`, `created_at`) VALUES
(1, 1, 11, 1, 50.00, 50.00, '2025-01-22 10:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `name`) VALUES
(7, 'Adventure Stories'),
(4, 'Camping Recipes'),
(1, 'Camping Tips'),
(6, 'Eco-Friendly Camping'),
(3, 'Family Camping'),
(2, 'Outdoor Activities'),
(5, 'Survival Skills');

-- --------------------------------------------------------

--
-- Table structure for table `safetyinfo`
--

CREATE TABLE `safetyinfo` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `last_updated` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `safetyinfo`
--

INSERT INTO `safetyinfo` (`id`, `title`, `type`, `description`, `image`, `last_updated`) VALUES
(1, 'Fire Extinguisher Use', 'Fire Safety', 'How to use a fire extinguisher safely.\r\n\r\n1. Understand the PASS Method:\r\nP: Pull the pin.\r\nA: Aim the nozzle at the base of the fire.\r\nS: Squeeze the handle to release the extinguishing agent.\r\nS: Sweep the nozzle from side to side until the fire is out.\r\n\r\n2. Assess the Fire:\r\nEnsure the fire is small and manageable.\r\nNever attempt to extinguish large, uncontrollable fires—evacuate and call for help.\r\n\r\n3. Safety Precautions\r\na) Use the Right Extinguisher:\r\nNever use a water extinguisher on electrical or grease fires.\r\n\r\nb) Avoid Inhaling Smoke:\r\nStay low to the ground to minimize smoke inhalation.\r\n\r\nc) Don’t Turn Your Back on the Fire:\r\nAlways face the fire until it is fully extinguished and safe to leave.\r\n\r\nd) Know When to Stop:\r\nIf the fire doesn\'t subside within a few seconds, evacuate the area.\r\n', '../safety/fire-extinguisher.jpg', '2025-01-22 22:43:32'),
(2, 'Emergency Evacuation Plan', 'General Safety', 'Steps to evacuate during emergencies.\r\n\r\n1. Prepare Before the Trip\r\nResearch the Area:\r\na) Check weather forecasts and river conditions.\r\nb) Identify high ground or safe zones nearby.\r\nc) Be aware of flood warnings for the region.\r\n\r\n2. Plan Escape Routes:\r\na) Map out at least two evacuation routes from your campsite.\r\nb) Avoid paths that cross the river or low-lying areas.\r\n\r\n3. Pack an Emergency Kit:\r\na) Include essentials like food, water, a first aid kit, flashlight, whistle, map, and extra clothing.\r\nb) Keep the kit easily accessible at all times.\r\n\r\n4. Recognize Early Warning Signs\r\na) Flash Flood Indicators:\r\nRapidly rising water levels or a sudden increase in river debris. Distant thunder or heavy rain upstream, even if it\'s not raining at your location.\r\n\r\n5. During the Emergency\r\na) Stay Calm and Act Quickly:\r\nPanic can lead to poor decisions. Keep the group organized and focused.\r\n\r\nb) Evacuate Immediately:\r\nMove to higher ground or a pre-identified safe zone. Avoid waiting for visible water to rise—flash floods can occur in minutes.\r\n\r\nc) Follow Evacuation Routes:\r\nUse the safest and shortest route to high ground. Avoid crossing the river, even if the water seems shallow.\r\n\r\nd) Leave Non-Essential Items:\r\nTake only survival essentials to avoid slowing down the group.\r\n\r\ne) Stay Together:\r\nKeep everyone in sight and do headcounts frequently.\r\n', '../safety/evacuation.jpg', '2025-01-22 22:40:42'),
(3, 'First Aid Basics', 'Health Safety', 'Essential first aid techniques.\r\n1. Pack a First Aid Kit\r\nEnsure your kit includes:\r\nAdhesive bandages (various sizes)\r\nAntiseptic wipes and ointment\r\nSterile gauze pads and medical tape\r\nTweezers, scissors, and safety pins\r\nElastic bandages for sprains\r\nPain relievers (e.g., ibuprofen)\r\nAnti-diarrheal medication\r\nAntihistamines for allergies\r\nThermometer\r\nEmergency blanket\r\nCPR face shield\r\nSplint materials\r\nGloves (non-latex preferred)\r\n\r\n2. Assessing the Situation\r\na) Stay calm and evaluate the environment for hazards (wild animals, falling rocks, etc.).\r\nb) Check the injured person\'s breathing, pulse, and consciousness.\r\nc) If you\'re trained, perform CPR if needed and call for emergency help if possible.\r\n\r\n3. Treating Common Outdoor Injuries\r\n\r\nCuts and Scrapes:\r\na) Wash your hands and stop the bleeding by applying pressure with a clean cloth.\r\nb) Clean the wound with water and antiseptic.\r\nc) Apply a sterile dressing and secure it with tape.\r\n\r\nSprains and Strains:\r\na) Use the R.I.C.E. method (Rest, Ice, Compression, Elevation).\r\nb) Wrap the injury with an elastic bandage but avoid cutting off circulation.\r\n\r\nBlisters:\r\na) Avoid popping blisters unless they are painful.\r\nb) Cover with a bandage or moleskin to reduce friction.\r\n\r\nBurns:\r\na) For minor burns, cool the area with cold water (not ice) for 10-15 minutes.\r\nb) Cover with a clean, non-stick dressing.\r\n\r\nInsect Bites and Stings:\r\na) Remove stingers with tweezers.\r\nb) Wash the area and apply an antihistamine cream or ice pack to reduce swelling.\r\n\r\nAllergic Reactions:\r\na) Administer antihistamines for mild reactions.\r\nb) Use an EpiPen (if available) for severe reactions and seek immediate medical help.\r\n\r\nDehydration:\r\na) Encourage the person to drink small sips of water or oral rehydration solutions.\r\nb) Rest in a shaded area.\r\n\r\nHeat Exhaustion:\r\na) Move to a cooler spot and remove excess clothing.\r\nb) Provide water and cool compresses.\r\n\r\nSnake Bites:\r\na) Keep the person calm and immobilize the bitten area.\r\nb) Keep the limb below heart level and seek immediate medical help.\r\nc) Avoid sucking out venom or applying ice.\r\n', '../safety/first-aid.jpg', '2025-01-22 22:35:37');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userPwd` text NOT NULL,
  `userRoles` varchar(50) NOT NULL,
  `regDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `userName`, `userEmail`, `userPwd`, `userRoles`, `regDate`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '1', '2025-01-21'),
(2, 'user', 'user@gmail.com', '123', '2', '2025-01-21'),
(8, 'alex', 'alex@gmail.com', '123', '2', '0000-00-00'),
(9, 'budiman', 'budi@gmail.com', 'budi', '2', '2025-01-21'),
(11, 'sugeng', 'sugeng@gmail.com', '123', '2', '0000-00-00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodations`
--
ALTER TABLE `accommodations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accommodation_limit`
--
ALTER TABLE `accommodation_limit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accommodation_id` (`accommodation_id`);

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`activityID`),
  ADD KEY `activity_ibfk_1` (`accommodationID`);

--
-- Indexes for table `activity_bookings`
--
ALTER TABLE `activity_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_id` (`activity_id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blogID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accommodation_id` (`accommodation_id`);

--
-- Indexes for table `booking_amenities`
--
ALTER TABLE `booking_amenities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_amenities_ibfk_1` (`booking_id`),
  ADD KEY `booking_amenities_ibfk_2` (`amenity_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `safetyinfo`
--
ALTER TABLE `safetyinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accommodations`
--
ALTER TABLE `accommodations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `accommodation_limit`
--
ALTER TABLE `accommodation_limit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `activityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `activity_bookings`
--
ALTER TABLE `activity_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blogID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `booking_amenities`
--
ALTER TABLE `booking_amenities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `safetyinfo`
--
ALTER TABLE `safetyinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accommodation_limit`
--
ALTER TABLE `accommodation_limit`
  ADD CONSTRAINT `accommodation_limit_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodations` (`id`);

--
-- Constraints for table `activity_bookings`
--
ALTER TABLE `activity_bookings`
  ADD CONSTRAINT `activity_bookings_ibfk_1` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`activityID`);

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`);

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`accommodation_id`) REFERENCES `accommodations` (`id`);

--
-- Constraints for table `booking_amenities`
--
ALTER TABLE `booking_amenities`
  ADD CONSTRAINT `booking_amenities_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`),
  ADD CONSTRAINT `booking_amenities_ibfk_2` FOREIGN KEY (`amenity_id`) REFERENCES `amenities` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
