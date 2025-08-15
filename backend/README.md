# FastAPI Backend for Flutter App

## Prerequisites
- Python 3.10+

## Setup
1. Create a virtual environment and install dependencies:
```bash
python3 -m venv backend/.venv
source backend/.venv/bin/activate
pip install -r backend/requirements.txt
```

2. Run the server:
```bash
uvicorn app.main:app --reload --app-dir backend
```

- Swagger UI: http://127.0.0.1:8000/docs
- ReDoc: http://127.0.0.1:8000/redoc
- Admin Panel: http://127.0.0.1:8000/admin

## Flutter Configuration
Set `dev_base_url` (and/or `prod_base_url`) in your remote config to:
```
http://127.0.0.1:8000/
```
Note the trailing slash.
