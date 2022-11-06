import 'package:flutter/material.dart';
import 'package:learn_bloc/widgets/teal.dart';

class AmberWidget extends StatelessWidget {
  const AmberWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[500],
      width: 120,
      height: 120,
      child: const TealWidget(),
    );
  }
}
