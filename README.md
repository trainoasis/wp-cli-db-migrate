# wp-cli-db-migrate
Simple Wordpress migration script using WP-CLI

# HOW TO USE
Edit variables inside the script or edit the script so you can pass parameters to it: 

FROM="/your/wordpress/root/path/from"  
TO="/your/wordpress/root/path/to"  
REPLACEFROM="oldurl.my"  
REPLACETO="newurl.my"  

When you are sure you have these correct, run the script using 
"sh wp-cli-db-migrate.sh". 

Note: Perhaps consider adding "--dry-run" parameter to "wp search-replace" command to make sure things 
work as expected. 

<b>USE AT YOUR OWN RISK AND MAKE A BACKUP OF ALL YOUR DATABASES FIRST</b>

