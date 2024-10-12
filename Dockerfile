# Use the official Python 3.8 slim image as the base image
FROM python:3.8-slim

# By default, listen on port 5000
EXPOSE 5000/tcp

# Set the working directory within the container
WORKDIR /app

# Copy the necessary files and directories into the container

COPY my.py requirements.txt /app/
COPY my_database.db /app/


COPY __pycache__ /app/__pycache__
COPY static /app/static
COPY env /app/env
COPY templates /app/templates


# Upgrade pip and install Python dependencies
RUN pip3 install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for the Flask application
EXPOSE 5000

#ENV FLASK_APP=my.py
# Define the command to run the Flask application using Gunicorn
#CMD ["/flask_ccb/env/Scripts/flask", "run"]
CMD [ "python", "./my.py" ]