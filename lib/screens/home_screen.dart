import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app/app_bloc.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
Future<void> _updateConnectionStatus(ConnectivityResult result) async {
  setState(() {
    _connectionStatus = result;
  });

  if (_connectionStatus != ConnectivityResult.none) {
    BlocProvider.of<AppBloc>(context).add(OnGetCities());
  }
}



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
          body: 
        state.isLoading==true  ? const Center(child: CircularProgressIndicator(color: Color(0xFFef233c),))
          :
          
          state.error != ""
              ? ContainerError(state: state,)
              : CitiesList(state: state,));
    });
  }
}

