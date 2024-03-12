import 'package:flutter/material.dart';

class QuizUI extends StatefulWidget {
  const QuizUI({super.key});

  @override
  //here the _QuizUIState is not constant because we are using the default constructor here if we used const object then we have to bring constant constructor in the picture.
  State createState() => _QuizUIState();
}

class SingleQuestionModel {
  final String? question;
  final List<String>? options;
  final int? answerIndex;

  const SingleQuestionModel({this.question, this.options, this.answerIndex});
}

class _QuizUIState extends State {
  //Question set in key value pair

  List allquestion = [
    const SingleQuestionModel(
      question: "1. Who is the Founder of Microsoft?",
      options: ["Bill Gates", "Steve Jobs", "Elon Musk", "Larry Page"],
      answerIndex: 0,
    ),
    const SingleQuestionModel(
      question: "2. Who is the Founder of Apple?",
      options: ["Bill Gates", "Steve Jobs", "Elon Musk", "Larry Page"],
      answerIndex: 1,
    ),
    const SingleQuestionModel(
      question: "3. Who is the Founder of google?",
      options: ["Bill Gates", "Steve Jobs", "Elon Musk", "Larry Page"],
      answerIndex: 3,
    ),
    const SingleQuestionModel(
      question: "4. Who is the Founder of Tesla?",
      options: ["Bill Gates", "Steve Jobs", "Elon Musk", "Larry Page"],
      answerIndex: 2,
    ),
    const SingleQuestionModel(
      question: "5. Who is the Founder of SpaceX?",
      options: ["Bill Gates ", "Steve Jobs", "Elon Musk", "Larry Page"],
      answerIndex: 2,
    ),
  ];

  //variables
  bool questionScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int noOfCorrectAnswers = 0;

