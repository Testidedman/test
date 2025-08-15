from __future__ import annotations

from sqlalchemy.orm import Session
from fastapi import APIRouter, Depends, HTTPException, status

from ..database import get_db
from ..models import User
from ..schemas import RegisterRequest, TokenPair
from ..security import hash_password, create_access_token

router = APIRouter()


@router.post("/register", response_model=TokenPair, tags=["auth"])
def register(payload: RegisterRequest, db: Session = Depends(get_db)) -> TokenPair:
    existing = db.query(User).filter(User.email == payload.email).first()
    if existing:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="User already exists")

    user = User(email=payload.email, hashed_password=hash_password(payload.password))
    db.add(user)
    db.commit()
    db.refresh(user)

    access = create_access_token(subject=str(user.id))
    refresh = create_access_token(subject=str(user.id), expires_minutes=60 * 24 * 30)
    return TokenPair(access_token=access, refresh_token=refresh)
