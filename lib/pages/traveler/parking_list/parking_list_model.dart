import '/components/navigation_botttom/navigation_botttom_widget.dart';
import '/components/parking_list_options/parking_list_options_widget.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'dart:ui';
import '/index.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'parking_list_widget.dart' show ParkingListWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkingListModel extends FlutterFlowModel<ParkingListWidget> {
  ///  Local state fields for this page.

  List<String> fabIcons = ['parkingMap', 'history', 'parkingManagment'];
  void addToFabIcons(String item) => fabIcons.add(item);
  void removeFromFabIcons(String item) => fabIcons.remove(item);
  void removeAtIndexFromFabIcons(int index) => fabIcons.removeAt(index);
  void insertAtIndexInFabIcons(int index, String item) =>
      fabIcons.insert(index, item);
  void updateFabIconsAtIndex(int index, Function(String) updateFn) =>
      fabIcons[index] = updateFn(fabIcons[index]);

  List<String> fabLabels = ['Mapa', 'Historial', 'En curso'];
  void addToFabLabels(String item) => fabLabels.add(item);
  void removeFromFabLabels(String item) => fabLabels.remove(item);
  void removeAtIndexFromFabLabels(int index) => fabLabels.removeAt(index);
  void insertAtIndexInFabLabels(int index, String item) =>
      fabLabels.insert(index, item);
  void updateFabLabelsAtIndex(int index, Function(String) updateFn) =>
      fabLabels[index] = updateFn(fabLabels[index]);

  List<String> fabRoutes = [
    '/parkingMap',
    '/parkingHistory',
    '/parkingManagment'
  ];
  void addToFabRoutes(String item) => fabRoutes.add(item);
  void removeFromFabRoutes(String item) => fabRoutes.remove(item);
  void removeAtIndexFromFabRoutes(int index) => fabRoutes.removeAt(index);
  void insertAtIndexInFabRoutes(int index, String item) =>
      fabRoutes.insert(index, item);
  void updateFabRoutesAtIndex(int index, Function(String) updateFn) =>
      fabRoutes[index] = updateFn(fabRoutes[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for NavigationBotttom component.
  late NavigationBotttomModel navigationBotttomModel;

  @override
  void initState(BuildContext context) {
    navigationBotttomModel =
        createModel(context, () => NavigationBotttomModel());
  }

  @override
  void dispose() {
    navigationBotttomModel.dispose();
  }
}
