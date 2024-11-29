import 'dart:convert';

import 'package:demo_bloc/model/todo_model.dart';
import 'package:http/http.dart' as http;
class TodoRepository {

  Future getAll() async {
    const url = "https://jsonplaceholder.typicode.com/todos";

    final response = await http.get(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if(response.statusCode == 200) {
      try {
        final data = jsonDecode(response.body) as List;
        final result = data.map((todo) {
          return TodoModel(
              title: todo['title'],
              id: todo['id'],
              userId: todo['userId'],
              completed: todo['completed']);
        }).toList();
        return result;
      } catch(e) {
        throw Exception(e.toString());
    }
    }
  }
}