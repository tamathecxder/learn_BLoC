import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class Counter extends Cubit<int> {
  Counter({this.init = 0}) : super(init);

  int init;

  increment() => emit(state + 1);
  decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    debugPrint(change.toString());
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrint(error.toString());
  }
}
