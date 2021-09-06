import 'package:news_of_daily/helper/res.dart';
import 'package:news_of_daily/helper/utils.dart';
import 'package:news_of_daily/inject/injector.dart';
import 'package:news_of_daily/screen/news_list.dart';
import 'package:news_of_daily/screen/post_language.dart';
import 'package:flutter/material.dart';
import 'package:news_of_daily/screen/side_menu/aboutus.dart';
import 'package:news_of_daily/screen/side_menu/privacy.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'memes_page.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // getData();
    // pushNotificationTokenGet();
    Utils.removeBadge();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.85),
//        backgroundColor: Colors.deepPurple.withOpacity(0.9),
        drawer: new Drawer (
          child: Container (
            color: Colors.deepPurple,
            child: new ListView(
              padding: EdgeInsets.only(top: 60.0),
              children: <Widget> [
                new UserAccountsDrawerHeader (
                  accountName: null,
                  accountEmail: null,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                      image: DecorationImage(
                          image: AssetImage(Utils.getAssetsImg('logo')),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  height: 20,
                ),
                sideMenuList("FeedBack", 1),
                sideMenuList("Share App", 2),
                sideMenuList("about us", 3),
//              sideMenuList("Privacy policy", 4),
                Divider(),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(StringResHindi.newsDaily, style: TextStyle(fontSize: 20.0)),
          bottom: PreferredSize(
              child: TabBar(
                  isScrollable: true,
                  unselectedLabelColor: Colors.white.withOpacity(0.3),
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(child: Text(StringResHindi.homepage)),
                    Tab(child: Text(StringResHindi.topNews)),
                    Tab(child: Text(StringResHindi.corona)),
                    Tab(child: Text(StringResHindi.manoranjan)),
                    Tab(child: Text(StringResHindi.review)),
                    Tab(child: Text(StringResHindi.bharat)),
                    Tab(child: Text(StringResHindi.vigyan)),
                    Tab(child: Text(StringResHindi.khel)),
                    Tab(child: Text(StringResHindi.lifeStyle)),
                    // Tab(child: Text(StringResHindi.hasyajanak)),
                  ]),
              preferredSize: Size.fromHeight(35.0)),
        ),
        body: TabBarView(children: <Widget>[
          NewsListPage(newsCategory: StringResHindi.homepage, isNotification: false),
          NewsListPage(newsCategory: StringResHindi.topNews, isNotification: false),
          NewsListPage(newsCategory: StringResHindi.corona, isNotification: false),
          NewsListPage(newsCategory: StringResHindi.manoranjan, isNotification: false),
          NewsListPage(newsCategory: StringResHindi.review, isNotification: false),
          NewsListPage(newsCategory: StringResHindi.bharat, isNotification: false),
          NewsListPage(newsCategory: StringResHindi.vigyan, isNotification: false),
          NewsListPage(newsCategory: StringResHindi.khel, isNotification: false),
//          NewsListPage(newsCategory: StringResHindi.hasyajanak),
          NewsListPage(newsCategory: StringResHindi.lifeStyle),
          // MemesShoePage(),

         // Container(child: CustomPaint(child: Text('Tab 1'))),
         // Container(child: Center(child: Text('Tab 2'))),
         // Container(child: Center(child: Text('Tab 3'))),
         // Container(child: Center(child: Text('Tab 4'))),
         // Container(child: Center(child: Text('Tab 5'))),
         // Container(child: Center(child: Text('Tab 6'))),
         // Container(child: Center(child: Text('Tab 7'))),
         // Container(child: Center(child: Text('Tab 8'))),
         // Container(child: Center(child: Text('Tab 9'))),
         // Container(child: Center(child: Text('Tab 10')))
        ]),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
//            UploadPhoto();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SelectLanguage()));
          },
          child: Icon(Icons.navigate_next),
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }

  sideMenuList(String title, int i) {
    return ListTile(
      leading: new Icon(Icons.arrow_right, color: Colors.white,),
      title: new Text(title,style: TextStyle(color: Colors.white, fontSize: 20),),
      onTap: () {
        Navigator.of(context).pop();
        if (i == 1) {
          _launchURL('ourconnection97@gmail.com', 'News Troop', 'Feedback \n');
        } else if (i == 2) {
          Share.share('Check Out My News Troop Hindi - Latest and Breaking News App:  https://play.google.com/store/apps/details?id=com.app.mynewsofdaily');
        } else if (i == 3) {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new Aboutus()));
        } else if (i == 4) {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => new privacy()));
        }
//                Navigator.of(context).pushNamed("/a");
      },
    );
  }

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body\n';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  pushNotificationTokenGet() {

    // var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    // var ios = new IOSInitializationSettings();
    // var platform = new InitializationSettings(android: android, iOS: ios);
    // flutterLocalNotificationsPlugin.initialize(platform);

    Injector.firebaseMessaging.getToken().then((token){
      print("Token  :  -  $token");
    }).catchError((e) {
      print("firebase messaging token error $e");
    });

     Injector.firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showNotification(message);
//        _showItemDialog(message);
//         Navigator.push(context, MaterialPageRoute(builder: (context) => Notiication()));

      },
//      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        showNotification(message);

//        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsListPage(isNotification: true)));
//         Navigator.push(context, MaterialPageRoute(builder: (context) => Notiication()));

//        _navigateToItemDetail(message);
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        showNotification(message);

        // Navigator.push(context, MaterialPageRoute(builder: (context) => Notiication()));

//        _navigateToItemDetail(message);
      },
    );



    Injector.firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, alert: true, badge: true));
    Injector.firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings setting) {
      print('IOS Setting Registed');
    });

  }

  showNotification(Map<String, dynamic> msg) async {
/*    var android = new AndroidNotificationDetails(
      'sdffds dsffds',
      "CHANNLE NAME",
      "channelDescription",
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);*/
    // await flutterLocalNotificationsPlugin.show(
    //     0, "This is title", "this is demo", platform);
  }

/*  Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }*/

}

/*Container(
                height: 50,
                child: CustomPaint(
                  painter: CurvePainter(),
                ),
              ),*/
/*
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill

    var path = Path();

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width / 2, size.height / 2, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}*/
