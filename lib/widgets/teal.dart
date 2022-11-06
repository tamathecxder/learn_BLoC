import 'package:flutter/material.dart';
import 'package:learn_bloc/widgets/grey.dart';

class TealWidget extends StatelessWidget {
  const TealWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.teal,
      width: 100,
      height: 100,
      child: const GreyWidget(),
    );
  }
}
