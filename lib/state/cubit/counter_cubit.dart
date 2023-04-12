import 'package:flutter_bloc/flutter_bloc.dart';

//Cubit对外暴露的更新状态方法触发状态更新，而在 onChange中会得到更新前后的状态，从而可以触发界面刷新
class CounterCubit extends Cubit<int>{
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}

class MyBlocObserver  extends BlocObserver{
  @override
  void onCreate(BlocBase bloc) {
    print('BloC Observer onCreate:  ${bloc.state}');
    super.onCreate(bloc);
  }
  @override
  void onChange(BlocBase bloc, Change change) {
    print('BloC Observer onChange: $change');
    super.onChange(bloc, change);
  }
  @override
  void onClose(BlocBase bloc) {
    print('BloC Observer onClose: ${bloc.state}');
    super.onClose(bloc);
  }
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('Bloc Observer onError: $error, $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
  @override
  void onEvent(Bloc bloc, Object? event) {
    print('Bloc Observer onEvent: $event, ${bloc.state}');
    super.onEvent(bloc, event);
  }

}

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