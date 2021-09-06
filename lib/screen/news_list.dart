import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_of_daily/helper/constant.dart';
import 'package:news_of_daily/helper/utils.dart';
import 'package:flutter/material.dart';
import 'package:news_of_daily/inject/injector.dart';
import 'package:news_of_daily/model/upload_news.dart';
import 'package:news_of_daily/screen/crud.dart';
import 'package:news_of_daily/screen/news_details.dart';
import 'package:news_of_daily/screen/upload_photo.dart';
import 'package:transparent_image/transparent_image.dart';

const String testDevice = 'ca-app-pub-2155095013191401/1449920761';

int isAdsShow;

class NewsListPage extends StatefulWidget {
  final String newsCategory;
  final bool isNotification;

  const NewsListPage({Key key, this.newsCategory, this.isNotification})
      : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  int viewHideShow = 1;

  CrudObj crudObj = CrudObj();
  Stream listOfData;

  ScrollController _scrollBottomBarController =
      new ScrollController(); // set controller on scrolling
  bool isScrollingDown = false;
  double bottomBarHeight = 75; // set bottom bar height

  UploadRequest uploadRequest = UploadRequest();
  List<UploadRequest> uploadList = List();

//  final _controller = NativeAdmobController();

//  BannerAd _bannerAd;

//google ads: -

/*
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
//    nonPersonalizedAds: true,
    keywords: <String>['Game', 'Mario'],
  );

  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: BannerAd.testAdUnitId,
        //Change BannerAd adUnitId with Admob ID
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("BannerAd $event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: InterstitialAd.testAdUnitId,
        //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd $event");
        });
  }*/

