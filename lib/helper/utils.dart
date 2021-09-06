import 'package:facebook_audience_network/ad/ad_interstitial.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_of_daily/helper/prefkey.dart';
import 'package:news_of_daily/inject/injector.dart';

class Utils {
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getAssetsImg(String name) {
    return "assets/images/" + name + ".png";
  }

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.black,
        textColor: Colors.white);
  }

  static void addBadge() {
    int count = Injector.badgeCount + 1;
    print('badge_Count' + count.toString());
    // FlutterAppBadger.updateBadgeCount(count);
    Injector.prefs.setInt(Prefs.badgeCount, count);
    Injector.badgeCount = Injector.prefs.getInt(Prefs.badgeCount);
  }

  static void removeBadge() {
    // FlutterAppBadger.removeBadge();
    Injector.badgeCount = 0;
    Injector.prefs.setInt(Prefs.badgeCount, 0);
  }



  //facebook ads
  static void InterstitialAds() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "1014394102270001_1014457265597018",
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED)
          FacebookInterstitialAd.showInterstitialAd(delay: 5000);
      },
    );
  }

   //banner
  static BannerAds() {
    return FacebookBannerAd(
//      placementId: "984738798528322_985106048491597", old
      placementId: "742602542923101_874027849780569",
      bannerSize: BannerSize.STANDARD,
      listener: (result, value) {
        switch (result) {
          case BannerAdResult.ERROR:
            print("Error: $value");
            break;
          case BannerAdResult.LOADED:
            print("Loaded: $value");
            break;
          case BannerAdResult.CLICKED:
            print("Clicked: $value");
            break;
          case BannerAdResult.LOGGING_IMPRESSION:
            print("Logging Impression: $value");
            break;
        }
      },
    );
  }

  static NativeBannerAds() {
    return FacebookNativeAd(
//      placementId: "984738798528322_985109275157941",
      placementId: "742602542923101_874027243113963",
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_120,
      width: double.infinity,
      backgroundColor: Colors.grey,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("Native Ad: $result --> $value");
      },
    );
  }

  static showNativeAd() {
    return FacebookNativeAd(
//      placementId: "984738798528322_1093800317622169",
      placementId: "742602542923101_743422176174471",
      adType: NativeAdType.NATIVE_AD,
      width: double.infinity,
      height: 300,
//      backgroundColor: Colors.blue,
      backgroundColor: Colors.grey,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("Native Ad: $result --> $value");
      },
    );
  }
/*  static inStreamVideoAd() {
    return FacebookInStreamVideoAd(
      placementId: "YOUR_PLACEMENT_ID",
      height: 300,
      listener: (result, value) {
        if (result == InStreamVideoAdResult.VIDEO_COMPLETE) {
          setState(() {
            _videoComplete = true;
          });
        }
      },
    );
  }*/


}
