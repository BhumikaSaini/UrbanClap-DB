USE `UrbanClap`;

LOCK TABLES `CATEGORY` WRITE;
INSERT INTO `CATEGORY` 
VALUES (1,'Plumbing'),(2,'Electrical'),(3,'Carpentry'),(4,'Home Deep Cleaning'),(5,'Sofa Cleaning'),(6,'Bathroom Deep Cleaning'),(7,'Carpet Cleaning'),(8,'Kitchen Deep Cleaning'),(9,'Pest Control'),(10,'Car Cleaning'),(11,'AC Service and Repair'),(12,'RO or Water Purifier Repair'),(13,'Washing Machine Repair'),(14,'Refrigerator Repair'),(15,'Microwave Repair'),(16,'TV Repair and Installation'),(17,'Mobile Repair'),(18,'Laptop Repair'),(19,'iPhone, iPad, Mac Repair'),(20,'Computer Repair'),(21,'Geyser/Water Heater Repair'),(22,'House Painters'),(23,'Interiors'),(24,'Furniture and Wood work'),(25,'Modular Kitchens'),(26,'Renovation'),(27,'Architect'),(28,'Bathroom Renovation'),(29,'Plans and Designs'),(30,'Vastu Shastra Consultants');
UNLOCK TABLES;

LOCK TABLES `CITY` WRITE;
INSERT INTO `CITY` VALUES (1,'Pune','Maharashtra','India'),(2,'Nagpur','Maharashtra','India'),(3,'Nashik','Maharashtra','India'),(4,'Thane','Maharashtra','India'),(5,'Kalyan','Maharashtra','India'),(6,'Dadar','Maharashtra','India'),(7,'Lonavala','Maharashtra','India'),(8,'Visakhapatnam','Andhra Pradesh','India'),(9,'Tirupati','Andhra Pradesh','India'),(10,'Chittoor','Andhra Pradesh','India'),(11,'Bengaluru','Karnataka','India'),(12,'Mysore','Karnataka','India'),(13,'Hubli','Karnataka','India'),(14,'Mangalore','Karnataka','India'),(15,'Ahmedabad','Gujarat','India'),(16,'Surat','Gujarat','India'),(17,'Vadodara','Gujarat','India'),(18,'Bhopal','Madhya Pradesh','India'),(19,'Indore','Madhya Pradesh','India'),(20,'Jabalpur','Madhya Pradesh','India'),(21,'Ujjain','Madhya Pradesh','India'),(22,'Gwalior','Madhya Pradesh','India'),(23,'Delhi','Delhi','India'),(24,'Noida','Uttar Pradesh','India'),(25,'Ghaziabad','Uttar Pradesh','India'),(26,'Faridabad','Haryana','India'),(27,'Meerut','Uttar Pradesh','India'),(28,'Sonipat','Haryana','India'),(29,'Gurgaon','Haryana','India'),(30,'Jaipur','Rajasthan','India');
UNLOCK TABLES;

LOCK TABLES `CUSTOMER` WRITE;
INSERT INTO `CUSTOMER` VALUES (1,'Aarav Acharya','M','aarav.acharya@mmail.com','1111111111','A',1),(2,'Vivaan Agarwal','M','vivaan.agarwal@mmail.com','2222222222','A',2),(3,'Aditya Khatri','M','aditya.khatri@mmail.com','3333333333','A',3),(4,'Vihaan Ahuja','M','vihaan.ahuja@mmail.com','4444444444','A',4),(5,'Arjun Anand','M','arjun.anand@mmail.com','5555555555','A',5),(6,'Reyansh Laghari','M','reyansh.laghari@mmail.com','6666666666','A',6),(7,'Muhammad Patel','M','muhammad.patel','7777777777','A',7),(8,'Sai Reddy','M','sai.reddy@mmail.com','8888888888','A',8),(9,'Arnav Bakshi','M','arnav.bakshi@mmail.com','9999999999','A',9),(10,'Ayaan Anthony','M','ayaan.anthony@mmail.com','1010101010','A',10),(11,'Ansh Burman','M','ansh.burman@mmail.com','1101101111','A',11),(12,'Kabir Bedi','M','kabir.bedi@mmail.com','1201201111','A',12),(13,'Rudra Bhatt','M','rudra.bhatt@mmail.com','1301301111','A',13),(14,'Raghav Dalal','M','raghav.dalal@mmail.com','1401401111','A',14),(15,'Mehul Chawla','M','mehul.chawla@mmail.com','1501501111','A',15),(16,'Ananya Birla','F','ananya.birla@mmail.com','1601601111','A',16),(17,'Riya Patel','F','riya.patel@mmail.com','17017011111','A',17),(18,'Diya Saxena','F','diya.saxena@mmail.com','1801801111','A',18),(19,'Ishita Patel','F','ishita.patel@mmail.com','1901901111','A',19),(20,'Kavya Sinha','F','kavya.sinha@mmail.com','2002001111','A',20),(21,'Khushi Chatterji','F','khushi.chatterji@mmail.com','2102101111','A',21),(22,'Tanvi Apte','F','tanvi.apte@mmail.com','2202201111','A',22),(23,'Radhika Sharma','F','radhika.sharma@mmail.com','2302301111','A',23),(24,'Krisha Datta','F','krisha.datta@mmail.com','2402401111','A',24),(25,'Zoya Mendes','F','zoya.mendes@mmail.com','2502501111','A',25),(26,'Akira Shamsi','F','akira.shamsi@mmail.com','2602601111','A',26),(27,'Mariya Shah','F','mariya.shah@mmail.com','2702701111','A',27),(28,'Vrunda Adhvaryu','F','vrunda.adhvaryu@mmail.com','2802801111','A',28),(29,'Anjali Vij','F','anjali.vij@mmail.com','2902901111','A',29),(30,'Kosha Prajapati','F','kosha.prajapati@mmail.com','3003001111','A',30);
UNLOCK TABLES;

LOCK TABLES `OFFER` WRITE;
UNLOCK TABLES;

LOCK TABLES `PARTNER` WRITE;
UNLOCK TABLES;

LOCK TABLES `SERVICE` WRITE;
UNLOCK TABLES;

LOCK TABLES `avails` WRITE;
UNLOCK TABLES;

LOCK TABLES `belongs_to` WRITE;
UNLOCK TABLES;

LOCK TABLES `books` WRITE;
UNLOCK TABLES;

LOCK TABLES `feedbacks` WRITE;
UNLOCK TABLES;

LOCK TABLES `proposes` WRITE;
UNLOCK TABLES;
