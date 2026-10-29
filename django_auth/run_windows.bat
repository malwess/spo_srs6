@echo off
cd /d "%~dp0"
if not exist venv (
    python -m venv venv || py -m venv venv
)
call venv\Scripts\activate.bat
pip install -r requirements.txt
python manage.py migrate
python manage.py collectstatic --noinput
start http://127.0.0.1:8000/accounts/login/
python manage.py runserver
pause
