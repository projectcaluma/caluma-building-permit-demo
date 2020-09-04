#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER emeis WITH PASSWORD '$EMEIS_DB_PASSWORD';
    CREATE DATABASE emeis OWNER emeis;
    ALTER USER emeis WITH SUPERUSER;

    CREATE USER alexandria WITH PASSWORD '$ALEXANDRIA_DB_PASSWORD';
    CREATE DATABASE alexandria OWNER alexandria;
    ALTER USER alexandria WITH SUPERUSER;

    CREATE USER caluma WITH PASSWORD '$CALUMA_DB_PASSWORD';
    CREATE DATABASE caluma OWNER caluma;
    ALTER USER caluma WITH SUPERUSER;
EOSQL