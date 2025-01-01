import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:math_expressions/math_expressions.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  String _equation = '';
  String _calculated = '';
  HomeBloc() : super(HomeInitialState()) {
    on<CalculatedEvent>(_calculatedEvent);
    on<NumberEvent>(_numberEvent);
    on<OperationEvent>(_operationEvent);
    on<ClearEvent>(_clearEvent);
  }
  Future<void> _numberEvent(
      NumberEvent event, Emitter<HomeState> emit) async {
     if (_calculated != ''){
      _calculated = '';
     } 
    _equation += event.number;
    emit(HomeSuccessState(equation: _equation));
  }
  Future<void> _operationEvent(
      OperationEvent event, Emitter<HomeState> emit) async {
    
    if (_calculated != '') {
      _equation = _calculated;
      _equation += event.operation;
    } else {
      _equation += event.operation;
    }

    emit(HomeSuccessState(equation: _equation));
  }

  Future<void> _clearEvent(
    ClearEvent event,
    Emitter<HomeState> emit,
  ) async {
    _equation = '';
    emit(HomeInitialState());
  }

   Future<void> _calculatedEvent(CalculatedEvent event, Emitter<HomeState> emit) async {

    try {
    Parser parser = Parser();
    Expression expression = parser.parse(_equation);
    ContextModel contextModel = ContextModel();
    double result = expression.evaluate(EvaluationType.REAL, contextModel);
    _calculated = result.toString();
    _equation = '';
    emit(HomeSuccessState(equation: _calculated));
  } catch (e) {
    emit(HomeErrorState(message: 'Invalid equation'));
  }
}
}
