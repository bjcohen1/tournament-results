
--Make database to hold all tournament information 
DROP DATABASE IF EXISTS tournament_2;
CREATE DATABASE tournament_2;

\c tournament_2;

--Make table to hold the player information
CREATE TABLE player_list(
	player_id SERIAL PRIMARY KEY, 
	player_name TEXT
	);

--Table to hold the wins and matches of each player
CREATE TABLE matches(
	match_number SERIAL PRIMARY KEY,
	winner INT REFERENCES player_list (player_id),
	loser INT REFERENCES player_list (player_id)
	);

--View that holds the overall standings including name, id, wins, matches in order of most wins
CREATE VIEW standings_table AS(
	SELECT player_list.player_id, player_list.player_name,
    (SELECT COUNT(matches.winner) FROM matches
	 WHERE player_list.player_id = matches.winner)
	 AS wins,
	(SELECT COUNT(matches.match_number) FROM matches
	 WHERE player_list.player_id = matches.winner
	 OR player_list.player_id = matches.loser)
	AS matches_played
	FROM player_list
	ORDER BY wins DESC
	);

--View containing only the information that will be needed to determine the next pairings
CREATE VIEW pairings_table AS (
	SELECT player_id, player_name
	FROM standings_table
	);
