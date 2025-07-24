import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isIconChanged = false;
  bool get isIconChanged => _isIconChanged;
  set isIconChanged(bool value) {
    _isIconChanged = value;
  }

  List<LatLng> _markersGoogleMap = [LatLng(-12.1188291, -77.01673559999999)];
  List<LatLng> get markersGoogleMap => _markersGoogleMap;
  set markersGoogleMap(List<LatLng> value) {
    _markersGoogleMap = value;
  }

  void addToMarkersGoogleMap(LatLng value) {
    markersGoogleMap.add(value);
  }

  void removeFromMarkersGoogleMap(LatLng value) {
    markersGoogleMap.remove(value);
  }

  void removeAtIndexFromMarkersGoogleMap(int index) {
    markersGoogleMap.removeAt(index);
  }

  void updateMarkersGoogleMapAtIndex(
    int index,
    LatLng Function(LatLng) updateFn,
  ) {
    markersGoogleMap[index] = updateFn(_markersGoogleMap[index]);
  }

  void insertAtIndexInMarkersGoogleMap(int index, LatLng value) {
    markersGoogleMap.insert(index, value);
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
