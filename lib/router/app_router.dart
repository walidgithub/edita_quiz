import 'package:edita_quiz/question/question.dart';
import 'package:edita_quiz/router/arguments.dart';
import 'package:edita_quiz/start_view/start_view.dart';
import 'package:flutter/material.dart';

import '../result_view/result_view.dart';

class Routes {
  static const String startRoute = "/start";
  static const String resultRoute = "/quiz";
  static const String questionRoute = "/question";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startRoute:
        return MaterialPageRoute(builder: (_) => const StartView());
      case Routes.resultRoute:
        return MaterialPageRoute(builder: (_) => ResultView(arguments: settings.arguments as GoToResult));
      case Routes.questionRoute:
        return MaterialPageRoute(builder: (_) => const QuestionView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(body: Container()),
    );
  }
}
