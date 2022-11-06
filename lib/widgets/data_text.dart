import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/counter.dart';

class DataText extends StatelessWidget {
  const DataText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
    return BlocBuilder(
      bloc: counter,
      builder: (context, state) {
        return Text(
          '$state',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        );
      },
    );
  }
}
