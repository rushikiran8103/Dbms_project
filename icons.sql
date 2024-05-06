CREATE TABLE Users (user_id INT PRIMARY KEY, username VARCHAR(255) UNIQUE NOT NULL, email VARCHAR(255) UNIQUE NOT NULL,password_hash VARCHAR(255) NOT NULL);
CREATE TABLE Icon (icon_id INT PRIMARY KEY,name VARCHAR(255),occupation VARCHAR(255),DOB DATE,DOD DATE, biography TEXT,contributions TEXT, awards TEXT,    publications TEXT);
CREATE TABLE Publication (pub_id INT PRIMARY KEY, title VARCHAR(255), author VARCHAR(255), date DATE, description TEXT, icon_id INT, FOREIGN KEY (icon_id) REFERENCES Icon(icon_id) ON DELETE CASCADE);
CREATE TABLE UserInteraction (int_id INT PRIMARY KEY, user_id INT, icon_id INT,    interaction_type VARCHAR(255), interaction_date DATE, FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE, FOREIGN KEY (icon_id) REFERENCES Icon(icon_id) ON DELETE CASCADE );
CREATE TABLE SearchFilter (filter_id INT PRIMARY KEY, user_id INT, filter_settings TEXT,   FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE);
CREATE TABLE Awards (award_id INT PRIMARY KEY, icon_id INT, name VARCHAR(255), description TEXT, FOREIGN KEY (icon_id) REFERENCES Icon(icon_id) ON DELETE CASCADE);


INSERT INTO Users (user_id, username, email, password_hash) 
VALUES 
(101, 'tommy', 'tommy@gmail.com', 'password123'),
(102, 'richard', 'richard@gmail.com', 'password456'),
(103, 'jameson', 'jameson@gmail.com', 'password789'),
(104, 'jack', 'jack@gmail.com', 'passwordabc'),
(105, 'jimmy', 'jimmy@gmail.com', 'passworddef'),
(106, 'samantha', 'samantha@gmail.com', 'passwordghi'),
(107, 'kenny', 'kenny@gmail.com', 'passwordjkl'),
(108, 'april', 'april@gmail.com', 'passwordmno'),
(109, 'shelby', 'shelby@gmail.com', 'passwordpqr'),
(110, 'jessy', 'jessy@gmail.com', 'passwordstu');

