import '../models/quiz_question.dart';

const questions = [
  QuizQuestion('Ktorý jazyk používa Flutter?', [
    'Dart',
    'Java',
    'Kotlin',
    'Swift',
  ]),
  QuizQuestion('Čo tvorí základ rozhrania vo Flutteri?', [
    'Widgety',
    'Databázy',
    'Kontroléry',
    'HTML súbory',
  ]),
  QuizQuestion('Ktorý widget spravuje meniaci sa stav?', [
    'StatefulWidget',
    'StatelessWidget',
    'Padding',
    'Text',
  ]),
  QuizQuestion('Ktorá metóda oznámi zmenu stavu?', [
    'setState()',
    'print()',
    'main()',
    'toString()',
  ]),
  QuizQuestion('Ktorý widget usporiada deti zvisle?', [
    'Column',
    'Row',
    'Stack',
    'Icon',
  ]),
  QuizQuestion('Ktorá metóda filtruje zoznam podľa podmienky?', [
    'where()',
    'shuffle()',
    'add()',
    'join()',
  ]),
];
