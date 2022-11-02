import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.number = 0}) : super(number);

  int number;

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}

class HomePage extends StatelessWidget {
  CounterCubit counter = CounterCubit(number: 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cubit App",
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            initialData: counter.number,
            stream: counter.stream,
            builder: (context, snapshot) {
              return Text(
                "${snapshot.data}",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  counter.decrement();
                },
                child: const Text("-",
                    style: TextStyle(
                      fontSize: 30,
                    )),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  counter.increment();
                },
                child: const Text(
                  "+",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
