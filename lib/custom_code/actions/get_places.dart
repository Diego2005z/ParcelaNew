// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> getPlaces(String searchQuery) async {
  // Add your function code here!
  final String apiKey =
      'pk.eyJ1IjoiYW5nZWxmdjkzIiwiYSI6ImNtOGV0MDZwZDA1OGkybXExYTFmNnUweW0ifQ.9zRTFM8Or3868Gx4Rtvg8A';
  final String encodedQuery = Uri.encodeFull(searchQuery);
  final String url =
      'https://api.mapbox.com/search/geocode/v6/forward?q=$encodedQuery.json&country=pe&language=es&access_token=$apiKey';

  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List features = data['features'];
      if (features != null && features.isNotEmpty) {
        print('Solicitud correcta');
        return features;
      }
    } else {
      print('Error en la solicitud: ${response.statusCode}');
    }
  } catch (e) {
    print('Error al obtener los datos: $e');
  }

  return [];
}
