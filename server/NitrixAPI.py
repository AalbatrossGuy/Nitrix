from fastapi import FastAPI, Depends, Path
from pydantic import BaseModel
from typing import Annotated
from configparser import ConfigParser
import psycopg

nitrix = FastAPI()
metas = ConfigParser()
metas.read('config.ini')
# connectx = psycopg.connect("postgres://postgres:pgadmin4@localhost:5432/fastapi")
connectx = psycopg.connect("dbname=Nitrix user=postgres password=pgadmin4 host=localhost port=5432")


@nitrix.get('/')
async def home():
    return {'message': f'Nitrix v{metas["GENERALINFO"]["api_version"]}'}


@nitrix.get('/profile/{pid}')
async def _get_profile_data(pid: Annotated[str, Path(max_length=3)]):
    return {"profile": pid}


class Profile(BaseModel):
    user_id: int
    user_name: str


@nitrix.post("/test")
async def test_post(profile: Profile):
    cur = connectx.cursor()
    # query =
    cur.execute("INSERT INTO profile(user_id, user_name) VALUES (%s, %s);", (profile.user_id, profile.user_name))
    connectx.commit()
    return profile
