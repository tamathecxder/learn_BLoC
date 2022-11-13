import 'package:bloc/bloc.dart';

class UserBloc extends Cubit<Map<String, dynamic>> {
  UserBloc()
      : super({
          "name": "",
          "age": 0,
        });

  changeName(String name) {
    emit({
      "name": name,
      "age": state['age'],
    });
  }

  changeAge(int age) {
    emit({
      "name": state['name'],
      "age": age,
    });
  }
}
