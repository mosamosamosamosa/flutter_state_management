import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/state/my_home_state.dart';

class MyHomePageStateNotify extends StateNotifier<MyHomePageState> {
  MyHomePageStateNotify() : super(const MyHomePageState());

  void increment() {
    //state: MyHomePageState を上書き
    state = state.copyWith(state.counter + 1);
  }
}
