#!/bin/bash
set -e

cd backend

# Install dependencies into user site-packages
pip install --user -r requirements.txt

# Run the app with Gunicorn from user-installed location
~/.local/bin/gunicorn app:app --bind 0.0.0.0:$PORT
