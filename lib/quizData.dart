import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question('Flutter is open-source', true),
    Question('Amazon owns Flutter', false),
    Question('Flutter for Web and Desktop is now stable', true),
    Question('Sparky is Flutter\'s official mascot', false),
    Question('Flutter was released in 2020', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) _questionNumber++;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
