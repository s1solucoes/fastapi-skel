from elasticapm.contrib.starlette import make_apm_client, ElasticAPM
from fastapi import FastAPI

apm = make_apm_client({
    'SERVICE_NAME': 'skel',
})

app = FastAPI()
app.add_middleware(ElasticAPM, client=apm)


@app.get("/")
async def root():
    return {"message": "Hello World"}
