import 'package:demo_bloc/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/todo_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    fetchMoreTodos();
    super.initState();
  }

  void fetchMoreTodos() {
    final cubit = context.read<TodoCubit>();
    cubit.fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit API Call"),
        centerTitle: true,
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
           if(state is SuccessTodoState) {
            final todos = state.todos;
            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                  final todo = todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    leading: Text(todo.id.toString()),
                  );
              },
            );
          } else if(state is ErrorTodoState){
            return Center(child: Text(state.error),);
          } else {
             return const Center(child: CircularProgressIndicator(),);}
        },),
    );
  }
}
