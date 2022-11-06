import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/pages/home.dart';
import 'package:learn_bloc/pages/other.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Counter counter = Counter();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: BlocProvider(
      //   create: (context) => Counter(),
      //   child: HomePage(),
      // ),
      routes: {
        "/": (context) => BlocProvider.value(
              value: counter,
              child: HomePage(),
            ),
        "/other": (context) => BlocProvider.value(
              value: counter,
              child: const OtherPage(),
            ),
      },
      initialRoute: "/",
    );
  }
}
