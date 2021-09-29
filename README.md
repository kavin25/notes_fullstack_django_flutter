# Notes Fullstack with Django Rest Framework and Flutter
- Idea and backend related to https://www.youtube.com/watch?v=VnztChBw7Og&t=6016s
- Flutter app inspired by the same but made differently

## Screenshots
<img src="https://user-images.githubusercontent.com/41034356/135322891-2c9123d3-637f-4ef7-b34c-95158b9db915.png" width="300px" />
<img src="https://user-images.githubusercontent.com/41034356/135323214-a00980bc-4d80-4303-974c-04c68535711c.png" width="300px" />


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
