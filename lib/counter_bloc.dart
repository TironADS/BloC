import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterblocEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterblocEvent>((event, emit) {
      if(event is IncrementEvent ){
        emit(CounterState(counterValue: state.counterValue+1));
      }
      if(event is DecrementEvent){
        emit(CounterState(counterValue: state.counterValue-1));
      }
      if(event is multiplyEvent){
        emit(CounterState(counterValue: state.counterValue*2));
      }
      if(event is divitionEvent){
        emit(CounterState(counterValue: state.counterValue / 2));
      }
      if(event is clearEvent){
        emit(CounterState(counterValue: state.counterValue=0));
      }
      // TODO: implement event handler
    });
  }
}
