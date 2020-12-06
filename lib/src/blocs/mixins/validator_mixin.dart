// provides validator stream tansformers for bloc class
// import dart:async because the stream transformers are found in the asyn lib
import "dart:async";

// create a validator class
class ValidatorMixin {
  // create an email validator stream transformer that accept a stream input of
  // a string and returns a string
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      // handle data
      handleData: (email, sink) {
    // ensure the email address has an @
    if (email.contains('@')) {
      // add the email to the sink
      sink.add(email);
    } else {
      // add an error message
      sink.addError('Enter a valid email address');
    }
  });

  // create a passwrod validator transformer that validates the password
  // must accept a string stream input and return an string stream input
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      // handle data
      handleData: (password, sink) {
    // ensure the password is atleast for characters long
    if (password.length >= 4) {
      // add the password to the sink
      sink.add(password);
    } else {
      // add an error
      sink.addError('Password must be at least 4 characters long');
    }
  });
}
