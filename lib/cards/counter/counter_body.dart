import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox_practice_flutter/cards/counter/cubit/counter_cubit.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Card(
          margin: const EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 7,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              children: [
                Text('Counter - instance for bloc_test and mockito usage',
                    style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 12.0),
                Text(
                  'Current value: ${state.counterValue}',
                ),
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: Text('Decrement'),
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      tooltip: 'Decrement',
                      child: Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      heroTag: Text('Increment'),
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      tooltip: 'Increment',
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
