import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(Feed());

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Opening a PDF',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
    return FeedHome();
//    );
  }
}

class FeedHome extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<FeedHome> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    Utils.InterstitialAds();
//    FirebaseAdMob.instance.initialize(appId: StringRes.appId);

  }

  @override
  void dispose() {
    // TODO: implement dispose
//    Utils.InterstitialAds();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('Feedback'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0))),
        backgroundColor: Colors.deepOrange,
      ),
      bottomNavigationBar: Container(
//        child: Utils.createBannerAd(),
      ),
      body: new Center(
        child: new MaterialButton(
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
          minWidth: 200.0,
          height: 60.0,
          color: Colors.deepOrange,
          onPressed: () => _launchURL('ourconnection97@gmail.com', 'RTO Vehicle Information', 'Feedback'),
          child: new Text('Send Email',style: TextStyle(color: Colors.white,fontSize: 20.0),),
        ),
      ),
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
}
