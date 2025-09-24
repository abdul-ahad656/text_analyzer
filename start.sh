#!/bin/bash
set -e

# Install python & pip
apt-get update && apt-get install -y python3 python3-pip

cd backend

python3 -m venv .venv
source .venv/bin/activate

pip3 install -r requirements.txt
exec .venv/bin/gunicorn app:app --bind 0.0.0.0:$PORT
