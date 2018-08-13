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

Use "-f" or "-force" flag to skip the confirmation and just migrate immediately. 

<b>USE AT YOUR OWN RISK AND MAKE A BACKUP OF ALL YOUR DATABASES FIRST</b>

