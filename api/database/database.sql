CREATE DATABASE Geography;

USE Geography;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    role ENUM('Student', 'Teacher') NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create QuizResults Table
CREATE TABLE QuizResults (
    result_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    country_id INT,
    student_answer TEXT NOT NULL,
    total_score INT NOT NULL,
    rank INT CHECK(rating BETWEEN 1 AND 5),
    time_taken TIME,
    FOREIGN KEY (student_id) REFERENCES Users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
        ON DELETE CASCADE,
    CHECK (role = 'Student')
);


-- Feedback Table
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    comments TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE SET NULL
);

-- Countries Table
CREATE TABLE Countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE NOT NULL,
    capital VARCHAR(100),
    continent VARCHAR(50),
    population INT,
    area INT,
    official_language VARCHAR(50)
);

-- Insert the countries into the Countries table
INSERT INTO Countries (name, capital, continent, population, area, official_language) VALUES
('USA', 'Washington, D.C.', 'North America', 331002651, 9833517, 'English'),
('UK', 'London', 'Western Europe', 67886011, 242495, 'English'),
('India', 'New Delhi', 'Asia', 1380004385, 3287263, 'Hindi, English'),
('Egypt', 'Cairo', 'Africa', 102334404, 1002450, 'Arabic');
('Germany', 'Berlin', 'Western Europe', 83783942, 357022, 'German');

-- Create the QuizQuestions table
CREATE TABLE QuizQuestions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    country_id INT REFERENCES Countries(country_id) ON DELETE CASCADE,
    student_id INT REFERENCES Users(user_id) ON DELETE CASCADE,
    question_text TEXT NOT NULL,
    correct_answer TEXT NOT NULL,
    student_answer TEXT,
    option_2 TEXT NOT NULL,
    option_3 TEXT NOT NULL,
    option_4 TEXT NOT NULL,
    difficulty VARCHAR(10) -- 'easy', 'medium', 'hard'
);


-- 21 questions: 7 easy, 7 medium, 7 hard

-- Questions for USA
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(1, 'What is the capital of the USA?', 'Washington, D.C.', 'New York City', 'Los Angeles', 'Chicago', 'easy'),
(1, 'Which river is the longest in the USA?', 'Missouri River', 'Mississippi River', 'Colorado River', 'Ohio River', 'easy'),
(1, 'Which state is known as the "Sunshine State"?', 'Florida', 'California', 'Texas', 'Hawaii', 'easy'),
(1, 'What is the national bird of the USA?', 'Bald Eagle', 'Golden Eagle', 'Turkey', 'American Robin', 'easy'),
(1, 'Which city is known as the "Big Apple"?', 'New York City', 'Los Angeles', 'Chicago', 'Miami', 'easy'),
(1, 'Which is the largest state in the USA by area?', 'Alaska', 'Texas', 'California', 'Montana', 'easy'),
(1, 'Which USA holiday celebrates the country’s independence?', 'Fourth of July', 'Thanksgiving', 'Memorial Day', 'Labor Day', 'easy'),

(1, 'Who was the first President of the USA?', 'George Washington', 'Thomas Jefferson', 'Abraham Lincoln', 'John Adams', 'medium'),
(1, 'Which war was fought between the North and South regions in the USA?', 'Civil War', 'Revolutionary War', 'World War I', 'War of 1812', 'medium'),
(1, 'Which document was signed on July 4, 1776?', 'Declaration of Independence', 'Constitution', 'Bill of Rights', 'Emancipation Proclamation', 'medium'),
(1, 'Which USA state was the last to join the union?', 'Hawaii', 'Alaska', 'Arizona', 'New Mexico', 'medium'),
(1, 'Who wrote the "Star-Spangled Banner"?', 'Francis Scott Key', 'Thomas Paine', 'James Madison', 'John Jay', 'medium'),
(1, 'What is the largest national park in the USA?', 'Wrangell-St. Elias', 'Yellowstone', 'Grand Canyon', 'Yosemite', 'medium'),
(1, 'Which USA state is known as the "Empire State"?', 'New York', 'California', 'Texas', 'Florida', 'medium'),

(1, 'Which USA President was in office during the Great Depression and World War II?', 'Franklin D. Roosevelt', 'Herbert Hoover', 'Harry S. Truman', 'Woodrow Wilson', 'hard'),
(1, 'Which USA state was purchased from Russia in 1867?', 'Alaska', 'Hawaii', 'Washington', 'Oregon', 'hard'),
(1, 'What is the smallest state in the USA by area?', 'Rhode Island', 'Delaware', 'Connecticut', 'New Jersey', 'hard'),
(1, 'Which USA battle is considered the turning point of the Civil War?', 'Battle of Gettysburg', 'Battle of Antietam', 'Battle of Bull Run', 'Battle of Fort Sumter', 'hard'),
(1, 'Which USA amendment abolished slavery?', '13th Amendment', '14th Amendment', '15th Amendment', '19th Amendment', 'hard'),
(1, 'Which USA river forms part of the border between Texas and Mexico?', 'Rio Grande', 'Mississippi River', 'Colorado River', 'Arkansas River', 'hard'),
(1, 'Which USA President issued the Emancipation Proclamation?', 'Abraham Lincoln', 'Andrew Johnson', 'Ulysses S. Grant', 'James Buchanan', 'hard');


