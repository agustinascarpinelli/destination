part of 'app_bloc.dart';

 class AppEvent {}
 class OnGetCities extends AppEvent {}

 class OnChangeTheme extends AppEvent {}

 class OnChangeLayout extends AppEvent {}

 class OnAddSearch extends AppEvent {
  final List<CityModel> cities;


  OnAddSearch({ required this.cities});
 }

 class OnRemoveSearch extends AppEvent {}

 class OnAddErrorSearch extends AppEvent {}

