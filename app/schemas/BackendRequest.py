from enum import IntEnum, Enum
from pydantic import BaseModel

class MergingOption(Enum):
    union = "union"
    intersection = "intersection"
    difference = "difference"




class BackendRequest(BaseModel):
    disease: str
    merging: MergingOption = MergingOption.union


