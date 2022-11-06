import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/widgets/amber.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = BlocProvider.of<Counter>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dependency Injection"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.lightBlueAccent,
                child: InkWell(
                  onTap: () {
                    counter.decrement();
                  },
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const AmberWidget(),
              Material(
                color: Colors.lightBlueAccent,
                child: InkWell(
                  onTap: () {
                    counter.increment();
                  },
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
