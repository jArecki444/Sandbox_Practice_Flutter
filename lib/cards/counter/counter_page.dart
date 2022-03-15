import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sandbox_practice_flutter/cards/counter/counter_body.dart';
import 'package:sandbox_practice_flutter/cards/counter/cubit/counter_cubit.dart';

class CounterPageCard extends StatelessWidget {
  const CounterPageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const CounterBody(),
    );
  }
}
