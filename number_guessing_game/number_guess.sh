#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_SECRET_NUMBER=$((RANDOM % 1000 + 1))

MAIN_MENU () {
  echo "Enter your username:"
  read USERNAME

  CHECK_USERNAME=$($PSQL "SELECT name FROM users WHERE name = '$USERNAME'")

  if [[ -z $CHECK_USERNAME ]]
  then

    ADD_USERNAME=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")

    echo "Welcome, $USERNAME! It looks like this is your first time here."

    echo "Guess the secret number between 1 and 1000:"

    THE_GUESSING_GAME
  else
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
    GAMES_PLAYED=$($PSQL "SELECT COUNT(guesses) FROM sessions WHERE user_id = $USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM sessions WHERE user_id = $USER_ID")

    echo "Welcome back, $CHECK_USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

    echo "Guess the secret number between 1 and 1000:"
    THE_GUESSING_GAME
  fi
}

NUMBER_OF_GUESSES=0

THE_GUESSING_GAME () {
  
  read USER_GUESS

  if [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then

    ((NUMBER_OF_GUESSES++))

    if [[ $USER_GUESS == $RANDOM_SECRET_NUMBER ]]
    then
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME'")
      SESSION_ENTRY=$($PSQL "INSERT INTO sessions(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")

      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_SECRET_NUMBER. Nice job!"
    elif [[ $USER_GUESS > $RANDOM_SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      THE_GUESSING_GAME
    else
      echo "It's higher than that, guess again:"
      THE_GUESSING_GAME
    fi

  else
    echo "That is not an integer, guess again:" 
    THE_GUESSING_GAME

  fi
  
}

MAIN_MENU
