# Oracle Database Client

can be used for remote database operations.

## Tags and Dockerfile links

* 12.2.0.1.0 (https://github.com/Guy-Incognito/oracle-db-client/blob/12.2.0.1.0/Dockerfile) Uses Oracle 12.2.0.1.0


## How to run

## Usage:

The container accepts the following mounted folder:

* "/data" --> mount the folder where all output should be written to here

### Opening a Shell:

Run the container with:

```
docker run  \
    --name oracle-db-client \
    -it \
    -v /path/to/local/data:/data \
    georgmoser/oracle-db-client
```

### Dumping a Database:

Run the container with:

```
docker run  \
    --name oracle-db-client \
    -it \
    -e DB_USERNAME= \
    -e DB_PASSWORT= \
    -e DB_PORT= \
    -e DB_HOST= \
    -e DB_SERVICENAME= \    
    -v /path/to/local/data:/data \
    georgmoser/oracle-db-client
```

