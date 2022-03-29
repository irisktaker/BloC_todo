import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/blocs/todos/todos_bloc.dart';
import 'package:todo_bloc/models/todos_filter_model.dart';
import 'package:todo_bloc/models/todos_model.dart';

part 'todos_filter_event.dart';
part 'todos_filter_state.dart';

class TodosFilterBloc extends Bloc<TodosFilterEvent, TodosFilterState> {
  final TodosBloc _todosBloc;
  late StreamSubscription _todosSubscription;

  TodosFilterBloc({required TodosBloc todosBloc})
      : _todosBloc = todosBloc,
        super(TodosFilterLoading()) {
    on<UpdateFilter>(_updateFilter);
    on<UpdateTodos>(_updateTodos);

    _todosSubscription = todosBloc.stream.listen((state) {
      add(const UpdateTodos());
    });
  }

  void _updateFilter(UpdateFilter event, Emitter<TodosFilterState> emit) {
    if (state is TodosFilterLoading) {
      add(
        const UpdateTodos(todosFilter: TodosFilter.pending),
      );
    }

    if (state is TodosFilterLoaded) {
      final state = this.state as TodosFilterLoaded;
      add(
        UpdateTodos(todosFilter: state.todosFilter),
      );
    }
  }

  void _updateTodos(UpdateTodos event, Emitter<TodosFilterState> emit) {
    final state = _todosBloc.state;

    if (state is TodosLoaded) {
      List<Todo> todos = state.todos.where((todo) {
        switch (event.todosFilter) {
          case TodosFilter.all:
            return true;
          case TodosFilter.completed:
            return todo.isCompleted!;
          case TodosFilter.canceled:
            return todo.isCancelled!;
          case TodosFilter.pending:
            return !(todo.isCancelled! || todo.isCompleted!);
        }
      }).toList();
    }
  }
}
