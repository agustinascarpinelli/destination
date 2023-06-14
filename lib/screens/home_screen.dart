import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app/app_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: BlocBuilder<AppBloc, AppState>(
              builder: (context, state) {
                return IconButton(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    state.isLightTheme ? Icons.dark_mode : Icons.light_mode,
                    color: const Color(0xFFffd166),
                  ),
                  onPressed: () {
                    BlocProvider.of<AppBloc>(context).add(OnChangeTheme());
                  },
                );
              },
            ),
          ),
          backgroundColor:
              state.isLightTheme ? const Color(0xFFc1d375) : Colors.black,
          body: state.error != ""
              ? ContainerError(state: state,)
              : CitiesList(state: state,));
    });
  }
}

