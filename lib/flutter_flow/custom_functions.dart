import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

LatLng flipCoords(List<dynamic> coordinates) {
  // Convierte la lista a List<double>
  final List<double> coords =
      coordinates.map((coord) => coord as double).toList();

  // Cambia el orden: primero latitud, luego longitud
  double latitude = coords[1];
  double longitude = coords[0];
  return LatLng(latitude, longitude);
}
