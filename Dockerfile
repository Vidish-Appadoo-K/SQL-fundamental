FROM postgres:16-alpine

COPY database/01_init.sql /docker-entrypoint-initdb.d/01-init.sql

COPY database/02_seed.sql /docker-entrypoint-initdb.d/02-seed.sql

RUN 

EXPOSE 5432