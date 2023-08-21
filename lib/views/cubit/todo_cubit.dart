import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Todo_model.dart';
import 'package:flutter_application_1/Service/Task_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()) {
    getMyTasks();
  }

  List<TodoModel> Tasks = [];
  getMyTasks() async {
    try {
      emit(TaskLoading());

      Tasks = await Task_service().getTasks();
      emit(TaskSucces());
    } catch (e) {
      emit(TaskError());
    }
  }
}
