import '/components/navigation_botttom/navigation_botttom_widget.dart';
import '/components/parking_history_modal/parking_history_modal_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import 'dart:math';
import 'dart:ui';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'rental_slot_list_widget.dart' show RentalSlotListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RentalSlotListModel extends FlutterFlowModel<RentalSlotListWidget> {
  ///  Local state fields for this page.

  bool enableSlot = false;

  List<String> fabIcons = [
    'rentalSlotEarnings',
    'history',
    'rentalSlotNew',
    'rentalSlotManagment'
  ];
  void addToFabIcons(String item) => fabIcons.add(item);
  void removeFromFabIcons(String item) => fabIcons.remove(item);
  void removeAtIndexFromFabIcons(int index) => fabIcons.removeAt(index);
  void insertAtIndexInFabIcons(int index, String item) =>
      fabIcons.insert(index, item);
  void updateFabIconsAtIndex(int index, Function(String) updateFn) =>
      fabIcons[index] = updateFn(fabIcons[index]);

  List<String> fabLabels = ['Ganancias', 'Historial', 'Nuevo', 'Viajeros'];
  void addToFabLabels(String item) => fabLabels.add(item);
  void removeFromFabLabels(String item) => fabLabels.remove(item);
  void removeAtIndexFromFabLabels(int index) => fabLabels.removeAt(index);
  void insertAtIndexInFabLabels(int index, String item) =>
      fabLabels.insert(index, item);
  void updateFabLabelsAtIndex(int index, Function(String) updateFn) =>
      fabLabels[index] = updateFn(fabLabels[index]);

  List<String> fabRoutes = [
    '/rentalSlotEarnings',
    '/rentalSlotHistory',
    '/rentalSlotNew',
    '/rentalSlotManagment'
  ];
  void addToFabRoutes(String item) => fabRoutes.add(item);
  void removeFromFabRoutes(String item) => fabRoutes.remove(item);
  void removeAtIndexFromFabRoutes(int index) => fabRoutes.removeAt(index);
  void insertAtIndexInFabRoutes(int index, String item) =>
      fabRoutes.insert(index, item);
  void updateFabRoutesAtIndex(int index, Function(String) updateFn) =>
      fabRoutes[index] = updateFn(fabRoutes[index]);

  ///  State fields for stateful widgets in this page.

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
