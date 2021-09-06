import 'package:flutter/material.dart';
import 'package:news_of_daily/inject/injector.dart';

class Notiication extends StatefulWidget {
  @override
  _NotiicationState createState() => _NotiicationState();
}

class _NotiicationState extends State<Notiication> {
  List<Message> _message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _message = List<Message>();


    Injector.firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
//        _showItemDialog(message);
//        Navigator.push(context, MaterialPageRoute(builder: (context) => Notiication()));
        _setMessage(message);
      },
//      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
//        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsListPage(isNotification: true)));

//        _navigateToItemDetail(message);
        _setMessage(message);

      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
//        _navigateToItemDetail(message);
        _setMessage(message);

      },
    );
  }




  _setMessage(Map<String, dynamic> message) {
/*
      final ntification =  message['notification'];
      final data =  message['data'];
      final String title =  notification['title'];
      final String body =  notification['body'];
      final String message =  notification['message'];

      Message m = Message(title, body, message);
      _message.add(m);
*/


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Text('hello'),
    );
  }


}

class Message {
  String title;
  String body;
  String message;

  Message(title, body, message) {
    this.title = title;
    this.body = body;
    this.message = message;
  }
}
