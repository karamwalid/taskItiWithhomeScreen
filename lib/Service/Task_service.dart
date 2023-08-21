import 'package:dio/dio.dart';
import 'package:flutter_application_1/Models/Todo_model.dart';

class Task_service {
  String URL = "https://jsonplaceholder.typicode.com/todos";
  Future<List<TodoModel>> getTasks() async {
    List<TodoModel> TasksList = [];

    final response = await Dio().get(URL);
    var data = response.data;
    data.forEach((Element) {
      TodoModel Task = TodoModel.fromJson(Element);
      TasksList.add(Task);
    });
    return TasksList;
  }
}
