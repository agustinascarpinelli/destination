import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:destination/services/city_service.dart';

import '../../models/city_model.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<OnGetCities>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final isConnected = await isConnect();
      if (isConnected) {
        final Either<String, List<CityModel>> cities =
            await CityService().getCities();

        await cities.fold(
          (l) async => emit(
              state.copyWith(isConnected: true, error: l, isLoading: false)),
          (r) async => emit(
              state.copyWith(cities: r, isConnected: true, isLoading: false)),
        );
      } else {
        emit(state.copyWith(
            isLoading: false,
            isConnected: false,
            error: 'There is no connection'));
      }
    });

    on<OnChangeTheme>((event, emit) {
      state.isLightTheme
          ? emit(state.copyWith(isLightTheme: false))
          : emit(state.copyWith(isLightTheme: true));
    });

    on<OnChangeLayout>((event, emit) {
      state.isVerticaLayout
          ? emit(state.copyWith(isVerticaLayout: false))
          : emit(state.copyWith(isVerticaLayout: true));
    });

    on<OnAddSearch>((event, emit) {
   if (event.cities.isNotEmpty) {
    emit(state.copyWith(citiesSearch: event.cities,errorSearch: false));
  }else{
    emit(state.copyWith(errorSearch: true));
  }
    });

    on<OnRemoveSearch>((event, emit) {
      emit(state.copyWith(citiesSearch: null,errorSearch: false));
    });


     on<OnAddErrorSearch>((event,emit){
      emit(state.copyWith(errorSearch: true));
     });

  }
}



Future<bool> isConnect() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
