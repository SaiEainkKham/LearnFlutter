import 'dart:math';

import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final String username;
  final String userImage;
  final bool isMe;
  MessageBubble(
      {required this.message,
      required this.username,
      required this.userImage,
      required this.isMe,
      super.key});

  final TextStyle textStyle = const TextStyle(
    fontSize: 30,
    color: Colors.white,
  );

  Size _textSize(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe)
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
        Container(
          decoration: BoxDecoration(
            color:
                isMe ? Colors.grey[300] : Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(12),
              topRight: const Radius.circular(12),
              bottomLeft:
                  isMe ? const Radius.circular(12) : const Radius.circular(0),
              bottomRight:
                  !isMe ? const Radius.circular(12) : const Radius.circular(0),
            ),
          ),
          width: min(
              MediaQuery.of(context).size.width * 0.5,
              max(_textSize(message, textStyle).width,
                  _textSize(username, textStyle).width)),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8,
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isMe
                      ? Colors.black
                      : Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              Text(
                message,
                style: TextStyle(
                  color: isMe
                      ? Colors.black
                      : Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ],
          ),
        ),
        if (isMe)
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              backgroundImage: NetworkImage(userImage),
            ),
          ),
      ],
    );
  }
}