  MaterialStateProperty<Color?> checkAnswer(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == allquestion[questionIndex].answerIndex) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void validateCurrentPage() {
    if (selectedAnswerIndex == -1) {
      if (questionIndex == allquestion.length - 1) {
        setState(() {
          questionScreen = false;
        });
      } else {
        setState(() => questionIndex++);
      }
    }

    if (selectedAnswerIndex == allquestion[questionIndex].answerIndex) {
      noOfCorrectAnswers += 1;
    }

    if (selectedAnswerIndex != -1) {
      if (questionIndex == allquestion.length - 1) {
        setState(() {
          questionScreen = false;
        });
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex += 1;
      });
    }
  }

  Scaffold isQuestionScreen() {
    if (allquestion.length != questionIndex) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 200,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          title: const Text(
            'Quizical',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w800, color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: const Color(0xFFF4F4F4),
          child: Column(
            //we cant keep the column constant here becase the variables are changing at run time i.e questionIndex so for this reason the column is not constant
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Questions: ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${questionIndex + 1}/${allquestion.length}',
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),

              Container(
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 91, 201, 190),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(25, 25),
                      topRight: Radius.elliptical(25, 25),
                      bottomLeft: Radius.elliptical(15, 15),
                      bottomRight: Radius.elliptical(15, 15)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(185, 182, 182, 0.831),
                      offset: Offset(10, 10),
                      blurRadius: 8,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(146, 144, 144, 0.831),
                      offset: Offset(10, 10),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                        child: Text(
                      allquestion[questionIndex].question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ],
                ),
              ),

              const SizedBox(
                height: 5,
              ),

              //options
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(0),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 50)),
                  shadowColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(255, 0, 0, 0),
                  ),
                  shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(15, 15),
                        bottomRight: Radius.elliptical(15, 15),
                        topLeft: Radius.elliptical(15, 15),
                        bottomLeft: Radius.elliptical(15, 15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 0;
                    });
                  }
                },
                child: Text(
                  "A.${allquestion[questionIndex].options[0]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(1),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 50)),
                  shadowColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(255, 0, 0, 0),
                  ),
                  shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(15, 15),
                        bottomRight: Radius.elliptical(15, 15),
                        topLeft: Radius.elliptical(15, 15),
                        bottomLeft: Radius.elliptical(15, 15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 1;
                    });
                  }
                },
                child: Text(
                  "B.${allquestion[questionIndex].options[1]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(2),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 50)),
                  shadowColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(255, 0, 0, 0),
                  ),
                  shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(15, 15),
                        bottomRight: Radius.elliptical(15, 15),
                        topLeft: Radius.elliptical(15, 15),
                        bottomLeft: Radius.elliptical(15, 15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 2;
                    });
                  }
                },
                child: Text(
                  "C.${allquestion[questionIndex].options[2]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: checkAnswer(3),
                  fixedSize: const MaterialStatePropertyAll(Size(180, 50)),
                  shadowColor: const MaterialStatePropertyAll(
                    Color.fromRGBO(255, 0, 0, 0),
                  ),
                  shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(15, 15),
                        bottomRight: Radius.elliptical(15, 15),
                        topLeft: Radius.elliptical(15, 15),
                        bottomLeft: Radius.elliptical(15, 15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (selectedAnswerIndex == -1) {
                    setState(() {
                      selectedAnswerIndex = 3;
                    });
                  }
                },
                child: Text(
                  "D.${allquestion[questionIndex].options[3]}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            validateCurrentPage();
          },
          backgroundColor: Colors.teal,
          child: const Icon(
            Icons.forward,
            color: Color.fromARGB(168, 8, 0, 0),
          ),
        ),
      );
    } else {
      if (noOfCorrectAnswers == allquestion.length) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 200,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            title: const Text(
              'Quizical',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Border radius for the container
                    color: Colors
                        .tealAccent, // Background color for the container (celebrations)
                    border: Border.all(
                      // Border properties
                      color: Colors.black, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.all(10), // Padding inside the container
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8), // Border radius for the image
                    child: Image.asset(
                      'lib/images/trophy.jpeg', // Replace 'your_image.jpg' with the actual image path
                      width: 200, // Width of the image
                      height: 200, // Height of the image
                      fit: BoxFit
                          .cover, // Adjust the image to cover the entire area
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 210, 199),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(25, 25),
                        topRight: Radius.elliptical(25, 25),
                        bottomLeft: Radius.elliptical(25, 25),
                        bottomRight: Radius.elliptical(25, 25)),
                    /*boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(175, 248, 5, 0.956),
                      offset: Offset(10, 10),
                      blurRadius: 8,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(175, 248, 5, 0.956),
                      offset: Offset(10, 10),
                      blurRadius: 8,
                    ),
                  ],*/
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        child: Text(
                          "Congragulation!!!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "You Have Finished the Quiz",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Score : $noOfCorrectAnswers  /  ${allquestion.length}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal),
                  fixedSize: MaterialStatePropertyAll(Size(130, 40)),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(15, 15),
                        bottomRight: Radius.elliptical(15, 15),
                        topLeft: Radius.elliptical(15, 15),
                        bottomLeft: Radius.elliptical(15, 15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  questionIndex = 0;
                  noOfCorrectAnswers = 0;
                  selectedAnswerIndex = -1;
                  setState(() {
                    questionScreen = true;
                  });
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh), // Icon widget for the reset icon
                    SizedBox(
                        width: 5), // SizedBox for spacing between icon and text
                    Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else if (noOfCorrectAnswers == 0) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 200,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            title: const Text(
              'Quizical',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Border radius for the container
                    color: Colors
                        .tealAccent, // Background color for the container (celebrations)
                    border: Border.all(
                      // Border properties
                      color: Colors.black, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.all(10), // Padding inside the container
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8), // Border radius for the image
                    child: Image.asset(
                      'lib/images/poor.jpeg', // Replace 'your_image.jpg' with the actual image path
                      width: 200, // Width of the image
                      height: 200, // Height of the image
                      fit: BoxFit
                          .cover, // Adjust the image to cover the entire area
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 210, 199),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(25, 25),
                        topRight: Radius.elliptical(25, 25),
                        bottomLeft: Radius.elliptical(25, 25),
                        bottomRight: Radius.elliptical(25, 25)),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        child: Text(
                          "Poor Performance!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "You Have Finished the Quiz",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Score : $noOfCorrectAnswers  /  ${allquestion.length}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal),
                  fixedSize: MaterialStatePropertyAll(Size(130, 40)),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(15, 15),
                        bottomRight: Radius.elliptical(15, 15),
                        topLeft: Radius.elliptical(15, 15),
                        bottomLeft: Radius.elliptical(15, 15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  questionIndex = 0;
                  noOfCorrectAnswers = 0;
                  selectedAnswerIndex = -1;
                  setState(() {
                    questionScreen = true;
                  });
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh), // Icon widget for the reset icon
                    SizedBox(
                        width: 5), // SizedBox for spacing between icon and text
                    Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 200,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            title: const Text(
              'Quizical',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Border radius for the container
                    color: Colors
                        .tealAccent, // Background color for the container (celebrations)
                    border: Border.all(
                      // Border properties
                      color: Colors.black, // Border color
                      width: 2, // Border width
                    ),
                  ),
                  padding:
                      const EdgeInsets.all(10), // Padding inside the container
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8), // Border radius for the image
                    child: Image.asset(
                      'lib/images/needpract.jpg', // Replace 'your_image.jpg' with the actual image path
                      width: 200, // Width of the image
                      height: 200, // Height of the image
                      fit: BoxFit
                          .cover, // Adjust the image to cover the entire area
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 210, 199),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(25, 25),
                        topRight: Radius.elliptical(25, 25),
                        bottomLeft: Radius.elliptical(25, 25),
                        bottomRight: Radius.elliptical(25, 25)),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(
                        child: Text(
                          "Need Practice",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                "You Have Finished the Quiz",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Score : $noOfCorrectAnswers  /  ${allquestion.length}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.teal),
                  fixedSize: MaterialStatePropertyAll(Size(130, 40)),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(15, 15),
                        bottomRight: Radius.elliptical(15, 15),
                        topLeft: Radius.elliptical(15, 15),
                        bottomLeft: Radius.elliptical(15, 15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  questionIndex = 0;
                  noOfCorrectAnswers = 0;
                  selectedAnswerIndex = -1;
                  setState(() {
                    questionScreen = true;
                  });
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh), // Icon widget for the reset icon
                    SizedBox(
                        width: 5), // SizedBox for spacing between icon and text
                    Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
