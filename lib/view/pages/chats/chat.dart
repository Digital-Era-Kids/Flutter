import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_era_kids/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:digital_era_kids/services/auth_services.dart';
final _firestore=FirebaseFirestore.instance;

class ChatScreen extends StatefulWidget {
  // const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  authServices authentication = authServices();
  String email;
  getEmail() {
    FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    setState(() {
      email = user.email;
    });
  }
  final textController = TextEditingController();
  String messageText;


  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PreferredSize(

        child: Container(
          height: 30,
          color: Color(0xffffc809),
        ),
      ),
      appBar: PreferredSize(
          child: Container(
              padding: EdgeInsets.only(left: 20, bottom: 20),
              color: Color(0xffA9C938),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      color: Color(0xffffc809),
                      height: 32,
                      width: 32,
                      child: Icon(
                        Icons.message,
                        size: 29,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Chats",
                      style: TextStyle(color: Colors.black, fontSize: 32),
                    )
                  ],
                ),
              )),
          preferredSize: Size.fromHeight(100.0)),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(email: email),

            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      textController.clear();
                      _firestore.collection('messages').add(
                        {
                          'text': messageText,
                          'sender': email,
                          'time': DateTime.now().toIso8601String().toString(),
                        },
                      );
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class MessageStream extends StatelessWidget {
  MessageStream({this.email});
  String email;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('messages')
            .orderBy('time', descending: true)//add this
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data.docs;
          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            final messageText = message.data()['text'];
            final messageSender = message.data()['sender'];
            final messageTime=message.data()['time'];
            final currentUser= email;

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser==messageSender,
              time: messageTime,


            );
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              children: messageBubbles,
            ),
          );
        });
  }
}
class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text,this.isMe,this.time});
  final String sender;
  final String text;
  final bool isMe;
  final Timestamp time;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text('$sender ', style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),),
          Material(
            elevation: 5,
            borderRadius:isMe ? BorderRadius.only(bottomLeft: Radius.circular(30),topLeft:Radius.circular(30.0),bottomRight: Radius.circular(30) ):BorderRadius.only(bottomLeft: Radius.circular(30),topRight:Radius.circular(30.0),bottomRight: Radius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text('$text ',style: TextStyle(
                  fontSize: 15,
                  color: isMe?Colors.white:Colors.black
              ),),
            ),
            color: isMe?Color(0xffffc809):Color(0xffA9C938),
          ),
          // Text('${time.toDate()}',style: TextStyle(
          //   fontSize: 12,
          //   color: Colors.black54,
          // ),),
        ],
      ),
    );
  }
}
