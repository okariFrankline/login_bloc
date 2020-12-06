// provide class for implementing the scoped bloc pattern
import "package:flutter/material.dart";
// import the bloc class
import "bloc.dart";

// provider class that inherits from hte inherited widget
class Provider extends InheritedWidget {
  // create a bloc
  final _bloc = Bloc();
  // must implement the shouldnotifyOnUpdate function

  // consturctor for the provider in order to allow it to take in a child
  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  // define an of function
  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()._bloc;
  }
}
