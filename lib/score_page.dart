import 'package:flutter/material.dart';

class ScorePage extends StatelessWidget {
  ScorePage({Key? key, required this.score}) : super(key: key);
  int score;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 350,
            width: 350,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff189065), Color(0xff01D467)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your score is:',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontFamily: 'Poppins-SemiBold',
                  ),
                ),
                Text(
                  score.toString(),
                  style: const TextStyle(
                    fontSize: 60.0,
                    color: Colors.white,
                    fontFamily: 'Poppins-Bold',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 350,
            child: Text(
              score > 30
                  ? 'Congratulations! You did well🎉'
                  : 'Better Luck Next Time!😬',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                fontFamily: 'Poppins-SemiBold',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
