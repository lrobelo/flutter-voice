import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:voice_quiz_app/quizData.dart';

import 'option_button.dart';
import 'score_page.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(VQuizApp());

class VQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff252B48),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;
  int score = 0;
  String question = '';

  //void checkAnswer(bool userPickedAnswer) {
  void checkAnswer(String userPickedAnswer) {
    //bool correctAnswer = quizBrain.getCorrectAnswer();
    String correctAnswer = quizBrain.getCorrectAnswer();
    setState(
      () {
        if (correctAnswer == userPickedAnswer) {
          score += 10;
        } else {
          score -= 1;
        }
        quizBrain.nextQuestion();
      },
    );
  }

  @override
  void initState() {
    initAlan();
    super.initState();
  }

  void initAlan() {
    AlanVoice.addButton(
        "19daa354cbd97e08635a5037da9f5a3b2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_RIGHT);

    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
      var commandName = command.data["command"];
      if (commandName == "next") {
        setState(() {
          score = command.data["item"];
          questionNumber++;
          quizBrain.nextQuestion();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return questionNumber < 12
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 25),
                child: Text(
                  'Question ${questionNumber + 1}/12',
                  style: const TextStyle(
                    color: Color(0xff8187A6),
                    fontSize: 27,
                    fontFamily: 'Poppins-Bold',
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontFamily: 'Poppins-SemiBold',
                      ),
                    ),
                  ),
                ),
              ),
              OptionButton(
                  buttonText: quizBrain.choices[questionNumber][0],
                  //buttonText: 'True',
                  onPressed: () {
                    checkAnswer(quizBrain.choices[questionNumber][0]);
                    //checkAnswer(true);
                    questionNumber++;
                  }),
              OptionButton(
                  //buttonText: 'False',
                  buttonText: quizBrain.choices[questionNumber][1],
                  onPressed: () {
                    //checkAnswer(false);
                    checkAnswer(quizBrain.choices[questionNumber][1]);
                    questionNumber++;
                  }),
              OptionButton(
                  //buttonText: 'False',
                  buttonText: quizBrain.choices[questionNumber][2],
                  onPressed: () {
                    //checkAnswer(false);
                    checkAnswer(quizBrain.choices[questionNumber][2]);
                    questionNumber++;
                  }),
              const SizedBox(height: 20),
            ],
          )
        : ScorePage(score: score);
  }
}
