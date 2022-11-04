// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:learn_bloc/bloc/counter.dart';
import 'package:learn_bloc/widgets/center_widget.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[400],
      height: 100,
      width: 200,
      child: const CenterWidget(),
    );
  }
}
