import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocSelector<UserBloc, Map<String, dynamic>, String>(
                selector: (state) {
                  return state['name'];
                },
                builder: (context, state) {
                  print("Bloc Selector: Name");
                  return Text(
                    "Name : $state",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  );
                },
              ),
              BlocSelector<UserBloc, Map<String, dynamic>, int>(
                selector: (state) {
                  return state['age'];
                },
                builder: (context, state) {
                  print("Bloc Selector: Age");
                  return Text(
                    "Age : $state years old",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            runSpacing: 20,
            children: [
              TextField(
                controller: nameController,
                onChanged: (value) {
                  userBloc.changeName(value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      userBloc.changeAge(userBloc.state['age'] - 1);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      userBloc.changeAge(userBloc.state['age'] + 1);
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
