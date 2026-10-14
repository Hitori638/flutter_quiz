# Flutter Quiz App

Interaktívny kvíz so šiestimi otázkami v slovenčine.

## Spustenie

```sh
flutter pub get
flutter run
```

V Android Studiu otvorte koreň projektu a spustite virtuálne zariadenie cez Device Manager.

## Overenie

```sh
flutter analyze
flutter test
```

## Štruktúra a požiadavky

- `lib/data/questions.dart`: štruktúrované otázky. Prvá odpoveď je správna.
- `lib/models/quiz_question.dart`: model a shuffle kópie odpovedí.
- `lib/models/answer_button.dart`: opakovane použiteľné tlačidlo.
- `lib/quiz.dart`: StatefulWidget, setState, prepínanie obrazoviek a vymazanie odpovedí pri reštarte.
- `lib/start_screen.dart`: Start Quiz.
- `lib/questions_screen.dart`: automatický postup, map() a spread operátor, náhodné poradie odpovedí uložené počas otázky.
- `lib/results_screen.dart`: mapovanie odpovedí, where().length, skóre a Restart Quiz.
- `lib/questions_summary.dart`: posúvateľný prehľad odpovedí s farebným rozlíšením.

Layout používa Column, Row, Expanded a SingleChildScrollView.
Test overuje zmiešané skóre, postup otázkami, reštart a následné plné skóre.

## Odovzdanie

ZIP `quiz_app_sources.zip` obsahuje lib/ a pubspec.yaml.
Screenshoty z Android emulátora patria do `screenshots/`.
Projekt je potrebné nahrať do vlastného GitHub/GitLab/Bitbucket repozitára a odovzdať jeho URL.
