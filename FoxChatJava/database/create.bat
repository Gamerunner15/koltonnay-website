ECHO OFF
psql -U postgres -f "dropdb.sql"
createdb -U postgres final_capstone
psql -U postgres -d final_capstone -f "schema.sql"
psql -U postgres -d final_capstone -f "user.sql"
PAUSE