INSERT INTO Icon (icon_id, name, occupation, DOB, DOD, biography, contributions, awards, publications)
VALUES 
(211, 'Grace Hopper', 'Computer Scientist', '1906-12-09', '1992-01-01', 'Grace Hopper was a pioneering computer scientist known for her work on the development of the COBOL programming language and her contributions to computer programming.', 'She developed the first compiler for a programming language and was instrumental in the development of early computers such as the UNIVAC I.', 'Presidential Medal of Freedom, National Medal of Technology, IEEE Emanuel R. Piore Award', '"The Science of Programming" (1968), "Understanding Computers" (1984)'),
(212, 'Alan Turing', 'Computer Scientist', '1912-06-23', '1954-06-07', 'Alan Turing was a mathematician and computer scientist known for his groundbreaking work in artificial intelligence and cryptography. He played a crucial role in breaking the German Enigma code during World War II.', 'Turing is considered the father of theoretical computer science and artificial intelligence. He introduced the concept of the Turing machine, which laid the foundation for modern computing.', 'Order of the British Empire (OBE)', '"On Computable Numbers, with an Application to the Entscheidungsproblem" (1936), "Computing Machinery and Intelligence" (1950)'),
(213, 'Ada Lovelace', 'Mathematician and Writer', '1815-12-10', '1852-11-27', 'Ada Lovelace, often regarded as the first computer programmer, was a mathematician and writer. She worked with Charles Babbage on his mechanical general-purpose computer, the Analytical Engine.', 'Lovelace wrote the first algorithm intended to be processed by a machine, making her the worlds first computer programmer.', 'None', 'Notes on the Analytical Engine (1843)'),
(214, 'Donald Knuth', 'Computer Scientist', '1938-01-10', NULL, 'Donald Knuth is a computer scientist and professor emeritus at Stanford University. He is known for his work in algorithms, complexity theory, and the authorship of "The Art of Computer Programming."', 'Knuth s multivolume work "The Art of Computer Programming" is considered one of the most influential books in the field of computer science.', 'Turing Award, National Medal of Science', '"The Art of Computer Programming" (1968-present), "Concrete Mathematics" (1989)'),
(215, 'Tim Berners-Lee', 'Computer Scientist', '1955-06-08', NULL, 'Tim Berners-Lee, an English computer scientist, is best known as the inventor of the World Wide Web. He developed the first web browser and editor (WorldWideWeb and the first web server, CERN httpd), which laid the foundation for the modern internet.', 'Berners-Lees invention revolutionized communication and information sharing, leading to the democratization of knowledge and the rise of the digital age.', 'Knight Commander of the Order of the British Empire (KBE), Turing Award, Queen Elizabeth Prize for Engineering', '"Weaving the Web: The Original Design and Ultimate Destiny of the World Wide Web" (1999)'),
(216, 'Vint Cerf', 'Computer Scientist', '1943-06-23', NULL, 'Vint Cerf, an American computer scientist, is often referred to as one of the "fathers of the internet." He co-designed the TCP/IP protocols and the architecture of the internet.', 'Cerfs work on the TCP/IP protocols was instrumental in the development and expansion of the internet, enabling global communication and connectivity.', 'Turing Award, Presidential Medal of Freedom, National Medal of Technology', '"Internet Architecture and Philosophy" (2000), "Cerfs Up: Surfing the Internet with Vint Cerf" (2012)'),
(217, 'Guido van Rossum', 'Computer Scientist', '1956-01-31', NULL, 'Guido van Rossum, a Dutch computer programmer, is best known as the creator of the Python programming language. He designed Python with a focus on simplicity and readability.', 'Van Rossums creation of Python has had a profound impact on software development, enabling rapid prototyping, automation, and data analysis.', 'Nominated for the ACM A.M. Turing Award', '"The Zen of Python" (PEP 20), "Python Tutorial" (Official Python Documentation)'),
(218, 'Linus Torvalds', 'Software Engineer', '1969-12-28', NULL, 'Linus Torvalds, a Finnish-American software engineer, is the creator of the Linux kernel, the core component of the Linux operating system.', 'Torvalds development of Linux has led to the widespread adoption of open-source software and has been fundamental to the growth of the internet and cloud computing.', 'Millennium Technology Prize, IEEE Computer Society Computer Pioneer Award', '"Just for Fun: The Story of an Accidental Revolutionary" (2001)'),
(219, 'John McCarthy', 'Computer Scientist', '1927-09-04', '2011-10-24', 'John McCarthy was an American computer scientist known for his pioneering work in artificial intelligence. He coined the term "artificial intelligence" and developed the Lisp programming language.', 'McCarthys research laid the foundation for many AI techniques, including symbolic reasoning, knowledge representation, and problem-solving.', 'Turing Award, Kyoto Prize, National Medal of Science', '"LISP 1.5 Programmers Manual" (1962), "Formalizing Common Sense" (1990)'),
(220, 'Charles Babbage', 'Mathematician, Philosopher, Inventor', '1791-12-26', '1871-10-18', 'Charles Babbage was an English polymath. A mathematician, philosopher, inventor, and mechanical engineer, Babbage originated the concept of a digital programmable computer.', 'Babbage s designs laid the foundation for modern computers. Although his Analytical Engine was never completed, it contained many essential concepts of modern computing.', 'None', '"On the Economy of Machinery and Manufactures" (1832), "Reflections on the Decline of Science in England" (1830)');


