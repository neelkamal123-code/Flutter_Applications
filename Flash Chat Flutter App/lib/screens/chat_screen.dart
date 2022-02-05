import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextCntr = TextEditingController();
  final firebase = Firestore.instance;
  final auth = FirebaseAuth.instance;
  CrossAxisAlignment direction;

  String messageText;
  FirebaseUser currentuser;

  void getCurrentUser() async {
    final auth = await FirebaseAuth.instance;
    FirebaseUser user = await auth.currentUser();
    currentuser = user;
    print(currentuser.email);
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(icon:Icon(Icons.arrow_back),
            onPressed:(){
              Navigator.pop(context);
            }
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality

                auth.signOut();
                Navigator.pop(context);
                //
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder(
              stream: firebase.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final messages = snapshot.data.documents.reversed;
                  List<MessageBubble> messageWidgets = [];
                  for (var message in messages) {
                    final messageText = message.data['text'];
                    final messageSender = message.data['sender'];
                    direction = (messageSender == currentuser.email)?CrossAxisAlignment.end:CrossAxisAlignment.start;
                    final messageBubble = MessageBubble(
                      direction: direction,
                      sender: messageSender,
                      text: messageText,
                    );
                    messageWidgets.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      children: messageWidgets,
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextCntr,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      onChanged: (value) {
                        //Do something with the user input.
                        setState(() {
                          messageText = value;
                        });
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextCntr.clear();
                      //Implement send functionality.
                      firebase.collection('messages').add({
                        'text': messageText,
                        'sender': currentuser.email,
                      });
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

  void messageStream() async {
    await for (var snapshot in firebase.collection('messages').snapshots()) {
      for (var message in snapshot.documents) {
        print(message.data);
      }
    }
  }
}


class MessageBubble extends StatelessWidget {
  MessageBubble({this.sender, this.text,this.direction});
  final sender;
  final text;
  CrossAxisAlignment direction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: direction,
        children:[
          Text(sender,
          style: TextStyle(
            letterSpacing: 2,
            color: Colors.black,
            fontSize: 12,
          ),),
          Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 20,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ]
      ),
    );
  }
}
