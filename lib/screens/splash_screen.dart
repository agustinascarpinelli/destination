import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../bloc/app/app_bloc.dart';
import 'screens.dart';

class SplashScreenCustom extends StatefulWidget {
  const SplashScreenCustom({super.key});

  @override
  State<SplashScreenCustom> createState() => _SplashScreenCustomState();
}

class _SplashScreenCustomState extends State<SplashScreenCustom>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late AppBloc appBloc;
  @override
  void initState() {
    super.initState();
    appBloc=BlocProvider.of<AppBloc>(context);
    appBloc.add(OnGetCities());
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0XFFc1d375),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
              'assets/lottie1.json',
              controller: _controller, onLoaded: (compos) {
            _controller
            
              ..duration = compos.duration * 1
              ..forward().then((value) {
      final appBloc=BlocProvider.of<AppBloc>(context).state;
if(appBloc.isLoading==false)
  {              Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const HomeScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 5000),
                  ),
                );}
              });
          }),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _controller.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Choose your destination',
                      style: TextStyle(
                          color: Color(0xFF38c172),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const SizedBox(width: 20,),
                    Lottie.asset(
                      'assets/lottie2.json',
                      width: 100,
                      controller: _controller,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
