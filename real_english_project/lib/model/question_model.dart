
class Question{
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question({required this.text,required this.options, this.isLocked = false, this.selectedOption});
}

class Option{
  final String text;
  final bool isCorrect;

  Option({required this.text,required this.isCorrect});
}

final questions1 =[
  Question(text: 'İstanbul ne zaman fethedilmiştir ?', options: [
    Option(text: '1453', isCorrect: true),
    Option(text: '1354', isCorrect: false),
    Option(text: '1643', isCorrect: false),
    Option(text: '1534', isCorrect: false)
  ]),
  Question(text: 'Ampülü kim icat etmiştir', options: [
    Option(text: 'Einstein', isCorrect: false),
    Option(text: 'Thomas Edison', isCorrect: false),
    Option(text: 'Nikola Tesla', isCorrect: true),
    Option(text: 'Alexander Grhambel', isCorrect: false)
  ]),
  Question(text: '', options: [])
];/// bunun içine sorular yazılacak