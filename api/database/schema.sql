DROP USER IF EXISTS 'spt_tracker'@'localhost';
CREATE USER 'spt_tracker'@'localhost' IDENTIFIED BY 'test';
DROP DATABASE IF EXISTS spthesis;
CREATE DATABASE spthesis;
GRANT SUPER ON *.* TO 'spt_tracker'@'localhost';
GRANT ALL PRIVILEGES ON spthesis.* TO 'spt_tracker'@'localhost' WITH GRANT OPTION;
USE spthesis;

CREATE TABLE adviser (
  employee_number VARCHAR(10) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  middle_name VARCHAR(20) NOT NULL,
  college VARCHAR(5) NOT NULL,
  department VARCHAR(7) NOT NULL,
  CONSTRAINT adviser_employee_number_pk
    PRIMARY KEY(employee_number)
);

CREATE TABLE adviser_mastery (
  employee_number VARCHAR(10) NOT NULL,
  field_of_mastery VARCHAR(255) NOT NULL,
  CONSTRAINT adviser_employee_number_field_pk
    PRIMARY KEY(employee_number, field_of_mastery)
);

CREATE TABLE student (
  student_number VARCHAR(10) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  middle_name VARCHAR(20) NOT NULL,
  course VARCHAR(6) NOT NULL,
  employee_number VARCHAR(20) NOT NULL,
  CONSTRAINT student_student_number_pk
    PRIMARY KEY(student_number),
  CONSTRAINT student_employee_number_fk
    FOREIGN KEY(employee_number)
    REFERENCES adviser(employee_number)
);

CREATE TABLE student_interest (
  student_number VARCHAR(10) NOT NULL,
  field_of_interest VARCHAR(255) NOT NULL,
  CONSTRAINT student_interest_student_number_pk
    PRIMARY KEY(student_number, field_of_interest)
);

CREATE TABLE paper (
  call_number VARCHAR(20) NOT NULL,
  title VARCHAR(100) NOT NULL,
  classification VARCHAR(20) NOT NULL,
  date_published DATE NOT NULL,
  grade FLOAT(3) NOT NULL,
  isBest BOOL NOT NULL,
  isBestPoster BOOL NOT NULL,
  student_number VARCHAR(10) NOT NULL,
  CONSTRAINT paper_call_number_pk
    PRIMARY KEY(call_number),
  CONSTRAINT paper_student_number_fk
    FOREIGN KEY(student_number)
    REFERENCES student(student_number)
);

CREATE TABLE paper_panel (
  call_number VARCHAR(20) NOT NULL,
  presentation_date date NOT NULL,
  presentation_place VARCHAR(255) NOT NULL,
  CONSTRAINT paper_panel_call_employee_number_pk
    PRIMARY KEY(call_number)
);

CREATE TABLE paper_panel_adviser (
  call_number VARCHAR(20) NOT NULL,
  employee_number VARCHAR(20) NOT NULL,
  CONSTRAINT paper_panel_adviser_call_employee_number_pk
    PRIMARY KEY(call_number, employee_number)
);

CREATE TABLE co_authored_by_student (
  call_number VARCHAR(20) NOT NULL,
  student_number VARCHAR(10) NOT NULL,
  CONSTRAINT co_authored_call_student_number_pk
    PRIMARY KEY(call_number, student_number)
);

CREATE TABLE co_authored_by_adviser (
  call_number VARCHAR(20) NOT NULL,
  employee_number VARCHAR(20) NOT NULL,
  CONSTRAINT co_authored_call_employee_number_pk
    PRIMARY KEY(call_number, employee_number)
);

INSERT INTO adviser
VALUES ('12345-1001', 'Albacea', 'John Patrick', 'VJ', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1002', 'Bawagan', 'Juan Miguel III', 'J', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1003', 'Clarino', 'Maria Art Antonette', 'D', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1004', 'Hermocilla', 'Joseph Anthony', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1005', 'Khan', 'Concepcion', 'L', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1006', 'Drio', 'Donnalyn', 'F', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1007', 'Poserio', 'Clinton', 'M', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1008', 'Eusebio', 'Rosemarie', 'A', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1009', 'Naag', 'Alice', 'B', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1010', 'Roxas', 'Jean Mark', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1011', 'de Guzman', 'Rowena', 'R', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1012', 'San Jose', 'Edna', 'J', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1013', 'Ayao', 'John Mark', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1014', 'Borja', 'Christopher John', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1015', 'Garcia', 'Joshua', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1016', 'Villanueva', 'Christian', 'Y', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1017', 'Garcia', 'Joshua', 'A', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1018', 'Cruz', 'Hans', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1019', 'Fernandez', 'Francis Mark', 'O', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1020', 'Roxas', 'Jean Mark', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1021', 'Aspe', 'Christian Drei', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1022', 'Huit', 'Emman Benedict', 'I', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1023', 'Barrameda', 'Richard Rey', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1024', 'Carpio', 'Erika Faye', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1025', 'Degamon', 'Lea May', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1026', 'Infante', 'Adrian', 'R', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1027', 'del Rosario', 'Maya', 'A', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1028', 'Evangelista', 'Hannah', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1029', 'Benavidez', 'Jan Nicole', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1030', 'Mendoza', 'Danilo', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1031', 'Ocampo', 'Mark Richard', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1032', 'Bautista', 'Hana', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1033', 'Torres', 'Rowena Lana', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1034', 'Santos', 'Christian', 'Y', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1035', 'Tan', 'Marissa', 'L', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1036', 'dela Cruz', 'Salem', 'P', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1037', 'Ong', 'John Michael', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1038', 'Soriano', 'Julia', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1039', 'Javier', 'Juan Jim', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1040', 'Domingo', 'Berna', 'A', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1041', 'Sy', 'Jan', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1042', 'Enriquez', 'Mark Anthony', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1043', 'Sierra', 'Cardo', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1044', 'Salazar', 'Tess', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1045', 'Mendiola', 'Han Ciel', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1046', 'Padilla', 'Jun', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1047', 'Mariano', 'Marvin', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1048', 'Corpuz', 'Mark Kim', 'I', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1049', 'Atienza', 'Joshua', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1050', 'Medina', 'Martin Bart', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1051', 'Ang', 'Carl Aaron', 'VJ', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1052', 'Rosales', 'Jean', 'J', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1053', 'Valencia', 'Armin', 'D', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1054', 'Manuel', 'Josh Jan', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1055', 'Fajardo', 'Richard', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1056', 'Pineda', 'Juan', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1057', 'Yu', 'Lin Ann', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1058', 'Samson', 'Robin', 'R', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1059', 'Chua', 'Bryan Joshua', 'A', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1060', 'Dizon', 'Lana', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1061', 'Francisco', 'Mark', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1062', 'Salvador', 'Lea', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1063', 'Legaspi', 'Maria Lea', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1064', 'Alcantara', 'Sean', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1065', 'de Jesus', 'Erik', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1066', 'Rosales', 'Hana', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1067', 'Cruz', 'Shana', 'A', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1068', 'Mendoza', 'Ariel', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1069', 'Reyes', 'Marc Joesph', 'O', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1070', 'Ciron', 'Ian', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1071', 'Cortez', 'Maria', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1072', 'Huit', 'Emman Benedict', 'I', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1073', 'Aguilar', 'Sean Josh', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1074', 'Mercado', 'Tim', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1075', 'Magnaye', 'Kevin Josh', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1076', 'Quiachon', 'Marc', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1077', 'Gaza', 'Rick', 'I', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1078', 'Chua', 'Morty', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1079', 'Ocampo', 'Ian Joshua', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1080', 'Barrientos', 'Alona', 'VJ', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1081', 'Faundo', 'Axcel', 'J', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1082', 'dela Cruz', 'Sena', 'D', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1083', 'Tan', 'Hannah', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1084', 'Robredo', 'Ariel', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1085', 'de Guzman', 'Ian', 'R', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1086', 'San Jose', 'Lana', 'J', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1087', 'Cortez', 'Joshua', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1088', 'Barrameda', 'Chris Ian', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1089', 'Barrientos', 'Joanna', 'N', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1090', 'Salazar', 'Ciel', 'Y', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1091', 'Garcia', 'Shun', 'A', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1092', 'Roxas', 'Lance Christopher', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1093', 'Gagpanan', 'Joshua', 'S', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1094', 'Argote', 'Jin', 'I', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1095', 'Mendiola', 'Kim', 'G', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1096', 'Ciron', 'Joseph', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1097', 'Perez', 'Camille', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1098', 'Francisco', 'Axel', 'T', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1099', 'Reyes', 'Minda', 'C', 'CAS', 'ICS');
INSERT INTO adviser
VALUES ('12345-1100', 'Roxas', 'Carmen Julia', 'S', 'CAS', 'ICS');

