import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'chatbox.dart';

class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        toolbarHeight: 100,
        leadingWidth: 64,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Chats',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 40),
              ),
            ),
            SizedBox(height: 20),
            ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                children: List.generate(3, (index) {
                  return BuildChatList(
                      ['Nishant Jain', 'Snehil Suman', 'Vatsaul Desai'][index]);
                })),
          ],
        ),
      ),
    );
  }

  Widget BuildChatList(String username) {
    return Column(
      children: [
        ListTile(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Chatbox(username: username))),
          minLeadingWidth: 0,
          hoverColor: Colors.grey,
          leading: CircleAvatar(
            foregroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1553272725-086100aecf5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60'),
            radius: 28,
          ),
          title: Text(
            username,
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            'Last Message: 12:30 pm',
            style: TextStyle(fontFamily: 'Montserrat'),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
