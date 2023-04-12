import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_second/state/cubit/counter_cubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  final cubit = CounterCubit();
  cubit.increment();
  print('after increment: ${cubit.state}');
  cubit.decrement();
  print('after decrement: ${cubit.state}');

  final anotherCubit  = CounterCubit();
  anotherCubit.increment();
  cubit.close();
  anotherCubit.close();
}