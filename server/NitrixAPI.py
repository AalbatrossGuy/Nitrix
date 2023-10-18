from fastapi import FastAPI, Depends, Path
from typing import Annotated

nitrix = FastAPI()


@nitrix.get('/')
async def home():
    return {'message': 'Run Nitrix'}


@nitrix.get('/profile/{pid}')
async def _get_profile_data(pid: Annotated[str, Path(max_length=3)]):

    return {"profile": pid}
