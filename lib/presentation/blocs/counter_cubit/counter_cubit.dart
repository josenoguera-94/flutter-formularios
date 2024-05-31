import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super( const CounterState( counter: 5 ) ); // estado inicial

  // se pueden tener métodos streams o listeners que no están ligadas al estado

  void increaseBy( int value ) {


    // emit(
    //   CounterState(
    //     counter: state.counter + value,
    //     transactionCount: state.transactionCount + 1,
    //   ) 
    // );

    // mejor forma por que hace un copyWith del estado actual y solo modifica el valor que se desea cambiar
    emit( state.copyWith( 
      counter: state.counter + value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  void reset() {
    emit( state.copyWith(
      counter: 0,
    ));
  }


}
