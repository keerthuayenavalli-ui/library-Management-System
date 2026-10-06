CREATE DATABASE LibraryManagement;
USE LibraryManagement;
-- category table
CREATE TABLE Category (
    category_id CHAR(6) PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);
-- author table
CREATE TABLE Author (
    author_id CHAR(5) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    nationality VARCHAR(50)
);
-- publisher table
CREATE TABLE Publisher (
    publisher_id CHAR(6) PRIMARY KEY,
    publisher_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(15)
);
-- student table
CREATE TABLE Student (
    student_id CHAR(5) PRIMARY KEY,
    roll_no VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    course VARCHAR(30) NOT NULL,
    department VARCHAR(50) NOT NULL,
    year TINYINT UNSIGNED NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) UNIQUE
);
-- librarian table
CREATE TABLE Librarian (
    librarian_id CHAR(6) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
-- book table
CREATE TABLE Book (
    book_id CHAR(5) PRIMARY KEY,

    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) NOT NULL UNIQUE,
    edition VARCHAR(20),
    publication_year YEAR,

    quantity INT UNSIGNED NOT NULL DEFAULT 1,
    available_quantity INT UNSIGNED NOT NULL DEFAULT 1,

    category_id CHAR(6) NOT NULL,
    author_id CHAR(5) NOT NULL,
    publisher_id CHAR(6) NOT NULL,

    CONSTRAINT fk_book_category
        FOREIGN KEY (category_id)
        REFERENCES Category(category_id),

    CONSTRAINT fk_book_author
        FOREIGN KEY (author_id)
        REFERENCES Author(author_id),

    CONSTRAINT fk_book_publisher
        FOREIGN KEY (publisher_id)
        REFERENCES Publisher(publisher_id)
);
-- issue table
CREATE TABLE Issue (
    issue_id CHAR(5) PRIMARY KEY,

    student_id CHAR(5) NOT NULL,
    book_id CHAR(5) NOT NULL,
    librarian_id CHAR(6) NOT NULL,

    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,

    status ENUM('Issued','Returned','Overdue')
    NOT NULL DEFAULT 'Issued',

    CONSTRAINT fk_issue_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    CONSTRAINT fk_issue_book
        FOREIGN KEY (book_id)
        REFERENCES Book(book_id),

    CONSTRAINT fk_issue_librarian
        FOREIGN KEY (librarian_id)
        REFERENCES Librarian(librarian_id)
);
-- return table
CREATE TABLE ReturnBook (
    return_id CHAR(5) PRIMARY KEY,

    issue_id CHAR(5) NOT NULL,

    return_date DATE NOT NULL,

    fine_amount DECIMAL(8,2) DEFAULT 0.00,

    CONSTRAINT fk_return_issue
        FOREIGN KEY (issue_id)
        REFERENCES Issue(issue_id)
);
show tables;
describe category;
describe author;
DESCRIBE Publisher;
DESCRIBE Student;
DESCRIBE Librarian;
DESCRIBE Book;
DESCRIBE Issue;
DESCRIBE ReturnBook;
INSERT INTO Category
(category_id, category_name, description)
VALUES
('CATCS','Computer Science','Programming and Software Development'),
('CATDB','Database','Database Management and SQL'),
('CATAI','Artificial Intelligence','AI and Machine Learning'),
('CATDS','Data Science','Data Analysis and Visualization'),
('CATNW','Networking','Computer Networks'),
('CATCY','Cyber Security','Security and Ethical Hacking'),
('CATOS','Operating Systems','Operating System Concepts'),
('CATMT','Mathematics','Engineering Mathematics'),
('CATEC','Electronics','Electronics and Communication'),
('CATGK','General Knowledge','General Knowledge and Competitive Exams');
INSERT INTO Author
(author_id, full_name, nationality)
VALUES
('AU001','Abraham Silberschatz','USA'),
('AU002','Henry F. Korth','USA'),
('AU003','S. Sudarshan','India'),
('AU004','Thomas H. Cormen','USA'),
('AU005','Charles E. Leiserson','USA'),
('AU006','Ronald L. Rivest','USA'),
('AU007','Clifford Stein','USA'),
('AU008','Robert C. Martin','USA'),
('AU009','Bjarne Stroustrup','Denmark'),
('AU010','Herbert Schildt','USA'),
('AU011','Andrew S. Tanenbaum','Netherlands'),
('AU012','Behrouz A. Forouzan','Iran'),
('AU013','Ian Sommerville','United Kingdom'),
('AU014','Efraim Turban','Israel'),
('AU015','Peter Norvig','USA'),
('AU016','Stuart Russell','United Kingdom'),
('AU017','Yashavant Kanetkar','India'),
('AU018','Ramez Elmasri','Egypt'),
('AU019','Shamkant B. Navathe','India'),
('AU020','Brian Kernighan','Canada'),
('AU021','Dennis Ritchie','USA'),
('AU022','Eric Freeman','USA'),
('AU023','Elisabeth Robson','USA'),
('AU024','Martin Fowler','United Kingdom'),
('AU025','Bruce Eckel','USA'),
('AU026','William Stallings','USA'),
('AU027','David A. Patterson','USA'),
('AU028','John L. Hennessy','USA'),
('AU029','Cay S. Horstmann','Germany'),
('AU030','Mark Lutz','USA');
INSERT INTO Publisher
(publisher_id, publisher_name, address, phone)
VALUES
('PUB001','Pearson','New Delhi','9876500001'),
('PUB002','McGraw Hill','Mumbai','9876500002'),
('PUB003','O''Reilly Media','California','9876500003'),
('PUB004','Wiley','Bangalore','9876500004'),
('PUB005','Springer','Berlin','9876500005'),
('PUB006','Oxford University Press','Oxford','9876500006'),
('PUB007','Cambridge University Press','Cambridge','9876500007'),
('PUB008','Packt Publishing','Birmingham','9876500008'),
('PUB009','Cengage Learning','Delhi','9876500009'),
('PUB010','BPB Publications','Noida','9876500010'),
('PUB011','Apress','New York','9876500011'),
('PUB012','Prentice Hall','Chennai','9876500012'),
('PUB013','Elsevier','Amsterdam','9876500013'),
('PUB014','MIT Press','Massachusetts','9876500014'),
('PUB015','DreamTech Press','Pune','9876500015');
INSERT INTO Librarian
(librarian_id, full_name, phone, email, password)
VALUES
('LIB001','Anitha Rao','9876501010','anitha@library.com','admin123'),
('LIB002','Ramesh Kumar','9876501011','ramesh@library.com','admin123'),
('LIB003','Priya Sharma','9876501012','priya@library.com','admin123'),
('LIB004','Kiran Patel','9876501013','kiran@library.com','admin123'),
('LIB005','Sunil Reddy','9876501014','sunil@library.com','admin123'),
('LIB006','Meena Das','9876501015','meena@library.com','admin123'),
('LIB007','Arun Verma','9876501016','arun@library.com','admin123'),
('LIB008','Lakshmi Devi','9876501017','lakshmi@library.com','admin123'),
('LIB009','Naveen Kumar','9876501018','naveen@library.com','admin123'),
('LIB010','Sanjay Gupta','9876501019','sanjay@library.com','admin123');
SELECT COUNT(*) FROM Category;
SELECT COUNT(*) FROM Author;
SELECT COUNT(*) FROM Publisher;
SELECT COUNT(*) FROM Librarian;
INSERT INTO Student
(student_id, roll_no, full_name, course, department, year, phone, email)
VALUES
('ST001','26B11CS001','Rahul Kumar','B.Tech','CSE',1,'9876100001','rahul001@student.com'),
('ST002','23249CM006','Keerthana Devi','Polytechnic','Computer',3,'9876100002','keerthana006@poly.com'),
('ST003','25MCA001','Harsha Vardhan','MCA','Computer Applications',1,'9876100003','harsha001@mca.com'),
('ST004','26B21AI012','Sneha Reddy','B.Tech','AIML',2,'9876100004','sneha012@student.com'),
('ST005','25BBA001','Sai Teja','BBA','Business Administration',2,'9876100005','saiteja001@bba.com'),
('ST006','24B41EC018','Priya Nair','B.Tech','ECE',4,'9876100006','priya018@student.com'),
('ST007','24255EE011','Naveen Kumar','Polytechnic','EEE',2,'9876100007','naveen011@poly.com'),
('ST008','25MBA001','Anusha Rao','MBA','Business Administration',1,'9876100008','anusha001@mba.com'),
('ST009','26B11IT008','Akhil Kumar','B.Tech','IT',1,'9876100009','akhil008@student.com'),
('ST010','25BCA001','Rohit Sharma','BCA','Computer Applications',2,'9876100010','rohit001@bca.com'),
('ST011','25B31CS021','Arjun Varma','B.Tech','CSE',3,'9876100011','arjun021@student.com'),
('ST012','24404ME007','Lokesh Babu','Polytechnic','MECH',1,'9876100012','lokesh007@poly.com'),
('ST013','26B21EC015','Sai Kiran','B.Tech','ECE',2,'9876100013','saikiran015@student.com'),
('ST014','25BCOM001','Koushik','B.Com','Commerce',2,'9876100014','koushik001@bcom.com'),
('ST015','24B42EE004','Harini','B.Tech','EEE',4,'9876100015','harini004@student.com'),
('ST016','25MCA002','Ramesh Krishna','MCA','Computer Applications',1,'9876100016','ramesh002@mca.com'),
('ST017','26B11AI018','Bhavya Reddy','B.Tech','AIML',1,'9876100017','bhavya018@student.com'),
('ST018','23255EC014','Prudhvi Raj','Polytechnic','ECE',2,'9876100018','prudhvi014@poly.com'),
('ST019','25MBA002','Lavanya','MBA','Business Administration',1,'9876100019','lavanya002@mba.com'),
('ST020','25B32IT017','Vineeth','B.Tech','IT',3,'9876100020','vineeth017@student.com'),
('ST021','26B11ME009','Ganesh Kumar','B.Tech','MECH',1,'9876100021','ganesh009@student.com'),
('ST022','24404CE003','Divya Sri','Polytechnic','CIVIL',1,'9876100022','divya003@poly.com'),
('ST023','25BCA002','Nikhil Reddy','BCA','Computer Applications',2,'9876100023','nikhil002@bca.com'),
('ST024','24B41AI009','Sowmya','B.Tech','AIML',4,'9876100024','sowmya009@student.com'),
('ST025','26B21CS026','Madhav','B.Tech','CSE',2,'9876100025','madhav026@student.com'),
('ST026','25BBA002','Keerthana','BBA','Business Administration',2,'9876100026','keerthana002@bba.com'),
('ST027','24B42CS014','Sai Charan','B.Tech','CSE',4,'9876100027','saicharan014@student.com'),
('ST028','23249EC018','Rakesh Kumar','Polytechnic','ECE',3,'9876100028','rakesh018@poly.com'),
('ST029','26B11AI023','Pavan Kalyan','B.Tech','AIML',1,'9876100029','pavan023@student.com'),
('ST030','25MBA003','Bhavana','MBA','Business Administration',1,'9876100030','bhavana003@mba.com'),
('ST031','25B31EC027','Karthik Reddy','B.Tech','ECE',3,'9876100031','karthik027@student.com'),
('ST032','24255CM011','Sandeep Kumar','Polytechnic','Computer',2,'9876100032','sandeep011@poly.com'),
('ST033','26B21IT019','Harsha Vardhan','B.Tech','IT',2,'9876100033','harsha019@student.com'),
('ST034','25BCA003','Lavanya Sri','BCA','Computer Applications',2,'9876100034','lavanya003@bca.com'),
('ST035','24B41ME008','Lokesh Babu','B.Tech','MECH',4,'9876100035','lokesh008@student.com'),
('ST036','25BCOM002','Ajay Kumar','B.Com','Commerce',2,'9876100036','ajay002@bcom.com'),
('ST037','26B11EE016','Anusha','B.Tech','EEE',1,'9876100037','anusha016@student.com'),
('ST038','24404EC009','Vamsi Krishna','Polytechnic','ECE',1,'9876100038','vamsi009@poly.com'),
('ST039','25MCA003','Nikhil Reddy','MCA','Computer Applications',1,'9876100039','nikhil003@mca.com'),
('ST040','26B21CS028','Prudhvi Raj','B.Tech','CSE',2,'9876100040','prudhvi028@student.com'),
('ST041','24B42AI012','Harika','B.Tech','AIML',4,'9876100041','harika012@student.com'),
('ST042','23255ME015','Ganesh Kumar','Polytechnic','MECH',2,'9876100042','ganesh015@poly.com'),
('ST043','25B32EE021','Vaishnavi','B.Tech','EEE',3,'9876100043','vaishnavi021@student.com'),
('ST044','25MBA004','Sowmya','MBA','Business Administration',1,'9876100044','sowmya004@mba.com'),
('ST045','26B11EC030','Priya Nair','B.Tech','ECE',1,'9876100045','priya030@student.com'),
('ST046','25BBA003','Rohit Sharma','BBA','Business Administration',2,'9876100046','rohit003@bba.com'),
('ST047','24404CM013','Naresh Kumar','Polytechnic','Computer',1,'9876100047','naresh013@poly.com'),
('ST048','25B31AI034','Akash','B.Tech','AIML',3,'9876100048','akash034@student.com'),
('ST049','26B21EC022','Divya Sri','B.Tech','ECE',2,'9876100049','divya022@student.com'),
('ST050','25MCA004','Ramesh Kumar','MCA','Computer Applications',1,'9876100050','ramesh004@mca.com'),
('ST051','26B11CS037','Abhishek Reddy','B.Tech','CSE',1,'9876100051','abhishek037@student.com'),
('ST052','23249EE021','Kiran Kumar','Polytechnic','EEE',3,'9876100052','kiran021@poly.com'),
('ST053','25BCA004','Meghana','BCA','Computer Applications',2,'9876100053','meghana004@bca.com'),
('ST054','24B41IT011','Vignesh','B.Tech','IT',4,'9876100054','vignesh011@student.com'),
('ST055','25MBA005','Anirudh','MBA','Business Administration',1,'9876100055','anirudh005@mba.com'),
('ST056','26B21AI029','Yamini','B.Tech','AIML',2,'9876100056','yamini029@student.com'),
('ST057','24255CE008','Pranay','Polytechnic','CIVIL',2,'9876100057','pranay008@poly.com'),
('ST058','25B31ME017','Raviteja','B.Tech','MECH',3,'9876100058','raviteja017@student.com'),
('ST059','25BCOM003','Likitha','B.Com','Commerce',2,'9876100059','likitha003@bcom.com'),
('ST060','26B11EC041','Karthikeya','B.Tech','ECE',1,'9876100060','karthik041@student.com'),
('ST061','25MCA005','Mounika','MCA','Computer Applications',1,'9876100061','mounika005@mca.com'),
('ST062','24B42CS019','Tarun Kumar','B.Tech','CSE',4,'9876100062','tarun019@student.com'),
('ST063','24404EE014','Sai Koushik','Polytechnic','EEE',1,'9876100063','saikoushik014@poly.com'),
('ST064','26B21IT032','Ashok Kumar','B.Tech','IT',2,'9876100064','ashok032@student.com'),
('ST065','25BBA004','Srinidhi','BBA','Business Administration',2,'9876100065','srinidhi004@bba.com'),
('ST066','25B31AI039','Harshitha','B.Tech','AIML',3,'9876100066','harshitha039@student.com'),
('ST067','23255CM017','Mahesh Kumar','Polytechnic','Computer',2,'9876100067','mahesh017@poly.com'),
('ST068','24B41EE013','Deepthi','B.Tech','EEE',4,'9876100068','deepthi013@student.com'),
('ST069','25BCA005','Aditya Varma','BCA','Computer Applications',2,'9876100069','aditya005@bca.com'),
('ST070','26B11ME018','Naresh Kumar','B.Tech','MECH',1,'9876100070','naresh018@student.com'),
('ST071','25MBA006','Lavanya','MBA','Business Administration',1,'9876100071','lavanya006@mba.com'),
('ST072','24249EC022','Yogesh','Polytechnic','ECE',3,'9876100072','yogesh022@poly.com'),
('ST073','25B32CS024','Rohini','B.Tech','CSE',3,'9876100073','rohini024@student.com'),
('ST074','26B21EE027','Sravani','B.Tech','EEE',2,'9876100074','sravani027@student.com'),
('ST075','25BCOM004','Keerthi','B.Com','Commerce',2,'9876100075','keerthi004@bcom.com'),
('ST076','24B42EC016','Nikhil Teja','B.Tech','ECE',4,'9876100076','nikhil016@student.com'),
('ST077','24404ME018','Pradeep','Polytechnic','MECH',1,'9876100077','pradeep018@poly.com'),
('ST078','25MCA006','Sai Lakshmi','MCA','Computer Applications',1,'9876100078','sailakshmi006@mca.com'),
('ST079','26B11AI042','Navya Sri','B.Tech','AIML',1,'9876100079','navya042@student.com'),
('ST080','25BBA005','Rithvik','BBA','Business Administration',2,'9876100080','rithvik005@bba.com'),
('ST081','25B31IT028','Sathvik','B.Tech','IT',3,'9876100081','sathvik028@student.com'),
('ST082','23255EE026','Venkatesh','Polytechnic','EEE',2,'9876100082','venkatesh026@poly.com'),
('ST083','24B41AI017','Aparna','B.Tech','AIML',4,'9876100083','aparna017@student.com'),
('ST084','25BCA006','Bhanu Prakash','BCA','Computer Applications',2,'9876100084','bhanu006@bca.com'),
('ST085','26B21CS035','Madhuri','B.Tech','CSE',2,'9876100085','madhuri035@student.com'),
('ST086','25MBA007','Aishwarya','MBA','Business Administration',1,'9876100086','aishwarya007@mba.com'),
('ST087','24404CM020','Ravi Kumar','Polytechnic','Computer',1,'9876100087','ravi020@poly.com'),
('ST088','24B42ME021','Ganesh Kumar','B.Tech','MECH',4,'9876100088','ganesh021@student.com'),
('ST089','25BCOM005','Sowmya','B.Com','Commerce',2,'9876100089','sowmya005@bcom.com'),
('ST090','26B11EC046','Akhil Sai','B.Tech','ECE',1,'9876100090','akhilsai046@student.com'),
('ST091','25B32AI031','Manasa','B.Tech','AIML',3,'9876100091','manasa031@student.com'),
('ST092','23249CE019','Charan Teja','Polytechnic','CIVIL',3,'9876100092','charan019@poly.com'),
('ST093','25MCA007','Keerthana','MCA','Computer Applications',1,'9876100093','keerthana007@mca.com'),
('ST094','24B41CS026','Sai Prasad','B.Tech','CSE',4,'9876100094','saiprasad026@student.com'),
('ST095','26B21IT039','Dheeraj Kumar','B.Tech','IT',2,'9876100095','dheeraj039@student.com'),
('ST096','25BBA006','Divya Bharathi','BBA','Business Administration',2,'9876100096','divya006@bba.com'),
('ST097','24255EC025','Poojitha','Polytechnic','ECE',2,'9876100097','poojitha025@poly.com'),
('ST098','25B31EE035','Vaishnavi','B.Tech','EEE',3,'9876100098','vaishnavi035@student.com'),
('ST099','25BCOM006','Koushik','B.Com','Commerce',2,'9876100099','koushik006@bcom.com'),
('ST100','24B42IT029','Rohan Reddy','B.Tech','IT',4,'9876100100','rohan029@student.com');
INSERT INTO Book
(book_id,title,isbn,edition,publication_year,quantity,available_quantity,category_id,author_id,publisher_id)
VALUES
('BK001','Clean Code','9780132350884','1st',2008,15,12,'CATCS','AU008','PUB012'),
('BK002','Clean Architecture','9780134494166','1st',2017,12,10,'CATCS','AU008','PUB012'),
('BK003','The Clean Coder','9780137081073','1st',2011,10,8,'CATCS','AU008','PUB012'),
('BK004','The C++ Programming Language','9780321563842','4th',2013,15,13,'CATCS','AU009','PUB001'),
('BK005','Programming Principles Using C++','9780321992789','2nd',2014,10,8,'CATCS','AU009','PUB001'),
('BK006','The C Programming Language','9780131103627','2nd',1988,20,17,'CATCS','AU020','PUB012'),
('BK007','Let Us C','9789389845678','18th',2022,18,16,'CATCS','AU017','PUB010'),
('BK008','Java The Complete Reference','9781260440236','12th',2021,16,14,'CATCS','AU010','PUB002'),
('BK009','Head First Java','9788173666029','3rd',2023,14,11,'CATCS','AU022','PUB003'),
('BK010','Core Java Volume I','9780135166307','12th',2021,12,10,'CATCS','AU029','PUB001'),
('BK011','Effective Java','9780134685991','3rd',2018,10,9,'CATCS','AU029','PUB001'),
('BK012','Python Crash Course','9781593279288','3rd',2023,15,12,'CATCS','AU030','PUB011'),
('BK013','Learning Python','9781449355739','5th',2013,12,10,'CATCS','AU030','PUB003'),
('BK014','Think Python','9781492051367','2nd',2019,10,8,'CATCS','AU030','PUB003'),
('BK015','Automate the Boring Stuff with Python','9781593275990','2nd',2019,15,14,'CATCS','AU030','PUB011'),
('BK016','Design Patterns','9780201633610','1st',1994,12,9,'CATCS','AU024','PUB012'),
('BK017','Refactoring','9780201485677','2nd',2018,10,8,'CATCS','AU024','PUB012'),
('BK018','The Pragmatic Programmer','9780135957059','2nd',2019,10,9,'CATCS','AU024','PUB001'),
('BK019','Code Complete','9780735619678','2nd',2004,8,7,'CATCS','AU025','PUB011'),
('BK020','Programming Pearls','9780201657883','2nd',1999,8,6,'CATCS','AU020','PUB012'),
('BK021','Object-Oriented Programming with C++','9780077099817','6th',2014,12,10,'CATCS','AU009','PUB002'),
('BK022','Head First Design Patterns','9780596007126','2nd',2020,10,9,'CATCS','AU022','PUB003'),
('BK023','Eloquent JavaScript','9781593279509','3rd',2018,10,8,'CATCS','AU030','PUB003'),
('BK024','HTML and CSS Design and Build Websites','9781118008188','1st',2011,12,10,'CATCS','AU025','PUB004'),
('BK025','JavaScript The Good Parts','9780596517748','1st',2008,8,6,'CATCS','AU030','PUB003'),
('BK026','Learning React','9781492051725','5th',2024,10,9,'CATCS','AU030','PUB003'),
('BK027','Software Engineering','9780137035151','10th',2015,15,12,'CATCS','AU013','PUB001'),
('BK028','Software Engineering A Practitioners Approach','9780078022128','8th',2015,10,8,'CATCS','AU013','PUB002'),
('BK029','Introduction to Computing','9780199468164','1st',2018,10,9,'CATCS','AU025','PUB006'),
('BK030','Programming Logic and Design','9780357117804','9th',2020,12,10,'CATCS','AU010','PUB009'),
('BK031','Database System Concepts','9780073523323','7th',2019,20,16,'CATDB','AU001','PUB002'),
('BK032','Database Management Systems','9789332558185','3rd',2018,18,15,'CATDB','AU002','PUB001'),
('BK033','Fundamentals of Database Systems','9780133970777','7th',2017,18,14,'CATDB','AU018','PUB004'),
('BK034','SQL The Complete Reference','9781259585498','4th',2016,12,10,'CATDB','AU002','PUB002'),
('BK035','Learning SQL','9780596520830','2nd',2020,12,9,'CATDB','AU030','PUB003'),
('BK036','Oracle Database Guide','9780071601474','2nd',2015,10,8,'CATDB','AU003','PUB002'),
('BK037','MySQL Cookbook','9781449374020','4th',2022,10,8,'CATDB','AU030','PUB003'),
('BK038','PostgreSQL Guide','9781484257098','1st',2020,8,7,'CATDB','AU030','PUB011'),
('BK039','SQL Cookbook','9780596009762','2nd',2009,10,8,'CATDB','AU030','PUB003'),
('BK040','Beginning SQL','9781119722038','5th',2021,10,9,'CATDB','AU003','PUB004'),
('BK041','Advanced SQL','9781484206485','2nd',2019,8,6,'CATDB','AU003','PUB011'),
('BK042','Mastering MySQL','9781783981540','3rd',2018,8,6,'CATDB','AU003','PUB008'),
('BK043','SQL Queries for Mere Mortals','9780134858333','4th',2018,12,10,'CATDB','AU018','PUB001'),
('BK044','Database Design','9780123820204','2nd',2012,10,8,'CATDB','AU019','PUB013'),
('BK045','NoSQL Distilled','9780321826626','1st',2012,8,7,'CATDB','AU024','PUB001'),
('BK046','MongoDB Basics','9781484211830','1st',2016,10,8,'CATDB','AU030','PUB011'),
('BK047','SQL Performance Explained','9783950307825','2nd',2017,8,7,'CATDB','AU003','PUB005'),
('BK048','Practical SQL','9781593278274','2nd',2023,10,8,'CATDB','AU030','PUB011'),
('BK049','Database Programming','9780131873254','3rd',2014,10,8,'CATDB','AU002','PUB001'),
('BK050','Data Modeling Essentials','9780125642972','3rd',2009,8,6,'CATDB','AU019','PUB013'),
('BK051','Artificial Intelligence A Modern Approach','9780134610993','4th',2021,18,15,'CATAI','AU016','PUB001'),
('BK052','Artificial Intelligence','9789332585495','3rd',2019,12,10,'CATAI','AU015','PUB004'),
('BK053','Hands-On Machine Learning','9781098125974','3rd',2022,15,12,'CATAI','AU015','PUB003'),
('BK054','Deep Learning','9780262035613','1st',2016,12,10,'CATAI','AU015','PUB014'),
('BK055','Machine Learning with Python','9781787125933','2nd',2019,10,8,'CATAI','AU015','PUB008'),
('BK056','Pattern Recognition and Machine Learning','9780387310732','1st',2006,10,8,'CATAI','AU016','PUB005'),
('BK057','Reinforcement Learning','9780262039246','2nd',2018,8,6,'CATAI','AU016','PUB014'),
('BK058','Practical Artificial Intelligence','9781484259993','1st',2021,10,8,'CATAI','AU015','PUB011'),
('BK059','AI for Everyone','9781523085248','1st',2019,8,7,'CATAI','AU015','PUB013'),
('BK060','Neural Networks Explained','9780128182475','2nd',2020,8,7,'CATAI','AU016','PUB013'),
('BK061','Natural Language Processing','9781491978238','2nd',2020,10,8,'CATAI','AU015','PUB003'),
('BK062','Computer Vision Basics','9781492037064','1st',2021,8,6,'CATAI','AU015','PUB003'),
('BK063','Machine Learning Yearning','9780999579500','1st',2018,10,9,'CATAI','AU015','PUB014'),
('BK064','Generative AI Essentials','9789355519123','1st',2024,12,10,'CATAI','AU015','PUB010'),
('BK065','AI Engineering','9781801819312','1st',2023,10,8,'CATAI','AU015','PUB008'),
('BK066','Applied Artificial Intelligence','9781484259313','2nd',2022,10,8,'CATAI','AU016','PUB011'),
('BK067','Intelligent Systems','9780130460428','2nd',2017,8,6,'CATAI','AU016','PUB001'),
('BK068','Machine Learning Fundamentals','9789355518768','1st',2023,10,8,'CATAI','AU015','PUB010'),
('BK069','Deep Reinforcement Learning','9780262049078','1st',2021,8,6,'CATAI','AU016','PUB014'),
('BK070','Artificial Intelligence Projects','9781803241234','1st',2023,8,7,'CATAI','AU015','PUB008'),
('BK071','Python for Data Analysis','9781098104030','3rd',2022,15,12,'CATDS','AU030','PUB003'),
('BK072','Data Science from Scratch','9781492041139','2nd',2019,12,10,'CATDS','AU030','PUB003'),
('BK073','Practical Statistics for Data Science','9781492072942','2nd',2020,10,8,'CATDS','AU030','PUB003'),
('BK074','Data Mining Concepts and Techniques','9780128117606','4th',2022,12,10,'CATDS','AU014','PUB013'),
('BK075','Python Data Science Handbook','9781491912058','2nd',2016,10,8,'CATDS','AU030','PUB003'),
('BK076','Data Visualization with Python','9781119603320','1st',2020,8,7,'CATDS','AU030','PUB004'),
('BK077','Big Data Analytics','9781119701828','2nd',2021,10,8,'CATDS','AU014','PUB004'),
('BK078','Data Analytics Using Python','9789355516559','1st',2023,10,8,'CATDS','AU030','PUB010'),
('BK079','Business Analytics','9781292341552','3rd',2021,8,6,'CATDS','AU014','PUB009'),
('BK080','Data Science for Business','9781449361327','2nd',2019,10,8,'CATDS','AU014','PUB003'),
('BK081','R Programming Essentials','9781788296045','2nd',2018,8,7,'CATDS','AU014','PUB008'),
('BK082','Applied Data Science','9781484232033','1st',2019,8,6,'CATDS','AU014','PUB011'),
('BK083','Data Wrangling','9781491948811','1st',2017,8,6,'CATDS','AU030','PUB003'),
('BK084','Modern Data Science','9780367332723','1st',2022,8,7,'CATDS','AU014','PUB005'),
('BK085','Advanced Data Analytics','9789355517020','1st',2024,8,7,'CATDS','AU014','PUB010'),
('BK086','Introduction to Big Data','9781119701873','1st',2020,8,7,'CATDS','AU014','PUB004'),
('BK087','Data Science Projects','9781801074025','1st',2022,10,8,'CATDS','AU030','PUB008'),
('BK088','Statistical Learning','9781461471370','2nd',2021,10,9,'CATDS','AU014','PUB005'),
('BK089','Predictive Analytics','9781118356852','2nd',2018,8,6,'CATDS','AU014','PUB004'),
('BK090','Analytics in Practice','9789355519987','1st',2024,8,7,'CATDS','AU014','PUB010'),
('BK091','Computer Networks','9780132126953','5th',2011,15,12,'CATNW','AU011','PUB001'),
('BK092','Data Communications and Networking','9781259064757','5th',2017,12,10,'CATNW','AU012','PUB002'),
('BK093','Network Security Essentials','9780134527338','6th',2018,10,8,'CATNW','AU026','PUB001'),
('BK094','TCP/IP Illustrated','9780201633467','1st',1994,8,6,'CATNW','AU026','PUB012'),
('BK095','CCNA Guide','9780357118283','8th',2020,10,8,'CATNW','AU026','PUB009'),
('BK096','Routing and Switching Essentials','9781587134289','2nd',2019,8,7,'CATNW','AU026','PUB001'),
('BK097','Computer Network Principles','9780136118183','2nd',2015,8,6,'CATNW','AU011','PUB001'),
('BK098','Wireless Communications','9780130422323','2nd',2016,8,6,'CATNW','AU012','PUB001'),
('BK099','Network Troubleshooting','9781119432258','1st',2021,8,7,'CATNW','AU026','PUB004'),
('BK100','Modern Computer Networks','9780133594140','2nd',2022,10,8,'CATNW','AU011','PUB001'),
('BK101','Cryptography and Network Security','9789352869177','7th',2020,15,12,'CATCY','AU026','PUB004'),
('BK102','Operating System Concepts','9781119800361','10th',2021,18,15,'CATOS','AU011','PUB004'),
('BK103','Engineering Mathematics I','9789353432509','5th',2022,20,18,'CATMT','AU004','PUB010'),
('BK104','Digital Electronics','9789332542603','3rd',2019,12,10,'CATEC','AU026','PUB009'),
('BK105','India Year Book','9789354092184','2024',2024,5,5,'CATGK','AU014','PUB013'),
('BK106','Ethical Hacking','9781264269949','3rd',2021,10,8,'CATCY','AU026','PUB002'),
('BK107','Modern Operating Systems','9780133591620','5th',2022,15,13,'CATOS','AU011','PUB001'),
('BK108','Discrete Mathematics','9781259676516','8th',2018,15,14,'CATMT','AU004','PUB002'),
('BK109','Electronic Devices','9789351340023','2nd',2020,10,8,'CATEC','AU026','PUB010'),
('BK110','Lucent General Knowledge','9789355013539','10th',2023,8,8,'CATGK','AU014','PUB010'),
('BK111','Kali Linux Revealed','9782375061339','2nd',2021,8,6,'CATCY','AU026','PUB005'),
('BK112','Linux Administration Handbook','9780134277554','2nd',2019,10,8,'CATOS','AU011','PUB001'),
('BK113','Probability and Statistics','9780199470594','3rd',2019,12,11,'CATMT','AU004','PUB006'),
('BK114','Microprocessors and Interfacing','9780070584082','2nd',2018,10,8,'CATEC','AU026','PUB002'),
('BK115','Objective General Knowledge','9789351760159','8th',2022,6,6,'CATGK','AU014','PUB010'),
('BK116','Computer Security Principles','9780134794105','4th',2018,10,8,'CATCY','AU026','PUB001'),
('BK117','Windows Internals','9780735684188','7th',2021,8,7,'CATOS','AU026','PUB011'),
('BK118','Advanced Engineering Mathematics','9780470458365','10th',2011,10,8,'CATMT','AU004','PUB004'),
('BK119','Digital Logic Design','9788131727003','5th',2019,10,9,'CATEC','AU026','PUB010'),
('BK120','Manorama Yearbook','9788197088582','2024',2024,6,6,'CATGK','AU014','PUB010'),
('BK121','CEH Certified Ethical Hacker Guide','9781264269956','2nd',2022,8,7,'CATCY','AU026','PUB002'),
('BK122','UNIX Concepts and Applications','9781259005873','4th',2017,8,7,'CATOS','AU011','PUB002'),
('BK123','Engineering Mathematics II','9789353432516','5th',2022,18,15,'CATMT','AU004','PUB010'),
('BK124','Embedded Systems Design','9780071077637','2nd',2021,8,7,'CATEC','AU026','PUB002'),
('BK125','General Knowledge 2024','9789355019999','2024',2024,6,6,'CATGK','AU014','PUB010'),
('BK126','Digital Forensics','9781264269957','2nd',2022,8,6,'CATCY','AU026','PUB002'),
('BK127','Operating Systems Design','9780131429387','2nd',2018,8,7,'CATOS','AU011','PUB001'),
('BK128','Linear Algebra','9780321982384','4th',2016,12,10,'CATMT','AU004','PUB001'),
('BK129','Electronic Circuits','9780199476305','3rd',2020,10,8,'CATEC','AU026','PUB006'),
('BK130','Encyclopedia of General Knowledge','9789355012211','2023',2023,5,5,'CATGK','AU014','PUB010'),
('BK131','Cyber Security Essentials','9789332585389','2nd',2019,10,9,'CATCY','AU026','PUB010'),
('BK132','Linux System Programming','9781449339531','2nd',2018,8,7,'CATOS','AU011','PUB003'),
('BK133','Numerical Methods','9781259064580','7th',2016,12,10,'CATMT','AU004','PUB002'),
('BK134','Signals and Systems','9780070141704','2nd',2019,10,8,'CATEC','AU026','PUB002'),
('BK135','Competitive Exams GK','9789351764515','2023',2023,8,8,'CATGK','AU014','PUB010'),
('BK136','Practical Malware Analysis','9781593272906','1st',2019,8,6,'CATCY','AU026','PUB011'),
('BK137','Real-Time Operating Systems','9780124171688','3rd',2017,8,7,'CATOS','AU011','PUB013'),
('BK138','Engineering Calculus','9788131702338','4th',2015,10,9,'CATMT','AU004','PUB010'),
('BK139','Power Electronics','9789353064960','3rd',2021,10,8,'CATEC','AU026','PUB010'),
('BK140','Current Affairs 2024','9789355011450','2024',2024,5,5,'CATGK','AU014','PUB010'),
('BK141','Web Security','9781492053118','2nd',2022,8,7,'CATCY','AU026','PUB003'),
('BK142','Distributed Operating Systems','9780131433209','2nd',2018,8,6,'CATOS','AU011','PUB001'),
('BK143','Engineering Algebra','9788131705407','3rd',2017,10,9,'CATMT','AU004','PUB010'),
('BK144','Control Systems','9780071077910','2nd',2020,10,8,'CATEC','AU026','PUB002'),
('BK145','World General Knowledge','9789355017773','2023',2023,6,6,'CATGK','AU014','PUB010'),
('BK146','Cyber Law and Ethics','9789353067183','2nd',2021,8,7,'CATCY','AU026','PUB010'),
('BK147','Advanced Operating Systems','9780070702042','2nd',2019,8,7,'CATOS','AU011','PUB002'),
('BK148','Engineering Statistics','9780199482450','2nd',2021,10,9,'CATMT','AU004','PUB006'),
('BK149','Communication Systems','9789352603269','3rd',2020,10,8,'CATEC','AU026','PUB010'),
('BK150','Yearbook of India','9789355018886','2024',2024,5,5,'CATGK','AU014','PUB010'),
('BK151','Advanced Java Programming','9781260463419','11th',2022,12,10,'CATCS','AU010','PUB002'),
('BK152','Database Administration','9780134706054','2nd',2020,10,8,'CATDB','AU002','PUB001'),
('BK153','Deep Learning with Python','9781617296864','2nd',2022,10,8,'CATAI','AU015','PUB008'),
('BK154','Data Analytics Essentials','9781119814252','1st',2022,8,7,'CATDS','AU014','PUB004'),
('BK155','Network Programming','9780134548784','3rd',2021,10,8,'CATNW','AU011','PUB001'),
('BK156','Cyber Warfare','9780071771544','2nd',2019,8,6,'CATCY','AU026','PUB002'),
('BK157','Linux Kernel Development','9780672329463','3rd',2018,8,7,'CATOS','AU011','PUB012'),
('BK158','Linear Programming','9789353432608','4th',2021,10,9,'CATMT','AU004','PUB010'),
('BK159','Digital Signal Processing','9780073398190','3rd',2019,10,8,'CATEC','AU026','PUB002'),
('BK160','General Science Handbook','9789355013331','2023',2023,6,6,'CATGK','AU014','PUB010'),
('BK161','Programming in ANSI C','9780070681880','8th',2017,15,13,'CATCS','AU017','PUB002'),
('BK162','SQL in 10 Minutes','9780672336072','5th',2020,12,10,'CATDB','AU002','PUB012'),
('BK163','Artificial Intelligence Basics','9781484250273','1st',2020,8,7,'CATAI','AU016','PUB011'),
('BK164','Data Warehousing','9789353064502','2nd',2021,10,8,'CATDS','AU014','PUB010'),
('BK165','Computer Network Security','9780134085043','3rd',2018,10,8,'CATNW','AU026','PUB001'),
('BK166','Information Security','9780078022129','2nd',2019,10,9,'CATCY','AU026','PUB002'),
('BK167','UNIX System Programming','9780131429011','2nd',2018,8,7,'CATOS','AU011','PUB001'),
('BK168','Engineering Mathematics III','9789353432615','3rd',2022,12,10,'CATMT','AU004','PUB010'),
('BK169','Electronic Communication Systems','9781259092934','5th',2020,10,8,'CATEC','AU026','PUB002'),
('BK170','Competitive Success Review','9789355014444','2024',2024,5,5,'CATGK','AU014','PUB010'),
('BK171','Object Oriented Programming','9780071074780','2nd',2019,12,10,'CATCS','AU009','PUB002'),
('BK172','Oracle SQL Developer Guide','9781260469992','1st',2021,8,7,'CATDB','AU003','PUB002'),
('BK173','AI Using Python','9781801812122','1st',2023,10,8,'CATAI','AU015','PUB008'),
('BK174','Big Data Fundamentals','9781119701811','2nd',2021,10,8,'CATDS','AU014','PUB004'),
('BK175','Wireless Network Technologies','9780133594145','2nd',2022,8,7,'CATNW','AU011','PUB001'),
('BK176','Cloud Computing Concepts','9781119875987','2nd',2022,12,10,'CATCS','AU013','PUB004'),
('BK177','MySQL Essentials','9781484295913','2nd',2023,10,8,'CATDB','AU003','PUB011'),
('BK178','Computer Vision Applications','9781803247892','1st',2023,8,7,'CATAI','AU015','PUB008'),
('BK179','Data Mining Techniques','9780128156544','3rd',2021,10,8,'CATDS','AU014','PUB013'),
('BK180','CCNA Complete Study Guide','9781119677611','8th',2021,12,10,'CATNW','AU026','PUB004'),
('BK181','Penetration Testing','9781119596547','2nd',2020,8,7,'CATCY','AU026','PUB004'),
('BK182','Embedded Linux Systems','9780137061105','2nd',2020,8,7,'CATOS','AU011','PUB001'),
('BK183','Engineering Numerical Analysis','9789353432707','3rd',2022,10,8,'CATMT','AU004','PUB010'),
('BK184','Microcontroller Systems','9780071077620','4th',2020,10,8,'CATEC','AU026','PUB002'),
('BK185','General Knowledge Manual','9789355015555','2024',2024,6,6,'CATGK','AU014','PUB010'),
('BK186','Software Testing Principles','9780137488629','2nd',2023,10,8,'CATCS','AU013','PUB001'),
('BK187','SQL Server Administration','9780133408539','3rd',2019,8,7,'CATDB','AU002','PUB001'),
('BK188','Machine Learning Algorithms','9781803244563','1st',2023,10,8,'CATAI','AU015','PUB008'),
('BK189','Business Intelligence','9781119701859','2nd',2021,8,7,'CATDS','AU014','PUB004'),
('BK190','Network Administration','9780134177458','3rd',2019,10,8,'CATNW','AU011','PUB001'),
('BK191','Cyber Crime Investigation','9789353065226','2nd',2022,8,7,'CATCY','AU026','PUB010'),
('BK192','Real Time Operating Systems','9780124171695','3rd',2021,8,6,'CATOS','AU011','PUB013'),
('BK193','Discrete Structures','9781259092941','4th',2020,12,10,'CATMT','AU004','PUB002'),
('BK194','Power System Engineering','9789352604594','3rd',2021,10,8,'CATEC','AU026','PUB010'),
('BK195','Current Affairs Digest','9789355016666','2024',2024,5,5,'CATGK','AU014','PUB010'),
('BK196','React Development Guide','9781803239965','2nd',2023,12,10,'CATCS','AU030','PUB008'),
('BK197','NoSQL Database Systems','9780321826633','2nd',2020,10,8,'CATDB','AU024','PUB001'),
('BK198','Artificial Intelligence Projects','9781803241235','2nd',2024,10,8,'CATAI','AU015','PUB008'),
('BK199','Data Engineering Fundamentals','9781803247779','1st',2024,10,8,'CATDS','AU014','PUB008'),
('BK200','Network Design Essentials','9780134762852','2nd',2022,10,8,'CATNW','AU011','PUB001');
SELECT title, quantity, available_quantity
FROM Book;
INSERT INTO Issue
(issue_id,student_id,book_id,librarian_id,issue_date,due_date,status)
VALUES
('IS001','ST042','BK031','LIB003','2026-07-01','2026-07-15','Returned'),
('IS002','ST008','BK102','LIB007','2026-07-02','2026-07-16','Issued'),
('IS003','ST067','BK001','LIB002','2026-07-02','2026-07-16','Returned'),
('IS004','ST015','BK091','LIB010','2026-07-03','2026-07-17','Overdue'),
('IS005','ST089','BK053','LIB005','2026-07-03','2026-07-17','Issued'),
('IS006','ST024','BK008','LIB001','2026-07-04','2026-07-18','Returned'),
('IS007','ST051','BK031','LIB004','2026-07-04','2026-07-18','Issued'),
('IS008','ST003','BK071','LIB008','2026-07-05','2026-07-19','Returned'),
('IS009','ST094','BK116','LIB009','2026-07-05','2026-07-19','Issued'),
('IS010','ST037','BK045','LIB006','2026-07-06','2026-07-20','Returned'),
('IS011','ST012','BK151','LIB002','2026-07-06','2026-07-20','Issued'),
('IS012','ST058','BK022','LIB001','2026-07-07','2026-07-21','Overdue'),
('IS013','ST076','BK188','LIB010','2026-07-07','2026-07-21','Returned'),
('IS014','ST019','BK135','LIB003','2026-07-08','2026-07-22','Issued'),
('IS015','ST084','BK091','LIB005','2026-07-08','2026-07-22','Returned'),
('IS016','ST033','BK102','LIB007','2026-07-09','2026-07-23','Issued'),
('IS017','ST070','BK051','LIB004','2026-07-09','2026-07-23','Returned'),
('IS018','ST028','BK176','LIB006','2026-07-10','2026-07-24','Overdue'),
('IS019','ST097','BK009','LIB009','2026-07-10','2026-07-24','Issued'),
('IS020','ST046','BK031','LIB008','2026-07-11','2026-07-25','Returned'),
('IS021','ST021','BK064','LIB001','2026-07-11','2026-07-25','Issued'),
('IS022','ST054','BK001','LIB003','2026-07-12','2026-07-26','Returned'),
('IS023','ST005','BK102','LIB010','2026-07-12','2026-07-26','Issued'),
('IS024','ST061','BK041','LIB002','2026-07-13','2026-07-27','Returned'),
('IS025','ST090','BK198','LIB004','2026-07-13','2026-07-27','Overdue'),
('IS026','ST041','BK052','LIB006','2026-07-14','2026-07-28','Returned'),
('IS027','ST013','BK074','LIB009','2026-07-14','2026-07-28','Issued'),
('IS028','ST082','BK031','LIB005','2026-07-15','2026-07-29','Returned'),
('IS029','ST036','BK111','LIB008','2026-07-15','2026-07-29','Issued'),
('IS030','ST056','BK121','LIB007','2026-07-16','2026-07-30','Returned'),
('IS031','ST001','BK002','LIB001','2026-07-16','2026-07-30','Issued'),
('IS032','ST072','BK180','LIB010','2026-07-17','2026-07-31','Overdue'),
('IS033','ST048','BK097','LIB003','2026-07-17','2026-07-31','Returned'),
('IS034','ST025','BK014','LIB002','2026-07-18','2026-08-01','Issued'),
('IS035','ST095','BK091','LIB006','2026-07-18','2026-08-01','Returned'),
('IS036','ST017','BK156','LIB009','2026-07-19','2026-08-02','Issued'),
('IS037','ST043','BK033','LIB004','2026-07-19','2026-08-02','Returned'),
('IS038','ST060','BK118','LIB005','2026-07-20','2026-08-03','Overdue'),
('IS039','ST086','BK065','LIB008','2026-07-20','2026-08-03','Issued'),
('IS040','ST031','BK001','LIB007','2026-07-21','2026-08-04','Returned'),
('IS041','ST078','BK089','LIB001','2026-07-21','2026-08-04','Issued'),
('IS042','ST010','BK102','LIB003','2026-07-22','2026-08-05','Returned'),
('IS043','ST052','BK170','LIB006','2026-07-22','2026-08-05','Issued'),
('IS044','ST027','BK018','LIB009','2026-07-23','2026-08-06','Returned'),
('IS045','ST064','BK191','LIB010','2026-07-23','2026-08-06','Overdue'),
('IS046','ST099','BK031','LIB005','2026-07-24','2026-08-07','Issued'),
('IS047','ST039','BK054','LIB004','2026-07-24','2026-08-07','Returned'),
('IS048','ST074','BK143','LIB002','2026-07-25','2026-08-08','Issued'),
('IS049','ST014','BK091','LIB008','2026-07-25','2026-08-08','Returned'),
('IS050','ST088','BK103','LIB001','2026-07-26','2026-08-09','Issued'),
('IS051','ST026','BK177','LIB004','2026-07-26','2026-08-09','Returned'),
('IS052','ST081','BK031','LIB007','2026-07-27','2026-08-10','Issued'),
('IS053','ST044','BK091','LIB010','2026-07-27','2026-08-10','Returned'),
('IS054','ST006','BK154','LIB003','2026-07-28','2026-08-11','Issued'),
('IS055','ST073','BK001','LIB009','2026-07-28','2026-08-11','Returned'),
('IS056','ST053','BK102','LIB005','2026-07-29','2026-08-12','Overdue'),
('IS057','ST018','BK035','LIB001','2026-07-29','2026-08-12','Issued'),
('IS058','ST096','BK053','LIB002','2026-07-30','2026-08-13','Returned'),
('IS059','ST034','BK187','LIB006','2026-07-30','2026-08-13','Issued'),
('IS060','ST079','BK121','LIB008','2026-07-31','2026-08-14','Returned'),
('IS061','ST002','BK071','LIB004','2026-07-31','2026-08-14','Issued'),
('IS062','ST057','BK102','LIB010','2026-08-01','2026-08-15','Overdue'),
('IS063','ST022','BK091','LIB003','2026-08-01','2026-08-15','Returned'),
('IS064','ST085','BK166','LIB009','2026-08-02','2026-08-16','Issued'),
('IS065','ST047','BK031','LIB001','2026-08-02','2026-08-16','Returned'),
('IS066','ST069','BK081','LIB007','2026-08-03','2026-08-17','Issued'),
('IS067','ST030','BK051','LIB006','2026-08-03','2026-08-17','Returned'),
('IS068','ST063','BK139','LIB002','2026-08-04','2026-08-18','Issued'),
('IS069','ST011','BK001','LIB008','2026-08-04','2026-08-18','Returned'),
('IS070','ST098','BK194','LIB005','2026-08-05','2026-08-19','Overdue'),
('IS071','ST040','BK104','LIB003','2026-08-05','2026-08-19','Issued'),
('IS072','ST087','BK031','LIB009','2026-08-06','2026-08-20','Returned'),
('IS073','ST055','BK075','LIB001','2026-08-06','2026-08-20','Issued'),
('IS074','ST004','BK165','LIB010','2026-08-07','2026-08-21','Returned'),
('IS075','ST080','BK008','LIB006','2026-08-07','2026-08-21','Issued'),
('IS076','ST049','BK091','LIB002','2026-08-08','2026-08-22','Returned'),
('IS077','ST093','BK173','LIB005','2026-08-08','2026-08-22','Overdue'),
('IS078','ST016','BK043','LIB007','2026-08-09','2026-08-23','Issued'),
('IS079','ST065','BK151','LIB004','2026-08-09','2026-08-23','Returned'),
('IS080','ST038','BK120','LIB001','2026-08-10','2026-08-24','Issued'),
('IS081','ST091','BK102','LIB009','2026-08-10','2026-08-24','Returned'),
('IS082','ST029','BK001','LIB006','2026-08-11','2026-08-25','Issued'),
('IS083','ST075','BK182','LIB010','2026-08-11','2026-08-25','Returned'),
('IS084','ST050','BK068','LIB003','2026-08-12','2026-08-26','Issued'),
('IS085','ST083','BK031','LIB002','2026-08-12','2026-08-26','Returned'),
('IS086','ST009','BK107','LIB008','2026-08-13','2026-08-27','Overdue'),
('IS087','ST071','BK190','LIB004','2026-08-13','2026-08-27','Issued'),
('IS088','ST062','BK012','LIB005','2026-08-14','2026-08-28','Returned'),
('IS089','ST020','BK051','LIB001','2026-08-14','2026-08-28','Issued'),
('IS090','ST066','BK199','LIB010','2026-08-15','2026-08-29','Returned'),
('IS091','ST035','BK031','LIB007','2026-08-15','2026-08-29','Issued'),
('IS092','ST092','BK091','LIB009','2026-08-16','2026-08-30','Returned'),
('IS093','ST007','BK110','LIB006','2026-08-16','2026-08-30','Issued'),
('IS094','ST059','BK001','LIB002','2026-08-17','2026-08-31','Returned'),
('IS095','ST045','BK156','LIB003','2026-08-17','2026-08-31','Overdue'),
('IS096','ST032','BK172','LIB008','2026-08-18','2026-09-01','Issued'),
('IS097','ST100','BK055','LIB005','2026-08-18','2026-09-01','Returned'),
('IS098','ST023','BK102','LIB010','2026-08-19','2026-09-02','Issued'),
('IS099','ST068','BK031','LIB004','2026-08-19','2026-09-02','Returned'),
('IS100','ST077','BK091','LIB001','2026-08-20','2026-09-03','Issued'),
('IS101','ST027','BK176','LIB002','2026-08-20','2026-09-03','Returned'),
('IS102','ST054','BK031','LIB006','2026-08-21','2026-09-04','Issued'),
('IS103','ST008','BK102','LIB009','2026-08-21','2026-09-04','Returned'),
('IS104','ST081','BK053','LIB004','2026-08-22','2026-09-05','Issued'),
('IS105','ST013','BK091','LIB001','2026-08-22','2026-09-05','Overdue'),
('IS106','ST063','BK165','LIB010','2026-08-23','2026-09-06','Returned'),
('IS107','ST035','BK001','LIB003','2026-08-23','2026-09-06','Issued'),
('IS108','ST097','BK071','LIB008','2026-08-24','2026-09-07','Returned'),
('IS109','ST020','BK151','LIB005','2026-08-24','2026-09-07','Issued'),
('IS110','ST075','BK120','LIB007','2026-08-25','2026-09-08','Returned'),
('IS111','ST049','BK188','LIB006','2026-08-25','2026-09-08','Issued'),
('IS112','ST003','BK031','LIB001','2026-08-26','2026-09-09','Returned'),
('IS113','ST089','BK102','LIB009','2026-08-26','2026-09-09','Overdue'),
('IS114','ST040','BK008','LIB002','2026-08-27','2026-09-10','Issued'),
('IS115','ST011','BK194','LIB004','2026-08-27','2026-09-10','Returned'),
('IS116','ST071','BK051','LIB010','2026-08-28','2026-09-11','Issued'),
('IS117','ST056','BK134','LIB003','2026-08-28','2026-09-11','Returned'),
('IS118','ST024','BK001','LIB007','2026-08-29','2026-09-12','Issued'),
('IS119','ST086','BK177','LIB005','2026-08-29','2026-09-12','Returned'),
('IS120','ST046','BK091','LIB008','2026-08-30','2026-09-13','Issued'),
('IS121','ST018','BK107','LIB001','2026-08-30','2026-09-13','Overdue'),
('IS122','ST094','BK031','LIB006','2026-08-31','2026-09-14','Returned'),
('IS123','ST059','BK173','LIB010','2026-08-31','2026-09-14','Issued'),
('IS124','ST007','BK012','LIB002','2026-09-01','2026-09-15','Returned'),
('IS125','ST082','BK143','LIB004','2026-09-01','2026-09-15','Issued'),
('IS126','ST031','BK102','LIB009','2026-09-02','2026-09-16','Returned'),
('IS127','ST065','BK190','LIB003','2026-09-02','2026-09-16','Issued'),
('IS128','ST100','BK091','LIB005','2026-09-03','2026-09-17','Returned'),
('IS129','ST014','BK054','LIB001','2026-09-03','2026-09-17','Issued'),
('IS130','ST052','BK068','LIB008','2026-09-04','2026-09-18','Overdue'),
('IS131','ST078','BK001','LIB010','2026-09-04','2026-09-18','Returned'),
('IS132','ST023','BK031','LIB006','2026-09-05','2026-09-19','Issued'),
('IS133','ST043','BK182','LIB002','2026-09-05','2026-09-19','Returned'),
('IS134','ST060','BK089','LIB004','2026-09-06','2026-09-20','Issued'),
('IS135','ST004','BK121','LIB007','2026-09-06','2026-09-20','Returned'),
('IS136','ST084','BK198','LIB001','2026-09-07','2026-09-21','Issued'),
('IS137','ST037','BK102','LIB009','2026-09-07','2026-09-21','Returned'),
('IS138','ST091','BK041','LIB005','2026-09-08','2026-09-22','Overdue'),
('IS139','ST058','BK031','LIB003','2026-09-08','2026-09-22','Returned'),
('IS140','ST026','BK180','LIB006','2026-09-09','2026-09-23','Issued'),
('IS141','ST099','BK165','LIB010','2026-09-09','2026-09-23','Returned'),
('IS142','ST044','BK051','LIB002','2026-09-10','2026-09-24','Issued'),
('IS143','ST016','BK001','LIB004','2026-09-10','2026-09-24','Returned'),
('IS144','ST069','BK174','LIB007','2026-09-11','2026-09-25','Issued'),
('IS145','ST010','BK031','LIB001','2026-09-11','2026-09-25','Returned'),
('IS146','ST073','BK102','LIB008','2026-09-12','2026-09-26','Issued'),
('IS147','ST050','BK091','LIB003','2026-09-12','2026-09-26','Returned'),
('IS148','ST087','BK156','LIB005','2026-09-13','2026-09-27','Overdue'),
('IS149','ST001','BK171','LIB009','2026-09-13','2026-09-27','Returned'),
('IS150','ST062','BK118','LIB010','2026-09-14','2026-09-28','Issued');
INSERT INTO ReturnBook
(return_id,issue_id,return_date,fine_amount)
VALUES
('RT001','IS001','2026-07-14',0.00),
('RT002','IS003','2026-07-15',0.00),
('RT003','IS006','2026-07-17',0.00),
('RT004','IS008','2026-07-18',0.00),
('RT005','IS010','2026-07-19',0.00),
('RT006','IS013','2026-07-20',0.00),
('RT007','IS015','2026-07-21',0.00),
('RT008','IS017','2026-07-22',0.00),
('RT009','IS020','2026-07-24',0.00),
('RT010','IS022','2026-07-25',0.00),
('RT011','IS024','2026-07-27',0.00),
('RT012','IS026','2026-07-28',0.00),
('RT013','IS028','2026-07-29',0.00),
('RT014','IS030','2026-07-30',0.00),
('RT015','IS033','2026-08-01',10.00),
('RT016','IS035','2026-08-02',20.00),
('RT017','IS037','2026-08-01',0.00),
('RT018','IS040','2026-08-03',0.00),
('RT019','IS042','2026-08-04',0.00),
('RT020','IS044','2026-08-05',0.00),
('RT021','IS047','2026-08-08',10.00),
('RT022','IS049','2026-08-08',0.00),
('RT023','IS051','2026-08-08',0.00),
('RT024','IS053','2026-08-09',0.00),
('RT025','IS055','2026-08-10',0.00),
('RT026','IS058','2026-08-12',0.00),
('RT027','IS060','2026-08-13',0.00),
('RT028','IS063','2026-08-15',0.00),
('RT029','IS065','2026-08-16',10.00),
('RT030','IS067','2026-08-17',0.00),
('RT031','IS069','2026-08-18',0.00),
('RT032','IS072','2026-08-20',0.00),
('RT033','IS074','2026-08-21',0.00),
('RT034','IS076','2026-08-22',0.00),
('RT035','IS079','2026-08-24',0.00),
('RT036','IS081','2026-08-25',0.00),
('RT037','IS083','2026-08-26',0.00),
('RT038','IS085','2026-08-27',0.00),
('RT039','IS088','2026-08-29',10.00),
('RT040','IS090','2026-08-30',0.00),
('RT041','IS092','2026-08-31',0.00),
('RT042','IS094','2026-09-01',20.00),
('RT043','IS097','2026-09-02',0.00),
('RT044','IS099','2026-09-03',0.00),
('RT045','IS101','2026-09-04',0.00),
('RT046','IS103','2026-09-05',0.00),
('RT047','IS106','2026-09-07',0.00),
('RT048','IS108','2026-09-08',10.00),
('RT049','IS110','2026-09-09',0.00),
('RT050','IS112','2026-09-10',0.00),
('RT051','IS115','2026-09-12',0.00),
('RT052','IS117','2026-09-13',20.00),
('RT053','IS119','2026-09-14',0.00),
('RT054','IS122','2026-09-16',0.00),
('RT055','IS124','2026-09-17',0.00),
('RT056','IS126','2026-09-18',10.00),
('RT057','IS128','2026-09-19',0.00),
('RT058','IS131','2026-09-20',50.00);
-- single issue
SELECT
    i.issue_id,
    s.student_id,
    s.full_name AS student_name,
    s.roll_no,
    s.course,
    s.department,
    b.book_id,
    b.title,
    l.librarian_id,
    l.full_name AS librarian_name,
    i.issue_date,
    i.due_date,
    i.status,
    r.return_date,
    r.fine_amount
