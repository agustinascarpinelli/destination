import 'package:destination/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app/app_bloc.dart';
import '../models/city_model.dart';

class CitiesList extends StatelessWidget {
  final AppState state;
  const CitiesList({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
     SliverToBoxAdapter(
   child:   Search(state: state,),
     ),
     if (state.errorSearch) SliverToBoxAdapter(child: Center(child: Container(
      margin:const EdgeInsets.all(15) ,
      child: const Text('There is no results that match with the search',style: TextStyle(color: Color(0xFFef233c),fontSize: 25 ),))),),
        SliverToBoxAdapter(
          child: IconButton(
              onPressed: () {
                BlocProvider.of<AppBloc>(context).add(OnChangeLayout());
              },
              icon: state.isVerticaLayout
                  ? const Icon(
                      Icons.grid_view_sharp,
                      color: Color(0xFFef233c),
                    )
                  : const Icon(
                      Icons.list_sharp,
                      color: Color((0xFFef233c)),
                    )),
        ),
        state.isVerticaLayout
            ? SliverList(
                delegate: _delegate(),
              )
            : SliverGrid(
                delegate: _delegate(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ))
      ],
    );
  }

  SliverChildBuilderDelegate _delegate() {
    return SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        final city=  state.citiesSearch==null ? state.cities![index] : state.citiesSearch![index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'details',
                arguments: city);
          },
          child: Hero(
            tag: city.id!,
            child: CityContainer(
              city: city,
              state: state,
            ),
          ),
        );
      },
      childCount: state.citiesSearch==null  ? state.cities!.length : state.citiesSearch!.length,
    );
  }
}

class Search extends StatefulWidget {
  final AppState state;
  const Search({
    super.key, required this.state,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _textEditingController = TextEditingController();
   

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appBloc=BlocProvider.of<AppBloc>(context);
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 25),
      child: TextField(
        controller: _textEditingController,
  onChanged: (query) {

  final filter = _search(query, widget.state);
  if (filter.isNotEmpty)
 { query.isNotEmpty ? appBloc.add(OnAddSearch(cities: filter)) : appBloc.add(OnRemoveSearch());}
 else{
  appBloc.add(OnAddErrorSearch());
 }
},
      decoration:  InputDecoration(
      icon: const Icon(Icons.search),
       labelText: 'Buscar ciudades',
        suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _textEditingController.clear();
              appBloc.add(OnRemoveSearch());
            },
          ),
      ),
      
    ),
    
    );
  }
}

List<CityModel> _search(String query, final AppState state) {
  final filteredCities = state.cities!.where((city) {
    return city.name!.toLowerCase().startsWith(query.toLowerCase()) ||
        city.country!.toLowerCase().startsWith(query.toLowerCase());
  }).toList();
  return filteredCities;
}
