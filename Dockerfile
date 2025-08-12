FROM python:3.7-slim-bullseye


# Set working directory
WORKDIR /app

# Install AWS CLI first (system dependency)
RUN apt update -y && apt install awscli -y

# Copy only requirements first for better caching
COPY requirements.txt .

# Install Python dependencies without cache
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose port if your app uses it
EXPOSE 8080

# Start the app
CMD ["python3", "app.py"]
