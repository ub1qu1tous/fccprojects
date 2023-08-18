PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

GET_ELEMENT_DATA () {

  if [[ $1 =~ ^[0-9]+$ ]]
  then
    GET_ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $1")
  else
    GET_ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1' OR symbol = '$1'")
  fi

  if [[ -z $GET_ELEMENT_NAME ]]
  then
    echo "I could not find that element in the database."
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$GET_ELEMENT_NAME'")
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$GET_ELEMENT_NAME'")
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    ELEMENT_TYPE=$($PSQL "SELECT type FROM properties JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    echo "The element with atomic number $ATOMIC_NUMBER is $GET_ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $GET_ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
}

if [[ $1 ]]
then
  GET_ELEMENT_DATA $1
else
  echo Please provide an element as an argument.
fi
