import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/pages/404.dart';
import 'package:learn_bloc/pages/home.dart';
import 'package:learn_bloc/pages/other.dart';

class AppRouter {
  final Counter counter = Counter();

  // List<Route<dynamic>> defaultRoute = [
  // ];

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: counter,
              child: HomePage(),
            );
          },
        );
      case "/other":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: counter,
              child: const OtherPage(),
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}
