#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo  "Enter your username:"
read username


USERNAME=$($PSQL "SELECT username FROM users where username='$username'")
if [[ -n $USERNAME ]]
then
USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username='$username'")
GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE username_id='$USERNAME_ID'")
BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE username_id='$USERNAME_ID'")
echo "Welcome back, $username! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
echo "Welcome, $username! It looks like this is your first time here."
INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$username')")
fi

GUESS_COUNT=0
SECRET_NUMBER=$((1 + $RANDOM % 1000))
echo  -e "\nGuess the secret number between 1 and 1000:"
read GUESS
until [[ $GUESS == $SECRET_NUMBER ]]
do
if [[ ! $GUESS =~ ^[0-9]+$ ]] 
  then
  echo "That is not an integer, guess again:"
  read GUESS
  ((GUESS_COUNT++))
  else
  if [[ $GUESS < $SECRET_NUMBER ]]
  then
  echo "It's higher than that, guess again:"
  read GUESS
  ((GUESS_COUNT++))
  else
  if [[ $GUESS > $SECRET_NUMBER ]]
  then
  echo "It's lower than that, guess again:"
  read GUESS
  ((GUESS_COUNT++))
  fi
  fi
  fi
  done

((GUESS_COUNT++))

echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

USERNAME_ID=$($PSQL "SELECT username_id FROM users WHERE username='$username'")
INSERT_SCORE=$($PSQL "INSERT INTO games (username_id, number_of_guesses) VALUES ('$USERNAME_ID','$GUESS_COUNT')")