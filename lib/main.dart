import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/bloc/theme.dart';
import 'package:learn_bloc/pages/home.dart';
import 'package:learn_bloc/pages/other.dart';
import 'package:learn_bloc/routes/routes.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    final ThemeBloc myTheme = ThemeBloc();
    final Counter counter = Counter();

    // return BlocProvider(
    //   create: (context) => myTheme,
    //   child: BlocBuilder(
    //     bloc: myTheme,
    //     builder: (context, state) {
    //       return MaterialApp(
    //         theme: myTheme.state == true ? ThemeData.light() : ThemeData.dark(),
    //         debugShowCheckedModeBanner: false,
    //         // home: BlocProvider(
    //         //   create: (context) => Counter(),
    //         //   child: HomePage(),
    //         // ),
    //         // routes: {
    //         //   "/": (context) => BlocProvider.value(
    //         //         value: counter,
    //         //         child: HomePage(),
    //         //       ),
    //         //   "/other": (context) => BlocProvider.value(
    //         //         value: counter,
    //         //         child: const OtherPage(),
    //         //       ),
    //         // },
    //         // initialRoute: "/",
    //         onGenerateRoute: router.onGenerateRoute,
    //       );
    //     },
    //   ),
    // );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => myTheme,
        ),
        BlocProvider(
          create: (context) => counter,
        ),
      ],
      child: BlocBuilder(
        bloc: myTheme,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: myTheme.state == true ? ThemeData.light() : ThemeData.dark(),
            onGenerateRoute: router.onGenerateRoute,
            // home: BlocProvider(
            //   create: (context) => Counter(),
            //   child: HomePage(),
            // ),
            // routes: {
            //   "/": (context) => BlocProvider.value(
            //         value: counter,
            //         child: HomePage(),
            //       ),
            //   "/other": (context) => BlocProvider.value(
            //         value: counter,
            //         child: const OtherPage(),
            //       ),
            // },
            // initialRoute: "/",
          );
        },
      ),
    );
  }
}