FROM Issue i
JOIN Student s
ON i.student_id = s.student_id
JOIN Book b
ON i.book_id = b.book_id
JOIN Librarian l
ON i.librarian_id = l.librarian_id
LEFT JOIN ReturnBook r
ON i.issue_id = r.issue_id
WHERE i.issue_id = 'IS150';
desc student;
desc librarian;
-- For all issues
SELECT
    i.issue_id,
    s.student_id,
    s.full_name AS student_name,
    s.roll_no,
    s.course,
    s.department,
    b.book_id,
    b.title,
    l.librarian_id,
    l.full_name AS librarian_name,
    i.issue_date,
    i.due_date,
    i.status,
    r.return_date,
    r.fine_amount
FROM Issue i
JOIN Student s
    ON i.student_id = s.student_id
JOIN Book b
    ON i.book_id = b.book_id
JOIN Librarian l
    ON i.librarian_id = l.librarian_id
LEFT JOIN ReturnBook r
    ON i.issue_id = r.issue_id
ORDER BY i.issue_id;
-- BASIC SQL QUERIES
-- 1. Display all student records
SELECT * FROM Student;
-- 2. Display all book records
SELECT * FROM Book;
-- 3. Display all author records
SELECT * FROM Author;
-- 4. Display all category records
SELECT * FROM Category;
-- 5. Display all publisher records
SELECT * FROM Publisher;
-- 6. Display all librarian records
SELECT * FROM Librarian;
-- 7. Display all issue records
SELECT * FROM Issue;
-- 8. Display all returned book records
SELECT * FROM ReturnBook;
-- 9. Display all Computer Science books
SELECT *
FROM Book
WHERE category_id = 'CATCS';
-- 10. Display all Database books
SELECT *
FROM Book
WHERE category_id = 'CATDB';
-- 11. Display all Artificial Intelligence books
SELECT *
FROM Book
WHERE category_id = 'CATAI';
-- 12. Display all CSE students
SELECT *
FROM Student
WHERE department = 'CSE';
-- 13. Display all AIML students
SELECT *
FROM Student
WHERE department = 'AIML';
-- 14. Display all B.Tech students
SELECT *
FROM Student
WHERE course = 'B.Tech';
-- 15. Display all Diploma students
SELECT *
FROM Student
WHERE course = 'Diploma';
-- 16. Display books published after the year 2020
SELECT *
FROM Book
WHERE publication_year > 2020;
-- 17. Display books that are currently available
SELECT *
FROM Book
WHERE available_quantity > 0;
-- 18. Display books having quantity greater than 10
SELECT *
FROM Book
WHERE quantity > 10;
-- 19. Display all books that are currently issued
SELECT *
FROM Issue
WHERE status = 'Issued';
-- 20. Display all overdue books
SELECT *
FROM Issue
WHERE status = 'Overdue';
-- 21. Display all returned issue records
SELECT *
FROM Issue
WHERE status = 'Returned';
-- 22. Display books in alphabetical order
SELECT *
FROM Book
ORDER BY title ASC;
-- 23. Display students in alphabetical order
SELECT *
FROM Student
ORDER BY full_name ASC;
-- 24. Display books with highest quantity first
SELECT *
FROM Book
ORDER BY quantity DESC;
-- 25. Display the first 10 books
SELECT *
FROM Book
LIMIT 10;

