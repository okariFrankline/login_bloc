// import async library
// async library is responsible for stream functionality that is required to
// handle text field inputs
import "dart:async";
// import validatormixin
import "mixins/validator_mixin.dart";

// create a bloc class
// in order use the mix in with this class, which does not extend any other base class,
// we need to extend the Object class, which is the base class for all the classes in dart.
// this is because the 'with' syntax adds the functions from a mixin class onto the base class
// of c class and not to the class itself.
// Hence, extending the Object class allows the current class to use the functions defineds in a mixin class
class Bloc extends Object with ValidatorMixin {
  // create a new email controller that will be used to handle email stream from
  // email text field
  final _emailController = StreamController<String>();
  // password controller
  final _passwordController = StreamController<String>();

  // getter fro accessing the email controller sink.add function( allows to add email to stream)
  Function(String) get changeEmail => _emailController.sink.add;
  // getter for the password(allows adding a password to stream)
  Function(String) get changePassword => _passwordController.sink.add;

  // getter for getting the stream
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  // stream for the password
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);

  // dispose function
  dispose() {
    // closes the stream created
    _emailController.close();
    // close the password stream
    _passwordController.close();
  }
}

// export an instance of the bloc
// any time this file will be imported, the importing file will get access to the
// this instance
final bloc = Bloc();
