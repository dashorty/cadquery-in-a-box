# Python 3.10 slim image als Basis
FROM python:3.10-slim

# Installiert die notwendige libgl1-mesa-glx Bibliothek
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

# Definiert das Arbeitsverzeichnis
WORKDIR /app

# Installiert alle notwendigen Paketabhängigkeiten
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Kopiert den aktuellen Ordnerinhalt (von Ihrem Docker-Context) in /app im Container
COPY . .

# Bildet Port 5000 nach außen ab
EXPOSE 5000

# Definiert die Umgebungsvariablen
ENV PYTHONUNBUFFERED=1

# Führt den cq-server aus
CMD ["cq-server", "run"]