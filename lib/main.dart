import 'package:destination/bloc/app/app_bloc.dart';
import 'package:destination/screens/screens.dart';
import 'package:destination/screens/zoom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AppBloc())],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreenCustom(),
          routes: {
            'home': (_) => const HomeScreen(),
            'details': (_) => const DetailsScreen(),
            'zoom': (_) => const ZoomableScreen()
          },
          theme: ThemeData().copyWith(
              primaryColor: Colors.white,
              colorScheme: const ColorScheme.light(primary: Color(0xFFef233c)),
              splashColor: Colors.transparent,
              textTheme: GoogleFonts.amaticScTextTheme(const TextTheme()))),
    );
  }
}
