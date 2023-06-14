import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app/app_bloc.dart';
import '../models/city_model.dart';


class CustomAppBar extends StatelessWidget {
  final CityModel city;

  const CustomAppBar({super.key, required this.city,});
  @override
  Widget build(BuildContext context) {
    final appState=BlocProvider.of<AppBloc>(context);
    return SliverAppBar(
         leading: Hero(
          tag: city.id!,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        actions: [
           IconButton(
               splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    appState.state.isLightTheme ? Icons.dark_mode : Icons.light_mode,
                    color: const Color(0xFFffd166),
                  ),
                  onPressed: () {
                    appState.add(OnChangeTheme());
                  },
            )
        ],
        expandedHeight: 400,
        floating: false,
        pinned: true,
        flexibleSpace: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'zoom', arguments: city);
          },
          child: FlexibleSpaceBar(
              
              centerTitle: true,
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                alignment: Alignment.bottomRight,
                color: Colors.black12,
                child: Text(city.name!,style: const TextStyle(fontSize: 10),),
              ),
              background: Hero(
                tag: city.id!,
                child: FadeInImage(
                  placeholder: const AssetImage('assets/loading.gif'),
                  image: city.image != null
                      ? NetworkImage(city.image!)
                      : const AssetImage('assets/error.gif')
                          as ImageProvider<Object>,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/error.gif');
                  },
                  fit: BoxFit.cover,
                ),
              )),
        ));
  }
}
