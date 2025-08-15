from __future__ import annotations

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

from .config import settings
from .database import Base, engine, SessionLocal
from .routers import health as health_router
from .routers import auth as auth_router
from .routers import books as books_router
from .admin import init_admin
from .seed import seed_data

app = FastAPI(title="Test App Backend", version="0.1.0", default_response_class=JSONResponse)

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.cors_origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(health_router.router)
app.include_router(auth_router.router)
app.include_router(books_router.router)

# Initialize admin site at /admin
admin = init_admin(app)


@app.on_event("startup")
def on_startup() -> None:
    Base.metadata.create_all(bind=engine)
    if settings.seed_on_startup:
        db = SessionLocal()
        try:
            seed_data(db)
        finally:
            db.close()


@app.get("/", tags=["root"])
def root() -> dict[str, str]:
    return {"message": "Backend up"}
