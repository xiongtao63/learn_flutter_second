import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_second/state/bloc/bloc_demo.dart';
import 'package:learn_flutter_second/state/cubit/counter_cubit.dart';

void main() {

  Bloc.observer = MyBlocObserver();
  final bloc = CounterBloc(5);
  bloc.add(IncrementEvent());
  bloc.add(DecrementEvent());
  bloc.close();
}