
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class NumberEvent extends HomeEvent  {
  final String number;
  NumberEvent({required this.number});

}
class OperationEvent extends HomeEvent  {
  final String operation;
  OperationEvent({required this.operation});

}



class CalculatedEvent extends HomeEvent  {
}


class ClearEvent extends HomeEvent {}
