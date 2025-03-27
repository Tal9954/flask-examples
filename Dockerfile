FROM python:latest
WORKDIR /app

# Install the application dependencies
COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN apt update && apt install vim -y
