# tournament-results
Swiss style tournament results program for Udacity's Intro to Programming Nanodegree

README for Swiss Style Tournament Program Developed for Intro to Comp Sci Nanodegree

Latest Version: 9/23/2016

The purpose of this program is to set up a Swiss Style Tournament--the program can delete player registrations,
match records, register new player, update standings, and output the next round of matchups for the tournament.

Files included with this program:
tournament_2.py--contains all of the python functions and sql queries necessary to carry out the tournament
tournament_2.sql--contains the tables and views that are needed by tournament.py to carry out the tournament
tournament_test_2.py--contains a list of test functions designed by Udacity to make sure all of the functions 
in tournament.py are working properly.

To run this program you will need to download Virtual Box and Vagrant to support the databases
needed to use this program.  Using git you can clone all of the necessary files for this program from Udacity via 
http://github.com/udacity/fullstack-nanodegree-vm fullstack

Once the above softwares are downloaded, start the virtual machine by typing vagrant up and log in to the 
virtual machine by typing vagrant ssh.
Type cd /vagrant and cd to 'tournament' to access the correct folder.

You can then manutally import the database schema by using the psql application--first type psql,
followed by \i tournament_2.sql and finally quit the psql application by typing \q.
You can then execute the tests in the tournament_test file by typing tournament_test_2.py

You can also use another python shell to make use of the functions themselves to run your own tournament. 

The functions contained in tournament_2.py are as follows:

connect(): establishes the connection to PostgreSQL database, here referring to tournament.sql
deleteMatches(): removes all of the match records from the database (from records_table)
deletePlayers: removes all players from the database (from player_list)
countPlayers(): returns the number of registered players 
registerPlayer(): takes a player name as an argument and adds that player name to the player_list table with a 
		unique serial number, also creates an entry in the records_table for that player with a corresponding
		serial number
playerStandings(): returns a list of the players and the number of wins, and the matches played, sorted by wins
reportMatch(): records the output of a match and updates the record of the winning and losing player in the database.
		Takes the id numbers of the winner and loser of the match as arguments
swissPairing(): returns a list of players for the next round of the match, pairing players with the same number of wins
		to play against one another

The tournament_2.sql file contains the tables necessary for the tournament--the player_list table, which contains
	the id number and name of each player and the records_table that contains the id number of the players
	as well as each players number of wins and matches played
