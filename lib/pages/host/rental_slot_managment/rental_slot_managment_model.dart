import '/components/navigation_botttom/navigation_botttom_widget.dart';
import '/components/traveler_detail/traveler_detail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'rental_slot_managment_widget.dart' show RentalSlotManagmentWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RentalSlotManagmentModel
    extends FlutterFlowModel<RentalSlotManagmentWidget> {
  ///  Local state fields for this page.

  List<String> fabLabels = [
    'Estacionamientos',
    'Ganancias',
    'Historial',
    'Nuevo'
  ];
  void addToFabLabels(String item) => fabLabels.add(item);
  void removeFromFabLabels(String item) => fabLabels.remove(item);
  void removeAtIndexFromFabLabels(int index) => fabLabels.removeAt(index);
  void insertAtIndexInFabLabels(int index, String item) =>
      fabLabels.insert(index, item);
  void updateFabLabelsAtIndex(int index, Function(String) updateFn) =>
      fabLabels[index] = updateFn(fabLabels[index]);

  List<String> fabIcons = [
    'rentalSlotList',
    'rentalSlotEarnings',
    'history',
    'rentalSlotNew'
  ];
  void addToFabIcons(String item) => fabIcons.add(item);
  void removeFromFabIcons(String item) => fabIcons.remove(item);
  void removeAtIndexFromFabIcons(int index) => fabIcons.removeAt(index);
  void insertAtIndexInFabIcons(int index, String item) =>
      fabIcons.insert(index, item);
  void updateFabIconsAtIndex(int index, Function(String) updateFn) =>
      fabIcons[index] = updateFn(fabIcons[index]);

  List<String> fabRoutes = [
    '/rentalSlotList',
    '/rentalSlotEarnings',
    '/rentalSlotHistory',
    '/rentalSlotNew'
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
