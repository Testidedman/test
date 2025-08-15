from __future__ import annotations

from sqlalchemy import Column, Integer, String, Float, JSON

from .database import Base


class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, nullable=False, index=True)
    hashed_password = Column(String, nullable=False)


class Book(Base):
    __tablename__ = "books"

    id = Column(String, primary_key=True, index=True)
    title = Column(String, nullable=False)
    year = Column(Integer, nullable=False)
    pages = Column(Integer, nullable=False)
    profile_picture = Column(String, nullable=False)
    author_id = Column(Integer, nullable=False)
    genres = Column(JSON, nullable=False)
    author = Column(String, nullable=True)
    average_rating = Column(Float, nullable=True)
    marks = Column(JSON, nullable=True)
