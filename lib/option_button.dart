import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  OptionButton({Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  String buttonText;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: TextButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0),
          ),
        ),
        child: Ink(
          height: 70,
          decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffFA5077), Color(0xffB56DEC)]),
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          ),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Poppins-Bold',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
