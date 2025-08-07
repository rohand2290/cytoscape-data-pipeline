# cytoscape-data-pipeline
A data pipeline to transform the network generating process in the [Jupyter Notebook](https://colab.research.google.com/github/rohand2290/find-orthologs/blob/main/find_orthologs.ipynb#scrollTo=83ae6ab9) I developed into a more programmatic interface using FastAPI, `py4cytoscape`, and a headless version of Cytoscape utilizing `xvfb`, a headless version of the X server.

## Purpose
I was satisfied enough with the notebook's methodology, as it did what I wanted it to do.
However, I wanted to transform this into a data pipeline that could handle many requests at once plus also other proteins. 

## Usage
Make sure to have Cytoscape, xvfb, devenv, and Nix installed. Then, run 
```
xvfb-run -a cytoscape
```
to launch the headless version.
After that, run `devenv shell` and `fastapi dev app/main.py` to launch the REST api. 

## Deployment/Production
Make sure to have Docker installed.
Then, run
```
docker build -t cytoscape-data-pipeline .
```
and then run
```
docker run -p 8000:8000 -p 1234:1234 cytoscape-data-pipeline
```
