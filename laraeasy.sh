#!/bin/bash

echo "######################################################"
echo "======================================================"
echo "||                                                   ||"
echo "||          Start Laravel project named:             ||"
echo "                   $1                              "
echo "||                                                   ||"
echo "======================================================"
echo "######################################################"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
			#Download and install Laravel
			composer create-project laravel/laravel ${PWD}"/$1"  --prefer-dist;
			cp welcome.blade.php ${PWD}"/$1"/resources/views/;
			break;;
        No ) 
			exit;;
    esac
done
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
			echo "*****************************************************"
			echo "**********                              *************"
			echo "**********   Header and Footer Added    *************"
			echo "**********                              *************"
			echo "*****************************************************"
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
			echo "*****************************************************"
			echo "**********                              *************"
			echo "**********    Authentication Added      *************"
			echo "**********                              *************"
			echo "*****************************************************"
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
				echo "Name of the blade #$1: "; 
				read name;
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
				echo ""
				echo "-----------------------"; 
				echo "Blade $name created!"
				echo "-----------------------"; 
				echo ""
			done
			break;;
        No ) 
			break;;
    esac
done