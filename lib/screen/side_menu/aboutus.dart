import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
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
        title: Text('Aboutus'),
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0))),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.share), onPressed: (){},)
//        ],
      ),
      bottomNavigationBar: Container(
//        child: Utils.createBannerAd(),
      ),
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
                    SizedBox(height: 10.0,),
                    Text("News Troop, India's  Hindi News Group, brings you the Latest news in Hindi, breaking news in hindi , hindi news from 400+ local news & different categories like national, politics, cricket, Tech, business and more. It also contains the latest hindi news etc. You can read your favorite News Troop here for free!! \n\nHindi is the key language in India & News Troop is the latest news source for Hindi news in India. News Troop has 37 editions & covers 11 states of India including UP News, Bihar News, MP, CG, Delhi & local news. It has also been declared by World Association of Newspapers as the Largest news read daily in the world. it has been the largest latest news daily of India for the last consecutive 21 rounds of the Indian Readership Survey (IRS). \n\nNews Troop latest hindi news app is all you need to get latest hindi news & breaking news in hindi today. \n\nTop Features of the app: \n\n400+ City & State News in Hindi: Connect with hometown & get local news. News Troop news app brings latest news in hindi from India to your phone. Latest hindi news coverage from 400+ Cities covering politics, local events, crime, business & more. We cover all hindi news states like, UP News, Bihar News, MP, Delhi, Uttrakhand, Delhi Punjab \n\nIn-depth Coverage: In-depth coverage of news, views & analysis of top news stories in politics, Business, Tech, World news, Sports & more. Our analytical stories provide unbiased coverage of all stories, be it Launch of a new mobile phone, general election coverage, latest hindi news in Business, cricket. \n\nTech News (टेक न्यूज़): We provide latest tech news in Hindi with gadgets review, new launches, product comparison, trending apps, tips to keep your data protected. \n\n  Top News (टॉप न्यूज़): Amar Ujala app aggregate top news in Hindi from all the categories like states and cities, sports, India, world, entertainment, business, automobiles and education at main page of app. \n\n Trending 30 (ट्रेंडिंग न्यूज़): Amar Ujala app gives trending news from across the India and world. Trending 30 News section has trending Hindi news on bollywood, viral news, weird news, cultural videos and shayari and poems in Hindi from Amar Ujala Kavya. \n\n Entertainment News (मनोरंजन समाचार): Amar Ujala app provides entertainment news from Bollywood, Hollywood, Indian Daily soaps and Television. This Hindi news app section offers the latest happening in entertainment industry, rumors, gossip, experts reviews on movies and trailers and much more. \n\n In-depth Analytical News: Get in-depth analytics breaking Hindi news on India news (इंडिया न्यूज़), world news (दुनिया न्यूज़), crime news (क्राइम न्यूज़), education news (शिक्षा समाचार), business news (बिज़नेस न्यूज़), lifestyle and fashion news, automobiles news, technology news (टेक्नोलॉजी न्यूज़), astrology and religious news, jokes and shayari, poems and much more in Hindi. \n\n  \n\nBusiness News (बिज़नेस न्यूज): Daily sensex updates & latest business news of all govt policies GST, Tax filing, Budget or more. Our business desk experts breakdown the policies in simple hindi news & inform its impact on your daily life. \n\nCommon Man Issues & Positive News (पॉजिटिव न्यूज): Tired of all negative news around, read our positive news section and drive the negativity away. \n\nEntertainment News & gossip (मनोरंजन समाचार): We bring the latest news from Bollywood & Indian tv shows. The latest bollywood news, rumors, gossip are delivered to your phone. Movie Reviews, trailers, viral videos. Detail of the TV serials & daily soaps. \n\nCricket News, Live Score Alerts (क्रिकेट न्यूज़): We keep you abreast with all live scores in hindi, fixtures (schedules), cricket news in hindi on and off the field, score updates, expert opinions and much more. We also cover all Indian sports news such as football, hockey, Tennis and many more. We cover all matches like IPL, World Cup 2019  \n\nEase of Use: The app is fast event in 2g/3g network and easy to browse . \n\nNotification: Get the latest news notifications & breaking news alerts. You can read all the latest notifications in our notification center.  \n\n    Offline Reading: Now no need of good internet connection to read news. Switch to offline mode and read all the news without burning your bandwidth.  \n\n    Audio News: Soon you can listen to the latest news and listen to notifications. (Coming Soon). RECORD_AUDIO: This is required to analyze offline TV viewing data and serve media-targeted ads. Granting this permission is optional. If you'd like to opt-out of this targeting, please visit the following link: http://www.zapr.in/privacy/.  \n\nStay ahead by downloading the latest hindi news app & end your daily news hunt here. Read Latest news", textAlign: TextAlign.justify,),
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
