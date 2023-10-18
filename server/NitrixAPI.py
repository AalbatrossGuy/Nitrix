from fastapi import FastAPI, Depends

nitrix = FastAPI()


@nitrix.get('/')
async def home():
    return {'message': 'Run Nitrix'}
