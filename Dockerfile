# Use the official Python 3.11 image as the base image
FROM python:3.11

# By default, listen on port 5000
EXPOSE 5000/tcp

# Set the working directory within the container
WORKDIR /app

# Copy the necessary files and directories into the container

COPY app_CCB.py requirements.txt Dockerfile /app/
COPY my_database.db /app/
COPY classifier.pickle /app/
COPY ML_algorithm_CCB.py /app/
COPY test_pytest.py /app/
COPY test_unittest.py /app/
COPY static /app/static
COPY templates /app/templates
COPY README.md /app/

# Upgrade pip and install Python dependencies
RUN pip3 install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for the Flask application
EXPOSE 5000

# Define the command to run the Flask application using Gunicorn
CMD [ "python", "./app_CCB.py" ]