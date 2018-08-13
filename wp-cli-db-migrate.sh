#!/bin/bash
# FROM & TO are Wordpress Root folder absolute paths 
# (or relative if you are running the script from specific folder)
FROM="/your/wordpress/root/path/from" # can also be Bedrock install
TO="/your/wordpress/root/path/to"
REPLACEFROM="oldurl.my"
REPLACETO="newurl.my"

cd "${FROM}"
wp db export wp-cli-db-migrate.sql
cd "${TO}"
wp db export wp-cli-db-migrate-db_backup.sql
wp db import "${FROM}/wp-cli-db-migrate.sql"
wp search-replace "${REPLACEFROM}" "${REPLACETO}"

# if all is fine, clean after ourselves
cd "${FROM}"
rm -f "${FROM}/wp-cli-db-migrate.sql"
cd "${TO}"
rm "${FROM}/wp-cli-db-migrate-db_backup.sql"
