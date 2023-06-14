import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:destination/models/city_model.dart';
import 'package:http/http.dart' as http;

class CityService{
  final String _urlBase='api.npoint.io';



Future <Either<String,List<CityModel>>> getCities ()async{
  try{
    final Uri url= Uri.https(_urlBase, '/5ecaa20ebea4d86084e5');
    final response=await http.get(url);
    final List<dynamic> jsonList= json.decode(response.body);
    final List<CityModel> cities=jsonList
    .map((json) => CityModel.fromMap(json))
    .toList();
    return Right(cities);
  }catch(e){
    final error=e.toString();
    return Left(error);
  }
}
}