/* insert on adviser mastery */
INSERT INTO adviser_mastery
VALUES ('12345-1001', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1001', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1002', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1002', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1003', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1003', 'Numerical Computation');
INSERT INTO adviser_mastery
VALUES ('12345-1003', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1004', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1004', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1005', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1005', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1005', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1006', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1006', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1007', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1007', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1008', 'Software Development');
INSERT INTO adviser_mastery
VALUES ('12345-1008', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1009', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1009', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1010', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1010', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1011', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1011', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1012', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1012', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1013', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1014', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1015', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1015', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1016', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1016', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1017', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1018', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1018', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1019', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1019', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1020', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1020', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1020', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1021', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1021', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1022', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1022', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1023', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1023', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1024', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1024', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1025', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1025', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1026', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1027', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1027', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1028', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1028', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1029', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1029', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1029', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1030', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1030', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1031', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1031', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1032', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1032', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1033', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1033', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1034', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1035', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1035', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1035', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1036', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1036', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1037', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1038', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1038', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1039', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1039', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1040', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1041', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1041', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1042', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1042', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1043', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1044', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1044', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1045', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1045', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1046', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1047', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1047', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1047', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1048', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1049', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1049', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1050', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1050', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1051', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1052', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1052', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1052', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1053', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1053', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1054', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1054', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1055', 'Software Development');
INSERT INTO adviser_mastery
VALUES ('12345-1055', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1056', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1056', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1057', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1057', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1058', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1058', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1058', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1059', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1059', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1060', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1060', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1061', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1061', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1062', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1062', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1063', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1064', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1064', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1065', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1065', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1066', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1067', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1067', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1068', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1068', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1069', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1069', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1070', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1070', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1070', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1071', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1072', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1072', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1073', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1074', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1075', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1076', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1077', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1077', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1078', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1078', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1079', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1079', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1079', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1080', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1080', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1081', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1082', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1082', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1083', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1084', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1084', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1085', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1085', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1086', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1087', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1087', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1087', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1088', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1089', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1089', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1090', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1090', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1091', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1091', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1092', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1092', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1093', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1094', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1094', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1095', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1095', 'Information Technology');
INSERT INTO adviser_mastery
VALUES ('12345-1096', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1097', 'Digital Image Processing');
INSERT INTO adviser_mastery
VALUES ('12345-1097', 'Robotics');
INSERT INTO adviser_mastery
VALUES ('12345-1098', 'Cloud and Distributed Computing');
INSERT INTO adviser_mastery
VALUES ('12345-1098', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1099', 'Advanced Databases');
INSERT INTO adviser_mastery
VALUES ('12345-1099', 'Artificial Intelligence');
INSERT INTO adviser_mastery
VALUES ('12345-1099', 'Web Designing');
INSERT INTO adviser_mastery
VALUES ('12345-1100', 'Programming Languages');
INSERT INTO adviser_mastery
VALUES ('12345-1100', 'Web Designing');

/* insert on student */
INSERT INTO student
VALUES ('2015-12345', 'Gaza', 'John Cedric', 'C', 'BSCS', '12345-1003');
INSERT INTO student
VALUES ('2015-23456', 'Cortez', 'Clarisse Sydney', 'B', 'BSCS', '12345-1006');
INSERT INTO student
VALUES ('2015-34567', 'Mirandilla', 'Meagan', 'A', 'BSCS', '12345-1001');
INSERT INTO student
VALUES ('2015-45678', 'Custodio', 'Alexander', 'B', 'BSCS', '12345-1005');
INSERT INTO student
VALUES ('2015-56789', 'Jueves', 'Kim Jushua', 'N', 'BSCS', '12345-1004');
INSERT INTO student
VALUES ('2015-67890', 'Aytona', 'Aaron Carl', 'I', 'BSCS', '12345-1008');
INSERT INTO student
VALUES ('2015-78901', 'Carillo', 'Sean Joshua', 'N', 'BSCS', '12345-1007');
INSERT INTO student
VALUES ('2015-89012', 'Dayo', 'Kimberly', 'M', 'BSCS', '12345-1002');
INSERT INTO student
VALUES ('2015-90123', 'Vibar', 'Vanessa Mae', 'W', 'BSCS', '12345-1010');
INSERT INTO student
VALUES ('2015-01234', 'Argote', 'Benedict Ian', 'N', 'BSCS', '12345-1009');
INSERT INTO student
VALUES ('2015-54321', 'Tapan', 'Tim', 'Q', 'BSCS', '12345-1012');
INSERT INTO student
VALUES ('2015-65432', 'Mercado', 'Mark Joseph', 'V', 'BSCS', '12345-1011');
INSERT INTO student
VALUES ('2015-76543', 'Rustia', 'Eugene Mar', 'O', 'BSCS', '12345-1014');
INSERT INTO student
VALUES ('2015-87654', 'Mallapre', 'Anne', 'U', 'BSCS', '12345-1013');
INSERT INTO student
VALUES ('2015-98765', 'Matias', 'Mel Gabriel', 'A', 'BSCS', '12345-1016');
INSERT INTO student
VALUES ('2015-09876', 'Rustia', 'Eugene Mark', 'D', 'BSCS', '12345-1015');
INSERT INTO student
VALUES ('2015-10987', 'Vibar', 'Joy', 'G', 'BSCS', '12345-1020');
INSERT INTO student
VALUES ('2015-21098', 'Arce', 'Mary Anne', 'E', 'BSCS', '12345-1018');
INSERT INTO student
VALUES ('2015-32109', 'Zapanta', 'Juan', 'K', 'BSCS', '12345-1017');
INSERT INTO student
VALUES ('2015-43210', 'Golpe', 'Arnel', 'I', 'BSCS', '12345-1019');
INSERT INTO student
VALUES ('2015-12321', 'Anselmo', 'Francheska May', 'I', 'BSCS', '12345-1021');
INSERT INTO student
VALUES ('2015-23432', 'Reyes', 'Coleen', 'A', 'BSCS', '12345-1022');
INSERT INTO student
VALUES ('2015-34543', 'de la Pena', 'Mary Ann', 'L', 'BSCS', '12345-1023');
INSERT INTO student
VALUES ('2015-45654', 'Romero', 'Jasper', 'M', 'BSCS', '12345-1024');
INSERT INTO student
VALUES ('2015-56765', 'Rubio', 'Mark Benedict', 'J', 'BSCS', '12345-1025');
INSERT INTO student
VALUES ('2015-67876', 'Soler', 'Jan Xavier', 'D', 'BSCS', '12345-1026');
INSERT INTO student
VALUES ('2015-78987', 'Petalio', 'Gian', 'G', 'BSCS', '12345-1027');
INSERT INTO student
VALUES ('2015-89098', 'de la Rosa', 'Jan', 'C', 'BSCS', '12345-1028');
INSERT INTO student
VALUES ('2015-90109', 'Comprado', 'Cristian Dale', 'P', 'BSCS', '12345-1029');
INSERT INTO student
VALUES ('2015-01210', 'Lillo', 'Mary Monica', 'R', 'BSCS', '12345-1030');
INSERT INTO student
VALUES ('2015-10901', 'Edgeworth', 'Miles', 'J', 'BSCS', '12345-1031');
INSERT INTO student
VALUES ('2015-21012', 'Wright', 'Phoenix', 'D', 'BSCS', '12345-1032');
INSERT INTO student
VALUES ('2015-32123', 'Fey', 'Maya', 'C', 'BSCS', '12345-1033');
INSERT INTO student
VALUES ('2015-43234', 'Fey', 'Mia', 'G', 'BSCS', '12345-1034');
INSERT INTO student
VALUES ('2015-54345', 'Potter', 'Harry', 'R', 'BSCS', '12345-1035');
INSERT INTO student
VALUES ('2015-65456', 'Everdeen', 'Katniss', 'J', 'BSCS', '12345-1036');
INSERT INTO student
VALUES ('2015-76567', 'Min', 'Pagan', 'G', 'BSCS', '12345-1037');
INSERT INTO student
VALUES ('2015-87678', 'Saihara', 'Shuuichi', 'T', 'BSCS', '12345-1038');
INSERT INTO student
VALUES ('2015-98789', 'Ouma', 'Kokichi', 'N', 'BSCS', '12345-1039');
INSERT INTO student
VALUES ('2015-09890', 'Hinata', 'Hajime', 'Y', 'BSCS', '12345-1040');
INSERT INTO student
VALUES ('2015-11223', 'Uzumaki', 'Naruto', 'A', 'BSCS', '12345-1041');
INSERT INTO student
VALUES ('2015-22334', 'Uchiha', 'Sasuke', 'C', 'BSCS', '12345-1042');
INSERT INTO student
VALUES ('2015-33445', 'Kurosaki', 'Ichigo', 'S', 'BSCS', '12345-1043');
INSERT INTO student
VALUES ('2015-44556', 'Luffy', 'Monkey', 'D', 'BSCS', '12345-1044');
INSERT INTO student
VALUES ('2015-55667', 'Zoro', 'Ronoroa', 'G', 'BSCS', '12345-1045');
INSERT INTO student
VALUES ('2015-66778', 'Robin', 'Nico', 'T', 'BSCS', '12345-1046');
INSERT INTO student
VALUES ('2015-77889', 'Houtarou', 'Oreki', 'C', 'BSCS', '12345-1047');
INSERT INTO student
VALUES ('2015-88990', 'Chitanda', 'Eru', 'T', 'BSCS', '12345-1048');
INSERT INTO student
VALUES ('2015-99001', 'Suzumiya', 'Haruhi', 'C', 'BSCS', '12345-1049');
INSERT INTO student
VALUES ('2015-00112', 'Nagato', 'Yuki', 'S', 'BSCS', '12345-1050');
INSERT INTO student
VALUES ('2015-11009', 'Ryuuguu', 'Rena', 'S', 'BSCS', '12345-1051');
INSERT INTO student
VALUES ('2015-22110', 'Furude', 'Rika', 'I', 'BSCS', '12345-1052');
INSERT INTO student
VALUES ('2015-33221', 'Ushiromiya', 'Battler', 'G', 'BSCS', '12345-1053');
INSERT INTO student
VALUES ('2015-44332', 'Frederica', 'Bernkastel', 'T', 'BSCS', '12345-1054');
INSERT INTO student
VALUES ('2015-55443', 'Komaeda', 'Nagito', 'C', 'BSCS', '12345-1055');
INSERT INTO student
VALUES ('2015-66554', 'Nanami', 'Chiaki', 'S', 'BSCS', '12345-1056');
INSERT INTO student
VALUES ('2015-77665', 'Makoto', 'Naegi', 'I', 'BSCS', '12345-1057');
INSERT INTO student
VALUES ('2015-88776', 'Kirigiri', 'Kyouko', 'G', 'BSCS', '12345-1058');
INSERT INTO student
VALUES ('2015-99887', 'Katsuragi', 'Keima', 'G', 'BSCS', '12345-1059');
INSERT INTO student
VALUES ('2015-00998', 'Otonashi', 'Maria', 'VJ', 'BSCS', '12345-1060');
INSERT INTO student
VALUES ('2015-11234', 'Hoshino', 'Kazuki', 'S', 'BSCS', '12345-1061');
INSERT INTO student
VALUES ('2015-22345', 'Tanaka', 'Gundam', 'C', 'BSCS', '12345-1062');
INSERT INTO student
VALUES ('2015-33456', 'Nevermind', 'Sonia', 'G', 'BSCS', '12345-1063');
INSERT INTO student
VALUES ('2015-44567', 'Conan', 'Edogawa', 'C', 'BSCS', '12345-1064');
INSERT INTO student
VALUES ('2015-55678', 'Shinichi', 'Kudo', 'N', 'BSCS', '12345-1065');
INSERT INTO student
VALUES ('2015-66789', 'Kuroba', 'Kaito', 'N', 'BSCS', '12345-1066');
INSERT INTO student
VALUES ('2015-77890', 'Ai', 'Haibara', 'A', 'BSCS', '12345-1067');
INSERT INTO student
VALUES ('2015-88901', 'Mouri', 'Ran', 'N', 'BSCS', '12345-1068');
INSERT INTO student
VALUES ('2015-99012', 'Hakurei', 'Reimu', 'O', 'BSCS', '12345-1069');
INSERT INTO student
VALUES ('2015-00123', 'Kirisame', 'Marisa', 'C', 'BSCS', '12345-1070');
INSERT INTO student
VALUES ('2015-11098', 'Izayoi', 'Sakuya', 'G', 'BSCS', '12345-1071');
INSERT INTO student
VALUES ('2015-22109', 'Scarlet', 'Remilia', 'C', 'BSCS', '12345-1072');
INSERT INTO student
VALUES ('2015-33210', 'Scarlet', 'Flandre', 'C', 'BSCS', '12345-1073');
INSERT INTO student
VALUES ('2015-44321', 'Konpaku', 'Youmu', 'Y', 'BSCS', '12345-1073');
INSERT INTO student
VALUES ('2015-55432', 'Udongen', 'Reisen', 'L', 'BSCS', '12345-1075');
INSERT INTO student
VALUES ('2015-66543', 'Brando', 'Dio', 'P', 'BSCS', '12345-1076');
INSERT INTO student
VALUES ('2015-77654', 'Kujo', 'Jotaro', 'T', 'BSCS', '12345-1077');
INSERT INTO student
VALUES ('2015-88765', 'Joestar', 'Joseph', 'C', 'BSCS', '12345-1078');
INSERT INTO student
VALUES ('2015-99876', 'Cujoh', 'Jolyne', 'S', 'BSCS', '12345-1079');
INSERT INTO student
VALUES ('2015-00987', 'Yoshikage', 'Kira', 'A', 'BSCS', '12345-1080');
INSERT INTO student
VALUES ('2015-12344', 'Zeppeli', 'Caesar', 'VJ', 'BSCS', '12345-1081');
INSERT INTO student
VALUES ('2015-23455', 'Yazawa', 'Nico', 'J', 'BSCS', '12345-1082');
INSERT INTO student
VALUES ('2015-34566', 'Hkigaya', 'Hachiman', 'D', 'BSCS', '12345-1083');
INSERT INTO student
VALUES ('2015-45677', 'Yukinoshita', 'Yukino', 'C', 'BSCS', '12345-1084');
INSERT INTO student
VALUES ('2015-56788', 'Elric', 'Edward', 'G', 'BSCS', '12345-1085');
INSERT INTO student
VALUES ('2015-67899', 'Elric', 'Alphonse', 'T', 'BSCS', '12345-1086');
INSERT INTO student
VALUES ('2015-78900', 'Mustang', 'Roy', 'N', 'BSCS', '12345-1087');
INSERT INTO student
VALUES ('2015-89011', 'Hawkeye', 'Riza', 'R', 'BSCS', '12345-1088');
INSERT INTO student
VALUES ('2015-90122', 'Armstrong', 'Alex', 'A', 'BSCS', '12345-1089');
INSERT INTO student
VALUES ('2015-01233', 'Freecs', 'Gon', 'N', 'BSCS', '12345-1090');
INSERT INTO student
VALUES ('2015-11233', 'Zoldyck', 'Killua', 'N', 'BSCS', '12345-1091');
INSERT INTO student
VALUES ('2015-22344', 'Morow', 'Hisoka', 'S', 'BSCS', '12345-1092');
INSERT INTO student
VALUES ('2015-33455', 'Spiegel', 'Spike', 'C', 'BSCS', '12345-1093');
INSERT INTO student
VALUES ('2015-44566', 'Himura', 'Kenshin', 'G', 'BSCS', '12345-1094');
INSERT INTO student
VALUES ('2015-55677', 'Kurokami', 'Medaka', 'T', 'BSCS', '12345-1095');
INSERT INTO student
VALUES ('2015-66788', 'Kumagawa', 'Misogi', 'C', 'BSCS', '12345-1096');
INSERT INTO student
VALUES ('2015-77899', 'Sakata', 'Gintoki', 'S', 'BSCS', '12345-1097');
INSERT INTO student
VALUES ('2015-88900', 'Katsura', 'Kotarou', 'I', 'BSCS', '12345-1098');
INSERT INTO student
VALUES ('2015-99011', 'Sakamoto', 'Tatsuma', 'G', 'BSCS', '12345-1099');
INSERT INTO student
VALUES ('2015-00122', 'Takasugi', 'Shinsuke', 'B', 'BSCS', '12345-1100'); 


/* insert on student interest */
INSERT INTO student_interest
VALUES ('2015-34567', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-34567', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-89012', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-89012', 'Bioinformatics');
INSERT INTO student_interest
VALUES ('2015-12345', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-12345', 'Numerical Computation');
INSERT INTO student_interest
VALUES ('2015-12345', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-56789', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-56789', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-45678', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-45678', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-45678', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-23456', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-23456', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-78901', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-78901', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-67890', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-67890', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-01234', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-01234', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-90123', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-90123', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-65432', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-65432', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-54321', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-54321', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-87654', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-76543', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-09876', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-09876', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-98765', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-98765', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-32109', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-21098', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-21098', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-43210', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-43210', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-10987', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-10987', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-10987', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-12321', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-12321', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-23432', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-23432', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-34543', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-34543', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-45654', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-45654', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-56765', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-56765', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-67876', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-67876', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-78987', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-78987', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-89098', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-89098', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-90109', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-90109', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-01210', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-01210', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-10901', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-10901', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-21012', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-21012', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-32123', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-32123', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-43234', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-43234', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-54345', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-65456', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-65456', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-65456', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-76567', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-76567', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-87678', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-98789', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-98789', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-09890', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-09890', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-11223', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-22334', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-22334', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-33445', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-33445', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-44556', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-55667', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-55667', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-66778', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-66778', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-77889', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-77889', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-88990', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-88990', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-99001', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-00112', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-00112', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-11009', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-11009', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-22110', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-33221', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-33221', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-33221', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-44332', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-44332', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-55443', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-55443', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-66554', 'Software Development');
INSERT INTO student_interest
VALUES ('2015-66554', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-77665', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-77665', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-88776', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-88776', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-99887', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-99887', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-99887', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-00998', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-00998', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-11234', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-11234', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-22345', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-22345', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-33456', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-33456', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-44556', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-55678', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-55678', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-66789', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-66789', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-77890', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-88901', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-88901', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-99012', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-99012', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-00123', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-00123', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-11098', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-11098', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-11098', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-22109', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-33210', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-33210', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-44321', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-55432', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-66543', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-77654', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-88765', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-88765', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-99876', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-99876', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-00987', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-00987', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-00987', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-12344', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-12344', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-23455', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-34566', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-34566', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-45677', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-56788', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-56788', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-67899', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-67899', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-78900', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-89011', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-89011', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-89011', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-90122', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-01233', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-01233', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-11233', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-11233', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-22344', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-22344', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-33455', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-33455', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-44566', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-55677', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-55677', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-66788', 'Programming Languages');
INSERT INTO student_interest
VALUES ('2015-66788', 'Information Technology');
INSERT INTO student_interest
VALUES ('2015-66788', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-88900', 'Digital Image Processing');
INSERT INTO student_interest
VALUES ('2015-88900', 'Robotics');
INSERT INTO student_interest
VALUES ('2015-99011', 'Cloud and Distributed Computing');
INSERT INTO student_interest
VALUES ('2015-99011', 'Web Designing');
INSERT INTO student_interest
VALUES ('2015-00122', 'Advanced Databases');
INSERT INTO student_interest
VALUES ('2015-00122', 'Artificial Intelligence');
INSERT INTO student_interest
VALUES ('2015-00122', 'Web Designing');


INSERT INTO paper
VALUES ('ABCDE-10001', 'Towards Input Device Satisfaction Through Hand Anthropometry', 'Thesis', '2019-08-26', 1.25, false, false, '2015-12345');
INSERT INTO paper
VALUES ('ABCDE-10002', 'Cool Microsimulations of Arching, Clogging, and Burty Exit Phenomena in Crowd Dynamics', 'Thesis', '2019-08-29', 1.00, true, false, '2015-23456');
INSERT INTO paper
VALUES ('ABCDE-10003', 'Local Area Redirection Policies for a Lightweight Distributed Desktop Webgrid', 'Thesis', '2019-09-02', 1.25, false, false, '2015-34567');
INSERT INTO paper
VALUES ('ABCDE-10004', 'Finding Solutions to Different Problems Simultaneously in a Multi-molecule Simulated Reactor', 'Thesis', '2019-09-05', 1.50, true, false, '2015-45678');
INSERT INTO paper
VALUES ('ABCDE-10005', 'Comparison of DTW and HMM for Isolated Word Recognition', 'Thesis', '2019-09-08', 1.75, false, false, '2015-56789');
INSERT INTO paper
VALUES ('ABCDE-10006', 'An Analysis of Named Etity Disambiguation in Social Networks', 'Thesis', '2019-09-11', 2.00, false, false, '2015-67890');
INSERT INTO paper
VALUES ('ABCDE-10007', 'A Molecular Dynamics Heuristic for Solving the Traveling Salesperson Problem', 'Thesis', '2019-09-14', 1.75, false, false, '2015-78901');
INSERT INTO paper
VALUES ('ABCDE-10008', 'A Hybrid Graph-drawing Algorithm for Large, Naturally-clustered, Disconnected Graphs',  'Thesis', '2019-09-17', 1.50, true, false, '2015-89012');
INSERT INTO paper
VALUES ('ABCDE-10009', 'A Framework for Stereoscopic Surround Display', 'Thesis', '2019-09-20', 1.25, false, false, '2015-90123');
INSERT INTO paper
VALUES ('ABCDE-10010', 'Neural Network Classifiers for Natural Food Products', 'Thesis', '2019-09-23', 1.50, false, false, '2015-01234');
INSERT INTO paper
VALUES ('ABCDE-10011', 'Experiences in Text Search Parallelization on a Lightweight Grid', 'Thesis', '2019-09-26', 1.75, false, false, '2015-10987');
INSERT INTO paper
VALUES ('ABCDE-10012', 'Hand Anthropometric Data for Philippine-centric Keyboard Dimensions', 'Thesis', '2019-09-29', 2.00, false, false, '2015-21098');
INSERT INTO paper
VALUES ('ABCDE-10013', 'On-Web-grid Implementation Using Single System Image', 'Thesis', '2019-10-01', 2.25, false, false, '2015-32109');
INSERT INTO paper
VALUES ('ABCDE-10014', 'Reversible Sorting Networks Using Quantum Gates', 'Thesis', '2019-10-04', 2.00, false, false, '2015-43210');
INSERT INTO paper
VALUES ('ABCDE-10015', 'Synchronization of ad hoc Clock Networks', 'Thesis', '2019-10-07', 1.75, false, false, '2015-54321');
INSERT INTO paper
VALUES ('ABCDE-10016', 'Optical Recognition of Pie', 'SP', '2019-10-10', 1.50, false, false, '2015-65432');
INSERT INTO paper
VALUES ('ABCDE-10017', 'A Prototype Distributed Desktop Web Grid', 'SP', '2019-10-13', 1.75, false, false, '2015-76543');
INSERT INTO paper
VALUES ('ABCDE-10018', 'Rondalla Instruments Simulator and Wave Files Mixer', 'SP', '2019-10-16', 2.00, false, false, '2015-87654');
INSERT INTO paper
VALUES ('ABCDE-10019', 'Hand Gesture Recognition using Projection Histograms', 'SP', '2019-10-19', 2.25, false, false, '2015-98765');
INSERT INTO paper
VALUES ('ABCDE-10020', 'An Online Alumni Tracer System', 'SP', '2019-10-22', 2.50, false, false, '2015-09876');
INSERT INTO paper
VALUES ('ABCDE-10021', 'A Multimedia Archiving System for Sharing Dances and Pantomimes', 'SP', '2019-10-25', 2.25, false, false, '2015-12321');
INSERT INTO paper
VALUES ('ABCDE-10022', 'Semantic Web Multimedia Enabled Search', 'SP', '2019-10-28', 2.50, false, false, '2015-23432');
INSERT INTO paper
VALUES ('ABCDE-10023', 'Analysis of Flash Crowd and Time-of-Day Effects on the UPLB Web Server', 'SP', '2019-11-01', 2.75, false, false, '2015-34543');
INSERT INTO paper
VALUES ('ABCDE-10024', 'Operating and Delivery Room Database for UPLB University Health Service', 'SP', '2019-11-04', 2.50, false, false, '2015-45654');
INSERT INTO paper
VALUES ('ABCDE-10025', 'UPLB RegisNet Project: Registration Procedures Module', 'SP', '2019-11-07', 2.75, false, false, '2015-56765');
INSERT INTO paper
VALUES ('ABCDE-10026', 'AJAX-Based Database Management System using PHP and jQuery', 'SP', '2019-11-10', 3.00, false, false, '2015-67876');
INSERT INTO paper
VALUES ('ABCDE-10027', 'Design and Implementation of the UPLB-OVCRE Research Monitoring System', 'SP', '2019-11-13', 2.75, false, false, '2015-78987');
INSERT INTO paper
VALUES ('ABCDE-10028', 'Queue Length Estimation Using Video Analysis', 'SP', '2019-11-16', 3.00, false, false, '2015-89098');
INSERT INTO paper
VALUES ('ABCDE-10029', 'Lamina Modeling using L-Systems', 'SP', '2019-11-19', 2.50, false, false, '2015-90109');
INSERT INTO paper
VALUES ('ABCDE-10030', 'Video Similarity Detection by Video Subsequence Matching', 'SP', '2019-11-22', 1.25, false, false, '2015-01210');
INSERT INTO paper
VALUES ('ABCDE-10031', 'Study of H.264 Video Streaming over Wireless Channel using GStreamer', 'Thesis', '2019-11-25', 1.25, false, false, '2015-12345');
INSERT INTO paper
VALUES ('ABCDE-10032', 'Self-assessment Task Analyzer', 'Thesis', '2019-11-28', 1.00, true, false, '2015-23456');
INSERT INTO paper
VALUES ('ABCDE-10033', 'GIS Tool for Globalization of Baseball', 'Thesis', '2019-12-02', 1.25, false, false, '2015-34567');
INSERT INTO paper
VALUES ('ABCDE-10034', 'Informative Application on Marine Species', 'Thesis', '2019-12-05', 1.50, true, false, '2015-45678');
INSERT INTO paper
VALUES ('ABCDE-10035', 'Robotic Person Following Using Stereo Depth Sensing and Person Recognition', 'Thesis', '2019-12-08', 1.75, false, false, '2015-56789');
INSERT INTO paper
VALUES ('ABCDE-10036', 'GIS tool for Nuclear Fuel and Tidal Resources', 'Thesis', '2019-12-11', 2.00, false, false, '2015-67890');
INSERT INTO paper
VALUES ('ABCDE-10037', 'Educational Tool for Hardtop', 'Thesis', '2019-12-14', 1.75, false, false, '2015-78901');
INSERT INTO paper
VALUES ('ABCDE-10038', 'K-12 Education Data Analysis and Forecast',  'Thesis', '2019-12-17', 1.50, true, false, '2015-89012');
INSERT INTO paper
VALUES ('ABCDE-10039', 'HIV Testing Web Application', 'Thesis', '2019-12-20', 1.25, false, false, '2015-90123');
INSERT INTO paper
VALUES ('ABCDE-10040', 'Current Employment Statistics for CS Graduates and Forecast', 'Thesis', '2019-12-23', 1.50, false, false, '2015-01234');
INSERT INTO paper
VALUES ('ABCDE-10041', 'Web Version of Shape File Analysis', 'Thesis', '2019-12-26', 1.75, false, false, '2015-10987');
INSERT INTO paper
VALUES ('ABCDE-10042', 'An Indoor Navigation Aid for Visually Impaired', 'Thesis', '2019-12-29', 2.00, false, false, '2015-21098');
INSERT INTO paper
VALUES ('ABCDE-10043', 'Mobile Location Based Crime Statistics', 'Thesis', '2019-01-01', 2.25, false, false, '2015-32109');
INSERT INTO paper
VALUES ('ABCDE-10044', 'Brainwave Sensor', 'Thesis', '2019-01-04', 2.00, false, false, '2015-43210');
INSERT INTO paper
VALUES ('ABCDE-10045', 'Python Oracle Integration and Data Analysis', 'Thesis', '2019-01-07', 1.75, false, false, '2015-54321');
INSERT INTO paper
VALUES ('ABCDE-10046', 'Bioinformatics and Functional Genomics', 'SP', '2019-01-10', 1.50, false, false, '2015-65432');
INSERT INTO paper
VALUES ('ABCDE-10047', 'Bitcoin and Cryptocurrencies', 'SP', '2019-01-13', 1.75, false, false, '2015-76543');
INSERT INTO paper
VALUES ('ABCDE-10048', 'Content-Aare Search System', 'SP', '2019-01-16', 2.00, false, false, '2015-87654');
INSERT INTO paper
VALUES ('ABCDE-10049', 'Principled Optimizing Compilation of Dependently Typed Programs', 'SP', '2019-01-19', 2.25, false, false, '2015-98765');
INSERT INTO paper
VALUES ('ABCDE-10050', 'Drawing Structured Decorative Patterns by Example', 'SP', '2019-01-22', 2.50, false, false, '2015-09876');
INSERT INTO paper
VALUES ('ABCDE-10051', 'Computational Neuroscience', 'SP', '2019-01-25', 2.25, false, false, '2015-12321');
INSERT INTO paper
VALUES ('ABCDE-10052', 'Epigenome-wide Association Studies', 'SP', '2019-01-28', 2.50, false, false, '2015-23432');
INSERT INTO paper
VALUES ('ABCDE-10053', 'Geo-replicated cloud storage', 'SP', '2019-02-01', 2.75, false, false, '2015-34543');
INSERT INTO paper
VALUES ('ABCDE-10054', 'Learning with Partial Feedback', 'SP', '2019-02-04', 2.50, false, false, '2015-45654');
INSERT INTO paper
VALUES ('ABCDE-10055', 'Least Privilege Web Services', 'SP', '2019-02-07', 2.75, false, false, '2015-56765');
INSERT INTO paper
VALUES ('ABCDE-10056', 'Online Convex Optimization', 'SP', '2019-02-10', 3.00, false, false, '2015-67876');
INSERT INTO paper
VALUES ('ABCDE-10057', 'Population Structure and Matrix Factorization', 'SP', '2019-02-13', 2.75, false, false, '2015-78987');
INSERT INTO paper
VALUES ('ABCDE-10058', 'Protein Molecular Function Prediction', 'SP', '2019-02-16', 3.00, false, false, '2015-89098');
INSERT INTO paper
VALUES ('ABCDE-10059', 'Paint Compositing by Example', 'SP', '2019-02-19', 2.50, false, false, '2015-90109');
INSERT INTO paper
VALUES ('ABCDE-10060', 'Video Similarity Detection by Video Subsequence Matching', 'SP', '2019-02-22', 1.25, false, false, '2015-01210');
INSERT INTO paper
VALUES ('ABCDE-10061', 'Classification of Immunoprofiles with Combined Correlated Features Algorithm', 'Thesis', '2019-02-26', 1.25, false, false, '2015-12345');
INSERT INTO paper
VALUES ('ABCDE-10062', 'Web Portal for Clinical Psychology', 'Thesis', '2019-02-28', 1.00, true, false, '2015-23456');
INSERT INTO paper
VALUES ('ABCDE-10063', 'Workforce Prediction', 'Thesis', '2019-03-02', 1.25, false, false, '2015-34567');
INSERT INTO paper
VALUES ('ABCDE-10064', 'Cross Browser Compatibility Issues', 'Thesis', '2019-03-05', 1.50, true, false, '2015-45678');
INSERT INTO paper
VALUES ('ABCDE-10065', 'Car Registration License Plate Detection and Recognition System', 'Thesis', '2019-03-08', 1.75, false, false, '2015-56789');
INSERT INTO paper
VALUES ('ABCDE-10066', 'Generic Log Analysis Tool', 'Thesis', '2019-03-11', 2.00, false, false, '2015-67890');
INSERT INTO paper
VALUES ('ABCDE-10067', 'Advanced File Manager with Multiple Functions to Manipulate Files with Different Formats', 'Thesis', '2019-03-14', 1.75, false, false, '2015-78901');
INSERT INTO paper
VALUES ('ABCDE-10068', 'Method for Minimizing Computing Core Costs in Cloud Infrastructures',  'SP', '2019-02-17', 1.50, true, false, '2015-89012');
INSERT INTO paper
VALUES ('ABCDE-10069', 'Adaptive Server Selection in Peer to Peer Networks', 'Thesis', '2019-03-20', 1.25, false, false, '2015-90123');
INSERT INTO paper
VALUES ('ABCDE-10070', 'An Efficient Location Information Management System for Smartphone Applications', 'Thesis', '2019-03-23', 1.50, false, false, '2015-01234');
INSERT INTO paper
VALUES ('ABCDE-10071', 'Importance of Metadata in Data Warehousing', 'Thesis', '2019-03-26', 1.75, false, false, '2015-10987');
INSERT INTO paper
VALUES ('ABCDE-10072', 'Parallel Programming on a GPU Using Intel Array Building Blocks', 'Thesis', '2019-03-29', 2.00, false, false, '2015-21098');
INSERT INTO paper
VALUES ('ABCDE-10073', 'Text Classification using Machine Learning', 'Thesis', '2019-04-01', 2.25, false, false, '2015-32109');
INSERT INTO paper
VALUES ('ABCDE-10074', 'Comparative Study of Oracle Spatial and Postgres Spatial', 'Thesis', '2019-04-04', 2.00, false, false, '2015-43210');
INSERT INTO paper
VALUES ('ABCDE-10075', 'Mobile Real Estate Agent for Android', 'Thesis', '2019-04-07', 1.75, false, false, '2015-54321');
INSERT INTO paper
VALUES ('ABCDE-10076', 'Resource Allocation For Cloud Services', 'SP', '2019-04-10', 1.50, false, false, '2015-65432');
INSERT INTO paper
VALUES ('ABCDE-10077', 'Search Engine for Heterogeneous Human Gene-Expression Compendia', 'SP', '2019-04-13', 1.75, false, false, '2015-76543');
INSERT INTO paper
VALUES ('ABCDE-10078', 'Sublinear Optimization', 'SP', '2019-04-16', 2.00, false, false, '2015-87654');
INSERT INTO paper
VALUES ('ABCDE-10079', 'Verified Software Toolchain', 'SP', '2019-04-19', 2.25, false, false, '2015-98765');
INSERT INTO paper
VALUES ('ABCDE-10080', 'Big Data Analytics Applied to Track Sentimental Analysis', 'SP', '2019-04-22', 2.50, false, false, '2015-09876');
INSERT INTO paper
VALUES ('ABCDE-10081', 'Software Development Estimation Using Parametric Cost Modeling', 'SP', '2019-04-25', 2.25, false, false, '2015-12321');
INSERT INTO paper
VALUES ('ABCDE-10082', 'Data Analytics on Amazon Product Metadata', 'SP', '2019-04-28', 2.50, false, false, '2015-23432');
INSERT INTO paper
VALUES ('ABCDE-10083', 'Strategies for Drawing Dynamic Lines on Map', 'SP', '2019-05-01', 2.75, false, false, '2015-34543');
INSERT INTO paper
VALUES ('ABCDE-10084', 'Charting in Mapping', 'SP', '2019-05-04', 2.50, false, false, '2015-45654');
INSERT INTO paper
VALUES ('ABCDE-10085', 'Solving Inverse Problems by Decomposition, Classification and Simple Modelling', 'SP', '2019-05-07', 2.75, false, false, '2015-56765');
INSERT INTO paper
VALUES ('ABCDE-10086', 'Parallel Computation of Functions on Set Partition', 'SP', '2019-05-10', 3.00, false, false, '2015-67876');
INSERT INTO paper
VALUES ('ABCDE-10087', 'Designing a Better Authentication Model', 'SP', '2019-05-13', 2.75, false, false, '2015-78987');
INSERT INTO paper
VALUES ('ABCDE-10088', 'Detecting Exaggerated Rankings in Online Reviews', 'SP', '2019-05-16', 3.00, false, false, '2015-89098');
INSERT INTO paper
VALUES ('ABCDE-10089', 'Enhancing Autonomous Robotic Person Detection and Following Using Modified Hough Transform', 'SP', '2019-05-19', 2.50, false, false, '2015-90109');
INSERT INTO paper
VALUES ('ABCDE-10090', 'Coordinated Multi-Robot Security System Using Fuzzy Logic Decision Making', 'SP', '2019-05-22', 1.25, false, false, '2015-01210');
INSERT INTO paper
VALUES ('ABCDE-10091', 'Game Based Rehabilitation', 'Thesis', '2019-05-26', 1.25, false, false, '2015-12345');
INSERT INTO paper
VALUES ('ABCDE-10092', 'Improved User Interface to Display and Edit Multiple Files and Folders', 'Thesis', '2019-05-29', 1.00, true, false, '2015-23456');
INSERT INTO paper
VALUES ('ABCDE-10093', 'Local Points of Interest Using Augmented Reality', 'Thesis', '2019-06-02', 1.25, false, false, '2015-34567');
INSERT INTO paper
VALUES ('ABCDE-10094', 'Cloud Based File System on Mobile Device', 'Thesis', '2019-06-05', 1.50, true, false, '2015-45678');
INSERT INTO paper
VALUES ('ABCDE-10095', 'Smartphone and Android Internals', 'Thesis', '2019-06-08', 1.75, false, false, '2015-56789');
INSERT INTO paper
VALUES ('ABCDE-10096', 'Method for Minimizing Computing Core Costs in Cloud Infrastructures', 'SP', '2019-06-10', 3.00, false, false, '2015-67876');
INSERT INTO paper
VALUES ('ABCDE-10097', 'Design and Implementation of Workflow for Content Management System', 'SP', '2019-06-13', 2.75, false, false, '2015-78987');
INSERT INTO paper
VALUES ('ABCDE-10098', 'Customization for Mobile EBook Readers', 'SP', '2019-06-16', 3.00, false, false, '2015-89098');
INSERT INTO paper
VALUES ('ABCDE-10099', 'Design and Architecture of Visualization Service in the Cyberinfracture Web Application Framework', 'SP', '2019-06-19', 2.50, false, false, '2015-90109');
INSERT INTO paper
VALUES ('ABCDE-10100', 'An Alternative Data Structure to Line Sweep Algorithm', 'SP', '2019-06-22', 1.25, false, false, '2015-01210');

INSERT INTO paper_panel
VALUES('ABCDE-10001', '2019-08-27', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10002', '2019-08-30', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10003', '2019-09-03', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10004', '2019-09-06', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10005', '2019-09-09', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10006', '2019-09-12', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10007', '2019-09-15', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10008', '2019-09-18', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10009', '2019-09-21', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10010', '2019-09-24', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10011', '2019-09-27', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10012', '2019-09-30', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10013', '2019-10-02', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10014', '2019-10-05', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10015', '2019-10-08', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10016', '2019-10-11', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10017', '2019-10-14', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10018', '2019-10-17', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10019', '2019-10-20', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10020', '2019-10-23', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10021', '2019-10-26', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10022', '2019-10-29', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10023', '2019-11-02', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10024', '2019-11-05', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10025', '2019-11-08', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10026', '2019-11-11', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10027', '2019-11-14', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10028', '2019-11-17', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10029', '2019-11-20', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10030', '2019-11-23', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10031', '2019-11-26', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10032', '2019-11-29', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10033', '2019-12-02', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10034', '2019-12-05', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10035', '2019-12-08', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10036', '2019-12-11', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10037', '2019-12-14', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10038', '2019-12-17', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10039', '2019-12-20', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10040', '2019-12-23', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10041', '2019-12-26', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10042', '2019-12-29', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10043', '2019-01-02', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10044', '2019-01-05', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10045', '2019-01-08', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10046', '2019-01-11', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10047', '2019-01-14', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10048', '2019-01-17', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10049', '2019-01-20', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10050', '2019-01-23', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10051', '2019-01-26', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10052', '2019-01-29', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10053', '2019-02-02', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10054', '2019-02-05', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10055', '2019-02-08', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10056', '2019-02-11', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10057', '2019-02-14', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10058', '2019-02-17', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10059', '2019-02-20', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10060', '2019-02-23', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10061', '2019-02-26', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10062', '2019-03-01', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10063', '2019-03-02', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10064', '2019-03-05', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10065', '2019-03-08', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10066', '2019-03-11', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10067', '2019-03-14', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10068', '2019-03-17', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10069', '2019-03-20', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10070', '2019-03-23', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10071', '2019-03-26', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10072', '2019-03-29', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10073', '2019-04-02', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10074', '2019-04-05', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10075', '2019-04-08', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10076', '2019-04-11', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10077', '2019-04-14', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10078', '2019-04-17', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10079', '2019-04-20', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10080', '2019-04-23', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10081', '2019-04-26', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10082', '2019-04-29', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10083', '2019-05-02', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10084', '2019-05-05', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10085', '2019-05-08', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10086', '2019-05-11', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10087', '2019-05-14', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10088', '2019-05-17', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10089', '2019-05-20', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10090', '2019-05-23', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10091', '2019-05-26', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10092', '2019-05-29', 'ICS PC4');
INSERT INTO paper_panel
VALUES('ABCDE-10093', '2019-06-02', 'ICS PC5');
INSERT INTO paper_panel
VALUES('ABCDE-10094', '2019-06-05', 'ICS PC6');
INSERT INTO paper_panel
VALUES('ABCDE-10095', '2019-06-08', 'ICS PC7');
INSERT INTO paper_panel
VALUES('ABCDE-10096', '2019-06-11', 'ICS PC8');
INSERT INTO paper_panel
VALUES('ABCDE-10097', '2019-06-14', 'ICS PC1');
INSERT INTO paper_panel
VALUES('ABCDE-10098', '2019-06-17', 'ICS PC2');
INSERT INTO paper_panel
VALUES('ABCDE-10099', '2019-06-20', 'ICS PC3');
INSERT INTO paper_panel
VALUES('ABCDE-10100', '2019-06-23', 'ICS PC4');

INSERT INTO paper_panel_adviser
VALUES('ABCDE-10001', '12345-1012');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10001', '12345-1013');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10002', '12345-1013');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10002', '12345-1014');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10003', '12345-1014');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10003', '12345-1015');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10003', '12345-1016');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10004', '12345-1015');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10004', '12345-1016');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10005', '12345-1016');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10005', '12345-1017');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10006', '12345-1017');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10006', '12345-1018');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10007', '12345-1018');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10007', '12345-1019');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10007', '12345-1020');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10008', '12345-1019');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10008', '12345-1020');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10009', '12345-1020');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10009', '12345-1021');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10010', '12345-1021');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10010', '12345-1022');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10011', '12345-1022');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10011', '12345-1023');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10012', '12345-1023');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10012', '12345-1024');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10013', '12345-1024');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10013', '12345-1025');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10013', '12345-1026');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10014', '12345-1025');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10014', '12345-1026');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10015', '12345-1026');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10015', '12345-1027');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10016', '12345-1027');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10016', '12345-1028');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10017', '12345-1028');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10017', '12345-1029');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10017', '12345-1030');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10018', '12345-1029');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10018', '12345-1030');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10019', '12345-1030');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10019', '12345-1031');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10020', '12345-1031');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10020', '12345-1032');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10021', '12345-1032');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10021', '12345-1033');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10022', '12345-1033');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10022', '12345-1034');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10023', '12345-1034');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10023', '12345-1035');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10023', '12345-1036');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10024', '12345-1035');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10024', '12345-1036');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10025', '12345-1036');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10025', '12345-1037');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10026', '12345-1037');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10026', '12345-1038');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10027', '12345-1038');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10027', '12345-1039');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10027', '12345-1040');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10028', '12345-1039');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10028', '12345-1040');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10029', '12345-1040');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10029', '12345-1041');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10030', '12345-1041');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10030', '12345-1042');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10031', '12345-1042');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10031', '12345-1043');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10032', '12345-1043');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10032', '12345-1044');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10033', '12345-1044');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10033', '12345-1045');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10033', '12345-1046');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10034', '12345-1045');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10034', '12345-1046');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10035', '12345-1046');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10035', '12345-1047');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10036', '12345-1047');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10036', '12345-1048');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10037', '12345-1048');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10037', '12345-1049');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10037', '12345-1050');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10038', '12345-1049');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10038', '12345-1050');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10039', '12345-1050');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10039', '12345-1051');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10040', '12345-1051');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10040', '12345-1052');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10041', '12345-1052');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10041', '12345-1053');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10042', '12345-1053');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10042', '12345-1054');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10043', '12345-1054');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10043', '12345-1055');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10043', '12345-1056');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10044', '12345-1055');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10044', '12345-1056');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10045', '12345-1056');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10045', '12345-1057');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10046', '12345-1057');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10046', '12345-1058');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10047', '12345-1058');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10047', '12345-1059');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10047', '12345-1060');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10048', '12345-1059');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10048', '12345-1060');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10049', '12345-1060');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10049', '12345-1061');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10050', '12345-1061');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10050', '12345-1062');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10051', '12345-1062');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10051', '12345-1063');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10052', '12345-1063');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10052', '12345-1064');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10053', '12345-1064');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10053', '12345-1065');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10053', '12345-1066');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10054', '12345-1065');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10054', '12345-1066');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10055', '12345-1066');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10055', '12345-1067');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10056', '12345-1067');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10056', '12345-1068');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10057', '12345-1068');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10057', '12345-1069');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10057', '12345-1070');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10058', '12345-1069');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10058', '12345-1070');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10059', '12345-1070');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10059', '12345-1071');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10060', '12345-1071');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10060', '12345-1072');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10061', '12345-1072');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10061', '12345-1073');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10062', '12345-1073');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10062', '12345-1074');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10063', '12345-1074');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10063', '12345-1075');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10063', '12345-1076');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10064', '12345-1075');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10064', '12345-1076');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10065', '12345-1076');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10065', '12345-1077');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10066', '12345-1077');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10066', '12345-1078');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10067', '12345-1078');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10067', '12345-1079');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10067', '12345-1080');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10068', '12345-1079');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10068', '12345-1080');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10069', '12345-1080');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10069', '12345-1081');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10070', '12345-1081');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10070', '12345-1082');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10071', '12345-1082');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10071', '12345-1083');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10072', '12345-1083');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10072', '12345-1084');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10073', '12345-1084');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10073', '12345-1085');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10073', '12345-1086');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10074', '12345-1085');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10074', '12345-1086');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10075', '12345-1086');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10075', '12345-1087');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10076', '12345-1087');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10076', '12345-1088');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10077', '12345-1088');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10077', '12345-1089');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10077', '12345-1090');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10078', '12345-1089');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10078', '12345-1090');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10079', '12345-1090');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10079', '12345-1091');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10080', '12345-1091');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10080', '12345-1092');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10081', '12345-1092');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10081', '12345-1093');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10082', '12345-1093');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10082', '12345-1094');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10083', '12345-1094');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10083', '12345-1095');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10083', '12345-1096');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10084', '12345-1095');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10084', '12345-1096');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10085', '12345-1096');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10085', '12345-1097');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10086', '12345-1097');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10086', '12345-1098');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10087', '12345-1098');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10087', '12345-1099');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10087', '12345-1000');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10088', '12345-1099');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10088', '12345-1000');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10089', '12345-1000');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10089', '12345-1001');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10090', '12345-1001');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10090', '12345-1002');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10091', '12345-1002');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10091', '12345-1003');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10092', '12345-1003');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10092', '12345-1004');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10093', '12345-1004');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10093', '12345-1005');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10093', '12345-1006');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10094', '12345-1005');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10094', '12345-1006');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10095', '12345-1006');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10095', '12345-1007');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10096', '12345-1007');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10096', '12345-1008');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10097', '12345-1008');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10097', '12345-1009');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10097', '12345-1010');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10098', '12345-1009');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10098', '12345-1010');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10099', '12345-1010');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10099', '12345-1011');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10100', '12345-1011');
INSERT INTO paper_panel_adviser
VALUES('ABCDE-10100', '12345-1012');

