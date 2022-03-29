import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todos_filter_model.dart';
import 'package:todo_bloc/models/todos_model.dart';

part 'todos_filter_event.dart';
part 'todos_filter_state.dart';

class TodosFilterBloc extends Bloc<TodosFilterEvent, TodosFilterState> {
  TodosFilterBloc() : super(TodosFilterLoading()) {
    on<TodosFilterEvent>((event, emit) {});
  }
}
