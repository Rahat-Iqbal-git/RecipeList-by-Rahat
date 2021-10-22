import 'package:flutter/material.dart';
import 'package:the_recipe/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  // static const PrimaryColor = Colors.black87;
  @override
  Widget build(BuildContext context) {
    // const color = Colors.accents;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: color,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          )
        ),
        primarySwatch: Colors.blue,
      ),
      home: HOMEPAGE(),
    );
  }
}
