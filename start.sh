#!/bin/bash
xvfb-run -a /cytoscape-unix-3.10.1/cytoscape.sh &
sleep 20
exec fastapi run app/main.py
