import 'package:flutter/material.dart';
import 'package:learn_bloc/widgets/data_text.dart';

class CenterWrapper extends StatelessWidget {
  const CenterWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DataText(),
    );
  }
}
