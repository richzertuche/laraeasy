#!/bin/bash

#Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


cp laraeasy.sh laraeasy
sudo cp laraeasy /usr/local/bin/laraeasy

echo ""
printf "${GREEN}=============================\n"
printf "=============================\n"
printf "==== Laraeasy Installed =====\n"
printf "=============================\n"
printf "=============================${NC}\n"
echo ""

printf "Use ${YELLOW} 'laraeasy [project_name]' ${NC}\n"
echo ""
echo "Project will be created from the directory you are at the moment"
echo "================================================================"
echo ""
echo ""