INSERT INTO Publication (pub_id, title, author, date, description, icon_id)
VALUES 
(311, 'The Science of Programming', 'Grace Hopper', '1968-01-01', 'A seminal work in the field of computer science, exploring the principles of programming.', 211),
(312, 'Understanding Computers', 'Grace Hopper', '1984-03-15', 'An accessible introduction to computers and their applications, written by a pioneer in the field.', 211),
(313, 'On Computable Numbers, with an Application to the Entscheidungsproblem', 'Alan Turing', '1936-01-01', 'Turings landmark paper introducing the concept of computability and the Turing machine.', 212),
(314, 'Computing Machinery and Intelligence', 'Alan Turing', '1950-01-01', 'A seminal paper exploring the question of whether machines can think, laying the groundwork for the field of artificial intelligence.', 212),
(315, 'Notes on the Analytical Engine', 'Ada Lovelace', '1843-01-01', 'Lovelaces historic notes on Charles Babbages Analytical Engine, containing the first computer algorithm.', 213),
(316, 'The Art of Computer Programming', 'Donald Knuth', '1968-01-01', 'A comprehensive multi-volume series on computer algorithms and programming techniques.', 214),
(317, 'Concrete Mathematics', 'Donald Knuth', '1989-01-01', 'A foundational text on mathematical techniques used in computer science, co-authored by Donald Knuth.', 214),
(318, 'Weaving the Web: The Original Design and Ultimate Destiny of the World Wide Web', 'Tim Berners-Lee', '1999-01-01', 'An insiders account of the invention and evolution of the World Wide Web by its creator.', 215),
(319, 'Internet Architecture and Philosophy', 'Vint Cerf', '2000-01-01', 'An exploration of the philosophical underpinnings of the internets architecture and development.', 216),
(320, 'Just for Fun: The Story of an Accidental Revolutionary', 'Linus Torvalds', '2001-01-01', 'Linus Torvalds candid memoir recounting the creation and impact of the Linux operating system.', 218);


INSERT INTO UserInteraction (int_id, user_id, icon_id, interaction_type, interaction_date)
VALUES 
(411, 101, 211, 'like', '2024-01-01'),
(412, 102, 212, 'comment', '2024-01-02'),
(413, 103, 213, 'like', '2024-01-03'),
(414, 104, 214, 'comment', '2024-01-04'),
(415, 105, 215, 'like', '2024-01-05'),
(416, 106, 216, 'comment', '2024-01-06'),
(417, 107, 217, 'like', '2024-01-07'),
(418, 108, 218, 'comment', '2024-01-08'),
(419, 109, 219, 'like', '2024-01-09'),
(420, 110, 220, 'comment', '2024-01-10');


INSERT INTO SearchFilter (filter_id, user_id, filter_settings)
VALUES 
(521, 101, '{"category": "Computer Scientist", "language": "English", "country": "United States", "specialization": "Computer Programming"}'),
(522, 102, '{"category": "Computer Scientist", "language": "English", "country": "United Kingdom", "specialization": "Artificial Intelligence"}'),
(523, 103, '{"category": "Mathematician and Writer", "language": "English", "country": "United Kingdom", "specialization": "Analytical Engine"}'),
(524, 104, '{"category": "Computer Scientist", "language": "English", "country": "United States", "specialization": "Algorithms"}'),
(525, 105, '{"category": "Computer Scientist", "language": "English", "country": "United Kingdom", "specialization": "World Wide Web"}'),
(526, 106, '{"category": "Computer Scientist", "language": "English", "country": "United States", "specialization": "Internet Protocols"}'),
(527, 107, '{"category": "Computer Scientist", "language": "Dutch", "country": "Netherlands", "specialization": "Programming Language"}'),
(528, 108, '{"category": "Software Engineer", "language": "English", "country": "United States", "specialization": "Operating Systems"}'),
(529, 109, '{"category": "Computer Scientist", "language": "English", "country": "United States", "specialization": "Artificial Intelligence"}'),
(530, 110, '{"category": "Mathematician, Philosopher, Inventor", "language": "English", "country": "United Kingdom", "specialization": "Analytical Engine"}');


