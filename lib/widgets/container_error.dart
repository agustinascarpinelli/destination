import 'package:flutter/material.dart';

import '../bloc/app/app_bloc.dart';

class ContainerError extends StatelessWidget {
  final AppState state;
  const ContainerError({
    super.key, required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color ((0xFFef233c))
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(state.error!,textAlign: TextAlign.center,),
          )),
      );
  }
}


