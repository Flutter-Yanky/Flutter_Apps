import 'package:flutter/material.dart';
import 'package:flutter_application_1/quiz_ui.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State createState() => _LandingPage();
}

class _LandingPage extends State {
  Scaffold quizScreens() {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: const Color.fromARGB(160, 146, 151, 12),
        title: const Text(
          "The Quizical",
          style: TextStyle(
            fontSize: 40,
            List<Shadow()>
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 29, 1, 1),
          ),
        ),
        toolbarHeight: 180,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),*/

      appBar: AppBar(
        toolbarHeight: 180,
        title: Text(
          'The Quizical',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.black,
            shadows: [
              Shadow(
                blurRadius: 3.0,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(159, 34, 161, 119),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 10, // Change the elevation of the app bar
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //founders Quiz Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizUI()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 85.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'lib/images/founderQ.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10), // Space between image and text

                    const Text(
                      "Founder ' s   Quiz", // Your text here
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              //Java Quiz
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizUI()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 85.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'lib/images/javaQ.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 20), // Space between image and text

                    const Text(
                      'Java  Adv.   Quiz', // Your text here
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              //AI Quiz
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuizUI()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 85.0,
                      height: 90.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'lib/images/ai.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(width: 10), // Space between image and text

                    const Text(
                      'Artificial Int. Quiz', // Your text here
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return quizScreens();
  }
}
