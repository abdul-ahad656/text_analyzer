#!/bin/bash
set -e

# Install python & pip
apt-get update && apt-get install -y python3 python3-pip

cd backend
pip3 install -r requirements.txt
gunicorn app:app --bind 0.0.0.0:$PORT
