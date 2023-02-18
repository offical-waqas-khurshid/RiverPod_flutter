import 'package:flutter_riverpod/flutter_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() {
    state = state + 1;
  }

  void decrement() {
    state -= 1;
  }
}
