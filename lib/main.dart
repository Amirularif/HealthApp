import 'package:flutter/cupertino.dart';
import 'package:healthapp/Dashboard.dart';
import 'package:healthapp/Login.dart';
import 'package:healthapp/Register.dart';
import 'package:healthapp/calendar.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/graph.dart';
import 'package:healthapp/mood.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' :(context) => LoginPage(),//SurveyPage(),
        '/Register' :(context) => RegisterPage(),
        '/dashboard' :(context) =>DashboardPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.white10,
      scaffoldBackgroundColor: Colors.white10),
      title: "Mood Diary",
    );
  }
}

