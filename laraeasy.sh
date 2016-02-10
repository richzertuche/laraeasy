#!/bin/bash

#Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

if [ "$1" != "" ]; then
	echo ""
	echo "######################################################"
	echo "======================================================"
	echo "||                                                   ||"
	printf "||          ${GREEN}Start Laravel project named:${NC}             ||\n"
	printf "                  ${YELLOW} $1 ${NC}                             \n"
	echo "||                                                   ||"
	echo "======================================================"
	echo "######################################################"
	select yn in "Yes" "No"; do
	    case $yn in
	        Yes )
				#Download and install Laravel
				printf "${GREEN} Installing Laravel...\n"
				composer create-project laravel/laravel ${PWD}"/$1"  --prefer-dist;
				break;;
	        No ) 
				exit;;
	    esac
	done
	echo ""
	echo "######################################################"
	echo "======================================================"
	echo "||         Add Header & Footer Blades ?             ||"
	echo "||        (Bootstrap and JQuery Included)           ||"
	echo "======================================================"
	echo "######################################################"

	select yn in "Yes" "No"; do
	    case $yn in
	        Yes )
				#Set header_footer boolean
				header_footer=true

				#Create includes directory
				mkdir "${PWD}/$1/resources/views/includes"

				#Create header file with Bootstrap, JQuery and AwesomeFont
				echo "<head>
					    <meta charset='utf-8'>
					    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
					    <title>$1</title>
					    <link href='https://fonts.googleapis.com/css?family=Lato:100' rel='stylesheet' type='text/css'>
					    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
					    <script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js'></script>
					    <!-- Latest compiled and minified CSS -->
						<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css' integrity='sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7' crossorigin='anonymous'>
						<!-- Font Awesome -->
						<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css' rel='stylesheet' integrity='sha256-3dkvEK0WLHRJ7/Csr0BZjAWxERc5WH7bdeUya2aXxdU= sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg==' crossorigin='anonymous'>	<!-- Optional theme -->
						<!-- Optional theme -->
						<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css' integrity='sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r' crossorigin='anonymous'>
						<!-- Latest compiled and minified JavaScript -->
						<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js' integrity='sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS' crossorigin='anonymous'></script>
					</head>" >> "${PWD}/$1/resources/views/includes/header.blade.php";

				#Create footer file 
				echo "<footer>
	    				<h3>$1</h3>
					</footer>" >> "${PWD}/$1/resources/views/includes/footer.blade.php";

				echo ""
				printf "${GREEN}*****************************************************\n"
				printf "**********                              *************\n"
				printf "**********   Header and Footer Added    *************\n"
				printf "**********                              *************\n"
				printf "*****************************************************${NC}"
				break;;
	        No ) 
				break;;
	    esac
	done
	echo ""
	echo "______________________________________________________"
	echo ""
	echo "######################################################"
	echo "======================================================"
	echo "||               Add Authentication ?               ||"
	echo "======================================================"
	echo "######################################################"
	select yn in "Yes" "No"; do
	    case $yn in
	        Yes )
				php "$1/"artisan make:auth;
				echo ""
				printf "${GREEN}*****************************************************\n"
				printf "**********                              *************\n"
				printf "**********    Authentication Added      *************\n"
				printf "**********                              *************\n"
				printf "*****************************************************${NC}\n"
				break;;
	        No ) 
				break;;
	    esac
	done
	echo ""
	echo "______________________________________________________"
	echo ""
	echo "######################################################"
	echo "======================================================"
	echo "||                   Add blades ?                   ||"
	echo "======================================================"
	echo "######################################################"
	select yn in "Yes" "No"; do
	    case $yn in
	        Yes )
				echo ""
				echo "______________________________________________________"
				echo ""
				echo "######################################################"
				echo "======================================================"
				echo "||                How many blades ?                 ||"
				echo "======================================================"
				echo "######################################################"
				read blades
				for (( c=1; c<=$blades; c++ ))
				do
					printf "${YELLOW}Name of the blade # $c: ${NC}"; 
					read name;
					echo ""
					echo "Add HTML?"
					echo ""
					select yn in "Yes" "No"; do
					    case $yn in
					        Yes )
								if [[ "$header_footer" ]] ; then
									echo ""
									echo "${YELLOW}Paste the elements between Header and Footer ${NC}\n"
									printf "WHEN FINISHED ${YELLOW}PRESS CTRL-D (2 times)${NC}\n"
									echo ""
									html=$(cat)

								    echo "<!DOCTYPE html>
											<html>
											    @include('includes.header')
											    $html
											    @include('includes.footer')
											</html>" >> "${PWD}/$1/resources/views/$name.blade.php";
								else
									echo ""
									printf "${YELLOW}Paste Complete html${NC}\n"
									printf "WHEN FINISHED ${YELLOW}PRESS CTRL-D (2 times)${NC}\n"
									echo ""
									html=$(cat)
									
									echo "$html" >> "${PWD}/$1/resources/views/$name.blade.php";
								fi
								break;;
					        No ) 
								if [[ "$header_footer" ]] ; then
								    echo "<!DOCTYPE html>
											<html>
											    @include('includes.header')
											    <body>
											        <div class='container'>
											            
											        </div>
											    </body>
											    @include('includes.footer')
											</html>" >> "${PWD}/$1/resources/views/$name.blade.php";
								else
									echo "<!DOCTYPE html>
											<html>
											    <head></head>
											    <body>
											        <div class='container'>
											            
											        </div>
											    </body>
											    <footer></footer>
											</html>" >> "${PWD}/$1/resources/views/$name.blade.php";
								fi
								break;;
					    esac
					done
					
					echo ""
					printf "${GREEN}\n"; 
					printf "${GREEN}Blade $name created!\n"
					printf "${NC}\n"; 
					echo ""
				done
				break;;
	        No ) 
				break;;
	    esac
	done
else
	echo ""
	printf "${RED}######################################################\n"
	printf "======================================================\n"
	printf "||${YELLOW}          laraeasy [project_name]${RED}             ||\n"
	printf "======================================================\n"
	printf "######################################################${NC}\n"
	echo ""
fi