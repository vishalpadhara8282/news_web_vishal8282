import 'package:flutter/material.dart';
import 'package:news_of_daily/helper/constant.dart';
import 'package:news_of_daily/helper/res.dart';
import 'package:news_of_daily/inject/injector.dart';

class CrudObj {
  getData(String newsCategory) async {
    return await Injector.databaseRef
        .collection(Const.hindiNews)
        .doc(newsCategory).collection('1').orderBy('date',descending: true).snapshots();
          // .collection('1').orderBy('date', descending: true)
          // .snapshots();
    }

  memesData() async {
    return await Injector.databaseRef.collection(Const.memes).orderBy('date', descending: true).snapshots();
  }


}
