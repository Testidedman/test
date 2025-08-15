from __future__ import annotations

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", env_prefix="APP_", extra="ignore")

    database_url: str = "sqlite:///./app.db"
    secret_key: str = "change-me"
    algorithm: str = "HS256"
    access_token_expires_minutes: int = 60
    cors_origins: list[str] = ["*"]
    seed_on_startup: bool = True


settings = Settings()
