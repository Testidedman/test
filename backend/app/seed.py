from __future__ import annotations

from sqlalchemy.orm import Session

from .models import Book


def seed_data(db: Session) -> None:
    if db.query(Book).count() > 0:
        return

    books = [
        Book(
            id="1",
            title="Sample Book One",
            year=2020,
            pages=200,
            profile_picture="https://example.com/img1.jpg",
            author_id=1,
            genres=[0],
            marks=[{"mark": 5, "percent": 80}, {"mark": 4, "percent": 20}],
            author="Author A",
            average_rating=4.6,
        ),
        Book(
            id="2",
            title="Sample Book Two",
            year=2021,
            pages=300,
            profile_picture="https://example.com/img2.jpg",
            author_id=2,
            genres=[1, 2],
            marks=[{"mark": 5, "percent": 50}, {"mark": 3, "percent": 50}],
            author="Author B",
            average_rating=3.9,
        ),
    ]

    for b in books:
        db.add(b)
    db.commit()
