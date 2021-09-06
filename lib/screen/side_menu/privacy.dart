import 'package:flutter/material.dart';

class privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrivacyHome();
  }
}

class PrivacyHome extends StatefulWidget {
  @override
  _PrivacyHomeState createState() => _PrivacyHomeState();
}

class _PrivacyHomeState extends State<PrivacyHome> {

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
    return Scaffold(

      appBar: AppBar(
        title: Text('Privacy policy'),
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0))),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.share), onPressed: (){},)
//        ],
      ),
      /*bottomNavigationBar: Container(
        child: Utils.createBannerAd(),
      ),*/
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
//              Container(
//                  height: 0,
//                  width: double.infinity,
////                  child: PNetworkImage(image,fit: BoxFit.cover,)
//              ),
              Container(

                margin: EdgeInsets.fromLTRB(10.0, 10.0,10.0,10.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
//                    Text("Privacy Policy", style: Theme.of(context).textTheme.title,),
//                    SizedBox(height: 10.0),
//                    Divider(),
                    SizedBox(height: 10.0,),
                    Text("your privacy and the security of your information very seriously, and we encourage you to read this notice carefully to understand how we collect and handle your information.", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("To enhance better protection of your privacy we provide this notice. Our privacy policy describes the type of information our mobile apps collect from you, and the steps we have taken to protect that inforamtion. We only use this information to provide you the best services.", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("We collects certain information from you when you share that information with us and when you use our services.", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("We may collect non-personal identification information such as advertising ID whenever they interact with our apps.", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("We also use Facebook advertisements API for nearby places.", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("We may also use third-party network advertisers, to deliver ads to you on our behalf. These network advertisers may be supplied with or have access to your non personally identifiable information.", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("\nOUR USE OF YOUR INFORMATION\n", textAlign: TextAlign.justify, style: TextStyle(fontSize: 15.0),),
                    SizedBox(height: 10.0),
                    Text("1) We collects information from you to provide our service. \n\n 2) We also use to maintain, operate, provide and enhance our mobile apps  and to market additional products and services to you. \n\n 3) We don't share any information with anyone except to comply with the law, develop our products, or protect our rights. \n\n 4) We do not sell, trade, or otherwise transfer to outside parties your personally identifiable information. \n\n 5) We may also disclose, at its sole discretion, Apps, Analytics or Visitor Information as required by law, or to comply with a legally binding request—like a subpoena or similar legally enforceable request for information.", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("\n SECURITY \n", textAlign: TextAlign.justify, style: TextStyle(fontSize: 15.0)),
                    SizedBox(height: 10.0),
                    Text("We takes the security of your information very seriously. We uses reasonable administrative, physical, and technical safeguards to secure the information you share with us. Despite these safeguards and our additional efforts to secure your information, We cannot promise or guarantee that hackers, cybercriminals, or other unauthorized third-parties will not be able to defeat our security, and improperly collect, access, steal, or modify your information.", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("CHANGES TO THIS PRIVACY POLICY \n", textAlign: TextAlign.justify, style: TextStyle(fontSize: 15.0)),
                    SizedBox(height: 10.0),
                    Text("We may update our privacy policy at any time. We encourage you to periodically visit this page for the latest information on our privacy practices. User acknowledges and agrees that it is his/her responsibility to review this Policy periodically and become aware of modifications.\n", textAlign: TextAlign.justify,),
                    SizedBox(height: 10.0),
                    Text("CONTACT US \n", textAlign: TextAlign.justify, style: TextStyle(fontSize: 15.0)),
                    SizedBox(height: 10.0),
                    Text("ourconnection97@gmail.com \n", textAlign: TextAlign.justify,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
