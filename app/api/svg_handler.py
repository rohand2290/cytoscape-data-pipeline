from fastapi import APIRouter, Response
import py4cytoscape as p4c
from schemas.CyjsResponse import CyjsResponse
from schemas.BackendRequest import BackendRequest
from services.query_by_disease import query_by_disease
import tempfile

router = APIRouter()

@router.post("/svg/{year}")
async def svg_handler(year: int, request: BackendRequest):

    p4c.delete_all_networks()
    p4c.import_network_from_file(f'networks/{year}network.cx')
    p4c.commands_post(query_by_disease(request.disease))
    p4c.merge_networks(sources=p4c.get_network_list(), operation=request.merging)
    with tempfile.NamedTemporaryFile(suffix=".svg") as tmp:
        tmp.close()
        p4c.network_views.export_image(tmp.name, type='SVG')
        with open(tmp.name, 'rb') as f:
            svg_bytes = f.read()
    return Response(content=svg_bytes, media_type='image/svg+xml')
    
