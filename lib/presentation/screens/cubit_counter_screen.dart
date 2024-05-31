import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';


// .watch en un método redibuja el widget cuando el estado cambia
// .read en un método no redibuja el widget cuando el estado cambia, es mejor en métodos

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        // create: (BuildContext context) => CounterCubit(),
        create: (_) => CounterCubit(), 
        child: const _CubitCounterView() // la vista está envuelta en el BlocProvider
      );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void increaseCounterBy( BuildContext context, [ int value = 1 ]) {
    context.read<CounterCubit>().increaseBy(value);
  }


  @override
  Widget build(BuildContext context) {
    // forma 2 de obtener el estado del cubit
    // final counterState = context.watch<CounterCubit>().state;
    // pero evalua todos los widgetes

    return Scaffold(
        appBar: AppBar(
          // forma 3 de obtener el estado del cubit
          title: context.select(( CounterCubit value) { // .select para estár pende un bloc específico
            return Text('Cubit Counter: ${ value.state.transactionCount }');
          }),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<CounterCubit>().reset();
                }, 
              icon: const Icon(Icons.refresh_outlined))
          ],
        ),
        body: Center(
          // forma 1 de obtener el estado del cubit
          child: BlocBuilder<CounterCubit, CounterState>(
            // buildWhen: (previous, current) => current.counter != previous.counter,
            builder: (context, state) {
              // print('Estado cambió');
              return Text('Counter value: ${ state.counter }');
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: '1', child: const Text('+3'), onPressed: () => increaseCounterBy(context, 3) ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
                heroTag: '2', child: const Text('+2'), onPressed: () => increaseCounterBy(context, 2) ),
            const SizedBox(
              height: 15,
            ),
            FloatingActionButton(
                heroTag: '3', child: const Text('+1'), onPressed: () => increaseCounterBy(context) ),
          ],
        ));
  }
}
