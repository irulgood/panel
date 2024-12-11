#!/bin/bash

# URL file ZIP
url="https://github.com/irulgood/panel/blob/main/panel-main.zip"

# Nama lokal untuk folder hasil ekstraksi
local_name="panel"

# Buat folder lokal jika belum ada
if [ ! -d "$local_name" ]; then
    echo "Folder '$local_name' belum ada. Membuat folder..."
    mkdir -p "$local_name"
else
    echo "Folder '$local_name' sudah ada. Menggunakan folder yang sama."
fi

# Unduh file ZIP
echo "Mengunduh file dari $url..."
wget -q "$url" -O temp.zip

# Ekstrak file ZIP ke folder lokal
echo "Mengekstrak file ke folder $local_name..."
unzip -q temp.zip -d "$local_name"

# Hapus file ZIP setelah ekstraksi
echo "Menghapus file ZIP sementara..."
rm temp.zip

# Masuk ke folder hasil ekstraksi
cd "$local_name" || exit

# Cek apakah file requirements.txt ada
if [ -f "requirements.txt" ]; then
    echo "Menginstal dependensi dari requirements.txt..."
    pip install -r requirements.txt
else
    echo "File requirements.txt tidak ditemukan, melewati instalasi dependensi."
fi

# Jalankan main.py jika ada
if [ -f "main.py" ]; then
    echo "Menjalankan main.py..."
    python3 main.py
else
    echo "File main.py tidak ditemukan."
fi

echo "Proses selesai."
