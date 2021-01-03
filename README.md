# README

Validate that the follwoing environment variables are set before running the application.

The following variables are used in config/storage.yml file
* **S3_Access_Key** = AWS Access key with access to S3
* **S3_Secret_Key** = AWS Secret key
* **S3_ClassBunkdev_bucket** = AWS S3 bucket name

The following variables are used in config/database.yml file
* **RDS_USERNAME** = AWS RDS Username
* **RDS_PASSWORD** = AWS RDS Password
* **RDS_HOST** = AWS RDS Endpoint

Used in config/application.rb to allow RDS host to access our rails console
* **RDS_DB_IP** = AWS RDC Host IP Address

Used in docker-compose.yml
* **DATABASE_URL** = Database connection string ie. "postgres://RDS_USERNAME:RDS_PASSWORD@RDS_ENNPOINT:RDS_PORT/RDS_DB_NAME"

! You may need to change AWS Region and Database name in config/storage.yml(or database.yml) based on your AWS configurations.
