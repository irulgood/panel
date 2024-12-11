#!/bin/bash

# Step 1: Clone Project
REPO_URL="<https://github.com/irulgood/panel>"
REPO_NAME=$(basename "$REPO_URL" .git)

echo "Mengkloning proyek ke lokal ke folder $REPO_NAME..."
git clone "$REPO_URL"
cd "$REPO_NAME" || exit

# Step 2: Install Dependencies
echo "Menginstal ketergantungan menggunakan pip3..."
pip3 install -r requirements.txt

# Step 3: Run the Bot Automatically
echo "Menjalankan bot..."
python3 main.py

# Done
echo "Bot telah dijalankan. Nikmati kemudahan pengelolaan Digital Ocean Anda dengan antarmuka yang ramah pengguna!"
