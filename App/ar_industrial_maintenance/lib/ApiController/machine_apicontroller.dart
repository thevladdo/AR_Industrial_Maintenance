import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class MachineApiController {
  String getBodyResponse(Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw (Exception(json.decode(response.body)["message"]));
    }
  }

  Future<String> getAllMachines() async {
    var url = Uri.http(FlutterConfig.get('API_URL'),
        '${FlutterConfig.get('MACHINE_URL')}/getAllMachine');
    return getBodyResponse(await http.get(
      url,
    ));
  }
}
