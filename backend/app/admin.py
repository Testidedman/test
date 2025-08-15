from __future__ import annotations

from sqladmin import Admin, ModelView
from starlette.applications import Starlette

from .database import engine
from .models import User, Book


class UserAdmin(ModelView, model=User):
    column_list = [User.id, User.email]


class BookAdmin(ModelView, model=Book):
    column_list = [Book.id, Book.title, Book.year, Book.pages]


def init_admin(app: Starlette) -> Admin:
    admin = Admin(app, engine)
    admin.add_view(UserAdmin)
    admin.add_view(BookAdmin)
    return admin
