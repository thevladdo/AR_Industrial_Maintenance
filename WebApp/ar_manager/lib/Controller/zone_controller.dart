import 'package:ar_manager/Models/data_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../Models/zone_model.dart';


class ZoneController {
  
String getBodyResponse(Response response) {
    if (response.statusCode == 200) {return response.body;} 
    else { return 'error'; }     
}


 Future<http.Response> postData(ZoneModel zone) {
 return http.post(
    Uri.parse('127.0.0.1:8080'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(zone)
  ); 
}

  Future<List<DataModel>> getZoneByMachine() async {
    var url = Uri.http('127.0.0.1:8080', 'artool/data/getZoneByMachine');
    final request = Request('GET',url,);
    request.headers.addAll({"content-type": "application/json", "accept": "application/json"});
    final streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return json.decode(getBodyResponse(response));
  }

  
 
}