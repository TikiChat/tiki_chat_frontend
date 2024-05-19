import 'package:equatable/equatable.dart';

abstract class CubitState<T> extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemsInitial<T> extends CubitState<T> {}

class ItemsLoading<T> extends CubitState<T> {}

class ItemsLoaded<T> extends CubitState<T> {
  final List<T> items;

  ItemsLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class ItemsError<T> extends CubitState<T> {
  final String message;

  ItemsError(this.message);

  @override
  List<Object> get props => [message];
}
