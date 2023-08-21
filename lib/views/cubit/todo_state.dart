part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class TaskLoading extends TodoState {}

class TaskSucces extends TodoState {}

class TaskError extends TodoState {}
