part of 'counter_cubit.dart';


class CounterState extends Equatable {

  final int counter;
  final int transactionCount;

  const CounterState({
    this.counter = 0, 
    this.transactionCount = 0
  });

  copyWith({ // copyWith es un método que se utiliza para copiar el estado actual y modificar solo los valores que se desean cambiar
    int? counter, // opcional
    int? transactionCount,
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount,
  );
  
  @override
  List<Object> get props => [ counter, transactionCount ];
  // List<Object?> get props => [ counter, transactionCount ]; // para propiedades que pueden ser nulas

}
