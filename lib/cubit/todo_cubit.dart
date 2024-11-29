import 'package:demo_bloc/cubit/todo_states.dart';
import 'package:demo_bloc/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository _todoRepository;
  TodoCubit(this._todoRepository) : super(InitialTodoState());

  Future<void> fetchTodo() async {
    emit(LoadingTodoState());
    try {
      final response = await _todoRepository.getAll();
      emit(SuccessTodoState(response));
    } catch(e) {
      emit(ErrorTodoState(e.toString()));
    }
  }

}