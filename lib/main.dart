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
  List<Icon> scoreKeeper = [];
  int questionNumber = 0;
  int score = 0;
  String question = '';

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(
      () {
        if (correctAnswer == userPickedAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
          score += 10;
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
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
    AlanVoice.addButton("YOUR_SDK_KEY",
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
    return questionNumber < 5
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 25),
                child: Text(
                  'Question ${questionNumber + 1}/5',
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
                  buttonText: 'True',
                  onPressed: () {
                    checkAnswer(true);
                    questionNumber++;
                  }),
              OptionButton(
                  buttonText: 'False',
                  onPressed: () {
                    checkAnswer(false);

                    questionNumber++;
                  }),
              const SizedBox(height: 20),
              Row(
                children: scoreKeeper,
              )
            ],
          )
        : ScorePage(score: score);
  }
}
