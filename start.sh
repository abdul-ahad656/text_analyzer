#!/bin/bash
set -e

# Make sure we are in backend folder
cd backend

# Install Python and pip (if not available)
if ! command -v python3 &> /dev/null
then
  apt-get update && apt-get install -y python3 python3-pip
fi

# Install requirements
pip3 install --no-cache-dir -r requirements.txt

# Start the Flask app with Gunicorn
exec gunicorn app:app --bind 0.0.0.0:$PORT
