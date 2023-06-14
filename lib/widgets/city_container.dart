import 'package:flutter/material.dart';

import '../bloc/app/app_bloc.dart';
import '../models/city_model.dart';

class CityContainer extends StatelessWidget {
  final CityModel city;
  final AppState state;
  const CityContainer({
    super.key,
   required this.city, required this.state,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:state.isLightTheme? const Color(0xFFfcefb4) : const Color(0xFF2a2e34),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                child: FadeInImage(
                  fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    placeholder:
                        const AssetImage('assets/loading.gif'),
                    image: city.image != null
                        ? NetworkImage(city.image!)
                        : const AssetImage('assets/error.gif')
                            as ImageProvider<Object>,
                    imageErrorBuilder:
                        (context, error, stackTrace) {
                      return Image.asset('assets/error.gif');
                    }),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(Icons.location_on,
                        color: Color(0xFFef233c)),
                    Text(
                     " ${city.country!}, ",
                      style: TextStyle(
                        fontSize: state.isVerticaLayout?  30 : 20,
                        color: state.isLightTheme
                            ? Colors.black
                            : Colors.white,
                      ),),
                          Text(
                      city.name!,
                      style: TextStyle(
                        fontSize: state.isVerticaLayout?  20 : 10,
                        color: state.isLightTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
          
              
            ],
          ),
        ),
      ),
    );
  }
}
