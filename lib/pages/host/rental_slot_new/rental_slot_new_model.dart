import '/components/navigation_botttom/navigation_botttom_widget.dart';
import '/components/upload_document/upload_document_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/lat_lng.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'rental_slot_new_widget.dart' show RentalSlotNewWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RentalSlotNewModel extends FlutterFlowModel<RentalSlotNewWidget> {
  ///  Local state fields for this page.

  List<String> fabLabels = [
    'Estacionamientos',
    'Ganancias',
    'Historial',
    'Viajeros'
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
    'rentalSlotManagment'
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

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for search widget.
  FocusNode? searchFocusNode;
  TextEditingController? searchTextController;
  String? Function(BuildContext, String?)? searchTextControllerValidator;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController1;
  List<String>? get choiceChipsValues1 => choiceChipsValueController1?.value;
  set choiceChipsValues1(List<String>? val) =>
      choiceChipsValueController1?.value = val;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for SwitchListTile widget.
  bool? switchListTileValue;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController2;
  List<String>? get choiceChipsValues2 => choiceChipsValueController2?.value;
  set choiceChipsValues2(List<String>? val) =>
      choiceChipsValueController2?.value = val;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Model for NavigationBotttom component.
  late NavigationBotttomModel navigationBotttomModel;

  @override
  void initState(BuildContext context) {
    navigationBotttomModel =
        createModel(context, () => NavigationBotttomModel());
  }

  @override
  void dispose() {
    searchFocusNode?.dispose();
    searchTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    navigationBotttomModel.dispose();
  }
}
