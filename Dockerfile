# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Expose the FastAPI port
EXPOSE 80

ENV MONGO_DB=CareerAdvisoryfpd
ENV MONGO_CONNECTION_STRING=MONGO_DETAILS="mongodb://cb-mongo-svc-dev:K1BRCsPHJhxaJrdCbEjkdHyCaxhehYlFucNMzhUJYNcp5ybhHe3xvlYLt9YB5joankTWbTvxA7r9c1zpNYxbNw==@cb-mongo-svc-dev.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@cb-mongo-svc-dev@"


# Run your FastAPI application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
