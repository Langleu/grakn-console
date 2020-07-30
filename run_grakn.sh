#!/bin/bash

ADDRESS=${ADDRESS:-'127.0.0.1:48555'}
KEYSPACE=${KEYSPACE:-'grakn'}
TIMEOUT=${TIMEOUT:-60}

while [ -z "$ESCAPE" ]
do
RESPONSE=$(grakn console --address $ADDRESS --file . 2> /dev/null)

if [[ $RESPONSE =~ "Loading: ." ]]; then
  ESCAPE=false
  echo 'grakn is up and running!'
else
  if [ $TIMEOUT -eq 0 ]; then
    echo 'timeout - grakn is not up yet'
    exit 1
  else
    let "TIMEOUT-=1"
    echo 'grakn is not up yet ...'
  fi
fi

done

if [ -f "$FILE" -a -n "$KEYSPACE" ]; then
  echo "schema $FILE and $KEYSPACE were supplied"
  grakn console --keyspace $KEYSPACE --address $ADDRESS --file $FILE
else
  echo "no schema or keyspace was supplied"
fi

grakn console --keyspace $KEYSPACE --address $ADDRESS
