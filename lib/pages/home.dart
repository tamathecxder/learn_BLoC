import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/bloc/theme.dart';
import 'package:learn_bloc/pages/other.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = BlocProvider.of<Counter>(context);
    ThemeBloc myTheme = BlocProvider.of<ThemeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Bloc Listener"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              myTheme.changeTheme();
              log(myTheme.state.toString());
            },
            icon: Icon(
              myTheme.state == true ? Icons.dark_mode : Icons.light_mode,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => BlocProvider.value(
          //       value: counter,
          //       child: const OtherPage(),
          //     ),
          //   ),
          // );
          Navigator.of(context).pushNamed('/other');
        },
        child: const Icon(
          Icons.navigate_next,
          size: 28,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MultiBlocListener(
                listeners: [
                  BlocListener<Counter, int>(
                    listener: (context, state) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Angka state: $state"),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    listenWhen: (previous, current) {
                      if (current > 10) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                  ),
                  BlocListener<ThemeBloc, bool>(
                    listener: (context, state) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berganti Tema"),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                    listenWhen: (previous, current) {
                      if (current == false) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                  ),
                ],
                child: BlocBuilder<Counter, int>(
                  bloc: counter,
                  builder: (context, state) {
                    return Text(
                      "$state",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      counter.decrement();
                    },
                    icon: const Icon(
                      Icons.remove,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      counter.increment();
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
