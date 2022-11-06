import 'package:flutter/material.dart';
import 'package:learn_bloc/widgets/center_wrapper.dart';

class GreyWidget extends StatelessWidget {
  const GreyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      color: Colors.grey[100],
      width: 80,
      height: 100,
      child: CenterWrapper(),
    );
  }
}
