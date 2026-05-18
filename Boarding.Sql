-- Equestrian Boarding and Training Facility Database
-- Physical Database Design SQL Script

CREATE DATABASE EquestrianBarnDB;
USE EquestrianBarnDB;

-- Table: BarnOwners
CREATE TABLE BarnOwners (
    OwnerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    BarnName VARCHAR(100) NOT NULL
);

-- Table: Trainers
CREATE TABLE Trainers (
    TrainerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(50),
    PhoneNumber VARCHAR(20),
    YearsExperience INT,
    OwnerID INT,
    CONSTRAINT fk_trainers_owner
        FOREIGN KEY (OwnerID)
        REFERENCES BarnOwners(OwnerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table: Boarders
CREATE TABLE Boarders (
    BoarderID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    OwnerID INT,
    CONSTRAINT fk_boarders_owner
        FOREIGN KEY (OwnerID)
        REFERENCES BarnOwners(OwnerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table: Horses
CREATE TABLE Horses (
    HorseID INT PRIMARY KEY AUTO_INCREMENT,
    HorseName VARCHAR(50) NOT NULL,
    Breed VARCHAR(50),
    Age INT,
    Discipline VARCHAR(50),
    BoarderID INT,
    CONSTRAINT fk_horses_boarder
        FOREIGN KEY (BoarderID)
        REFERENCES Boarders(BoarderID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Table: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    RidingLevel VARCHAR(30),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100),
    TrainerID INT,
    CONSTRAINT fk_students_trainer
        FOREIGN KEY (TrainerID)
        REFERENCES Trainers(TrainerID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Table: Lessons
CREATE TABLE Lessons (
    LessonID INT PRIMARY KEY AUTO_INCREMENT,
    LessonDate DATE NOT NULL,
    LessonTime TIME NOT NULL,
    StudentID INT,
    TrainerID INT,
    HorseID INT,
    DurationMinutes INT,
    CONSTRAINT fk_lessons_student
        FOREIGN KEY (StudentID)
        REFERENCES Students(StudentID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_lessons_trainer
        FOREIGN KEY (TrainerID)
        REFERENCES Trainers(TrainerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_lessons_horse
        FOREIGN KEY (HorseID)
        REFERENCES Horses(HorseID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Sample Data Inserts

INSERT INTO BarnOwners (FirstName, LastName, PhoneNumber, Email, BarnName)
VALUES
('Emily', 'Johnson', '555-111-2222', 'emily@sunsetstables.com', 'Sunset Stables');

INSERT INTO Trainers (FirstName, LastName, Specialty, PhoneNumber, YearsExperience, OwnerID)
VALUES
('Sarah', 'Miller', 'Jumping', '555-333-4444', 10, 1),
('Jake', 'Wilson', 'Dressage', '555-555-6666', 8, 1);

INSERT INTO Boarders (FirstName, LastName, PhoneNumber, Email, OwnerID)
VALUES
('Megan', 'Lopez', '555-777-8888', 'megan@email.com', 1);

INSERT INTO Horses (HorseName, Breed, Age, Discipline, BoarderID)
VALUES
('Ridley', 'Quarter Horse', 12, 'Jumping', 1);

INSERT INTO Students (FirstName, LastName, RidingLevel, PhoneNumber, Email, TrainerID)
VALUES
('Olivia', 'Brown', 'Intermediate', '555-999-0000', 'olivia@email.com', 1);

INSERT INTO Lessons (LessonDate, LessonTime, StudentID, TrainerID, HorseID, DurationMinutes)
VALUES
('2026-05-20', '15:00:00', 1, 1, 1, 60);

-- Example Queries

-- View all students and their trainers
SELECT Students.FirstName AS StudentFirstName,
       Students.LastName AS StudentLastName,
       Trainers.FirstName AS TrainerFirstName,
       Trainers.LastName AS TrainerLastName
FROM Students
JOIN Trainers
ON Students.TrainerID = Trainers.TrainerID;

-- View all lessons scheduled
SELECT LessonDate,
       LessonTime,
       DurationMinutes
FROM Lessons;