-- AGGREGATE FUNCTION QUERIES
-- 1. Count the total number of students
SELECT COUNT(*) AS Total_Students
FROM Student;
-- 2. Count the total number of books
SELECT COUNT(*) AS Total_Books
FROM Book;
-- 3. Count the total number of authors
SELECT COUNT(*) AS Total_Authors
FROM Author;
-- 4. Count the total number of publishers
SELECT COUNT(*) AS Total_Publishers
FROM Publisher;
-- 5. Count the total number of librarians
SELECT COUNT(*) AS Total_Librarians
FROM Librarian;
-- 6. Count the total number of issued records
SELECT COUNT(*) AS Total_Issues
FROM Issue;
-- 7. Count the total number of returned books
SELECT COUNT(*) AS Total_Returns
FROM ReturnBook;
-- 8. Calculate the total quantity of books in the library
SELECT SUM(quantity) AS Total_Book_Quantity
FROM Book;
-- 9. Calculate the total available books
SELECT SUM(available_quantity) AS Total_Available_Books
FROM Book;
-- 10. Find the average quantity of books
SELECT AVG(quantity) AS Average_Quantity
FROM Book;
-- 11. Find the average available quantity of books
SELECT AVG(available_quantity) AS Average_Available
FROM Book;
-- 12. Find the maximum fine collected
SELECT MAX(fine_amount) AS Maximum_Fine
FROM ReturnBook;
-- 13. Find the minimum fine collected
SELECT MIN(fine_amount) AS Minimum_Fine
FROM ReturnBook;
-- 14. Find the average fine collected
SELECT AVG(fine_amount) AS Average_Fine
FROM ReturnBook;
-- 15. Find the total fine collected
SELECT SUM(fine_amount) AS Total_Fine
FROM ReturnBook;
-- 16. Count the number of books in each category
SELECT category_id,COUNT(*) AS Total_Books
FROM Book
GROUP BY category_id;
-- 17. Count the number of students in each department
SELECT department,COUNT(*) AS Total_Students
FROM Student
GROUP BY department;
-- 18. Count the number of students in each course
SELECT course,COUNT(*) AS Total_Students
FROM Student
GROUP BY course;
-- 19. Count books based on publication year
SELECT publication_year,COUNT(*) AS Total_Books
FROM Book
GROUP BY publication_year
ORDER BY publication_year;
-- 20. Count books issued under each status
SELECT status,COUNT(*) AS Total_Records
FROM Issue
GROUP BY status;

