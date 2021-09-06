import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_of_daily/helper/utils.dart';
import 'package:transparent_image/transparent_image.dart';

import 'crud.dart';
import 'news_list.dart';

class MemesShoePage extends StatefulWidget {
  @override
  _MemesShoePageState createState() => _MemesShoePageState();
}

class _MemesShoePageState extends State<MemesShoePage> {

  CrudObj crudObj = CrudObj();
  Stream memesData;




  getData() async {
    crudObj.memesData().then((result) {
      if(result != null) {
        setState(() {
          memesData = result;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: isAdsShow == 0 ? Utils.BannerAds() : Container(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 5,
              width: 100,
              margin: EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: memesData,
              builder: (context, snapShot) {
                if(snapShot.data == null) return Center(child: CircularProgressIndicator());

                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
//                      border: Border.all(color: Colors.black, width: 2.0),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0))),
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.only(top: 50, bottom: 40),
                  child: GridView.builder (
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapShot.data.docs.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                    return InkResponse (
                      child: Container (
                        width: 150,
                        height: 150,
                        // child: Icon(Icons.compare, color: Colors.black),
                        /*child: FadeInImage.memoryNetwork (
                            placeholder: kTransparentImage, image: snapShot.data.docs[index].data()["images"]
                        ),*/
                        // child: Image(
                        //   image: CachedNetworkImageProvider(snapShot.data.docs[index].data()['image']),
                        // ),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                            // new MaterialPageRoute(
                            //     builder: (context) =>
                            //     new FullScreenImagePage(snapShot.data.docs[index].data()['image'])));
                      },
                    );
                  }),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}


class FullScreenImagePage extends StatelessWidget {
  String imgPath;
  FullScreenImagePage(this.imgPath);

  final LinearGradient backgroundGradient = new LinearGradient(
      colors: [new Color(0x10000000), new Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: isAdsShow == 0 ? Utils.BannerAds() : Container(),
      body: new SizedBox.expand(
        child: new Container(
          child: GestureDetector(
//            behavior: HitTestBehavior.translucent,
            onVerticalDragEnd: (DragEndDetails details) {
              Navigator.of(context).pop();
            },
            child: new Stack(
              children: <Widget>[
                new Align(
                  alignment: Alignment.center,
                  child: Image(image: CachedNetworkImageProvider(imgPath)),
                ),
                new Align(
                  alignment: Alignment.topCenter,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new AppBar(
                        elevation: 0.0,
                        backgroundColor: Colors.transparent,
                        leading: new IconButton(
                          icon: new Icon(
                            Icons.close,
                            size: 30,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}