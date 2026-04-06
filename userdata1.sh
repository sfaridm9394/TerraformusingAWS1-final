#!/bin/bash
yum update -y

# Install Python3 and pip
yum install -y python3 python3-pip

# Install Flask
pip3 install flask

# Create simple HA web app
cat << 'EOF' > /home/ec2-user/app2.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def index():
    return "✅ Hello from EC2 Instance 2 - ALB Test Successful!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
EOF

# Run the Flask app in the background
nohup python3 /home/ec2-user/app2.py &