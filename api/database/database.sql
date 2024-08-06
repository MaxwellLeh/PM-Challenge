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
    country_name VARCHAR(100) UNIQUE NOT NULL,
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
CREATE TABLE IF NOT EXISTS Feedback (
    feedback_id SERIAL PRIMARY KEY,
    user_id INT,
    comments TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
        ON DELETE SET NULL
);


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
(3, 'Who was the first Prime Minister of India?', 'Jawaharlal Nehru', 'Mahatma Gandhi', 'Sardar Patel', 'Rajendra Prasad', 'easy'),
(3, 'Which Indian state is known for its backwaters?', 'Kerala', 'Goa', 'Tamil Nadu', 'Karnataka', 'easy'),
(3, 'What is the largest city in India by population?', 'Mumbai', 'Delhi', 'Kolkata', 'Bangalore', 'easy'),
(3, 'What is the official language of India?', 'Hindi', 'English', 'Bengali', 'Tamil', 'easy'),

(3, 'Which Indian leader is known for his role in the non-violent resistance movement?', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Subhas Chandra Bose', 'Bhagat Singh', 'medium'),
(3, 'What is the name of the Indian parliament?', 'Lok Sabha', 'Rajya Sabha', 'Vidhan Sabha', 'National Assembly', 'medium'),
(3, 'Which Indian monument is a UNESCO World Heritage Site and a symbol of love?', 'Taj Mahal', 'Qutub Minar', 'Red Fort', 'Humayun’s Tomb', 'medium'),
(3, 'In which year did India gain independence from British rule?', '1947', '1950', '1965', '1971', 'medium'),
(3, 'Which Indian state is known for its tea plantations?', 'Assam', 'West Bengal', 'Sikkim', 'Kerala', 'medium'),
(3, 'Which Indian festival involves the throwing of colored powders?', 'Holi', 'Diwali', 'Eid', 'Pongal', 'medium'),
(3, 'What is the highest civilian award given by the Indian government?', 'Bharat Ratna', 'Padma Bhushan', 'Padma Shri', 'Jnanpith Award', 'medium'),

(3, 'Which Indian scientist is known for his work on nuclear physics?', 'Dr. Homi Bhabha', 'Dr. A.P.J. Abdul Kalam', 'C.V. Raman', 'Satyendra Nath Bose', 'hard'),
(3, 'What is the name of the Indian space agency?', 'ISRO', 'NASA', 'ESA', 'JAXA', 'hard'),
(3, 'Which Indian leader played a key role in the Indian independence movement and later became the President of India?', 'Dr. Rajendra Prasad', 'Mahatma Gandhi', 'Jawaharlal Nehru', 'Sardar Patel', 'hard'),
(3, 'Which Indian epic is known for its battle of Kurukshetra?', 'Mahabharata', 'Ramayana', 'Puranas', 'Vedas', 'hard'),
(3, 'What is the official name of the Indian currency?', 'Indian Rupee', 'Dollar', 'Pound', 'Euro', 'hard'),
(3, 'Which Indian state is the largest by area?', 'Rajasthan', 'Uttar Pradesh', 'Madhya Pradesh', 'Maharashtra', 'hard'),
(3, 'Which Indian actor is known for his role in the film “Lagaan”?', 'Aamir Khan', 'Shah Rukh Khan', 'Salman Khan', 'Akshay Kumar', 'hard');

-- Questions for Egypt
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(4, 'What is the capital of Egypt?', 'Cairo', 'Alexandria', 'Giza', 'Luxor', 'easy'),
(4, 'Which river is the longest in Egypt?', 'Nile', 'Amazon', 'Yangtze', 'Mississippi', 'easy'),
(4, 'Which ancient wonder was located in Egypt?', 'Great Pyramid of Giza', 'Hanging Gardens of Babylon', 'Colossus of Rhodes', 'Statue of Zeus', 'easy'),
(4, 'What is the predominant religion in Egypt?', 'Islam', 'Christianity', 'Judaism', 'Hinduism', 'easy'),
(4, 'Which city is famous for its ancient pyramids?', 'Giza', 'Cairo', 'Alexandria', 'Aswan', 'easy'),
(4, 'What is the primary language spoken in Egypt?', 'Arabic', 'English', 'French', 'Spanish', 'easy'),
(4, 'Which pharaoh is known for the discovery of his intact tomb in 1922?', 'Tutankhamun', 'Ramses II', 'Seti I', 'Akhenaten', 'easy'),

(4, 'Which ancient Egyptian queen was known for her relationship with Julius Caesar and Mark Antony?', 'Cleopatra', 'Nefertiti', 'Hatshepsut', 'Merneith', 'medium'),
(4, 'What is the name of the Egyptian writing system using pictures and symbols?', 'Hieroglyphics', 'Cuneiform', 'Latin', 'Greek', 'medium'),
(4, 'Which Egyptian city was an important center of learning in ancient times?', 'Alexandria', 'Cairo', 'Thebes', 'Memphis', 'medium'),
(4, 'What is the name of the ancient Egyptian sun god?', 'Ra', 'Osiris', 'Horus', 'Anubis', 'medium'),
(4, 'Which historical figure led the Egyptian revolution of 1952?', 'Gamal Abdel Nasser', 'Sadat', 'Mubarak', 'Hosni', 'medium'),
(4, 'Which Egyptian monument is associated with the Sphinx?', 'Giza Plateau', 'Valley of the Kings', 'Temple of Karnak', 'Abu Simbel', 'medium'),
(4, 'Which Egyptian dynasty built the pyramids?', 'Fourth Dynasty', 'Eighteenth Dynasty', 'Twenty-sixth Dynasty', 'Twenty-first Dynasty', 'medium'),

(4, 'Which Egyptian president signed the Camp David Accords with Israel?', 'Anwar Sadat', 'Gamal Abdel Nasser', 'Hosni Mubarak', 'Mohamed Morsi', 'hard'),
(4, 'What was the ancient Egyptian name for the afterlife?', 'Duat', 'Valhalla', 'Elysium', 'Nirvana', 'hard'),
(4, 'Which Egyptian pharaoh is known for the construction of the Karnak Temple?', 'Ramses II', 'Akhenaten', 'Thutmose III', 'Seti I', 'hard'),
(4, 'Which pharaoh’s tomb was discovered by Howard Carter in 1922?', 'Tutankhamun', 'Ramses II', 'Seti I', 'Akhenaten', 'hard'),
(4, 'Which Egyptian god is depicted with the head of a jackal?', 'Anubis', 'Horus', 'Ra', 'Osiris', 'hard'),
(4, 'Which Egyptian city is known for its ancient temples and monuments?', 'Luxor', 'Aswan', 'Cairo', 'Giza', 'hard'),
(4, 'Which historical period in Egypt is known as the "New Kingdom"?', '1570–1069 BC', '2686–2181 BC', '2055–1650 BC', '1069–664 BC', 'hard');

-- Questions for Germany
INSERT INTO QuizQuestions (country_id, question_text, correct_answer, option_2, option_3, option_4, difficulty) VALUES
(5, 'What is the capital of Germany?', 'Berlin', 'Munich', 'Frankfurt', 'Hamburg', 'easy'),
(5, 'Which German composer wrote the "Moonlight Sonata"?', 'Ludwig van Beethoven', 'Johann Sebastian Bach', 'Wolfgang Amadeus Mozart', 'Richard Wagner', 'easy'),
(5, 'What is the predominant language spoken in Germany?', 'German', 'French', 'Dutch', 'English', 'easy'),
(5, 'Which famous German scientist developed the theory of relativity?', 'Albert Einstein', 'Max Planck', 'Werner Heisenberg', 'Niels Bohr', 'easy'),
(5, 'What is the name of the famous German automobile company known for its luxury cars?', 'Mercedes-Benz', 'Volkswagen', 'BMW', 'Audi', 'easy'),
(5, 'Which German city is known for its annual Oktoberfest celebration?', 'Munich', 'Berlin', 'Hamburg', 'Frankfurt', 'easy'),
(5, 'What was the capital of East Germany?', 'East Berlin', 'West Berlin', 'Hamburg', 'Dresden', 'easy'),

(5, 'Which German leader was in power during World War II?', 'Adolf Hitler', 'Otto von Bismarck', 'Wilhelm II', 'Konrad Adenauer', 'medium'),
(5, 'Which famous German philosopher wrote "Thus Spoke Zarathustra"?', 'Friedrich Nietzsche', 'Immanuel Kant', 'Georg Wilhelm Friedrich Hegel', 'Martin Heidegger', 'medium'),
(5, 'Which river is the longest in Germany?', 'Rhine', 'Danube', 'Elbe', 'Main', 'medium'),
(5, 'Which German city is known for its history of beer brewing?', 'Munich', 'Cologne', 'Dusseldorf', 'Frankfurt', 'medium'),
(5, 'Which German physicist is known for his work on quantum mechanics?', 'Max Planck', 'Albert Einstein', 'Werner Heisenberg', 'Niels Bohr', 'medium'),
(5, 'Which German car manufacturer is known for the model "Porsche 911"?', 'Porsche', 'Audi', 'BMW', 'Mercedes-Benz', 'medium'),
(5, 'Which historical event is known as the "Fall of the Berlin Wall"?', '1989', '1961', '1949', '1953', 'medium'),

(5, 'Which German leader is known for the reunification of Germany?', 'Helmut Kohl', 'Willy Brandt', 'Otto von Bismarck', 'Konrad Adenauer', 'hard'),
(5, 'Which German poet and playwright wrote "Faust"?', 'Johann Wolfgang von Goethe', 'Friedrich Schiller', 'Heinrich Heine', 'Gottfried Benn', 'hard'),
(5, 'Which German city is known for its medieval architecture and timber-framed houses?', 'Rothenburg ob der Tauber', 'Munich', 'Frankfurt', 'Hamburg', 'hard'),
(5, 'Which German philosopher is known for his concept of the "Übermensch"?', 'Friedrich Nietzsche', 'Immanuel Kant', 'Georg Wilhelm Friedrich Hegel', 'Martin Heidegger', 'hard'),
(5, 'Which German scientist is known for his work on the photoelectric effect?', 'Albert Einstein', 'Max Planck', 'Werner Heisenberg', 'Niels Bohr', 'hard'),
(5, 'Which German city is famous for its fairytale castle known as Neuschwanstein?', 'Füssen', 'Munich', 'Berlin', 'Frankfurt', 'hard'),
(5, 'Which German emperor was known for his efforts to unify Germany in the 19th century?', 'Wilhelm I', 'Wilhelm II', 'Friedrich III', 'Otto von Bismarck', 'hard');