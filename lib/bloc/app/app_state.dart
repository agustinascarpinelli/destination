part of 'app_bloc.dart';

 class AppState {
final bool isLightTheme;
final bool ?isConnected;
final String ? error;
final List<CityModel> ?cities;
final bool? isLoading;
final List<CityModel> ?citiesSearch;
final bool isVerticaLayout;
final bool errorSearch;

  AppState({this.errorSearch=false,this.citiesSearch, this.isVerticaLayout=true,this.isLoading=false, this.isLightTheme=true,this.isConnected, this.error = "", this.cities});

 

 AppState copyWith({
  final bool ?isLightTheme,
final bool ?isConnected,
final String ? error,
final List<CityModel> ?cities,
final bool? isLoading,
final bool ? isVerticaLayout,
final List<CityModel> ?citiesSearch,
final bool ?errorSearch,

 })=>AppState(errorSearch: errorSearch?? this.errorSearch, citiesSearch: citiesSearch, isVerticaLayout: isVerticaLayout??this.isVerticaLayout,isLoading:isLoading??this.isLoading,isConnected: isConnected??this.isConnected,isLightTheme: isLightTheme??this.isLightTheme,error: error??this.error,cities: cities??this.cities);
 }

