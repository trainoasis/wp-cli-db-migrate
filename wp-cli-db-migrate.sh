#!/bin/bash
# VARIABLES
FROM="/your/wp/root/from"
TO="/your/wp/root/to"
REPLACEFROM="from.url.my"
REPLACETO="to.url.my"

FORCE=false
#DRYRUN="--dry-run"

# CHECK FLAGS FIRST
if [[ $* == -force ]] || [[ $* == -f ]]
  then
    #DRYRUN=""
    FORCE=true
fi

# ASK USER FOR CONFIRMATION WHEN NO -f or -force flag
if [[ $FORCE == false ]]
  then

  echo "\nPlease check the below and confirm:\n"
  echo "${FROM}" "->" "${TO}"
  echo "------"
  echo  "${REPLACEFROM}" "->" "${REPLACETO}"
  echo "\nIs this correct? [1/2]"
  select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
  done

fi

# MOVE TO APPROPRIATE DIRS AND EXPORT DBS
cd "${FROM}"
wp db export wp-cli-db-migrate.sql
cd "${TO}"
wp db export db_backup.sql

# IMPORT DB  
wp db import "${FROM}/wp-cli-db-migrate.sql"

# SEARCH-REPLACE THE NEW DATABASE
wp search-replace "${REPLACEFROM}" "${REPLACETO}" #${DRYRUN}

# IF ALL IS FINE, CLEAN AFTER OURSELVES
cd "${FROM}"
rm -f "${FROM}/wp-cli-db-migrate.sql"
#cd "${TO}"
#rm "${FROM}/wp-cli-db-migrate-db_backup.sql"
