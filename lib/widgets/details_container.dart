import 'package:flutter/material.dart';

import '../models/city_model.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.city,
  });

  final CityModel city;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Color(0xFFef233c)),
            const Text(
              'Country: ',
              style: TextStyle(fontSize: 30),
            ),
            Text(city.country!, style: const TextStyle(fontSize: 30)),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Color(0xFFef233c)),
            const Text('City: ', style: TextStyle(fontSize: 30)),
            Text(city.city!, style: const TextStyle(fontSize: 30)),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on, color: Color(0xFFef233c)),
            const Text('Place name: ', style: TextStyle(fontSize: 30)),
            Text(city.name!, style: const TextStyle(fontSize: 30)),
          ],
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            city.description!,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
