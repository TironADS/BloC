part of 'counter_bloc.dart';

@immutable
abstract class CounterBlocState {}


class CounterState extends CounterBlocState{
  num counterValue;
  CounterState({required this.counterValue});
}

class CounterInitial extends CounterState {
  CounterInitial() : super(counterValue: 0);

}
