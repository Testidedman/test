from __future__ import annotations

from typing import List
from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session

from ..database import get_db
from ..models import Book as BookModel
from ..schemas import Book as BookSchema

router = APIRouter()


@router.get("/books/rating", response_model=List[BookSchema], tags=["books"])
def get_books_rating(db: Session = Depends(get_db)) -> List[BookSchema]:
    books = db.query(BookModel).all()
    return [
        BookSchema(
            id=b.id,
            title=b.title,
            year=b.year,
            pages=b.pages,
            profilePicture=b.profile_picture,
            authorId=b.author_id,
            genres=b.genres,
            marks=b.marks,
            author=b.author,
            averageRating=b.average_rating,
        )
        for b in books
    ]


@router.get("/book/{book_id}", response_model=BookSchema, tags=["books"])
def get_book(book_id: str, db: Session = Depends(get_db)) -> BookSchema:
    b = db.get(BookModel, book_id)
    if not b:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")
    return BookSchema(
        id=b.id,
        title=b.title,
        year=b.year,
        pages=b.pages,
        profilePicture=b.profile_picture,
        authorId=b.author_id,
        genres=b.genres,
        marks=b.marks,
        author=b.author,
        averageRating=b.average_rating,
    )
