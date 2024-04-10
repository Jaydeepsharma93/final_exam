import 'package:final_exam/view/screen/addstudentdata.dart';
import 'package:final_exam/view/screen/homescreen.dart';
import 'package:final_exam/view/screen/Detailscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
         '/' : (context) => Home(),
        '/add' : (context) => AddStudent(),
        '/detail' : (context) => StudentDetail()
      },
    );
  }
}
