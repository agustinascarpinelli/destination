import 'package:destination/bloc/app/app_bloc.dart';
import 'package:destination/models/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final city = ModalRoute.of(context)!.settings.arguments as CityModel;
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      return Scaffold(
          backgroundColor:
              state.isLightTheme ? const Color(0xFFc1d375) : Colors.black,
          body: CustomScrollView(
            slivers: [
              CustomAppBar(city: city),
              SliverList(
                delegate: SliverChildListDelegate([
                  Details(city: city),
                ]),
              )
            ],
          ));
    });
  }
}
