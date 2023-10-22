from fastapi import FastAPI, HTTPException
from models import Profile
from typing import Annotated
from configparser import ConfigParser
import psycopg

nitrix = FastAPI()
metas = ConfigParser()
metas.read('config.ini')
# connectx = psycopg.connect("postgres://postgres:pgadmin4@localhost:5432/fastapi")
connectx = psycopg.connect(
    f"dbname={metas['DATABASEINFO']['name']} user={metas['DATABASEINFO']['user']} password={metas['DATABASEINFO']['password']} host={metas['DATABASEINFO']['host']} port={metas['DATABASEINFO']['port']}")


@nitrix.get('/')
async def home():
    return {'message': f'Nitrix v{metas["GENERALINFO"]["api_version"]}'}


# @nitrix.get('/profile/{pid}')
# async def _get_profile_data(pid: Annotated[str, Path(max_length=3)]):
#     return {"profile": pid}


@nitrix.post("/register")  # Need to work on this as a modified signup
async def _register(profile: Profile):
    cur = connectx.cursor()
    # query =
    if profile.account_type not in ["Admin", "Teacher", "Student"]:
        raise HTTPException(status_code=422, detail="Account type should be 'Admin', 'Teacher' or 'Student' only. ")
    cur.execute("INSERT INTO profile(user_id, user_name, account_type) VALUES (%s, %s, %s);",
                (profile.user_id, profile.user_name, profile.account_type))
    connectx.commit()
    return profile


@nitrix.get("/user/{user_name}")
async def _get_user_details(user_name: Annotated[str, None]):
    cur = connectx.cursor()
    cur.execute("SELECT user_id, account_type FROM profile WHERE user_name = %s", (user_name,))
    user_id = cur.fetchone()
    cur.close()
    if user_id:
        return user_id
    else:
        raise HTTPException(status_code=404, detail="User Not Found")
