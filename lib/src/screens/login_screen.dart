// import flutter
import "package:flutter/material.dart";
// import bloc
import "../blocs/bloc.dart";
// import the provider
import "../blocs/provider.dart";

// login screen
class LoginScreen extends StatelessWidget {
  // build function
  @override
  Widget build(BuildContext context) {
    // create a new instance of bloc from the provider
    final bloc = Provider.of(context);
    // return the login widget
    return Container(
      // set the margin
      margin: EdgeInsets.all(20.0),
      // child
      child: buildForm(bloc),
    );
  }

  // function for buildong the form
  Widget buildForm(Bloc bloc) {
    // return form
    return Column(
      // children
      children: <Widget>[
        // email field
        emailField(bloc),
        // password field
        passwordField(bloc),
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
  // in order to start listening for changes about the input from the text field,
  // the text field has to be wrapped in a StreamBuilder widget, which will be responsible
  // for handling the wiring between the text field widget and the the bloc class
  // The stream class receives two named parameted:
  // 1. stream => the strem for which the field will belistening for
  // 2. builder => function that recieves a context and the snapshot
  // the snapshot stores any of the data received by the stream, => if an error did not
  // occur, the data will be found in the data property of the snapshot
  // however, if the error occured, the error will be found in the error property of the snapshot

  // function for returing the streambuilder
  StreamBuilder emailField(Bloc bloc) {
    // return a stream builder
    return StreamBuilder(
      // stream listeining to
      stream: bloc.email,
      // builder function
      builder: (context, snapshot) {
        // return the text field for the email
        return TextField(
          // keyboardType
          keyboardType: TextInputType.emailAddress,
          // onchanged
          onChanged: bloc.changeEmail,
          // set teh decoration
          decoration: InputDecoration(
            // lable
            labelText: 'Email Address',
            // hint text
            hintText: 'you@example.com',
            // icon
            icon: Icon(Icons.email),
            // error text
            errorText: snapshot.error,
          ),
        );
      },
    );
  }

  // function for showing the password field
  StreamBuilder passwordField(Bloc bloc) {
    // return a stream builder for the password
    return StreamBuilder(
        // set the stream
        stream: bloc.password,
        // builder function
        builder: (context, snapshot) {
          // return a textfield responsible for handling the password
          return TextField(
            // obscure the text
            obscureText: true,
            // onchanged
            onChanged: bloc.changePassword,
            // decoration
            decoration: InputDecoration(
                // label
                labelText: 'Password',
                // hint text
                hintText: 'Password',
                // iccon
                icon: Icon(
                  Icons.visibility_off,
                ),
                // error text
                errorText: snapshot.error),
          );
        });
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
