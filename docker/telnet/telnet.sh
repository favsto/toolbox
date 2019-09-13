#!/bin/bash

# program setup
COLOR_NONE='\033[0m'
COLOR_RED='\033[0;31m'
COLOR_YELLOW='\033[0;33m'
COLOR_BLUE='\033[0;34m'

# check
echo -e "Usage: ./telnet.sh ${COLOR_BLUE}<host> <port>${COLOR_NONE}"

if [ $# -lt 2 ]
  then
    echo -e "${COLOR_RED}Wrong parameters number${COLOR_NONE}"
    exit 1
fi

echo ""

# execute
docker run --rm -it mikesplain/telnet "$@"