-- Questions for UK 
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(2, 'What is the capital of the UK?', 'London', 'Manchester', 'Edinburgh', 'Birmingham', 'easy'),
(2, 'Which UK country is known as the "Land of the Red Dragon"?', 'Wales', 'Scotland', 'England', 'Northern Ireland', 'easy'),
(2, 'What is the national flower of England?', 'Rose', 'Thistle', 'Daffodil', 'Shamrock', 'easy'),
(2, 'Which British monarch had the longest reign?', 'Queen Elizabeth II', 'Queen Victoria', 'King George III', 'King Henry VIII', 'easy'),
(2, 'Which UK city is famous for its association with The Beatles?', 'Liverpool', 'Manchester', 'London', 'Birmingham', 'easy'),
(2, 'What is the name of the UK’s currency?', 'Pound Sterling', 'Euro', 'Dollar', 'Franc', 'easy'),
(2, 'Which UK country is known for the Loch Ness Monster?', 'Scotland', 'Wales', 'England', 'Northern Ireland', 'easy'),

(2, 'Which British Prime Minister served during World War II?', 'Winston Churchill', 'Neville Chamberlain', 'Clement Attlee', 'Margaret Thatcher', 'medium'),
(2, 'What is the UK’s highest mountain?', 'Ben Nevis', 'Snowdon', 'Scafell Pike', 'Slieve Donard', 'medium'),
(2, 'Which UK city is home to the oldest university?', 'Oxford', 'Cambridge', 'Edinburgh', 'St. Andrews', 'medium'),
(2, 'In which year did the Great Fire of London occur?', '1666', '1642', '1690', '1707', 'medium'),
(2, 'Who wrote the play "Hamlet"?', 'William Shakespeare', 'Christopher Marlowe', 'John Milton', 'Ben Jonson', 'medium'),
(2, 'Which London landmark is associated with the crowning of British monarchs?', 'Westminster Abbey', "St. Paul\'s Cathedral", 'The Tower of London', 'Buckingham Palace', 'medium'),
(2, 'What is the name of the river that flows through London?', 'Thames', 'Severn', 'Mersey', 'Tyne', 'medium'),

(2, 'Which UK Prime Minister was assassinated in 1812?', 'Spencer Perceval', 'Robert Peel', 'William Pitt', 'Duke of Wellington', 'hard'),
(2, 'Which English king signed the Magna Carta in 1215?', 'King John', 'King Henry II', 'King Edward I', 'King Richard I', 'hard'),
(2, 'In which year did the UK join the European Economic Community?', '1973', '1965', '1981', '1992', 'hard'),
(2, 'What is the official residence of the UK Prime Minister?', '10 Downing Street', 'Windsor Castle', 'Buckingham Palace', 'Kensington Palace', 'hard'),
(2, 'Which English king had six wives?', 'Henry VIII', 'Henry VII', 'Edward VI', 'James I', 'hard'),
(2, 'Which UK city is famous for its Georgian architecture and Roman baths?', 'Bath', 'York', 'Canterbury', 'Brighton', 'hard'),
(2, 'What is the name of the UK’s central bank?', 'Bank of England', 'Lloyds', 'HSBC', 'Barclays', 'hard');


