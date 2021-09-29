# Notes Fullstack with Django Rest Framework and Flutter
- Idea and backend related to https://www.youtube.com/watch?v=VnztChBw7Og&t=6016s
- Flutter app inspired by the same but made differently

## Setup
```sh
git clone https://github.com/kavin25/notes_fullstack_django_flutter.git
cd notes_fullstack_django_flutter
cd backend
virtualenv env
source env/bin/activate # source env/bin/activate.fish for fish
pip install -r requirements.txt
cd ../app
flutter pub get
```

### Run Backend
```sh
python3 manage.py runserver
```

### Run App
```sh
flutter run
```

## Tech
### Backend
- Django
- Django Rest Framework

### Frontend
- Flutter
- Provider (for state management)
- `http` package for hitting api requests
