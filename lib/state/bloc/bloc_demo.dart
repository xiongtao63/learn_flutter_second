// Bloc内部，有一个onEvent方法，在这个方法里，
// 通过 EventTransformer将 event转换为更新状态的方法来刷新状态数据。
// 每个event都可以有对应的 EventHandler来处理该 event，完成后再通过 emit触发通知状态更新。
// 当状态转变前会调用 onTransition，在这里会有当前的状态，触发更新的 event和下一个状态。

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_second/state/cubit/counter_cubit.dart';

abstract class CounterEvent{}

class IncrementEvent extends CounterEvent{}

class DecrementEvent extends CounterEvent{}


//Bloc继承自BlocBase，BlocBase中创建了StreamController对象，为多订阅对象
// 其中on<CounterEvent>((event, emit)为初始化创建_eventController监听
// 通过add方法向_eventController中添加事件，然后通过_eventController中的listen方法监听事件
class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc(int initialState) : super(initialState){
    on<IncrementEvent>((event, emit) {
      emit(state + 1);
    });
    on<DecrementEvent>((event, emit) {
      emit(state - 1);
    });
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    print(
        'Current: ${transition.currentState}, Next: ${transition.nextState}, Event: ${transition.event}');
    super.onTransition(transition);

  }
}

void main() {

  Bloc.observer = MyBlocObserver();
  final bloc = CounterBloc(5);
  bloc.add(IncrementEvent());
  bloc.add(DecrementEvent());
  bloc.close();
}