-- WHERE, LIKE, BETWEEN, IN, DISTINCT & LIMIT QUERIES
-- 1. Display students studying in CSE department
SELECT * FROM Student
WHERE department='CSE';
-- 2. Display students studying in ECE department
SELECT * FROM Student
WHERE department='ECE';
-- 3. Display all 2nd year students
SELECT * FROM Student
WHERE year=2;
-- 4. Display books published between 2020 and 2024
SELECT * FROM Book
WHERE publication_year BETWEEN 2020 AND 2024;
-- 5. Display books with quantity between 5 and 15
SELECT * FROM Book
WHERE quantity BETWEEN 5 AND 15;
-- 6. Display books with available quantity between 1 and 10
SELECT * FROM Book
WHERE available_quantity BETWEEN 1 AND 10;
-- 7. Display students whose name starts with 'S'
SELECT * FROM Student
WHERE full_name LIKE 'S%';
-- 8. Display students whose name ends with 'Kumar'
SELECT * FROM Student
WHERE full_name LIKE '%Kumar';
-- 9. Display books whose title starts with 'Data'
SELECT * FROM Book
WHERE title LIKE 'Data%';
-- 10. Display books whose title contains 'Java'
SELECT * FROM Book
WHERE title LIKE '%Java%';
-- 11. Display books belonging to Computer Science or Database category
SELECT * FROM Book
WHERE category_id IN('CATCS','CATDB');
-- 12. Display students from CSE, AIML and IT departments
SELECT * FROM Student
WHERE department IN('CSE','AIML','IT');
-- 13. Display books not belonging to Computer Science category
SELECT * FROM Book
WHERE category_id<>'CATCS';
-- 14. Display students whose phone number starts with '98761'
SELECT * FROM Student
WHERE phone LIKE '98761%';
-- 15. Display books with quantity greater than available quantity
SELECT * FROM Book
WHERE quantity>available_quantity;
-- 16. Display distinct departments
SELECT DISTINCT department
FROM Student;
-- 17. Display distinct courses
SELECT DISTINCT course
FROM Student;
-- 18. Display the latest 10 books based on publication year
SELECT * FROM Book
ORDER BY publication_year DESC
LIMIT 10;
-- 19. Display the top 5 books with highest quantity
SELECT * FROM Book
ORDER BY quantity DESC
LIMIT 5;
-- 20. Display students whose email contains 'student'
SELECT * FROM Student
WHERE email LIKE '%student%';

