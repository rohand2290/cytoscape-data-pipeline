# Start FROM the official Cytoscape image
FROM cytoscape/cytoscape-desktop:latest

# (Optional) Set a working directory for your app
WORKDIR /app

# Install Python and pip if not included (most images are Debian-based)
RUN apt-get update && apt-get install -y python3 python3-pip

# Copy your API code and requirements
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . /app

# Entry point: start Cytoscape, then your API
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

