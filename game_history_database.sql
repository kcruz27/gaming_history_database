CREATE SCHEMA IF NOT EXISTS game_history_database;

USE game_history_database;

CREATE TABLE IF NOT EXISTS User (
    Username VARCHAR(30) PRIMARY KEY,
    Name VARCHAR(30),
    Startdate DATE
);

CREATE TABLE IF NOT EXISTS Game_Developer (
    Dev_Name VARCHAR(30) PRIMARY KEY,
    Location VARCHAR(50),
    Head_Dev VARCHAR(30)
);

CREATE TABLE IF NOT EXISTS Game (
    Game_Name VARCHAR(255) PRIMARY KEY,
    GDev VARCHAR(50),
    Genre VARCHAR(50),
    FOREIGN KEY (GDev) REFERENCES Game_Developer(Dev_Name)
);

CREATE TABLE IF NOT EXISTS Plays (
    Username VARCHAR(30),
    Game_Name VARCHAR(255),
    Hours INT,
    PRIMARY KEY (Username, Game_Name),
    FOREIGN KEY (Username) REFERENCES User(Username),
    FOREIGN KEY (Game_Name) REFERENCES Game(Game_Name)
);



INSERT INTO User (Username, Name, Startdate) VALUES 
('user1', 'John Doe', '2026-01-15'),
('user2', 'Jane Smith', '2020-02-20'),
('user3', 'Alice Johnson', '2018-03-10'),
('user4', 'Bob Brown', '2008-04-05'),
('user5', 'Ella Davis', '2019-05-12'),
('user6', 'Mike Wilson', '2020-06-25'),
('user7', 'Olivia Lee', '2020-07-30'),
('user8', 'David Jones', '2021-08-08'),
('user9', 'Sophia Anderson', '2014-09-21'),
('user10', 'William Miller', '2017-10-02');

INSERT INTO Game_Developer (Dev_Name, Location, Head_Dev) VALUES 
('Epic Games', 'Cary, North Carolina, USA', 'Tim Sweeney'),
('PUBG Corporation', 'Seoul, South Korea', 'Brendan Greene'),
('Infinityward', 'Los Angeles, California, USA', null),
('Mojang Studios', 'Stockholm, Sweden', 'Markus Persson'),
('InnerSloth', null, 'Forest Willard '),
('Nintendo', 'kyoto, Japan', null),
('Rockstar North', 'Edinburgh, Scotland, UK', 'Dan Houser, Sam Houser'),
('Rockstar Studios', 'New York City, New York, USA', null),
('Blizzard', 'Irvine, California, USA', 'Jeff Kaplan'),
('Valve Corporation', 'Bellevue, Washington, USA', null),
('FromSoftware', 'Tokyo, Japan', 'Hidetaka Miyazaki');

INSERT INTO Game (Game_Name, GDev, Genre) VALUES 
('Fortnite', 'Epic Games', 'Battle Royale'),
('PUBG', 'PUBG Corporation', 'Battle Royale'),
('Warzone', 'Infinityward', 'Battle Royale'),
('Minecraft', 'Mojang Studios', 'Sandbox'),
('Among Us', 'InnerSloth', 'Party'),
('The Legend of Zelda: Breath of the Wild', 'Nintendo', 'Action-Adventur'),
('GTA5', 'Rockstar North', 'Action-Adventure'),
('Red Dead Redemption 2', 'Rockstar Studios', 'Action-Adventure'),
('Overwatch', 'Blizzard', 'FPS'),
('CS:GO', 'Valve Corporation', 'FPS'),
('Elden Ring', 'FromSoftware', 'Action RPG'),
('Animal Crossing: New Horizons', 'Nintendo', 'Simulation');

INSERT INTO Plays (Username, Game_Name, Hours) VALUES 
('user1', 'Fortnite', 50),
('user1', 'Warzone', 40),
('user2', 'Minecraft', 60),
('user2', 'Overwatch', 30),
('user3', 'Red Dead Redemption 2', 25),
('user4', 'GTA5', 55),
('user4', 'Elden Ring', 15),
('user5', 'Among Us', 10),
('user5', 'Animal Crossing: New Horizons', 35),
('user6', 'CS:GO', 40),
('user6', 'Fortnite', 20),
('user7', 'Elden Ring', 60),
('user7', 'Overwatch', 30),
('user8', 'Animal Crossing: New Horizons', 55),
('user8', 'The Legend of Zelda: Breath of the Wild', 40),
('user9', 'Minecraft', 25),
('user9', 'PUBG', 30),
('user10', 'Warzone', 45),
('user10', 'CS:GO', 55),
('user1', 'Red Dead Redemption 2', 40),
('user2', 'Fortnite', 30),
('user3', 'PUBG', 60),
('user3', 'GTA5', 20),
('user4', 'The Legend of Zelda: Breath of the Wild', 25),
('user5', 'Warzone', 45),
('user6', 'Overwatch', 40),
('user7', 'Minecraft', 60),
('user7', 'Among Us', 15),
('user8', 'Elden Ring', 25),
('user8', 'GTA5', 35),
('user9', 'Fortnite', 20),
('user9', 'Animal Crossing: New Horizons', 45),
('user10', 'Red Dead Redemption 2', 55);

-- Function that gets the total hours for a given name
DELIMITER //
CREATE PROCEDURE CalculateTotalHoursForGame(IN gameName VARCHAR(255), OUT totalHours INT)
BEGIN
    SELECT SUM(Hours) INTO totalHours
    FROM Plays
    WHERE Game_Name = gameName;
END;
//
DELIMITER ;

-- function that gets the total amount of hours that a given player has played in all games
DELIMITER //
CREATE PROCEDURE CalculateTotalHoursForPlayer(IN playerName VARCHAR(30), OUT totalHours INT)
BEGIN
    SELECT SUM(Hours) INTO totalHours
    FROM Plays
    WHERE Username = playerName;
END;
//
DELIMITER ;




-- gets the total hours that Fortnite has been played by all players
CALL CalculateTotalHoursForGame('Fortnite', @totalHours);
SELECT @totalHours;

-- gets the total hours that Minecraft has been played by all players
CALL CalculateTotalHoursForGame('Minecraft', @totalHours);
SELECT @totalHours;

CALL CalculateTotalHoursForPlayer('user1', @totalHours);
SELECT @totalHours;

CALL CalculateTotalHoursForPlayer('user10', @totalHours);
SELECT @totalHours;

SELECT Game.Game_Name
FROM Game
WHERE Game.GDev = 'Mojang Studios';