-- JOIN QUERIES
-- 1. Display student details with issued books
SELECT s.student_id,s.full_name,s.roll_no,b.title,i.issue_date
FROM Student s
JOIN Issue i ON s.student_id=i.student_id
JOIN Book b ON i.book_id=b.book_id;
-- 2. Display issued books with librarian details
SELECT i.issue_id,b.title,l.full_name,i.issue_date
FROM Issue i
JOIN Book b ON i.book_id=b.book_id
JOIN Librarian l ON i.librarian_id=l.librarian_id;
-- 3. Display returned books with student details
SELECT s.full_name,b.title,r.return_date,r.fine_amount
FROM ReturnBook r
JOIN Issue i ON r.issue_id=i.issue_id
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id;
-- 4. Display book title with author name
SELECT b.book_id,b.title,a.full_name
FROM Book b
JOIN Author a ON b.author_id=a.author_id;
-- 5. Display book title with publisher name
SELECT b.book_id,b.title,p.publisher_name
FROM Book b
JOIN Publisher p ON b.publisher_id=p.publisher_id;
-- 6. Display book title with category name
SELECT b.book_id,b.title,c.category_name
FROM Book b
JOIN Category c ON b.category_id=c.category_id;
-- 7. Display student,book and librarian details
SELECT s.full_name,b.title,l.full_name
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
JOIN Librarian l ON i.librarian_id=l.librarian_id;
-- 8. Display all returned books with fine amount
SELECT s.full_name,b.title,r.fine_amount
FROM ReturnBook r
JOIN Issue i ON r.issue_id=i.issue_id
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id;
-- 9. Display overdue books with student details
SELECT s.full_name,b.title,i.due_date
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
WHERE i.status='Overdue';
-- 10. Display currently issued books
SELECT s.full_name,b.title,i.issue_date
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
WHERE i.status='Issued';
-- 11. Display complete library transaction details
SELECT i.issue_id,s.full_name,b.title,l.full_name,i.issue_date,i.due_date,i.status,r.return_date,r.fine_amount
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
JOIN Librarian l ON i.librarian_id=l.librarian_id
LEFT JOIN ReturnBook r ON i.issue_id=r.issue_id;
-- 12. Display books borrowed by B.Tech students
SELECT s.full_name,s.course,b.title
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
WHERE s.course='B.Tech';
-- 13. Display books borrowed by Diploma students
SELECT s.full_name,s.course,b.title
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
WHERE s.course='Polytechnic';
-- 14. Display students with returned books only
SELECT s.full_name,b.title,r.return_date
FROM Student s
JOIN Issue i ON s.student_id=i.student_id
JOIN ReturnBook r ON i.issue_id=r.issue_id
JOIN Book b ON i.book_id=b.book_id;
-- 15. Display books with their category and author
SELECT b.title,c.category_name,a.full_name
FROM Book b
JOIN Category c ON b.category_id=c.category_id
JOIN Author a ON b.author_id=a.author_id;
-- 16. Display books with publisher and author
SELECT b.title,p.publisher_name,a.full_name
FROM Book b
JOIN Publisher p ON b.publisher_id=p.publisher_id
JOIN Author a ON b.author_id=a.author_id;
-- 17. Display librarian wise issued books
SELECT l.full_name,b.title,i.issue_date
FROM Issue i
JOIN Librarian l ON i.librarian_id=l.librarian_id
JOIN Book b ON i.book_id=b.book_id;
-- 18. Display students with book category
SELECT s.full_name,c.category_name,b.title
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
JOIN Category c ON b.category_id=c.category_id;
-- 19. Display return details with librarian
SELECT l.full_name,s.full_name,b.title,r.return_date
FROM ReturnBook r
JOIN Issue i ON r.issue_id=i.issue_id
JOIN Librarian l ON i.librarian_id=l.librarian_id
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id;
-- 20. Display complete student borrowing history
SELECT s.full_name,b.title,i.issue_date,i.due_date,i.status,r.return_date
FROM Student s
JOIN Issue i ON s.student_id=i.student_id
JOIN Book b ON i.book_id=b.book_id
LEFT JOIN ReturnBook r ON i.issue_id=r.issue_id
ORDER BY s.full_name;

