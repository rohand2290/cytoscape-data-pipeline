from fastapi import FastAPI
from schemas.CyjsResponse import CyjsResponse
from api.cyjshandler import router as cyjs_router
from api.svg_handler import router as svg_router

app = FastAPI()


app.include_router(cyjs_router)
app.include_router(svg_router)




