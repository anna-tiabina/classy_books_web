# Use the official Python 3.8 slim image as the base image
FROM python:3.8-slim

# Set the working directory within the container
WORKDIR /flask_ccb

# Copy the necessary files and directories into the container

COPY C:\Users\Tyabi\web application my.py requirements.txt /flask_ccb/
COPY C:\Users\Tyabi\web application my_database.db /flask_ccb/


COPY C:\Users\Tyabi\web application\__pycache__ /flask_ccb/__pycache__
COPY C:\Users\Tyabi\web application\static /flask_ccb/static
COPY C:\Users\Tyabi\web application\env /flask_ccb/env
COPY C:\Users\Tyabi\web application\templates /flask_ccb/templates


# Upgrade pip and install Python dependencies
RUN pip3 install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for the Flask application
EXPOSE 5000

# Define the command to run the Flask application using Gunicorn
CMD ["gunicorn", "application:app", "-b", "0.0.0.0:5000", "-w", "4"]