INSERT INTO Awards (award_id, icon_id, name, description)
VALUES 
(1, 211, 'Presidential Medal of Freedom', 'The Presidential Medal of Freedom is the highest civilian award in the United States, bestowed by the President to individuals who have made exceptional contributions to the security or national interests of America, to world peace, or to cultural or other significant public or private endeavors.'),
(2, 211, 'National Medal of Technology', 'The National Medal of Technology and Innovation is the highest honor for technological achievement bestowed by the President of the United States on leading innovators.'),
(3, 211, 'IEEE Emanuel R. Piore Award', 'The IEEE Emanuel R. Piore Award is presented to individuals for outstanding contributions to information processing systems.'),
(4, 212, 'Order of the British Empire (OBE)', 'The Order of the British Empire is a British order of chivalry, rewarding contributions to the arts and sciences, work with charitable and welfare organizations, and public service.'),
(5, 214, 'Turing Award', 'The Turing Award is an annual prize given by the Association for Computing Machinery (ACM) to individuals who have made lasting contributions to the field of computer science.'),
(6, 214, 'National Medal of Science', 'The National Medal of Science is an honor bestowed by the President of the United States to individuals in science and engineering who have made important contributions to the advancement of knowledge in the fields of behavioral and social sciences, biology, chemistry, engineering, mathematics, and physics.'),
(7, 215, 'Knight Commander of the Order of the British Empire (KBE)', 'The Knight Commander of the Order of the British Empire is a grade within the British order of chivalry, rewarding contributions to the arts and sciences, work with charitable and welfare organizations, and public service.'),
(8, 215, 'Turing Award', 'The Turing Award is an annual prize given by the Association for Computing Machinery (ACM) to individuals who have made lasting contributions to the field of computer science.'),
(9, 215, 'Queen Elizabeth Prize for Engineering', 'The Queen Elizabeth Prize for Engineering is a global engineering prize that celebrates the achievements of some of the world’s most pioneering engineers.'),
(10, 216, 'Turing Award', 'The Turing Award is an annual prize given by the Association for Computing Machinery (ACM) to individuals who have made lasting contributions to the field of computer science.'),
(11, 216, 'Presidential Medal of Freedom', 'The Presidential Medal of Freedom is the highest civilian award in the United States, bestowed by the President to individuals who have made exceptional contributions to the security or national interests of America, to world peace, or to cultural or other significant public or private endeavors.'),
(12, 216, 'National Medal of Technology', 'The National Medal of Technology and Innovation is the highest honor for technological achievement bestowed by the President of the United States on leading innovators.'),
(13, 217, 'Nominated for the ACM A.M. Turing Award', 'Nominated for the ACM A.M. Turing Award.'),
(14, 218, 'Millennium Technology Prize', 'The Millennium Technology Prize is one of the world’s largest technology prizes. It is awarded for groundbreaking technological innovations that benefit millions of people around the world.'),
(15, 218, 'IEEE Computer Society Computer Pioneer Award', 'The IEEE Computer Society Computer Pioneer Award is given to those individuals whose efforts resulted in the creation and continued vitality of the computer industry.'),
(16, 219, 'Turing Award', 'The Turing Award is an annual prize given by the Association for Computing Machinery (ACM) to individuals who have made lasting contributions to the field of computer science.'),
(17, 219, 'Kyoto Prize', 'The Kyoto Prize is an international award to honor those who have contributed significantly to the scientific, cultural, and spiritual betterment of mankind.'),
(18, 219, 'National Medal of Science', 'The National Medal of Science is an honor bestowed by the President of the United States to individuals in science and engineering who have made important contributions to the advancement of knowledge in the fields of behavioral and social sciences, biology, chemistry, engineering, mathematics, and physics.');
