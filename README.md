# Description

A backup/ops tooling image based on Ubuntu 25.10 with a collection of cloud and database CLI clients pre-installed.

# Included tools

- **Google Cloud CLI** (`gcloud`)
- **AWS CLI v2** (`aws`)
- **MongoDB client** (`mongosh`)
- **kubectl**
- **MariaDB client** (`mariadb`)
- **PostgreSQL client** (`psql`)

# Build and test

```
./create-local-release.sh

docker run -ti --rm \
    fdi-backup:main-SNAPSHOT \
    bash
```

# Usage

```
docker run -ti --rm \
    foilen/fdi-backup:latest \
    bash
```
