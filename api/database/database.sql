DROP TABLE IF EXISTS QuizResults;
DROP TABLE IF EXISTS Feedback;
DROP TABLE IF EXISTS QuizQuestions;
DROP TABLE IF EXISTS Countries;
DROP TABLE IF EXISTS Users;
 
CREATE TABLE IF NOT EXISTS Users (
    user_id SERIAL PRIMARY KEY,
    role VARCHAR(50) CHECK (role IN ('Student', 'Teacher')) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
-- Countries Table
CREATE TABLE IF NOT EXISTS Countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    capital VARCHAR(100),
    continent VARCHAR(50),
    population INT,
    area INT,
    official_language VARCHAR(50)
);
 
-- QuizResults
CREATE TABLE IF NOT EXISTS QuizResults (
    result_id SERIAL PRIMARY KEY,
    student_id INT,
    country_id INT,
    student_answer TEXT NOT NULL,
    total_score INT NOT NULL,
    rank INT CHECK(rank BETWEEN 1 AND 5),
    time_taken TIME,
    FOREIGN KEY (student_id) REFERENCES Users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (country_id) REFERENCES Countries(country_id)
        ON DELETE CASCADE
);
 
 
-- Feedback Table
CREATE TABLE Feedback (
    feedback_id SERIAL PRIMARY KEY,
    role VARCHAR(50) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    improvements TEXT,
    additional_comments TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
 
-- Insert dummy users into the Users table
INSERT INTO Users (role, first_name, last_name, email, username, password) VALUES
('Student', 'Alice', 'Smith', 'alice.smith@example.com', 'alice_smith', 'password123'),
('Student', 'Bob', 'Johnson', 'bob.johnson@example.com', 'bob_johnson', 'password456'),
('Student', 'Charlie', 'Williams', 'charlie.williams@example.com', 'charlie_williams', 'password789'),
('Teacher', 'David', 'Brown', 'david.brown@example.com', 'david_brown', 'teacherpass1'),
('Teacher', 'Eva', 'Jones', 'eva.jones@example.com', 'eva_jones', 'teacherpass2'),
('Teacher', 'Frank', 'Garcia', 'frank.garcia@example.com', 'frank_garcia', 'teacherpass3');
 
 
-- Insert the countries into the Countries table
INSERT INTO Countries (country_name, capital, continent, population, area, official_language) VALUES
('USA', 'Washington, D.C.', 'North America', 331002651, 9833517, 'English'),
('UK', 'London', 'Western Europe', 67886011, 242495, 'English'),
('India', 'New Delhi', 'Asia', 1380004385, 3287263, 'Hindi, English'),
('Egypt', 'Cairo', 'Africa', 102334404, 1002450, 'Arabic'),
('Germany', 'Berlin', 'Western Europe', 83783942, 357022, 'German');
 
 
-- Create the QuizQuestions table
CREATE TABLE IF NOT EXISTS QuizQuestions (
    question_id SERIAL PRIMARY KEY,
    country_id INT REFERENCES Countries(country_id) ON DELETE CASCADE,
    question_text TEXT NOT NULL,
    correct_answer TEXT NOT NULL,
    option_2 TEXT NOT NULL,
    option_3 TEXT NOT NULL,
    option_4 TEXT NOT NULL,
    difficulty VARCHAR(10) -- 'easy', 'medium', 'hard'
);
 
 
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
(2, 'Which London landmark is associated with the crowning of British monarchs?', 'Westminster Abbey', 'Buckingham Palace', 'The Tower of London', 'St. Paul’s Cathedral', 'medium'),
(2, 'Which UK war was fought between 1337 and 1453?', 'Hundred Years’ War', 'War of the Roses', 'English Civil War', 'Napoleonic Wars', 'medium'),
 
(2, 'What was the last British colony to gain independence?', 'Hong Kong', 'Singapore', 'Cyprus', 'Jamaica', 'hard'),
(2, 'Which UK Prime Minister served during the Falklands War?', 'Margaret Thatcher', 'James Callaghan', 'Tony Blair', 'John Major', 'hard'),
(2, 'What was the name of the ship that famously sank in 1912?', 'Titanic', 'Lusitania', 'Britannic', 'Olympic', 'hard'),
(2, 'Which UK Prime Minister was known for the “Iron Curtain” speech?', 'Winston Churchill', 'Clement Attlee', 'Neville Chamberlain', 'Harold Macmillan', 'hard'),
(2, 'Which UK city was the site of the 2012 Summer Olympics?', 'London', 'Manchester', 'Glasgow', 'Birmingham', 'hard'),
(2, 'Which British scientist is known for the theory of evolution?', 'Charles Darwin', 'Isaac Newton', 'Michael Faraday', 'James Clerk Maxwell', 'hard'),
(2, 'Which UK artist painted "The Persistence of Memory"?', 'Salvador Dalí', 'David Hockney', 'Francis Bacon', 'J.M.W. Turner', 'hard');
 
-- Questions for India
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(3, 'What is the capital of India?', 'New Delhi', 'Mumbai', 'Kolkata', 'Chennai', 'easy'),
(3, 'Which river is considered the holiest in Hinduism?', 'Ganges', 'Yamuna', 'Indus', 'Brahmaputra', 'easy'),
(3, 'Which Indian festival is known as the "Festival of Lights"?', 'Diwali', 'Holi', 'Navratri', 'Eid', 'easy'),
(3, 'Who was the first Prime Minister of India?', 'Jawaharlal Nehru', 'Mahatma Gandhi', 'Sardar Patel', 'Indira Gandhi', 'easy'),
(3, 'What is the national language of India?', 'Hindi', 'English', 'Bengali', 'Tamil', 'easy'),
(3, 'Which city is known as the "Pink City" in India?', 'Jaipur', 'Delhi', 'Mumbai', 'Bangalore', 'easy'),
(3, 'Which Indian leader is known for his role in the Indian independence movement?', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Subhas Chandra Bose', 'Bhagat Singh', 'easy'),
 
(3, 'Which Indian state is the largest by area?', 'Rajasthan', 'Uttar Pradesh', 'Maharashtra', 'Tamil Nadu', 'medium'),
(3, 'Which Indian emperor is known for his contributions to art and architecture?', 'Ashoka', 'Akbar', 'Shivaji', 'Aurangzeb', 'medium'),
(3, 'What is the largest desert in India?', 'Thar Desert', 'Rann of Kutch', 'Ladakh Desert', 'Great Indian Desert', 'medium'),
(3, 'Which Indian festival is celebrated to mark the end of the harvest season?', 'Pongal', 'Diwali', 'Holi', 'Onam', 'medium'),
(3, 'Which Indian city is known as the "Silicon Valley of India"?', 'Bangalore', 'Hyderabad', 'Chennai', 'Pune', 'medium'),
(3, 'What is the national sport of India?', 'Hockey', 'Cricket', 'Football', 'Badminton', 'medium'),
(3, 'Which Mughal emperor built the Taj Mahal?', 'Shah Jahan', 'Akbar', 'Babur', 'Aurangzeb', 'medium'),
 
(3, 'Who is known as the "Father of the Indian Nation"?', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Subhas Chandra Bose', 'Sardar Patel', 'hard'),
(3, 'Which Indian Prime Minister declared the Emergency in 1975?', 'Indira Gandhi', 'Rajiv Gandhi', 'Jawaharlal Nehru', 'Atal Bihari Vajpayee', 'hard'),
(3, 'Which Indian scientist won the Nobel Prize for Physics in 1930?', 'C.V. Raman', 'Homi Bhabha', 'Satyendra Nath Bose', 'Dr. A.P.J. Abdul Kalam', 'hard'),
(3, 'Which Indian state has the highest literacy rate?', 'Kerala', 'Goa', 'Tamil Nadu', 'Maharashtra', 'hard'),
(3, 'What is the name of the Indian parliament building?', 'Rashtrapati Bhavan', 'Lok Sabha', 'Rajya Sabha', 'Parliament House', 'hard'),
(3, 'Who wrote the Indian national anthem "Jana Gana Mana"?', 'Rabindranath Tagore', 'Bankim Chandra Chattopadhyay', 'Subhas Chandra Bose', 'Kavi Pradeep', 'hard'),
(3, 'Which Indian city is known as the "City of Joy"?', 'Kolkata', 'Mumbai', 'Delhi', 'Chennai', 'hard');
 
-- Questions for Egypt
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(4, 'What is the capital of Egypt?', 'Cairo', 'Alexandria', 'Giza', 'Luxor', 'easy'),
(4, 'Which river flows through Egypt?', 'Nile', 'Amazon', 'Yangtze', 'Mississippi', 'easy'),
(4, 'Which ancient wonder was located in Egypt?', 'Great Pyramid of Giza', 'Hanging Gardens of Babylon', 'Statue of Zeus', 'Colossus of Rhodes', 'easy'),
(4, 'Who was the famous female pharaoh of Egypt?', 'Cleopatra', 'Nefertiti', 'Hatshepsut', 'Tiy', 'easy'),
(4, 'What is the primary language spoken in Egypt?', 'Arabic', 'English', 'French', 'Spanish', 'easy'),
(4, 'Which city is known for its ancient pyramids and the Sphinx?', 'Giza', 'Cairo', 'Luxor', 'Aswan', 'easy'),
(4, 'Which Egyptian god is associated with the sun?', 'Ra', 'Osiris', 'Horus', 'Anubis', 'easy'),
 
(4, 'Which Egyptian leader was known for his peace treaty with Israel?', 'Anwar Sadat', 'Gamal Abdel Nasser', 'Hosni Mubarak', 'Mohammed Morsi', 'medium'),
(4, 'In which period did the Ptolemaic Dynasty rule Egypt?', 'Hellenistic Period', 'Old Kingdom', 'Middle Kingdom', 'New Kingdom', 'medium'),
(4, 'What is the name of the famous ancient library located in Alexandria?', 'Library of Alexandria', 'Library of Ashurbanipal', 'Library of Pergamum', 'Library of Ephesus', 'medium'),
(4, 'Which Egyptian monument is known for its colossal statues of Ramses II?', 'Abu Simbel', 'Karnak', 'Valley of the Kings', 'Temple of Horus', 'medium'),
(4, 'What is the main type of economy in Egypt?', 'Agricultural', 'Industrial', 'Service', 'Technology', 'medium'),
(4, 'Which Egyptian goddess was depicted as a lioness?', 'Sekhmet', 'Isis', 'Bastet', 'Hathor', 'medium'),
(4, 'Which event marked the beginning of modern Egypt’s history?', 'Egyptian Revolution of 1952', 'Suez Crisis', 'Napoleon’s Campaign in Egypt', 'British Occupation of Egypt', 'medium'),
 
(4, 'Which Pharaoh is known for the discovery of his nearly intact tomb in 1922?', 'Tutankhamun', 'Ramses II', 'Akhenaten', 'Seti I', 'hard'),
(4, 'Which Egyptian leader was known for his role in the Egyptian Revolution of 2011?', 'Hosni Mubarak', 'Mohammed Morsi', 'Anwar Sadat', 'Gamal Abdel Nasser', 'hard'),
(4, 'Which city is considered the center of Egypt’s ancient civilization?', 'Thebes', 'Cairo', 'Alexandria', 'Giza', 'hard'),
(4, 'What was the primary purpose of the pyramids in ancient Egypt?', 'Tombs for pharaohs', 'Religious temples', 'Astronomical observatories', 'Trade centers', 'hard'),
(4, 'Which Egyptian monument is known for its unique half-man, half-lion sculpture?', 'The Sphinx', 'The Colossus of Rhodes', 'The Statue of Zeus', 'The Colossus of Memnon', 'hard'),
(4, 'What ancient Egyptian writing system used pictograms?', 'Hieroglyphics', 'Cuneiform', 'Runes', 'Latin Script', 'hard'),
(4, 'Which Egyptian deity was considered the god of the underworld?', 'Osiris', 'Ra', 'Horus', 'Anubis', 'hard');
 
-- Questions for Germany
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(5, 'What is the capital of Germany?', 'Berlin', 'Munich', 'Frankfurt', 'Hamburg', 'easy'),
(5, 'Which river flows through Germany’s capital?', 'Spree', 'Rhine', 'Danube', 'Elbe', 'easy'),
(5, 'Which German composer is known for his Ninth Symphony?', 'Ludwig van Beethoven', 'Johann Sebastian Bach', 'Richard Wagner', 'Wolfgang Amadeus Mozart', 'easy'),
(5, 'What is the name of the famous German car manufacturer known for the "Beetle"?', 'Volkswagen', 'BMW', 'Mercedes-Benz', 'Audi', 'easy'),
(5, 'Which German city is famous for its Oktoberfest?', 'Munich', 'Berlin', 'Hamburg', 'Frankfurt', 'easy'),
(5, 'Which historical event led to the division of Germany into East and West?', 'Cold War', 'World War I', 'World War II', 'German Revolution', 'easy'),
(5, 'Who was the leader of Nazi Germany during World War II?', 'Adolf Hitler', 'Wilhelm II', 'Otto von Bismarck', 'Paul von Hindenburg', 'easy'),
 
(5, 'Which German physicist developed the theory of relativity?', 'Albert Einstein', 'Max Planck', 'Werner Heisenberg', 'Niels Bohr', 'medium'),
(5, 'Which German city is known for its Brandenburg Gate?', 'Berlin', 'Cologne', 'Dresden', 'Leipzig', 'medium'),
(5, 'In which year did the Berlin Wall fall?', '1989', '1961', '1975', '1991', 'medium'),
(5, 'What is the name of the German parliament building?', 'Reichstag', 'Bundestag', 'Bundesrat', 'Kaiser Wilhelm Memorial Church', 'medium'),
(5, 'Which famous German philosopher wrote "Thus Spoke Zarathustra"?', 'Friedrich Nietzsche', 'Immanuel Kant', 'Georg Wilhelm Friedrich Hegel', 'Karl Marx', 'medium'),
(5, 'What was the main cause of the German economic crisis in the 1920s?', 'Hyperinflation', 'Stock Market Crash', 'Great Depression', 'World War I', 'medium'),
(5, 'Which German city is known for its medieval architecture and its Old Town?', 'Nuremberg', 'Hamburg', 'Munich', 'Berlin', 'medium'),
 
(5, 'Which German leader was known for his policy of appeasement in the 1930s?', 'Adolf Hitler', 'Kaiser Wilhelm II', 'Otto von Bismarck', 'Paul von Hindenburg', 'hard'),
(5, 'Which German physicist was awarded the Nobel Prize for his work on quantum mechanics?', 'Werner Heisenberg', 'Albert Einstein', 'Max Planck', 'Erwin Schrödinger', 'hard'),
(5, 'Which city was the capital of West Germany during the Cold War?', 'Bonn', 'Berlin', 'Frankfurt', 'Hamburg', 'hard'),
(5, 'Who was the first Chancellor of unified Germany?', 'Helmut Kohl', 'Konrad Adenauer', 'Gerhard Schröder', 'Willy Brandt', 'hard'),
(5, 'Which German film director is known for his work on "Metropolis" and "M"?', 'Fritz Lang', 'Werner Herzog', 'Rainer Werner Fassbinder', 'Wim Wenders', 'hard'),
(5, 'What is the name of the German national football team’s stadium?', 'Allianz Arena', 'Olympiastadion', 'Volkswagen Arena', 'Signal Iduna Park', 'hard'),
(5, 'Which German composer is known for his opera "The Ring Cycle"?', 'Richard Wagner', 'Johann Sebastian Bach', 'Ludwig van Beethoven', 'Wolfgang Amadeus Mozart', 'hard');
 
 
-- Insert data into QuizResults table
INSERT INTO QuizResults (student_id, country_id, student_answer, total_score, rank, time_taken) VALUES
(1, 1, 'Washington, D.C.', 10, 1, '00:05:23'),
(1, 1, 'Missouri River', 8, 2, '00:08:15'),
(2, 2, 'London', 10, 1, '00:06:30'),
(2, 2, 'Wales', 9, 2, '00:07:20');