import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/cubit/todo_cubit.dart';
import '../widgets/floating_action_button_widget.dart';
import '../widgets/home_build_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocConsumer<ToDoCubit, ToDoState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = context.read<ToDoCubit>();
            return SafeArea(
                child: HomeBuildWidget(
              state: state,
              cubit: cubit,
            ));
          },
        ),
        floatingActionButton: FloatingActionButtonWidget(
          cubit: context.read<ToDoCubit>(),
        ),
      );
}
