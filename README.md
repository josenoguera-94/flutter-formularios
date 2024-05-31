# forms_app

1. BLoC
2. Flutter Bloc
3. Cubits
4. Equatable
5. Eventos
6. Estado

flutter bloc permite trabajar el estado, separando los eventos y los estados de mi app y una clase que trabaja los eventos y los estados.

los estados son inmutables, y los eventos son los que cambian el estado de la app. mejor control

pero se necesita equatable para poder comparar los estados y los eventos. debido a que puedes tener 2 objetos iguales pero asignados a diferentes espacios de memoria. equatable permite comparar los objetos y saber si son iguales o no.

tiene una límitante, no puedes tener más de un bloc en un widget, por lo que se necesita un cubit, que es un bloc sin eventos.

Bloc maneja eventos y estados de manera separada




