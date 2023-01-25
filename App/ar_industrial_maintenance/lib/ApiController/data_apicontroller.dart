import 'dart:convert';
import 'package:ar_industrial_maintenance/Model/data_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class DataApiController {
  String getBodyResponse(Response response) {
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'error';
    }
  }

  Future<List<DataModel>> getDataByZone(String zoneId) async {
    var url = Uri.http('172.20.10.4:8080', 'artool/data/getDataByZone');
    final request = Request(
      'GET',
      url,
    );
    request.headers.addAll(
        {"content-type": "application/json", "accept": "application/json"});

    request.body = zoneId;
    final streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    return extractData(getBodyResponse(response));
  }

  List<DataModel> extractData(String controllerJson) {
    if (controllerJson == 'error') {
      return [];
    }
    var dataToExtract = json.decode(controllerJson);
    List<DataModel> dataList = [];
    for (var data in dataToExtract) {
      dataList.add(_newData(data));
    }
    return dataList;
  }

  DataModel _newData(var data) {
    return DataModel.complete(data["id"], data["name"], data["coordinateX"],
        data["coordinateY"], data["unit"], data["value"]);
  }
}
