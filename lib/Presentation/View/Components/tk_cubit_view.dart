import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tikichat_app/Presentation/ViewModel/Common/cubit_state.dart';

class TkCubitView<C extends Cubit<CubitState<S>>, S> extends StatelessWidget {
  const TkCubitView({
    super.key,
    required this.createCubit,
    required this.successBuilder,
  });
  final C Function(BuildContext) createCubit;
  final Widget Function(BuildContext, ItemsLoaded<S>) successBuilder;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: createCubit,
      child: BlocBuilder<C, CubitState<S>>(builder: (context, state) {
        if (state is ItemsInitial || state is ItemsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ItemsError<S>) {
          return Center(child: Text(state.message));
        } else if (state is ItemsLoaded<S>) {
          return successBuilder(context, state);
        } else {
          return Container();
        }
      }),
    );
  }
}
