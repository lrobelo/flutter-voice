import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [
    Question(
        'Descriptive knowledge consists of a collection of facts about observed events',
        'Description'),
    Question(
        'Statement of the anticipated outcome of a presently unknown or future measurement',
        'Prediction'),
    Question('Actual manipulation of variable to produce intended outcomes',
        'Control'),
    Question(
        'Presumed but unobserved entitities that could not be manipulated in an experiment',
        'Hypothetical construct'),
    Question(
        'Demonstrating that the prior level of baseline responding would have remained unchanged had the independent variable not been introduced',
        'Verification'),
    Question(
        'Repeating conditions within an experiment to determine the reliability of effects and increase internal validity or repeating whole experiments to determine generality of findings',
        'Replication'),
    Question(
        'The extent to which data obtained from measurement are directly relevant to the target behavior of interest and to the reason for measuring it',
        'Validity'),
    Question(
        'The level of investigation that demonstrations correlation between events and is based on repeated observation',
        'Prediction'),
    Question(
        'The level of investigation in which functional relationships can be derived',
        'Control'),
    Question(
        'Achieve a through understanding of phenomenon under study', 'Science'),
    Question('Most useful level of understanding the effect of treatment',
        'Individual level'),
    Question(
        'ABA identifies early interventions for socially significant behavior by focusing on',
        'Behavior of individual subjects'),
  ];

  var choices = [
    ['Description', 'Prediction', 'Control'],
    ['Description', 'Prediction', 'Control'],
    ['Description', 'Prediction', 'Control'],
    ['Description', 'Prediction', 'Hypothetical construct'],
    ['Verification', 'Prediction', 'Hypothetical construct'],
    ['Verification', 'Prediction', 'Replication'],
    ['Verification', 'Validity', 'Replication'],
    ['Prediction', 'Validity', 'Replication'],
    ['Prediction', 'Validity', 'Control'],
    ['Prediction', 'Science', 'Control'],
    ['Individual level', 'Science', 'Control'],
    ['Individual level', 'Behavior of individual subjects', 'Control'],
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) _questionNumber++;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  /*bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }*/

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}
