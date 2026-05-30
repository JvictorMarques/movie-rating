import logging
from typing import Optional

from pydantic import model_validator
from pydantic_settings import BaseSettings, SettingsConfigDict

logger = logging.getLogger(__name__)

_DEFAULT_ENVIRONMENT = 'development'
_DEFAULT_JWT_KEY = 'supersecretkey-with-enough-length-32b'
_DEFAULT_DB_USER = 'db'
_DEFAULT_DB_PASSWORD = 'db'  # NOSONAR
_DEFAULT_DB_DATABASE = 'db'
_DEFAULT_DB_ADDRESS = 'localhost'


class Settings(BaseSettings):
    model_config = SettingsConfigDict(
        env_file='.env', env_file_encoding='utf-8'
    )
    DEBUG: bool = False
    ENVIRONMENT: str = _DEFAULT_ENVIRONMENT

    DB_USER: str = _DEFAULT_DB_USER
    DB_PASSWORD: str = _DEFAULT_DB_PASSWORD
    DB_DATABASE: str = _DEFAULT_DB_DATABASE
    DB_ADDRESS: str = _DEFAULT_DB_ADDRESS
    DB_PORT: int = 5432

    JWT_SECRET_KEY: str = _DEFAULT_JWT_KEY
    JWT_ALGORITHM: str = 'HS256'
    JWT_ACCESS_TOKEN_EXPIRE_MINUTES: int = 15

    OTLP_ENDPOINT: Optional[str] = None

    @model_validator(mode='after')
    def validate_jwt_secret(self) -> 'Settings':
        if (
            self.ENVIRONMENT != _DEFAULT_ENVIRONMENT
            and self.JWT_SECRET_KEY == _DEFAULT_JWT_KEY
            or not self.JWT_SECRET_KEY
        ):
            logger.warning(
                'Using default JWT secret key in non-development environment.'
            )
            raise ValueError(
                'JWT_SECRET_KEY must be set in production environment'
            )
        return self

    @model_validator(mode='after')
    def validate_database_values(self) -> 'Settings':
        defaults = {
            self.DB_USER == _DEFAULT_DB_USER,
            self.DB_PASSWORD == _DEFAULT_DB_PASSWORD,
            self.DB_DATABASE == _DEFAULT_DB_DATABASE,
            self.DB_ADDRESS == _DEFAULT_DB_ADDRESS,
        }
        empties = {
            not self.DB_USER,
            not self.DB_PASSWORD,
            not self.DB_DATABASE,
            not self.DB_ADDRESS,
        }
        if self.ENVIRONMENT != _DEFAULT_ENVIRONMENT and (
            any(defaults) or any(empties)
        ):
            logger.warning(
                'Using default DB credentials in non-development environment.'
            )
            raise ValueError(
                'DB_USER, DB_PASSWORD, DB_DATABASE '
                'and DB_ADDRESS must be set in production environment'
            )
        return self

    @property
    def DATABASE_URL(self) -> str:
        return f'postgresql+psycopg://{self.DB_USER}:{self.DB_PASSWORD}@{self.DB_ADDRESS}:{self.DB_PORT}/{self.DB_DATABASE}'


settings = Settings()
