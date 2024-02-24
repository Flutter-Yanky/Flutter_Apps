import 'package:flutter/material.dart';
import 'package:table_of_2/assignment1.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Assignment1(),
    );
  }
}
