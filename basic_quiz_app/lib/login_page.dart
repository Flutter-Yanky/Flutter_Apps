import 'package:flutter/material.dart';
import 'package:flutter_application_1/landing_page.dart';
import 'package:flutter_application_1/textfields.dart';
import 'package:flutter_application_1/my_button.dart';

//square tile box for images

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
          height: 30,
        ));
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign USer in method
  void signUserIn() => LandingPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 30),
              const Icon(
                Icons.person,
                size: 100,
              ),

              const Text(
                'The Qizical',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 40),
              const Text(
                'Welcome Back Quizical, you/ve been missed!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 25),
              //username text
              Textfield(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false),

              const SizedBox(height: 10),
              //password textfield
              Textfield(
                  controller: passwordController,
                  hintText: 'password',
                  obscureText: true),

              //forgot password
              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              MyButton(
                text: 'Sign In',
                onTap: signUserIn,
              ),

              const SizedBox(height: 30),
              //or continue with
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Continue With',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(imagePath: 'lib/images/google_logo.jpg'),
                  SizedBox(width: 10),
                  SquareTile(imagePath: 'lib/images/apple_logo.jpg'),
                ],
              ),

              const SizedBox(height: 20),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a Member?'),
                  SizedBox(width: 4),
                  Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
