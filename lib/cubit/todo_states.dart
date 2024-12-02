import 'package:demo_bloc/model/todo_model.dart';

abstract class TodoState {
}

class InitialTodoState extends TodoState {}

class LoadingTodoState extends TodoState {}

class SuccessTodoState extends TodoState {
  final List<TodoModel> todos;
  SuccessTodoState(this.todos);
}

class ErrorTodoState extends TodoState {
  final String error;
  ErrorTodoState(this.error);
}