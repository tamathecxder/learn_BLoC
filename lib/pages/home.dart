import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Counter counter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLoC Builder"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            bloc: counter,
            buildWhen: (prev, curr) => curr % 2 == 0 ? true : false,
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
          // StreamBuilder(
          //   initialData: counter.init,
          //   stream: counter.stream,
          //   builder: (context, snapshot) {
          //     return Text(
          //       "${snapshot.data}",
          //       style: const TextStyle(
          //         fontSize: 50,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     );
          //   },
          // ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  counter.decrement();
                },
                child: Text(
                  "-",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  counter.increment();
                },
                child: Text(
                  "+",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
