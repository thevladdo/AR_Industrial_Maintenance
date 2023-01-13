import 'dart:convert';
import 'package:ar_industrial_maintenance/Model/zone_model.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class MachineApiController {
  String getBodyResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw (Exception(json.decode(response.body)["message"]));
    }
  }

  Future<String> getDataByZone(ZoneId zoneId) async {
    var url = Uri.http(FlutterConfig.get('API_URL'),
        '${FlutterConfig.get('ZONE_URL')}/getDataByZone');
    final request = Request('GET', url);
    request.body =
        '{"machineId":${zoneId.machineId}, "zoneNum":${zoneId.zoneNum}}';
    final streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);
    return getBodyResponse(response);
  }
}
