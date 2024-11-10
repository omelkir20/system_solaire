import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:systemsolaire/models/planet_model.dart';
class API{
  static const baseUrl='http://localhost:3000/api/';
  static addPlanet(Map pdata)async{
    var url=Uri.parse(baseUrl+"add_planet");
  try{
    final res =await http.post(url,body:pdata);
    if(res.statusCode==200){
      var data=jsonDecode(res.body.toString());
      print(data);
    }else{
     print("Failed to upload DATA");
    }
  }catch(e){
    debugPrint(e.toString());
  }
  }
  //GET planet
static getPlanet() async{
    List<Planet> planet=[];
  var url=Uri.parse(baseUrl+"get_planet");
    try{
      final res = await http.get(url);
      if(res.statusCode==200){
        var data=jsonDecode(res.body);
        print(data);
        data['planet']?.forEach((value)=>{
          planet.add(Planet(
            nom:value['pnom'],
            distance:value['pdistance'],
            radius:value['pradius'],
            gravity:value['pgravity'],

          ))
        });
        return planet;
      }else{
        print("Failed to upload DATA");
      }
    }catch(e){
      debugPrint(e.toString());
    }
}
}