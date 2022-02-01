import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatBubble extends StatefulWidget {
  ChatBubble(this.message, this.username, this.type, this.animation);
  final String message;
  final String username;
  final String type;
  final animation;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> with TickerProviderStateMixin {
  final DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          widget.type == 'sent' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 100),
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft:
                    widget.type == 'sent' ? Radius.circular(15) : Radius.zero,
                topRight:
                    widget.type != 'sent' ? Radius.circular(15) : Radius.zero,
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              color: widget.type == 'sent'
                  ? Colors.lightBlueAccent.withOpacity(0.5)
                  : Color.fromRGBO(230, 230, 230, 100)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.username,
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 5,
                ),
                Container(
                    child: Text(widget.message,
                        style: TextStyle(fontFamily: 'Montserrat'))),
                SizedBox(height: 5),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(DateFormat.jm().format(time),
                      style: TextStyle(fontFamily: 'Montserrat', fontSize: 12))
                ])
              ],
            ),
          )),
    );
  }
}