-- GROUP BY & HAVING QUERIES
-- 1. Count the number of books in each category
SELECT category_id,COUNT(*) AS Total_Books
FROM Book
GROUP BY category_id;
-- 2. Count the number of students in each department
SELECT department,COUNT(*) AS Total_Students
FROM Student
GROUP BY department;
-- 3. Count the number of students in each course
SELECT course,COUNT(*) AS Total_Students
FROM Student
GROUP BY course;
-- 4. Count the number of books issued by each librarian
SELECT librarian_id,COUNT(*) AS Total_Issued
FROM Issue
GROUP BY librarian_id;
-- 5. Count the number of books borrowed by each student
SELECT student_id,COUNT(*) AS Total_Borrowed
FROM Issue
GROUP BY student_id;
-- 6. Count the number of issued books based on status
SELECT status,COUNT(*) AS Total_Records
FROM Issue
GROUP BY status;
-- 7. Display departments having more than 10 students
SELECT department,COUNT(*) AS Total_Students
FROM Student
GROUP BY department
HAVING COUNT(*)>10;
-- 8. Display categories having more than 15 books
SELECT category_id,COUNT(*) AS Total_Books
FROM Book
GROUP BY category_id
HAVING COUNT(*)>15;
-- 9. Display librarians who issued more than 10 books
SELECT librarian_id,COUNT(*) AS Total_Issued
FROM Issue
GROUP BY librarian_id
HAVING COUNT(*)>10;
-- 10. Display students who borrowed more than one book
SELECT student_id,COUNT(*) AS Total_Borrowed
FROM Issue
GROUP BY student_id
HAVING COUNT(*)>1;
-- 11. Display publication years having more than 5 books
SELECT publication_year,COUNT(*) AS Total_Books
FROM Book
GROUP BY publication_year
HAVING COUNT(*)>5;
-- 12. Display categories with average quantity greater than 8
SELECT category_id,AVG(quantity) AS Average_Quantity
FROM Book
GROUP BY category_id
HAVING AVG(quantity)>8;
-- 13. Display departments with average year greater than 2
SELECT department,AVG(year) AS Average_Year
FROM Student
GROUP BY department
HAVING AVG(year)>2;
-- 14. Display issue dates having more than one issue
SELECT issue_date,COUNT(*) AS Total_Issues
FROM Issue
GROUP BY issue_date
HAVING COUNT(*)>1;
-- 15. Display return dates having more than one return
SELECT return_date,COUNT(*) AS Total_Returns
FROM ReturnBook
GROUP BY return_date
HAVING COUNT(*)>1;

