from __future__ import annotations

from typing import List, Optional
from pydantic import BaseModel, EmailStr


class Mark(BaseModel):
    mark: int
    percent: int


class Book(BaseModel):
    id: str
    title: str
    year: int
    pages: int
    profilePicture: str
    authorId: int
    genres: List[int]
    marks: Optional[List[Mark]] = None
    author: Optional[str] = None
    averageRating: Optional[float] = None

    model_config = {
        "json_schema_extra": {
            "example": {
                "id": "1",
                "title": "Sample Book",
                "year": 2020,
                "pages": 250,
                "profilePicture": "https://example.com/image.jpg",
                "authorId": 1,
                "genres": [0, 1],
                "marks": [{"mark": 5, "percent": 80}],
                "author": "John Doe",
                "averageRating": 4.2,
            }
        }
    }


class TokenPair(BaseModel):
    access_token: str
    refresh_token: str


class RegisterRequest(BaseModel):
    email: EmailStr
    login: EmailStr
    password: str
