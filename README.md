# desafio: Flutter training app

A small Flutter app built to practice UI, local state and REST integration. The home screen leads to three features:

- **To-do list:** add tasks, block duplicates with a dialog, and mark tasks as done.
- **GitHub profile lookup:** calls `GET https://api.github.com/users/{user}` and shows the avatar, login, name and bio, with loading and error feedback.
- **Star Wars browser:** lists characters from [SWAPI](https://swapi.dev) with `FutureBuilder`, filters them by name, and opens a detail page (height, mass, birth year).

**Stack:** Flutter · Dart · `http` · JSON models · API providers in `lib/network/`

## Run

```bash
flutter pub get
flutter run
```

Built in 2022 as a Flutter coding challenge.