-- SUBQUERY QUERIES
-- 1. Display the book(s) with the maximum quantity
SELECT *
FROM Book
WHERE quantity=(SELECT MAX(quantity) FROM Book);
-- 2. Display the book(s) with the minimum quantity
SELECT *
FROM Book
WHERE quantity=(SELECT MIN(quantity) FROM Book);
-- 3. Display the student(s) who borrowed the maximum number of books
SELECT student_id,COUNT(*) AS Total_Borrowed
FROM Issue
GROUP BY student_id
HAVING COUNT(*)=(SELECT MAX(Total_Borrowed)
FROM(SELECT COUNT(*) AS Total_Borrowed
FROM Issue
GROUP BY student_id) AS BorrowCount);
-- 4. Display the highest fine amount details
SELECT *
FROM ReturnBook
WHERE fine_amount=(SELECT MAX(fine_amount)
FROM ReturnBook);
-- 5. Display books published in the latest year
SELECT *
FROM Book
WHERE publication_year=(SELECT MAX(publication_year)
FROM Book);
-- 6. Display students who have borrowed at least one book
SELECT *
FROM Student
WHERE student_id IN(SELECT student_id
FROM Issue);
-- 7. Display students who have never borrowed any book
SELECT *
FROM Student
WHERE student_id NOT IN(SELECT student_id
FROM Issue);
-- 8. Display books that have never been issued
SELECT *
FROM Book
WHERE book_id NOT IN(SELECT book_id
FROM Issue);
-- 9. Display librarians who have issued books
SELECT *
FROM Librarian
WHERE librarian_id IN(SELECT librarian_id
FROM Issue);
-- 10. Display books having quantity greater than the average quantity
SELECT *
FROM Book
WHERE quantity>(SELECT AVG(quantity)
FROM Book);
-- 11. Display books having available quantity less than the average available quantity
SELECT *
FROM Book
WHERE available_quantity<(SELECT AVG(available_quantity)
FROM Book);
-- 12. Display students from the department having the maximum number of students
SELECT *
FROM Student
WHERE department=(SELECT department
FROM Student
GROUP BY department
ORDER BY COUNT(*) DESC
LIMIT 1);
-- 13. Display the earliest published books
SELECT *
FROM Book
WHERE publication_year=(SELECT MIN(publication_year)
FROM Book);
-- 14. Display issue records of the latest issue date
SELECT *
FROM Issue
WHERE issue_date=(SELECT MAX(issue_date)
FROM Issue);
-- 15. Display return records with the latest return date
SELECT *
FROM ReturnBook
WHERE return_date=(SELECT MAX(return_date)
FROM ReturnBook);

