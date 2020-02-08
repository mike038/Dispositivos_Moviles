import 'package:tarea_1/main.dart';
import 'package:tarea_1/page2.dart';
import 'package:tarea_1/page3.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case "/secondPage":
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Page2(
              texto: args,
            ),
          );
        } else
          return _errorPage();
        break;
      case "/thirdPage":
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => Page3(
              texto: args,
            ),
          );
        } else
          return _errorPage();
        break;
      default:
        return _errorPage();
    }
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text("ERROR"),
        ),
        body: Center(
          child: Text("Error page"),
        ),
      ),
    );
  }
}