import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Station {
  String siteName = "";
  int aqi = -1;

  Station({required this.siteName});

  Station.fromJson(Map<String, dynamic> json) {
    siteName = json['SiteName'];
    aqi = int.tryParse(json['AQI']) ?? -1;
  }
}

Future <List<Station>> fetchAQI() async {
  List<Station> stations = [];
  final response = await http.get(Uri.parse(
    'https://data.epa.gov.tw/api/v1/aqx_p_432?format=json&offset=0&limit=100&api_key=cafdaec2-c961-4a00-9138-6c657a2a2895'
  ));

  debugPrint("Response Gotten");
  if (response.statusCode == 200) {
    debugPrint("Result Gotton");
    var res = jsonDecode(response.body);
    List<dynamic> stationJSON = res['records'];
    for (var station in stationJSON) {
      debugPrint(station['SiteName']);
      stations.add(Station.fromJson(station));
    }
    debugPrint("${stations.length} stations gotten");
  } else {
    debugPrint("Http Status Code = ${response.statusCode}");
    throw Exception("Failed to load data");
  }
  return stations;
}