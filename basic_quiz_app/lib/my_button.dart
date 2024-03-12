import 'package:flutter/material.dart';
import 'package:flutter_application_1/landing_page.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final Function()? onTap;

  const MyButton({Key? key, this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to QuizUI screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LandingPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
            child: Text(text ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ))),
      ),
    );
  }
}
