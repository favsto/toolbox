#!/bin/bash

# program setup
COLOR_NONE='\033[0m'
COLOR_YELLOW='\033[0;33m'
COLOR_BLUE='\033[0;34m'

# check
echo -e "Usage: ./run.sh ${COLOR_BLUE}<wsl-mode>${COLOR_NONE}"
echo -e "  ${COLOR_BLUE}<wsl-mode>${COLOR_NONE} : [OPTIONAL] 'true' if the application must consider Windows path in WSL runs"
echo ""

TOOLBOX_SUBPATH=$(pwd)
if [ $# -eq 1 ]
  then
    if [ $1 == "true" ]
      then
        TOOLBOX_SUBPATH=$(../../generic/wsl/winpath.sh)
    fi
fi

echo -e "I will mount volumes with subpath ${COLOR_YELLOW}$TOOLBOX_SUBPATH${COLOR_NONE}"

# execute
docker run --rm -p 5433:80 -e "PGADMIN_DEFAULT_EMAIL=admin" -e "PGADMIN_DEFAULT_PASSWORD=admin" -v "$TOOLBOX_SUBPATH/var/lib/pgadmin:/var/lib/pgadmin" -v "$TOOLBOX_SUBPATH/servers.json:/pgadmin4/servers.json" --name pgadmin-4-11 -d dpage/pgadmin4:4.11