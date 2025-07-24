import 'package:flutter/material.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

class HostChatWidget extends StatefulWidget {
  const HostChatWidget({Key? key}) : super(key: key);

  static String routeName = 'HostChat';
  static String routePath = '/hostChat';

  @override
  _HostChatWidgetState createState() => _HostChatWidgetState();
}

class _HostChatWidgetState extends State<HostChatWidget> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, String>> messages = [
    {'sender': 'Sophia', 'message': 'Hola, ¿todo bien?'},
    {'sender': 'Liam', 'message': 'Sí, todo perfecto. Gracias.'},
    {'sender': 'Sophia', 'message': 'Perfecto, cualquier cosa me avisas.'},
    {'sender': 'Liam', 'message': 'Gracias, estaré atento.'},
  ];

  Widget _buildAvatar(String sender) {
    if (sender == 'Liam') {
      // Host avatar placeholder: blue circle with initials
      return CircleAvatar(
        radius: 18,
        backgroundColor: Colors.blue.shade400,
        child: const Text(
          'L',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    } else {
      // Traveler avatar placeholder: purple circle with initials
      return CircleAvatar(
        radius: 18,
        backgroundColor: Colors.deepPurple.shade400,
        child: const Text(
          'S',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  Widget _buildMessageBubble(Map<String, String> msg) {
    final isHost = msg['sender'] == 'Liam';
    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(16),
      topRight: const Radius.circular(16),
      bottomLeft: Radius.circular(isHost ? 16 : 4),
      bottomRight: Radius.circular(isHost ? 4 : 16),
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        mainAxisAlignment:
        isHost ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isHost) _buildAvatar(msg['sender']!),
          if (!isHost) const SizedBox(width: 12),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isHost ? Colors.white : const Color(0xFF5B3E99),
                borderRadius: borderRadius,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Text(
                msg['message']!,
                style: TextStyle(
                  color: isHost ? Colors.black : Colors.white,
                  fontSize: 15,
                  height: 1.3,
                ),
              ),
            ),
          ),
          if (isHost) const SizedBox(width: 12),
          if (isHost) _buildAvatar(msg['sender']!),
        ],
      ),
    );
  }

  Widget _buildQuickMessages() {
    final quickMessages = [
      'Hola, ¿en qué puedo ayudarte?',
      'Estoy en camino.',
      'Por favor, toca el timbre al llegar.',
      'Gracias por tu mensaje.',
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: const Color(0xFF3C3A70),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: quickMessages.map((text) {
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white24,
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  setState(() {
                    messages.add({'sender': 'Liam', 'message': text});
                  });
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        _scrollController.position.maxScrollExtent + 100,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  });
                },
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMessageInputArea() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        color: const Color(0xFF3C3A70),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                        decoration: const InputDecoration(
                          hintText: 'Type a message',
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        minLines: 1,
                        maxLines: 4,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.attach_file, color: Colors.white70),
                      onPressed: () {
                        // TODO: Implement image attachment
                      },
                      tooltip: 'Attach image',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Color(0xFF2C2B50)),
                onPressed: () {
                  if (_messageController.text.trim().isNotEmpty) {
                    setState(() {
                      messages.add({
                        'sender': 'Liam',
                        'message': _messageController.text.trim()
                      });
                      _messageController.clear();
                    });
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (_scrollController.hasClients) {
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent + 100,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      }
                    });
                  }
                },
                tooltip: 'Send message',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C2B50),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Reservation ID: 123456',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back',
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Today',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(bottom: 12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageBubble(messages[index]);
              },
            ),
          ),
          _buildQuickMessages(),
          _buildMessageInputArea(),
        ],
      ),
    );
  }
}