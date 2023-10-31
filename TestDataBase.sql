--Skapa en tabell Animals
CREATE TABLE Animals(
	AnimalID INT PRIMARY KEY,
	Name NVARCHAR(30),
	Species NVARCHAR(30),
	Gender NVARCHAR(8),
	Age INT
);
GO

-- Lägger till information i Animals
INSERT INTO Animals(AnimalID, Name, Species, Gender, Age)
VALUES
(1, 'Pelle', 'Cat', 'Male', 2),
(2, 'Maja', 'Cat', 'Female', 2),
(3, 'Kerstin', 'Dog', 'Male', 4),
(4, 'Doris', 'Dog', 'Female', 6),
(5, 'Håkan', 'Bird', 'Male', 15),
(6, 'Berra', 'Turtle', 'Male', 30);
GO

--Skapa en tabell Fodder
CREATE TABLE Fooder(
	FooderID INT PRIMARY KEY,
	Type NVARCHAR(20),
	Preferences NVARCHAR(20),
);
GO

-- Lägger till information till Fodder
INSERT INTO Fooder(FooderID, Type, Preferences)
VALUES
(1, 'Doogfood', 'Meat'),
(2, 'Doogfood', 'Fish'),
(3, 'Doogfood', 'Vegan'),
(4, 'Catfood', 'Meat'),
(5, 'Catfood', 'Fish'),
(6, 'Catfood', 'Vegan'),
(7, 'Birdfood', 'Fruits'),
(8, 'Birdfood', 'Seeds'),
(9, 'Birdfood', 'Berries'),
(10, 'Turtlefood', 'Vorms'),
(11, 'Turtlefood', 'Plants');
GO

--Skapa en tabell Meals
CREATE TABLE Meals(
	MealID INT PRIMARY KEY,
	AnimalID_FK INT,
	FooderID_FK INT,
	FOREIGN KEY(AnimalID_FK) REFERENCES Animals(AnimalID),
	FOREIGN KEY(FooderID_FK) REFERENCES Fooder(FooderID)
);
GO

--Lägger till information til Meals
INSERT INTO Meals(MealID, AnimalID_FK, FooderID_FK)
VALUES
(1, 1, 4),
(2, 2, 6),
(3, 3, 2),
(4, 4, 1),
(5, 5, 9),
(6, 6, 11);
GO

SELECT Name, Species, Type, Preferences
FROM Meals
JOIN Animals ON Meals.AnimalID_FK = Animals.AnimalID
JOIN Fooder ON Meals.FooderID_FK = Fooder.FooderID