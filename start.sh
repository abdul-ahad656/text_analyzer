#!/bin/bash
set -e

cd backend

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate venv
. venv/bin/activate

# Upgrade pip safely
pip install --upgrade pip

# Install dependencies inside venv
pip install --no-cache-dir -r requirements.txt

# Run the app with Gunicorn
exec gunicorn app:app --bind 0.0.0.0:$PORT
