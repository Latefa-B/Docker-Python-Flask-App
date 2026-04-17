# Step 1: Choose a base image with Python
# Explanation: We start with an official Python image. 'python:3.9-alpine'
# means Python version 3.9 on a small Alpine Linux base, similar to Nginx Alpine.
FROM python:3.9-alpine

# Step 2: Set the working directory inside the container
# Explanation: This command creates a directory named '/app' inside the container
# and sets it as the current working directory for all subsequent commands.
# This keeps our application files organized.
WORKDIR /app

# Step 3: Copy the requirements file and install dependencies
# Explanation: We copy only the 'requirements.txt' file first. This is a best practice
# because if only the requirements change, Docker can use a cached layer for this step,
# making builds faster. Then, we install the Python libraries listed in it.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Step 4: Copy the rest of the application code
# Explanation: Now we copy all other files from our current folder (my-flask-app)
# into the '/app' directory inside the container. This includes app.py and the templates folder.
COPY . .

# Step 5: Expose the port the Flask app will run on
# Explanation: Our Flask app is configured to run on port 5000 (see app.py).
# This line informs Docker that the container will listen on this port.
EXPOSE 5000

# Step 6: Define the command to run the Flask application
# Explanation: This is the command that Docker will execute when a container
# is started from this image. It tells Python to run our 'app.py' script.
CMD ["python", "app.py"]

