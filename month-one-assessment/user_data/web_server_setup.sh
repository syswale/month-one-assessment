#!/bin/bash
# Update OS and install Apache
yum update -y
yum install -y httpd

# Start and enable the service to run on boot
systemctl start httpd
systemctl enable httpd

# Fetch the specific EC2 Instance ID using AWS metadata (IMDSv2)
TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/instance-id)

# Create the HTML file requested by the assessment
echo "<h1>Welcome to TechCorp</h1><p>Successfully serving traffic from Instance ID: <strong>$INSTANCE_ID</strong></p>" > /var/www/html/index.html
