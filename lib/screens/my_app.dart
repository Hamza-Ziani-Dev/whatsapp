import 'package:flutter/material.dart';
import 'package:whatsapp/screens/main_home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "WhastApp",
      color: Colors.white,
       theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
         titleTextStyle: TextStyle(color: Colors.white)
        ),
      ),
      home: const MainHome(),
      
      
    );
  }
}