-- Questions for India
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(3, 'What is the capital of India?', 'New Delhi', 'Mumbai', 'Kolkata', 'Chennai', 'easy'),
(3, 'Which river is considered the holiest in India?', 'Ganges', 'Yamuna', 'Narmada', 'Godavari', 'easy'),
(3, 'Which is the national animal of India?', 'Tiger', 'Elephant', 'Lion', 'Peacock', 'easy'),
(3, 'Which festival is known as the "Festival of Lights"?', 'Diwali', 'Holi', 'Eid', 'Raksha Bandhan', 'easy'),
(3, 'Which Indian city is known as the "Silicon Valley of India"?', 'Bangalore', 'Hyderabad', 'Pune', 'Chennai', 'easy'),
(3, 'Who is known as the "Father of the Nation" in India?', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Subhas Chandra Bose', 'Sardar Patel', 'easy'),
(3, 'Which is the largest state in India by area?', 'Rajasthan', 'Maharashtra', 'Uttar Pradesh', 'Madhya Pradesh', 'easy'),

(3, 'Who wrote the Indian national anthem?', 'Rabindranath Tagore', 'Bankim Chandra Chatterjee', 'Subramania Bharati', 'Sarojini Naidu', 'medium'),
(3, 'What is the official language of the Indian government?', 'Hindi', 'English', 'Bengali', 'Tamil', 'medium'),
(3, 'Which Indian scientist is known as the "Missile Man of India"?', 'APJ Abdul Kalam', 'Vikram Sarabhai', 'Homi Bhabha', 'C. V. Raman', 'medium'),
(3, 'In which year did India gain independence from British rule?', '1947', '1950', '1930', '1965', 'medium'),
(3, 'Which Indian state is known as the "Spice Garden of India"?', 'Kerala', 'Tamil Nadu', 'Goa', 'Andhra Pradesh', 'medium'),
(3, 'Which Indian classical dance form originates from Tamil Nadu?', 'Bharatanatyam', 'Kathak', 'Odissi', 'Kuchipudi', 'medium'),
(3, 'Which Mughal emperor built the Taj Mahal?', 'Shah Jahan', 'Akbar', 'Babur', 'Aurangzeb', 'medium'),

(3, 'Which ancient Indian text is considered the first work of Sanskrit literature?', 'Rigveda', 'Mahabharata', 'Ramayana', 'Upanishads', 'hard'),
(3, 'Who was the first President of independent India?', 'Dr. Rajendra Prasad', 'Dr. S. Radhakrishnan', 'Jawaharlal Nehru', 'Lal Bahadur Shastri', 'hard'),
(3, 'Which Indian mathematician is known for his contributions to the number theory?', 'Srinivasa Ramanujan', 'C. V. Raman', 'Homi Bhabha', 'Jagadish Chandra Bose', 'hard'),
(3, 'Which empire was founded by Chandragupta Maurya?', 'Maurya Empire', 'Gupta Empire', 'Mughal Empire', 'Chola Empire', 'hard'),
(3, 'Which Indian state was previously known as "Madras"?', 'Tamil Nadu', 'Kerala', 'Karnataka', 'Andhra Pradesh', 'hard'),
(3, 'Which Indian philosopher founded the Advaita Vedanta school of Hindu philosophy?', 'Adi Shankaracharya', 'Ramanuja', 'Madhvacharya', 'Vallabha', 'hard'),
(3, 'Which battle marked the beginning of British rule in India?', 'Battle of Plassey', 'Battle of Buxar', 'Battle of Panipat', 'Battle of Haldighati', 'hard');


-- Questions for Egypt
-- Questions for Egypt
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(4, 'What is the capital of Egypt?', 'Cairo', 'Alexandria', 'Giza', 'Luxor', 'easy'),
(4, 'Which river is the longest in Egypt?', 'Nile', 'Amazon', 'Mississippi', 'Yangtze', 'easy'),
(4, 'Which is the largest desert in Egypt?', 'Sahara', 'Arabian Desert', 'Libyan Desert', 'Kalahari Desert', 'easy'),
(4, 'Which ancient wonder is located in Egypt?', 'Great Pyramid of Giza', 'Hanging Gardens of Babylon', 'Statue of Zeus', 'Temple of Artemis', 'easy'),
(4, 'Which is the most widely practiced religion in Egypt?', 'Islam', 'Christianity', 'Judaism', 'Buddhism', 'easy'),
(4, 'What is the official language of Egypt?', 'Arabic', 'English', 'French', 'Berber', 'easy'),
(4, 'Which Egyptian city is known for the Valley of the Kings?', 'Luxor', 'Cairo', 'Alexandria', 'Aswan', 'easy'),

(4, 'Who was the first female pharaoh of Egypt?', 'Hatshepsut', 'Cleopatra', 'Nefertiti', 'Tawosret', 'medium'),
(4, 'What is the ancient Egyptian writing system called?', 'Hieroglyphs', 'Cuneiform', 'Latin', 'Greek', 'medium'),
(4, 'Which Egyptian ruler was known for building the most temples and statues?', 'Ramses II', 'Tutankhamun', 'Akhenaten', 'Thutmose III', 'medium'),
(4, 'In which year did Egypt gain independence from British rule?', '1922', '1914', '1936', '1945', 'medium'),
(4, 'Which modern canal connects the Mediterranean Sea to the Red Sea?', 'Suez Canal', 'Panama Canal', 'Kiel Canal', 'Corinth Canal', 'medium'),
(4, 'Who was the last ruler of the Ptolemaic Kingdom of Egypt?', 'Cleopatra', 'Ptolemy XV', 'Caesarion', 'Mark Antony', 'medium'),
(4, 'What is the ancient Egyptian symbol of life?', 'Ankh', 'Eye of Horus', 'Scarab', 'Djed', 'medium'),

(4, 'Which Egyptian pharaoh attempted to introduce monotheism?', 'Akhenaten', 'Tutankhamun', 'Ramses II', 'Thutmose III', 'hard'),
(4, 'Which battle marked the defeat of Napoleon’s forces in Egypt?', 'Battle of the Nile', 'Battle of Alexandria', 'Battle of Abukir', 'Battle of Heliopolis', 'hard'),
(4, 'Which structure is considered the oldest pyramid in Egypt?', 'Step Pyramid of Djoser', 'Great Pyramid of Giza', 'Pyramid of Khafre', 'Pyramid of Menkaure', 'hard'),
(4, 'Who was the first pharaoh of the unified Egypt?', 'Narmer', 'Khufu', 'Thutmose I', 'Amenhotep III', 'hard'),
(4, 'Which Egyptian city was known as Thebes in ancient times?', 'Luxor', 'Cairo', 'Alexandria', 'Giza', 'hard'),
(4, 'What is the name of the sun god in Egyptian mythology?', 'Ra', 'Osiris', 'Anubis', 'Horus', 'hard'),
(4, 'Which temple complex in Egypt is known for its Great Hypostyle Hall?', 'Karnak', 'Luxor', 'Abu Simbel', 'Philae', 'hard');

-- Questions for Germany
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(5, 'What is the capital of Germany?', 'Berlin', 'Munich', 'Frankfurt', 'Hamburg', 'easy'),
(5, 'Which river runs through Berlin?', 'Spree', 'Rhine', 'Elbe', 'Danube', 'easy'),
(5, 'What is the name of the famous German highway with no speed limit?', 'Autobahn', 'Autostrada', 'Route 66', 'M25', 'easy'),
(5, 'Which German city is known for its annual Oktoberfest?', 'Munich', 'Berlin', 'Hamburg', 'Frankfurt', 'easy'),
(5, 'Which German car brand is known for the slogan "The Ultimate Driving Machine"?', 'BMW', 'Mercedes-Benz', 'Audi', 'Volkswagen', 'easy'),
(5, 'Which is the largest state in Germany by area?', 'Bavaria', 'Saxony', 'Baden-Württemberg', 'Hesse', 'easy'),
(5, 'What is the national flower of Germany?', 'Cornflower', 'Rose', 'Tulip', 'Lily', 'easy'),

(5, 'Who was the first Chancellor of the German Empire?', 'Otto von Bismarck', 'Adolf Hitler', 'Angela Merkel', 'Helmut Kohl', 'medium'),
(5, 'Which German city is famous for its cathedral, one of the largest in Europe?', 'Cologne', 'Munich', 'Frankfurt', 'Berlin', 'medium'),
(5, 'What is the highest mountain in Germany?', 'Zugspitze', 'Watzmann', 'Brocken', 'Feldberg', 'medium'),
(5, 'In which year did the Berlin Wall fall?', '1989', '1990', '1987', '1991', 'medium'),
(5, 'Which composer is known as the "Father of the Symphony"?', 'Ludwig van Beethoven', 'Johann Sebastian Bach', 'Wolfgang Amadeus Mozart', 'Richard Wagner', 'medium'),
(5, 'Which treaty ended World War I for Germany?', 'Treaty of Versailles', 'Treaty of Brest-Litovsk', 'Treaty of Trianon', 'Treaty of Saint-Germain', 'medium'),
(5, 'Which German scientist developed the theory of relativity?', 'Albert Einstein', 'Max Planck', 'Werner Heisenberg', 'Johannes Kepler', 'medium'),

(5, 'Which German state was formerly a kingdom and is known for its castles?', 'Bavaria', 'Saxony', 'Prussia', 'Baden-Württemberg', 'hard'),
(5, 'Which German philosopher wrote "Critique of Pure Reason"?', 'Immanuel Kant', 'Friedrich Nietzsche', 'Karl Marx', 'Georg Hegel', 'hard'),
(5, 'Which battle marked the defeat of the Roman legions by Germanic tribes in 9 AD?', 'Battle of the Teutoburg Forest', 'Battle of Actium', 'Battle of Philippi', 'Battle of Milvian Bridge', 'hard'),
(5, 'Who was the last emperor of Germany?', 'Kaiser Wilhelm II', 'Frederick III', 'Wilhelm I', 'Ludwig III', 'hard'),
(5, 'Which German physicist is known as the father of quantum theory?', 'Max Planck', 'Werner Heisenberg', 'Albert Einstein', 'Niels Bohr', 'hard'),
(5, 'What was the name of the German air force during World War II?', 'Luftwaffe', 'Kriegsmarine', 'Wehrmacht', 'Stasi', 'hard'),
(5, 'Which German philosopher is famous for his work "The World as Will and Representation"?', 'Arthur Schopenhauer', 'Friedrich Nietzsche', 'Martin Heidegger', 'Georg Hegel', 'hard');






