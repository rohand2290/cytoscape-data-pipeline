# Start FROM the official Cytoscape image
FROM ubuntu:latest


ENV DISPLAY=:1
ENV XVFB_SCREEN_WIDTH=1920
ENV XVFB_SCREEN_HEIGHT=1080
ENV CYREST_PORT=1234
ENV NOVNC_PORT=6080
WORKDIR /app

RUN apt-get update && apt -y install openjdk-17-jdk xvfb supervisor x11vnc novnc fluxbox websockify libxcursor1 wget python3 python3-pip python3-venv

RUN wget https://github.com/cytoscape/cytoscape/releases/download/3.10.3/Cytoscape_3_10_3_unix.sh
RUN chmod +x Cytoscape_3_10_3_unix.sh
RUN ./Cytoscape_3_10_3_unix.sh -q
# CMD ["/Cytoscape_3_10_3_unix.sh"]

RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . /app
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]





# (Optional) Set a working directory for your app
#WORKDIR /app
#
## Install Python and pip if not included (most images are Debian-based)
#RUN apt-get update && apt-get install -y python3 python3-pip
#
## Copy your API code and requirements
#COPY requirements.txt .
#RUN pip3 install --no-cache-dir -r requirements.txt
#
#COPY . /app
#
## Entry point: start Cytoscape, then your API
#COPY start.sh /start.sh
#RUN chmod +x /start.sh
#
#CMD ["/start.sh"]

