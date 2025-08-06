from fastapi import APIRouter
import py4cytoscape as p4c
from schemas.CyjsResponse import CyjsResponse
router = APIRouter()

@router.get("/cyjs/{year}")
async def cyjs_handler(year: int):
    p4c.delete_all_networks()
    p4c.import_network_from_file(f'networks/{year}network.cx')
    return CyjsResponse(data=str(p4c.networks.create_cytoscapejs_from_network())) 
    