INSERT INTO co_authored_by_student
VALUES('ABCDE-10001', '2015-23456');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10001', '2015-34567');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10002', '2015-34567');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10002', '2015-45678');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10003', '2015-45678');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10003', '2015-56789');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10003', '2015-67890');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10004', '2015-56789');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10004', '2015-67890');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10005', '2015-67890');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10005', '2015-78901');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10006', '2015-78901');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10006', '2015-89012');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10007', '2015-89012');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10007', '2015-90123');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10007', '2015-01234');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10008', '2015-90123');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10008', '2015-01234');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10009', '2015-01234');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10009', '2015-12345');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10010', '2015-12345');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10010', '2015-23456');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10011', '2015-21098');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10011', '2015-32109');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10012', '2015-32109');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10012', '2015-43210');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10013', '2015-43210');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10013', '2015-54321');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10013', '2015-65432');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10014', '2015-54321');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10014', '2015-65432');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10015', '2015-65432');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10015', '2015-76543');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10016', '2015-76543');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10016', '2015-87654');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10017', '2015-87654');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10017', '2015-98765');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10017', '2015-09876');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10018', '2015-98765');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10018', '2015-09876');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10019', '2015-09876');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10019', '2015-10987');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10020', '2015-10987');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10020', '2015-21098');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10021', '2015-23432');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10021', '2015-34543');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10022', '2015-34543');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10022', '2015-45654');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10023', '2015-45654');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10023', '2015-56765');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10023', '2015-67876');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10024', '2015-56765');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10024', '2015-67876');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10025', '2015-67876');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10025', '2015-78987');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10026', '2015-78987');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10026', '2015-89098');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10027', '2015-89098');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10027', '2015-90109');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10027', '2015-01210');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10028', '2015-90109');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10028', '2015-01210');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10029', '2015-01210');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10029', '2015-12321');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10030', '2015-12321');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10030', '2015-23432');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10031', '2015-21012');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10031', '2015-32123');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10032', '2015-32123');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10032', '2015-43234');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10033', '2015-43234');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10033', '2015-54345');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10033', '2015-65456');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10034', '2015-54345');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10034', '2015-65456');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10035', '2015-65456');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10035', '2015-76567');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10036', '2015-76567');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10036', '2015-87678');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10037', '2015-87678');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10037', '2015-98789');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10037', '2015-09890');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10038', '2015-98789');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10038', '2015-09890');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10039', '2015-09890');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10039', '2015-10901');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10040', '2015-10901');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10040', '2015-21012');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10041', '2015-23456');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10041', '2015-33445');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10042', '2015-33445');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10042', '2015-44556');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10043', '2015-44556');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10043', '2015-55667');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10043', '2015-66778');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10044', '2015-55667');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10044', '2015-66778');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10045', '2015-66778');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10045', '2015-77889');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10046', '2015-77889');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10046', '2015-88990');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10047', '2015-88990');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10047', '2015-99001');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10047', '2015-00112');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10048', '2015-99001');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10048', '2015-00112');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10049', '2015-00112');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10049', '2015-11223');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10050', '2015-11223');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10050', '2015-22334');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10051', '2015-22110');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10051', '2015-33221');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10052', '2015-33221');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10052', '2015-44332');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10053', '2015-44332');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10053', '2015-55443');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10053', '2015-66554');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10054', '2015-55443');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10054', '2015-66554');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10055', '2015-66554');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10055', '2015-77665');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10056', '2015-77665');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10056', '2015-88776');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10057', '2015-88776');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10057', '2015-99887');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10057', '2015-00998');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10058', '2015-99887');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10058', '2015-00998');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10059', '2015-00998');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10059', '2015-11009');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10060', '2015-11009');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10060', '2015-22110');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10061', '2015-22345');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10061', '2015-33456');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10062', '2015-33456');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10062', '2015-44567');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10063', '2015-44567');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10063', '2015-55678');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10063', '2015-66789');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10064', '2015-55678');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10064', '2015-66789');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10065', '2015-66789');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10065', '2015-77890');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10066', '2015-77890');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10066', '2015-88901');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10067', '2015-88901');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10067', '2015-99012');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10067', '2015-00123');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10068', '2015-99012');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10068', '2015-00123');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10069', '2015-00123');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10069', '2015-11234');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10070', '2015-11234');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10070', '2015-22109');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10071', '2015-22109');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10071', '2015-33210');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10072', '2015-33210');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10072', '2015-44321');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10073', '2015-44321');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10073', '2015-55432');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10073', '2015-66543');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10074', '2015-55432');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10074', '2015-66543');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10075', '2015-66543');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10075', '2015-77654');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10076', '2015-77654');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10076', '2015-88765');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10077', '2015-88765');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10077', '2015-99876');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10077', '2015-00987');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10078', '2015-99876');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10078', '2015-00987');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10079', '2015-00987');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10079', '2015-11098');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10080', '2015-11098');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10080', '2015-22109');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10081', '2015-23455');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10081', '2015-34566');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10082', '2015-34566');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10082', '2015-45677');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10083', '2015-45677');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10083', '2015-56788');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10083', '2015-67899');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10084', '2015-56788');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10084', '2015-67899');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10085', '2015-67899');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10085', '2015-78900');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10086', '2015-78900');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10086', '2015-89011');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10087', '2015-89011');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10087', '2015-90122');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10087', '2015-01233');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10088', '2015-90122');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10088', '2015-01233');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10089', '2015-01233');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10089', '2015-12344');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10090', '2015-12344');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10090', '2015-23455');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10091', '2015-22344');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10091', '2015-33455');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10092', '2015-33455');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10092', '2015-44566');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10093', '2015-44566');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10093', '2015-55677');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10093', '2015-66788');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10094', '2015-55677');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10094', '2015-66788');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10095', '2015-66788');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10095', '2015-77899');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10096', '2015-77899');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10096', '2015-88900');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10097', '2015-88900');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10097', '2015-99011');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10097', '2015-00122');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10098', '2015-99011');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10098', '2015-00122');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10099', '2015-00122');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10099', '2015-11233');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10100', '2015-11233');
INSERT INTO co_authored_by_student
VALUES('ABCDE-10100', '2015-22344');

INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10001', '12345-1002');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10001', '12345-1003');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10002', '12345-1003');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10002', '12345-1004');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10003', '12345-1004');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10003', '12345-1005');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10003', '12345-1006');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10004', '12345-1005');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10004', '12345-1006');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10005', '12345-1006');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10005', '12345-1007');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10006', '12345-1007');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10006', '12345-1008');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10007', '12345-1008');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10007', '12345-1009');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10007', '12345-1010');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10008', '12345-1009');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10008', '12345-1010');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10009', '12345-1010');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10009', '12345-1011');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10010', '12345-1011');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10010', '12345-1012');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10011', '12345-1012');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10011', '12345-1013');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10012', '12345-1013');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10012', '12345-1014');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10013', '12345-1014');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10013', '12345-1015');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10013', '12345-1016');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10014', '12345-1015');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10014', '12345-1016');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10015', '12345-1016');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10015', '12345-1017');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10016', '12345-1017');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10016', '12345-1018');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10017', '12345-1018');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10017', '12345-1019');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10017', '12345-1020');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10018', '12345-1019');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10018', '12345-1020');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10019', '12345-1020');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10019', '12345-1021');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10020', '12345-1021');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10020', '12345-1022');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10021', '12345-1022');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10021', '12345-1023');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10022', '12345-1023');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10022', '12345-1024');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10023', '12345-1024');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10023', '12345-1025');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10023', '12345-1026');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10024', '12345-1025');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10024', '12345-1026');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10025', '12345-1026');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10025', '12345-1027');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10026', '12345-1027');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10026', '12345-1028');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10027', '12345-1028');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10027', '12345-1029');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10027', '12345-1030');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10028', '12345-1029');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10028', '12345-1030');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10029', '12345-1030');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10029', '12345-1031');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10030', '12345-1031');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10030', '12345-1032');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10031', '12345-1032');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10031', '12345-1033');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10032', '12345-1033');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10032', '12345-1034');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10033', '12345-1034');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10033', '12345-1035');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10033', '12345-1036');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10034', '12345-1035');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10034', '12345-1036');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10035', '12345-1036');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10035', '12345-1037');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10036', '12345-1037');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10036', '12345-1038');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10037', '12345-1038');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10037', '12345-1039');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10037', '12345-1040');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10038', '12345-1039');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10038', '12345-1040');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10039', '12345-1040');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10039', '12345-1041');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10040', '12345-1041');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10040', '12345-1042');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10041', '12345-1042');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10041', '12345-1043');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10042', '12345-1043');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10042', '12345-1044');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10043', '12345-1044');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10043', '12345-1045');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10043', '12345-1046');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10044', '12345-1045');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10044', '12345-1046');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10045', '12345-1046');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10045', '12345-1047');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10046', '12345-1047');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10046', '12345-1048');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10047', '12345-1048');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10047', '12345-1049');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10047', '12345-1050');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10048', '12345-1049');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10048', '12345-1050');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10049', '12345-1050');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10049', '12345-1051');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10050', '12345-1051');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10050', '12345-1052');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10051', '12345-1052');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10051', '12345-1053');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10052', '12345-1053');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10052', '12345-1054');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10053', '12345-1054');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10053', '12345-1055');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10053', '12345-1056');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10054', '12345-1055');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10054', '12345-1056');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10055', '12345-1056');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10055', '12345-1057');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10056', '12345-1057');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10056', '12345-1058');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10057', '12345-1058');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10057', '12345-1059');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10057', '12345-1060');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10058', '12345-1059');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10058', '12345-1060');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10059', '12345-1060');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10059', '12345-1061');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10060', '12345-1061');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10060', '12345-1062');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10061', '12345-1062');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10061', '12345-1063');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10062', '12345-1063');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10062', '12345-1064');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10063', '12345-1064');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10063', '12345-1065');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10063', '12345-1066');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10064', '12345-1065');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10064', '12345-1066');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10065', '12345-1066');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10065', '12345-1067');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10066', '12345-1067');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10066', '12345-1068');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10067', '12345-1068');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10067', '12345-1069');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10067', '12345-1070');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10068', '12345-1069');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10068', '12345-1070');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10069', '12345-1070');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10069', '12345-1071');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10070', '12345-1071');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10070', '12345-1072');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10071', '12345-1072');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10071', '12345-1073');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10072', '12345-1073');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10072', '12345-1074');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10073', '12345-1074');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10073', '12345-1075');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10073', '12345-1076');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10074', '12345-1075');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10074', '12345-1076');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10075', '12345-1076');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10075', '12345-1077');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10076', '12345-1077');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10076', '12345-1078');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10077', '12345-1078');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10077', '12345-1079');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10077', '12345-1080');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10078', '12345-1079');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10078', '12345-1080');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10079', '12345-1080');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10079', '12345-1081');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10080', '12345-1081');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10080', '12345-1082');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10081', '12345-1082');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10081', '12345-1083');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10082', '12345-1083');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10082', '12345-1084');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10083', '12345-1084');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10083', '12345-1085');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10083', '12345-1086');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10084', '12345-1085');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10084', '12345-1086');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10085', '12345-1086');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10085', '12345-1087');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10086', '12345-1087');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10086', '12345-1088');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10087', '12345-1088');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10087', '12345-1089');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10087', '12345-1090');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10088', '12345-1089');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10088', '12345-1090');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10089', '12345-1090');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10089', '12345-1091');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10090', '12345-1091');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10090', '12345-1092');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10091', '12345-1092');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10091', '12345-1093');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10092', '12345-1093');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10092', '12345-1094');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10093', '12345-1094');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10093', '12345-1095');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10093', '12345-1096');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10094', '12345-1095');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10094', '12345-1096');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10095', '12345-1096');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10095', '12345-1097');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10096', '12345-1097');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10096', '12345-1098');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10097', '12345-1098');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10097', '12345-1099');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10097', '12345-1100');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10098', '12345-1099');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10098', '12345-1100');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10099', '12345-1100');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10099', '12345-1001');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10100', '12345-1001');
INSERT INTO co_authored_by_adviser
VALUES('ABCDE-10100', '12345-1002');