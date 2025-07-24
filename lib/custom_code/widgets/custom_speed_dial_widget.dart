// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomSpeedDialWidget extends StatefulWidget {
  const CustomSpeedDialWidget({
    super.key,
    this.width,
    this.height,
    this.icon = 'add', // Ícono principal
    this.labels = const [], // Lista de etiquetas
    this.icons = const [], // Lista de íconos
    this.routes = const [], // Lista de rutas
    this.mode = 0, // Nuevo parámetro de tipo entero
  });

  final double? width;
  final double? height;
  final String icon; // Declaración del ícono principal
  final List<String> labels; // Lista de etiquetas
  final List<String> icons; // Lista de nombres de íconos
  final List<String> routes; // Lista de rutas
  final int mode; // Nuevo parámetro de tipo entero

  @override
  State<CustomSpeedDialWidget> createState() => _CustomSpeedDialWidgetState();
}

class _CustomSpeedDialWidgetState extends State<CustomSpeedDialWidget> {
  final isDialOpen = ValueNotifier<bool>(false);
  final buttonSize = const Size(56.0, 56.0);
  final childrenButtonSize = const Size(56.0, 56.0);
  final speedDialDirection = SpeedDialDirection.up;
  final useRAnimation = true;
  final switchLabelPosition = false;
  final closeManually = false;
  final renderOverlay = true;

  /// Mapa para convertir nombres de íconos en IconData
  final Map<String, IconData> _iconMap = {
    'history': Icons.history,
    'parkingList': FontAwesomeIcons.list,
    'parking': Icons.local_parking,
    'rentalSlotNew': Icons.add_location,
    'parkingMap': FontAwesomeIcons.mapMarkedAlt,
    'parkingManagment': Icons.access_time_outlined,
    'rentalSlotManagment': Icons.car_repair,
    'rentalSlotEarnings': FontAwesomeIcons.piggyBank,
    'wallet': FontAwesomeIcons.wallet,
    'rentalSlotList': FontAwesomeIcons.warehouse,
  };

  /// Obtiene el IconData correspondiente al nombre del ícono
  IconData _getIconData(String iconName) {
    return _iconMap[iconName] ?? Icons.local_parking; // Ícono por defecto
  }

  Color _getColor(bool type) {
    final isLightMode =
        ((Theme.of(context).brightness == Brightness.light) == type);

    if (widget.mode == 1) {
      return isLightMode
          ? FlutterFlowTheme.of(context).tertiary
          : FlutterFlowTheme.of(context).accent4;
    } else if (widget.mode == 2) {
      return isLightMode
          ? FlutterFlowTheme.of(context).secondary
          : FlutterFlowTheme.of(context).accent4;
    } else {
      return type
          ? FlutterFlowTheme.of(context).secondaryText
          : FlutterFlowTheme.of(context).secondaryBackground;
    }
  }

  /// Construye los botones secundarios del SpeedDial
  List<SpeedDialChild> _buildChildren() {
    return List.generate(widget.labels.length, (index) {
      return SpeedDialChild(
        child: Icon(_getIconData(widget.icons[index])),
        label: widget.labels[index],
        backgroundColor: _getColor(true),
        foregroundColor: _getColor(false),
        onTap: () {
          context.go(widget.routes[index], extra: <String, dynamic>{
            kTransitionInfoKey: const TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: _getIconData(widget.icon),
      activeIcon: Icons.close,
      spacing: 3,
      mini: false,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      buttonSize: buttonSize,
      childrenButtonSize: childrenButtonSize,
      visible: true,
      direction: speedDialDirection,
      switchLabelPosition: switchLabelPosition,
      closeManually: closeManually,
      renderOverlay: renderOverlay,
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      useRotationAnimation: useRAnimation,
      heroTag: 'speed-dial-hero-tag',
      backgroundColor: _getColor(true),
      foregroundColor: _getColor(false),
      elevation: 0.0,
      animationCurve: Curves.elasticInOut,
      isOpenOnStart: false,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: _getColor(false),
          width: 7,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      children: _buildChildren(),
    );
  }
}
