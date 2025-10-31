import 'package:flutter/material.dart';
import '../screens/welcome.dart';
import '../screens/home.dart';
import '../screens/quiz.dart';
import '../screens/result.dart';
import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case AppRoutes.quiz:
        return MaterialPageRoute(builder: (_) => const QuizPage());
      case AppRoutes.result:
        return MaterialPageRoute(builder: (_) => const ResultPage());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
