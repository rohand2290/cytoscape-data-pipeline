#!/bin/bash
xvfb-run -a Cytoscape &
sleep 20
python install_string.py
setsid fastapi run app/main.py
