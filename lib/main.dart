import 'package:flutter/material.dart';
import 'pages/home_page.dart';
void main() {
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "flutter deemo",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
    );
  }
}
