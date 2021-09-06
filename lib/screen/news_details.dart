import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:news_of_daily/helper/utils.dart';
import 'package:news_of_daily/model/upload_news.dart';

import 'news_list.dart';

class NewsDetailsPage extends StatefulWidget {
  final UploadRequest uploadRequest;
  final String appBarTitle;

  const NewsDetailsPage({Key key, this.appBarTitle, this.uploadRequest})
      : super(key: key);

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  FacebookNativeAd nativeAds;

  UploadRequest fullNewsdata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nativeAds = Utils.showNativeAd();

    setState(() {
      fullNewsdata = widget.uploadRequest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.appBarTitle),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              margin: EdgeInsets.only(top: 2),
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  titleText(),
                  SizedBox(
                    height: 10,
                  ),
                  fullNewsdata.imageList.length == 0 ||
                          fullNewsdata.imageList.length == 1
                      ? imageShow()
                      : sliderImage(),
                  SizedBox(
                    height: 10,
                  ),
//                  dateShow(),
                  description(),
//                  isAdsShow == 0 ? nativeAds : Container(),
//                     isAdsShow == 0 ? Utils.BannerAds() : Container(),

        /*Container(
                    height: _videoComplete == false ? 320 : 0,
                    child: ,
//                    child: Utils.rectangleBannerAd(),
                  ),*/
                  longDescription(),
                  // isAdsShow == 0 ? nativeAds : Container(),
                  /*FacebookInStreamVideoAd(
                    placementId: "984738798528322_985106048491597",
                    height: 300,
//               listener: (result, value) {
//                 if (result == InStreamVideoAdResult.VIDEO_COMPLETE) {
//                   setState(() {
//                     _videoComplete = true;
//                   });
//                 }
//               },
                  )*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  sliderImage() {
    return Container(
      height: 250,
      padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 13),
      child: fullNewsdata.imageList.isNotEmpty
          ? Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image(
                    image: CachedNetworkImageProvider(
                        fullNewsdata.imageList[index]),
                    fit: BoxFit.cover);
              },
              onIndexChanged: (i) {},
              onTap: (index) {
                showDialog(
                  context: context,
                  builder: (_) =>
                      FunkyOverlay(image: fullNewsdata.imageList[index]),
                );
              },
              autoplay: false,
              itemCount: fullNewsdata.imageList.length,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
              loop: false,
            )
          : Center(
              child: Image(
                  height: Utils.getDeviceHeight(context) / 2.3,
                  image: AssetImage(Utils.getAssetsImg("1024_logo")),
                  fit: BoxFit.fill),
            ),
    );
  }

  titleText() {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 8, right: 8),
      margin: EdgeInsets.all(10),
      child: fullNewsdata.title != null
          ? Text(
              fullNewsdata.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            )
          : Text(''),
    );
  }

  imageShow() {
    return InkResponse(
      child: Container(
        width: Utils.getDeviceWidth(context),
        alignment: Alignment.center,
        child: Image(
          image: CachedNetworkImageProvider(fullNewsdata.image),
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => FunkyOverlay(image: fullNewsdata.image),
        );
      },
    );
  }

  dateShow() {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 10, bottom: 8, right: 5),
      child: Text(
        fullNewsdata.date,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  description() {
    return Container(
      margin: EdgeInsets.all(10),
      child: fullNewsdata.description != null
          ? Text(fullNewsdata.description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500))
          : Text(''),
    );
  }

  longDescription() {
    return Container(
      margin: EdgeInsets.all(10),
      child: fullNewsdata.longDescription != null
          ? Text(fullNewsdata.longDescription,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500))
          : Text(''),
    );
  }
}

class FunkyOverlay extends StatefulWidget {
  final String image;

  const FunkyOverlay({Key key, this.image}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: GestureDetector(
            child: Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  image: DecorationImage(image: NetworkImage(widget.image))),
//            child: Image.network(widget.image,fit: BoxFit.fill),
            ),
            onVerticalDragDown: (details) {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
