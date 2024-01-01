part of 'counter_bloc.dart';

@immutable
abstract class CounterblocEvent {}
class IncrementEvent extends CounterblocEvent{}
class DecrementEvent extends CounterblocEvent{}
class multiplyEvent extends CounterblocEvent{}
class divitionEvent extends CounterblocEvent{}
class clearEvent extends CounterblocEvent{}