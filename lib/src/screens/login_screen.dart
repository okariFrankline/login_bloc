// import flutter
import "package:flutter/material.dart";

// login screen
class LoginScreen extends StatelessWidget {
  // build function
  @override
  Widget build(BuildContext context) {
    // return the login widget
    return Container(
      // set the margin
      margin: EdgeInsets.all(20.0),
      // child
      child: buildForm(),
    );
  }

  // function for buildong the form
  Widget buildForm() {
    // return form
    return Column(
      // children
      children: <Widget>[
        // email field
        emailField(),
        // password field
        passwordField(),
        // set a padding
        Padding(
          padding: EdgeInsets.only(
            top: 10.0,
          ),
        ),
        // submit button
        submitButton(),
      ],
    );
  }

  // function for showing the email field
  TextField emailField() {
    return TextField(
      // decoration
      decoration: InputDecoration(
        // set the label
        labelText: 'Email Address',
        // set the hin text
        hintText: 'you@example.com',
        // set the email
        icon: Icon(Icons.email),
      ),
      // keyboard type
      keyboardType: TextInputType.emailAddress,
    );
  }

  // function for showing the password field
  TextField passwordField() {
    // return a password field
    return TextField(
      // decoration
      decoration: InputDecoration(
        // label
        labelText: 'Password',
        // hint text
        hintText: "password",
        // icon
        icon: Icon(Icons.visibility_off),
      ),
      // hide the user input
      obscureText: true,
    );
  }

  // function for showing the submit function
  ElevatedButton submitButton() {
    // return an elevated button
    return ElevatedButton(
      // child
      child: Text('Submit'),
      // color
      style: ButtonStyle(
          // background color
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
      // on pressed
      onPressed: () {},
    );
  }
}