-- VIEWS
-- 1. Create a view to display all available books
CREATE VIEW AvailableBooks AS
SELECT book_id,title,available_quantity
FROM Book
WHERE available_quantity>0;
-- Display the AvailableBooks view
SELECT * FROM AvailableBooks;
-- 2. Create a view to display all issued books
CREATE VIEW IssuedBooks AS
SELECT i.issue_id,s.full_name,b.title,i.issue_date,i.due_date,i.status
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id;
-- Display the IssuedBooks view
SELECT * FROM IssuedBooks;
-- 3. Create a view to display returned books
CREATE VIEW ReturnedBooks AS
SELECT r.return_id,s.full_name,b.title,r.return_date,r.fine_amount
FROM ReturnBook r
JOIN Issue i ON r.issue_id=i.issue_id
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id;
-- Display the ReturnedBooks view
SELECT * FROM ReturnedBooks;
-- 4. Create a view to display overdue books
CREATE VIEW OverdueBooks AS
SELECT s.full_name,b.title,i.issue_date,i.due_date
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
WHERE i.status='Overdue';
-- Display the OverdueBooks view
SELECT * FROM OverdueBooks;
-- 5. Create a view to display complete library transactions
CREATE VIEW LibraryTransactions AS
SELECT i.issue_id,s.full_name,b.title,l.full_name AS librarian_name,i.issue_date,i.due_date,i.status,r.return_date,r.fine_amount
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
JOIN Librarian l ON i.librarian_id=l.librarian_id
LEFT JOIN ReturnBook r ON i.issue_id=r.issue_id;
-- Display the LibraryTransactions view
SELECT * FROM LibraryTransactions;

-- STORED PROCEDURES
-- 1. Display all students
DELIMITER $$
CREATE PROCEDURE GetAllStudents()
BEGIN
SELECT * FROM Student;
END$$
DELIMITER ;
CALL GetAllStudents();
-- 2. Display all books
DELIMITER $$
CREATE PROCEDURE GetAllBooks()
BEGIN
SELECT * FROM Book;
END$$
DELIMITER ;
CALL GetAllBooks();
-- 3. Display all issued books
DELIMITER $$
CREATE PROCEDURE GetIssuedBooks()
BEGIN
SELECT *
FROM Issue
WHERE status='Issued';
END$$
DELIMITER ;
CALL GetIssuedBooks();
-- 4. Display all overdue books
DELIMITER $$
CREATE PROCEDURE GetOverdueBooks()
BEGIN
SELECT *
FROM Issue
WHERE status='Overdue';
END$$
DELIMITER ;
CALL GetOverdueBooks();
-- 5. Display books by category
DELIMITER $$
CREATE PROCEDURE GetBooksByCategory(IN CatID CHAR(6))
BEGIN
SELECT *
FROM Book
WHERE category_id=CatID;
END$$
DELIMITER ;
CALL GetBooksByCategory('CATCS');
-- 6. Display students by department
DELIMITER $$
CREATE PROCEDURE GetStudentsByDepartment(IN Dept VARCHAR(50))
BEGIN
SELECT *
FROM Student
WHERE department=Dept;
END$$
DELIMITER ;
CALL GetStudentsByDepartment('CSE');
-- 7. Display books by publication year
DELIMITER $$
CREATE PROCEDURE GetBooksByYear(IN PubYear YEAR)
BEGIN
SELECT *
FROM Book
WHERE publication_year=PubYear;
END$$
DELIMITER ;
CALL GetBooksByYear(2024);
-- 8. Display return details
DELIMITER $$
CREATE PROCEDURE GetReturnDetails()
BEGIN
SELECT *
FROM ReturnBook;
END$$
DELIMITER ;
CALL GetReturnDetails();
-- 9. Display books with available quantity
DELIMITER $$
CREATE PROCEDURE GetAvailableBooks()
BEGIN
SELECT *
FROM Book
WHERE available_quantity>0;
END$$
DELIMITER ;
CALL GetAvailableBooks();
-- 10. Display complete library transactions
DELIMITER $$
CREATE PROCEDURE GetLibraryTransactions()
BEGIN
SELECT i.issue_id,s.full_name,b.title,l.full_name AS librarian_name,i.issue_date,i.due_date,i.status,r.return_date,r.fine_amount
FROM Issue i
JOIN Student s ON i.student_id=s.student_id
JOIN Book b ON i.book_id=b.book_id
JOIN Librarian l ON i.librarian_id=l.librarian_id
LEFT JOIN ReturnBook r ON i.issue_id=r.issue_id;
END$$
DELIMITER ;
CALL GetLibraryTransactions();

-- FUNCTIONS
-- 1. Function to calculate total fine collected
DELIMITER $$
CREATE FUNCTION TotalFine()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE Total DECIMAL(10,2);
SELECT SUM(fine_amount) INTO Total
FROM ReturnBook;
RETURN IFNULL(Total,0);
END$$
DELIMITER ;
SELECT TotalFine();
-- 2. Function to count total books
DELIMITER $$
CREATE FUNCTION TotalBooks()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE Total INT;
SELECT COUNT(*) INTO Total
FROM Book;
RETURN Total;
END$$
DELIMITER ;
SELECT TotalBooks();
-- 3. Function to count total students
DELIMITER $$
CREATE FUNCTION TotalStudents()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE Total INT;
SELECT COUNT(*) INTO Total
FROM Student;
RETURN Total;
END$$
DELIMITER ;
SELECT TotalStudents();
-- 4. Function to count total issue records
DELIMITER $$
CREATE FUNCTION TotalIssues()
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE Total INT;
SELECT COUNT(*) INTO Total
FROM Issue;
RETURN Total;
END$$
DELIMITER ;
SELECT TotalIssues();
-- 5. Function to return maximum fine
DELIMITER $$
CREATE FUNCTION MaximumFine()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE Fine DECIMAL(10,2);
SELECT MAX(fine_amount) INTO Fine
FROM ReturnBook;
RETURN IFNULL(Fine,0);
END$$
DELIMITER ;
SELECT MaximumFine();

-- TRIGGERS
-- 1. Automatically decrease available quantity when a book is issued
DELIMITER $$
CREATE TRIGGER trg_BookIssue
AFTER INSERT ON Issue
FOR EACH ROW
BEGIN
UPDATE Book
SET available_quantity=available_quantity-1
WHERE book_id=NEW.book_id;
END$$
DELIMITER ;
-- 2. Automatically increase available quantity when a book is returned
DELIMITER $$
CREATE TRIGGER trg_BookReturn
AFTER INSERT ON ReturnBook
FOR EACH ROW
BEGIN
UPDATE Book b
JOIN Issue i ON b.book_id=i.book_id
SET b.available_quantity=available_quantity+1
WHERE i.issue_id=NEW.issue_id;
END$$
DELIMITER ;
-- Test Trigger 1
INSERT INTO Issue(issue_id,student_id,book_id,librarian_id,issue_date,due_date,status)
VALUES('IS151','ST001','BK001','LIB001','2026-10-01','2026-10-15','Issued');
SELECT book_id,title,quantity,available_quantity
FROM Book
WHERE book_id='BK001';
-- Test Trigger 2
INSERT INTO ReturnBook(return_id,issue_id,return_date,fine_amount)
VALUES('RT059','IS151','2026-10-10',0.00);
SELECT book_id,title,quantity,available_quantity
FROM Book
WHERE book_id='BK001';
show tables;