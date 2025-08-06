from fastapi import FastAPI
from schemas.CyjsResponse import CyjsResponse
from api.cyjshandler import router as cyjs_router

app = FastAPI()


app.include_router(cyjs_router)