  //end google ads

/*  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );


  BannerAd createBannerAd() {
    return new BannerAd(
        adUnitId: "ca-app-pub-4252364201498947/3350664917",
        size: AdSize.banner,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("Banner event : $event");
        });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
    setState(() {
      isAdsShow = 0;
    });


    /*
    FirebaseAdMob.instance.initialize(appId: StringRes.appId);
    _bannerAd = createBannerAd()..load()..show(anchorType: AnchorType.bottom);*/
  }

  @override
  void dispose() {
//    _bannerAd.dispose();
//    _interstitialAd.dispose();
    super.dispose();
  }

  Future<Null> getData() async {
    crudObj.getData(widget.newsCategory).then((result) {
      if (result != null) {
        setState(() {
          // print("Test data");
          print(result.toString());
          listOfData = result;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /* if(widget.isNotification) {
      return Scaffold(
        appBar: AppBar(
          title: Text('hello'),
        ),
        body: Center(
          child: Text('hello'),
        ),
      );
    } else {*/
    return Scaffold (
        backgroundColor: Colors.deepPurple,
        body: RefreshIndicator (
          color: Colors.deepPurple,
          onRefresh: getData,
          child: SingleChildScrollView (
            physics: BouncingScrollPhysics(),
            child: listOfData != null ?
            StreamBuilder (
                    // stream: listOfData,
                    stream: Injector.databaseRef
                        .collection(Const.hindiNews)
                        .doc(widget.newsCategory)
                        .collection('1').snapshots(),
                        // .orderBy('date',descending: true).snapshots,
//                  listOfData != null ? listOfData : CommonView.showShimmer(),
                    builder: (context, snapShot) {
                      print(snapShot.data);
                      if (snapShot.data == null) return Container();
//                            return CommonView.showShimmer();

                      return Container (
                        decoration: BoxDecoration (
                            color: Colors.white,
//                      border: Border.all(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.only (
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                                bottomRight: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0))),
                        margin: EdgeInsets.only(top: 0),
//                      margin: EdgeInsets.only(top: 50),
                        padding: EdgeInsets.only(top: 20, bottom: 40),
                        child: ListView.separated (
                          shrinkWrap: true,

//                  padding: EdgeInsets.only(bottom: 10, top: 50),
                          physics: NeverScrollableScrollPhysics(),
                          controller: _scrollBottomBarController,
                          itemCount: snapShot.data.docs.length ?? 0,
    //                physics: BouncingScrollPhysics(),
                          //          CommonView.showShimmer(),
                          itemBuilder: (context, index) {
                            return cellTitle(index, snapShot);
                          },
                          separatorBuilder: (context, index) {
                            return Container();
                            // return adsShow(index);
                          },
                        ),
                      );
                    })
                : Container (
                    height: Utils.getDeviceHeight(context),
                    width: Utils.getDeviceWidth(context),
                    color: Colors.transparent,
                  ),
            /* child: listOfData != null
                  ? StreamBuilder(
                  stream: listOfData,
//                  listOfData != null ? listOfData : CommonView.showShimmer(),
                  builder: (context, snapShot) {
                    if (snapShot.data == null)
                      return CommonView.showShimmer();

                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
//                      border: Border.all(color: Colors.black, width: 2.0),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0))),
                      margin: EdgeInsets.only(top: 50),
                      padding: EdgeInsets.only(top: 20, bottom: 40),
                      child: ListView.separated(
                        shrinkWrap: true,

//                  padding: EdgeInsets.only(bottom: 10, top: 50),
                        physics: NeverScrollableScrollPhysics(),
                        controller: _scrollBottomBarController,
                        itemCount: snapShot.data.documents.length,
//                physics: BouncingScrollPhysics(),
                        //          CommonView.showShimmer(),
                        itemBuilder: (context, index) {
                          return cellTitle(index, snapShot);
                        },
                        separatorBuilder: (context, index) {
                          return adsShow(index);
                        },
                      ),
                    );
                  })
                  : CommonView.showShimmer(),*/
          ),
        ));
//    }
  }

  adsShow(int index) {
    /* if (index % 4 == 0) {
      return Container(
        height: 100,
//        height: 0,
        margin: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 0),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
//                    color: Colors.black45,
                  color: Colors.deepPurple.shade800,
                  blurRadius: 4,
                  spreadRadius: 0.0,
                  offset: Offset(-2.0, 2.0))
            ]),
        child: Column(
          children: <Widget>[
            Text('Ads'),
            SizedBox(
              height: 4,
            ),
            Utils.BannerAds()
          ],
        ),
      );
    } else*/
    if (index % 8 == 0) {
      return Container(
        // margin: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 0),
        // child: isAdsShow == 0 ? Utils.NativeBannerAds() : Container(),
      );
      /* return Container(
        height: 120,
//        height: 0,
        alignment: Alignment.center,
//        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
//                    color: Colors.black45,
                  color: Colors.deepPurple.shade800,
                  blurRadius: 4,
                  spreadRadius: 0.0,
                  offset: Offset(-2.0, 2.0))
            ]),
//        child: Utils.NativeBannerAds(),
//        child: Utils.NativeBannerAds(),

     */ /*   child: Container(
          height: 100,
//          child: _bannerAd..load()..show()
        ),*/ /*
      );*/
    } else {
      return Container();
    }
  }

  cellTitle(int index, AsyncSnapshot snapShot) {
    if (snapShot != null && snapShot.data.docs.length != 0) {
      return InkResponse (
        child: Container (
          height: Utils.getDeviceWidth(context) / 5,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(
              left: 15, right: 13, top: 25, bottom: index == 9 ? 18 : 0),
          decoration: BoxDecoration (
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow (
//                    color: Colors.black45,
                    color: Colors.deepPurple.shade800,
                    blurRadius: 4,
                    spreadRadius: 0.0,
                    offset: Offset(-2.0, 2.0))
              ]),
          child: Row(
            children: <Widget>[

              SizedBox (
                width: 150,
                height: 150,
                child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage, image: snapShot.data.docs[index].data()['image']),
              ),

//               Image(
//                   height: Utils.getDeviceHeight(context) / 6,
//                   width: Utils.getDeviceWidth(context) / 3.3,
// //                  image: NetworkImage(snapShot.data.documents[index].data['image']),
//                   image: CachedNetworkImageProvider(snapShot.data.docs[index].data()['image']),
// //                snapShot.data.documents[0].data['image']
// //                image: AssetImage(Utils.getAssetsImg("facebook")),
//                   fit: BoxFit.fitHeight),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Text(
                snapShot.data.docs[index].data()['title'],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ))
            ],
          ),
        ),
        onTap: () {
          setState(() {
//            uploadList = List();
            uploadRequest =
                UploadRequest.fromJson(snapShot.data.docs[index].data());
//            uploadList.add(uploadRequest);
          });
          if (viewHideShow == 0) {
            //navigation read data
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UploadNewsPage(
                          isUpdateValue: true,
                          title: snapShot.data.docs[index].data()['title'],
                          image: snapShot.data.docs[index].data()['image'],
                          description: snapShot
                              .data.docs[index].data()['description'],
                          longDescription: snapShot
                              .data.docs[index].data()['longDescription'],
                          date: snapShot.data.docs[index].data()['date'],
                          appBarTitle: widget.newsCategory,
                          documentId: snapShot.data.docs[index].documentID,
                        )));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsDetailsPage(
                          uploadRequest: uploadRequest,
                          appBarTitle: widget.newsCategory,
                        )));
          }
        },
        onLongPress: () {
          if (viewHideShow == 0) {
            Injector.databaseRef
                .collection(Const.hindiNews)
                .doc(widget.newsCategory)
                .collection("1")
                .doc(snapShot.data.docs[index].documentID)
                .delete();
          }
        },
      );
    } else {
      return Center(
        child: Text(
          'data is empty',
          style: TextStyle(color: Colors.black),
        ),
      );
    }
  }
}
