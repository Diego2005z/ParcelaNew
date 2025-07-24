import '/components/navigation_botttom/navigation_botttom_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'parking_managment_widget.dart' show ParkingManagmentWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkingManagmentModel extends FlutterFlowModel<ParkingManagmentWidget> {
  ///  Local state fields for this page.

  List<String> fabIcons = ['parkingMap', 'parkingList', 'history'];
  void addToFabIcons(String item) => fabIcons.add(item);
  void removeFromFabIcons(String item) => fabIcons.remove(item);
  void removeAtIndexFromFabIcons(int index) => fabIcons.removeAt(index);
  void insertAtIndexInFabIcons(int index, String item) =>
      fabIcons.insert(index, item);
  void updateFabIconsAtIndex(int index, Function(String) updateFn) =>
      fabIcons[index] = updateFn(fabIcons[index]);

  List<String> fabLabels = ['Mapa', 'Lista', 'Historial'];
  void addToFabLabels(String item) => fabLabels.add(item);
  void removeFromFabLabels(String item) => fabLabels.remove(item);
  void removeAtIndexFromFabLabels(int index) => fabLabels.removeAt(index);
  void insertAtIndexInFabLabels(int index, String item) =>
      fabLabels.insert(index, item);
  void updateFabLabelsAtIndex(int index, Function(String) updateFn) =>
      fabLabels[index] = updateFn(fabLabels[index]);

  List<String> fabRoutes = ['/parkingMap', '/parkingList', '/parkingHistory'];
  void addToFabRoutes(String item) => fabRoutes.add(item);
  void removeFromFabRoutes(String item) => fabRoutes.remove(item);
  void removeAtIndexFromFabRoutes(int index) => fabRoutes.removeAt(index);
  void insertAtIndexInFabRoutes(int index, String item) =>
      fabRoutes.insert(index, item);
  void updateFabRoutesAtIndex(int index, Function(String) updateFn) =>
      fabRoutes[index] = updateFn(fabRoutes[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 4530000;
  int timerMilliseconds = 4530000;
  String timerValue =
      StopWatchTimer.getDisplayTime(4530000, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Model for NavigationBotttom component.
  late NavigationBotttomModel navigationBotttomModel;

  @override
  void initState(BuildContext context) {
    navigationBotttomModel =
        createModel(context, () => NavigationBotttomModel());
  }

  @override
  void dispose() {
    timerController.dispose();
    navigationBotttomModel.dispose();
  }
}
