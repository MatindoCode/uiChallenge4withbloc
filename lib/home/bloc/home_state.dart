part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

final class HomeInitialState extends HomeState {}

final class HomeSuccessState extends HomeState with EquatableMixin {
  final String equation;

  HomeSuccessState({required this.equation});

  @override
  List<Object> get props => [equation];
}

final class HomeErrorState extends HomeState with EquatableMixin {
  final String message;

  HomeErrorState({required this.message});

  @override
  List<Object> get props => [message];
}