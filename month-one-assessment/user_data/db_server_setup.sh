#!/bin/bash
# Update OS and enable the Postgres extra repository
yum update -y
amazon-linux-extras enable postgresql14

# Install, initialize, and start Postgres
yum install -y postgresql-server
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
