FROM python:3.6.15-slim-buster
WORKDIR /app

# Install the application dependencies
COPY . ./
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt update && apt install vim -y
WORKDIR /app/hello
EXPOSE 5000
CMD ["flask", "run","--host=0.0.0.0"]
