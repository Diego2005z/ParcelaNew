import '/flutter_flow/flutter_flow_model.dart';
import 'package:flutter/material.dart';
import 'host_chat_widget.dart';

/// Modelo para la gestión del chat del anfitrión.
/// Extiende FlutterFlowModel para integrar con HostChatWidget.
class HostChatModel extends FlutterFlowModel<HostChatWidget> {
  /// Nodo para manejar el enfoque de los campos de texto.
  final FocusNode unfocusNode = FocusNode();

  /// Controlador para el campo de texto del mensaje.
  final TextEditingController textController = TextEditingController();

  /// Controlador para la lista de mensajes (scroll).
  final ScrollController scrollController = ScrollController();

  /// Lista de mensajes del chat.
  /// Cada mensaje puede contener texto, indicar si es del anfitrión y opcionalmente una URL de imagen adjunta.
  List<Map<String, dynamic>> messages = [
    {
      'fromHost': true,
      'text': '¡Hola! Bienvenido a mi cochera.',
      'imageUrl': null,
    },
    {
      'fromHost': false,
      'text': 'Hola, gracias. Estoy llegando en 5 minutos.',
      'imageUrl': null,
    },
  ];

  /// Respuestas rápidas para facilitar la interacción.
  final List<String> quickReplies = [
    '¡Hola! Bienvenido a mi cochera.',
    '¿Necesitas ayuda con algo?',
    'Recuerda dejar el lugar limpio.',
    '¡Gracias por tu visita!',
  ];

  @override
  void initState(BuildContext context) {

  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textController.dispose();
    scrollController.dispose();
  }
}
