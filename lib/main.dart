import 'package:flutter/material.dart';
import 'package:shein_app/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shein',
      theme: ThemeData(
       
        // textTheme: GoogleFonts.quicksandTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginNavigator(),
    );
  }
}


