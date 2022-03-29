part of 'todos_filter_bloc.dart';

abstract class TodosFilterState extends Equatable {
  const TodosFilterState();

  @override
  List<Object> get props => [];
}

class TodosFilterLoading extends TodosFilterState {}

class TodosFilterLoaded extends TodosFilterState {
  final List<Todo> filteredTodo;
  final TodosFilter todosFilter;

  const TodosFilterLoaded({
    required this.filteredTodo,
    this.todosFilter = TodosFilter.all,
  });

  @override
  List<Object> get props => [
        filteredTodo,
        todosFilter,
      ];
}
