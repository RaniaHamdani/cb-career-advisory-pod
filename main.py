from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from starlette.responses import JSONResponse
#from core_engine.routers.disabilities_routers import router as disability_router
from graphene import ObjectType, String, Schema


app = FastAPI()

origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(disability_router)

@app.get("/")
async def read_root():
    return {"message": "Welcome to this fantastic app."}

@app.get('/healthz')
def health():
    return {"status": "healthy"}

@app.exception_handler(Exception)
async def exception_handler(request, exc):
    # Custom exception handling logic
    return JSONResponse(status_code=500, content={"message": "Internal server error"})






"""
if __name__ == "__main__":
    uvicorn.run(
        "app:app",
        host=settings.HOST,
        reload=settings.DEBUG_MODE,
        port=settings.PORT,
    )
"""