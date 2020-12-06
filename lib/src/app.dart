// import flutter
import "package:flutter/material.dart";
// import login screen
import "screens/login_screen.dart";

// app class
class App extends StatelessWidget {
  // build method
  Widget build(BuildContext context) {
    // return a material app
    return MaterialApp(
      // title
      title: 'Login BLOC Application',
      // home page
      home: Scaffold(
        // appbar
        appBar: AppBar(
          // title
          title: Text('Login Bloc Application'),
          backgroundColor: Colors.teal,
        ),
        // body
        body: LoginScreen(),
      ),
    );
  }
}
