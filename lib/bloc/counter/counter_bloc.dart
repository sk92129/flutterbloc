import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {

    // on increment
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    void decrementCounter (
      DecrementCounterEvent event,
      Emitter<CounterState> emit,
    ) {
      emit(state.copyWith(counter: state.counter - 1));
    }

    // decrement
    on<DecrementCounterEvent>(decrementCounter);
  }
}
