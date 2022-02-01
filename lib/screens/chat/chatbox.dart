import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:student_portal/screens/chat/components/chat_bubble.dart';
import 'package:student_portal/screens/homepage/home.dart';
import 'package:student_portal/screens/store/store.dart';

class Chatbox extends StatefulWidget {
  Chatbox({required this.username});
  final String username;

  @override
  _ChatboxState createState() => _ChatboxState();
}

class _ChatboxState extends State<Chatbox> {
  static final key = GlobalKey<AnimatedListState>();

  final textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var chats = [
      {'message': 'Hello World 1', 'type': 'sent', 'sender': 'Me'},
      {
        'message': 'Hello World 2',
        'type': 'received',
        'sender': widget.username
      },
      {'message': 'Hello World 1', 'type': 'sent', 'sender': 'Me'},
      {
        'message': 'Hello World 3',
        'type': 'received',
        'sender': widget.username
      },
      {'message': 'Hello World 4', 'type': 'sent', 'sender': 'Me'},
      {'message': 'Hello World 5', 'type': 'sent', 'sender': 'Me'},
      {'message': 'Hello World 6', 'type': 'sent', 'sender': 'Me'},
      {
        'message': 'Hello World 7',
        'type': 'received',
        'sender': widget.username
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1553272725-086100aecf5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
              radius: 16,
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.username,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        fontSize: 16)),
                Text(
                  'Online',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.greenAccent,
                      fontSize: 12),
                )
              ],
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
                reverse: true,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AnimatedList(
                            key: key,
                            initialItemCount: chats.length,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index, animation) {
                              return SlideTransition(
                                position: animation.drive(Tween(
                                        begin: Offset(0, 0.5), end: Offset.zero)
                                    .chain(
                                        CurveTween(curve: Curves.easeOutBack))),
                                child: BuildChatBubble(
                                    index, chats[index], animation),
                              );
                            }),
                        SizedBox(height: 70),
                      ],
                    ),
                  ),
                ]),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        toolbarOptions: ToolbarOptions(
                            copy: true, paste: true, selectAll: true),
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: 'Message',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.black),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.5, color: Colors.black),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton.small(
                      backgroundColor: Colors.black,
                      onPressed: () {
                        sendMessage(textController.text, chats);
                        textController.clear();
                      },
                      child: Icon(
                        Icons.send,
                        size: 16,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget BuildChatBubble(index, messages, animation) {
    return ChatBubble(
        messages['message'], messages['sender'], messages['type'], animation);
  }

  void sendMessage(String message, chats) {
    var chat = {'message': message, 'type': 'sent', 'sender': 'Me'};
    var index = chats.length;
    chats.add(chat);
    print(chats);
    key.currentState!.insertItem(index);
  }
}
