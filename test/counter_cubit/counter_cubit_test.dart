import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandbox_practice_flutter/cards/counter/cubit/counter_cubit.dart';

void main() {
  group('CounterCubit', () {
    blocTest<CounterCubit, CounterState>(
      'emit CounterState(counterValue: 1) when CounterCubit.increment() is called',
      build: () => CounterCubit(),
      act: (CounterCubit cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1)],
    );
    blocTest<CounterCubit, CounterState>(
      'emit CounterState(counterValue: -1) when CounterCubit.decrement() is called',
      build: () => CounterCubit(),
      act: (CounterCubit cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1)],
    );
  });
}
