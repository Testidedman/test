from __future__ import annotations

from fastapi import APIRouter

router = APIRouter()


@router.get("/healthcheck", tags=["health"])
def healthcheck() -> dict[str, str]:
    return {"status": "ok"}
