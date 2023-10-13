# gaming_history_database
Contains ER diagram and SQL script for a gaming history databas
e
The Game History Database is a relational database designed to store information related to users, game developers, and the games they play.

##Database Schema
The database schema consists of the following tables:

User: Stores user information including their username, name, and registration start date.

Game_Developer: Stores information about game development companies, including their name, location, and the head developer's name.

Game: Contains game-related data, including the game name, the developer company (linked to Game_Developer), and the game genre.

Plays: Records the gameplay history, associating users with the games they play and the number of hours played.

##Stored Procedures
The database includes two stored procedures to calculate total hours:

CalculateTotalHoursForGame: This procedure takes a game name as input and returns the total hours played by all users for that game.

CalculateTotalHoursForPlayer: This procedure takes a player's username as input and returns the total hours played by that player across all games.


