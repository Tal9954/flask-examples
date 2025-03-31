# Use the official Python 3.6.15 image based on Debian Buster (slim)
FROM python:3.6.15-slim-buster

# Set the working directory in the container to /flask-examples (assuming this is the main app directory)
WORKDIR /flask-examples

# Copy the requirements.txt file into the working directory
COPY requirements.txt ./

# Update apt and install vim (useful for debugging or editing directly inside the container)
RUN apt-get update && apt-get install -y vim

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install the required Python dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose port 5000 to the outside world (used by Flask)
EXPOSE 5000

# Set the working directory to where your Flask app is located
WORKDIR /flask-examples/hello

# Set the FLASK_APP environment variable to the Flask app module (in this case, app.py)
ENV FLASK_APP=app.py

# Run Flask in production-friendly mode
CMD ["flask", "run", "--host=0.0.0.0"]

