/*
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:news_of_daily/helper/res.dart';
import 'package:news_of_daily/helper/utils.dart';

import 'homepage.dart';


class SplashScreen extends StatelessWidget {
  //making list of pages needed to pass in IntroViewsFlutter constructor.
  final pages = [

    PageViewModel(
//        pageColor: const Color(0xFFffffff),
        pageColor: Colors.deepPurple,
        // iconImageAssetPath: 'assets/air-hostess.png',
        bubble: Image.asset('assets/images/splash_1.png'),
        body: Text( StringResHindi.s1Details,style: TextStyle(fontSize: 20)
        ),
        title: Text(StringResHindi.s1Title,style: TextStyle(fontSize: 25)
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        mainImage: Image.asset(
          'assets/images/splash_1.png',
          height: 285.0,

          alignment: Alignment.center,
        )),

    PageViewModel(
//      pageColor: const Color(0xFFffffff),
      pageColor: Colors.deepPurple,

      iconImageAssetPath: 'assets/waiter.png',
      body: Text( StringResHindi.s2Details,style: TextStyle(fontSize: 20)),
      title: Text(StringResHindi.s1Title, style: TextStyle(fontSize: 25)),
      mainImage: Image.asset(
        'assets/images/splash_2.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),

    PageViewModel(
//      pageColor: const Color(0xFFffffff),
      pageColor: Colors.deepPurple,
//      bubble: ,
//      iconImageAssetPath: 'assets/taxi-driver.png',
      body: Text(StringResHindi.s3Details, style: TextStyle(fontSize: 20),
      ),
      title: Text(StringResHindi.s3Title, style: TextStyle(fontSize: 25)),
      mainImage: Image.asset(
        'assets/images/splash_3.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(//ThemeData
      body: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,

          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
*/
//
// import 'package:flutter/material.dart';
// import 'package:intro_slider/dot_animation_enum.dart';
// import 'package:intro_slider/intro_slider.dart';
// import 'package:intro_slider/slide_object.dart';
// import 'package:news_of_daily/helper/prefkey.dart';
// import 'package:news_of_daily/helper/res.dart';
// import 'package:news_of_daily/inject/injector.dart';
//
// import 'homepage.dart';
//
// //import 'package:intro_slider_example/home.dart';
//
// class Splash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IntroScreen(),
//     );
//   }
// }
//
// class IntroScreen extends StatefulWidget {
//   IntroScreen({Key key}) : super(key: key);
//
//   @override
//   IntroScreenState createState() => new IntroScreenState();
// }
//
// //------------------ Custom your own tabs ------------------
// class IntroScreenState extends State<IntroScreen> {
//   List<Slide> slides = new List();
//
//   Function goToTab;
//
//   @override
//   void initState() {
//     super.initState();
//
//     slides.add(
//       new Slide(
//         title: StringResHindi.s1Title,
//         styleTitle: TextStyle(
// //            color: Color(0xff3da4ab),
//             color: Colors.deepPurple,
//
// //            color: Colors.grey,
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description: StringResHindi.s1Details,
//         styleDescription: TextStyle(
// //            color: Color(0xfffe9c8f),
//             color: Colors.deepPurple.shade400,
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/splash_1.png",
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: StringResHindi.s2Title,
//         styleTitle: TextStyle(
// //            color: Color(0xff3da4ab),
//             color: Colors.deepPurple,
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description: StringResHindi.s2Details,
//         styleDescription: TextStyle(
//             color: Colors.deepPurple.shade400,
// //            color: Color(0xfffe9c8f),
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/splash_2.png",
//       ),
//     );
//     slides.add(
//       new Slide(
//         title: StringResHindi.s3Title,
//         styleTitle: TextStyle(
// //            color: Color(0xff3da4ab),
//             color: Colors.deepPurple,
//             fontSize: 30.0,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'RobotoMono'),
//         description: StringResHindi.s3Details,
//         styleDescription: TextStyle(
// //            color: Color(0xfffe9c8f),
//             color: Colors.deepPurple.shade400,
//             fontSize: 20.0,
//             fontStyle: FontStyle.italic,
//             fontFamily: 'Raleway'),
//         pathImage: "assets/images/splash_3.png",
//       ),
//     );
//   }
//
//   void onDonePress() {
//     // Back to the first tab
// //    this.goToTab(0);
//
//     Injector.prefs
//         .setString(Prefs.firstTimeSplash, StringResHindi.firstTimeOpen);
// //    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (BuildContext context) => HomePage()),
//       ModalRoute.withName('/home'),
//     );
//   }
//
//   void onTabChangeCompleted(index) {
//     // Index of current tab is focused
//   }
//
//   Widget renderNextBtn() {
//     return Icon(
//       Icons.navigate_next,
// //      color: Color(0xffffcc5c),
//       color: Colors.deepPurple,
//       size: 35.0,
//     );
//   }
//
//   Widget renderDoneBtn() {
//     return Icon(
//       Icons.done,
// //      color: Color(0xffffcc5c),
//       color: Colors.deepPurple,
//     );
//   }
//
//   Widget renderSkipBtn() {
//     return Icon(
//       Icons.skip_next,
// //      color: Color(0xffffcc5c),
//       color: Colors.deepPurple,
//     );
//   }
//
//   List<Widget> renderListCustomTabs() {
//     List<Widget> tabs = new List();
//     for (int i = 0; i < slides.length; i++) {
//       Slide currentSlide = slides[i];
//       tabs.add(Container(
//         width: double.infinity,
//         height: double.infinity,
//         child: Container(
//           margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
//           child: ListView(
//             children: <Widget>[
//               GestureDetector(
//                   child: Image.asset(
//                 currentSlide.pathImage,
//                 width: 200.0,
//                 height: 200.0,
//                 fit: BoxFit.contain,
//               )),
//               Container(
//                 child: Text(
//                   currentSlide.title,
//                   style: currentSlide.styleTitle,
//                   textAlign: TextAlign.center,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//               Container(
//                 child: Text(
//                   currentSlide.description,
//                   style: currentSlide.styleDescription,
//                   textAlign: TextAlign.center,
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 margin: EdgeInsets.only(top: 20.0),
//               ),
//             ],
//           ),
//         ),
//       ));
//     }
//     return tabs;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new IntroSlider(
//       // List slides
//       slides: this.slides,
//
//       // Skip button
//       renderSkipBtn: this.renderSkipBtn(),
// //      colorSkipBtn: Color(0x33ffcc5c),
//       colorSkipBtn: Colors.deepPurple.shade50,
// //      highlightColorSkipBtn: Color(0xffffcc5c),
//       highlightColorSkipBtn: Colors.deepPurple.shade400,
//
//       // Next button
//       renderNextBtn: this.renderNextBtn(),
//
//       // Done button
//       renderDoneBtn: this.renderDoneBtn(),
//       onDonePress: this.onDonePress,
// //      colorDoneBtn: Color(0x33ffcc5c),
//       colorDoneBtn: Colors.deepPurple.shade50,
//
// //      highlightColorDoneBtn: Color(0xffffcc5c),
//       highlightColorDoneBtn: Colors.deepPurple.shade400,
//
//       // Dot indicator
// //      colorDot: Color(0xffffcc5c),
//       colorDot: Colors.deepPurple.shade400,
//
//       sizeDot: 13.0,
//       typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
//
//       // Tabs
//       listCustomTabs: this.renderListCustomTabs(),
//       backgroundColorAllSlides: Colors.white,
//       refFuncGoToTab: (refFunc) {
//         this.goToTab = refFunc;
//       },
//
//       // Show or hide status bar
//       // hideStatusBar: true,
//       shouldHideStatusBar: true,
//
//       // On tab change completed
//       onTabChangeCompleted: this.onTabChangeCompleted,
//     );
//   }
// }

//------------------ Default config ------------------
//class IntroScreenState extends State<IntroScreen> {
//  List<Slide> slides = new List();
//
//  @override
//  void initState() {
//    super.initState();
//
//    slides.add(
//      new Slide(
//        title: "ERASER",
//        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
//        pathImage: "images/photo_eraser.png",
//        backgroundColor: Color(0xfff5a623),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "PENCIL",
//        description: "Ye indulgence unreserved connection alteration appearance",
//        pathImage: "images/photo_pencil.png",
//        backgroundColor: Color(0xff203152),
//      ),
//    );
//    slides.add(
//      new Slide(
//        title: "RULER",
//        description:
//        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
//        pathImage: "images/photo_ruler.png",
//        backgroundColor: Color(0xff9932CC),
//      ),
//    );
//  }
//
//  void onDonePress() {
//    // Do what you want
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new IntroSlider(
//      slides: this.slides,
//      onDonePress: this.onDonePress,
//    );
//  }
//}
