import 'dart:io';
import 'package:news_of_daily/helper/constant.dart';
import 'package:news_of_daily/helper/res.dart';
import 'package:news_of_daily/helper/utils.dart';
import 'package:news_of_daily/inject/injector.dart';
import 'package:news_of_daily/model/memes.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class MemesPage extends StatefulWidget {
  @override
  _MemesPageState createState() => _MemesPageState();
}

class _MemesPageState extends State<MemesPage> {
  File sampleImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringResHindi.memesUpload),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[selectImage(), submitButton()],
        ),
      ),
    );
  }

  selectImage() {
    return InkResponse(
      child: Container(
        height: 300,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        margin: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.deepPurple,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: sampleImage == null
            ? Text("Select an Image")
            : Image.file(sampleImage,
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width),
      ),
      onTap: () {
        getImage();
//        loadAssets();
      },
    );
  }

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = File(tempImage.path);
    });
  }

  submitButton() {
    return InkResponse(
      child: Container(
        height: 50,
        width: Utils.getDeviceWidth(context),
        padding: EdgeInsets.only(top: 5, bottom: 5),
        margin: EdgeInsets.only(left: 5, right: 5),
        color: Colors.deepPurple,
        child: Center(
          child: Text(StringResHindi.postMemes,
              style: TextStyle(color: Colors.white, fontSize: 18),),
        ),
      ),
      onTap: () {
        uploadFile();
//          multipleImageUpload();
      },
    );
  }

  Future uploadFile() async {
    String fileName = sampleImage.path.split('/').last;
    firebase_storage.StorageReference storageReference = firebase_storage.FirebaseStorage.instance.ref().child('memes/$fileName');
    firebase_storage.StorageUploadTask uploadTask = storageReference.putFile(sampleImage);
    // await uploadTask.onComplete;
    Future.value(uploadTask);
    print('File Uploaded');
//    saveToDataBase(url);

    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        saveToDataBase(fileURL);
      });
    }).catchError((e) {
      print(e);
    });
  }

  saveToDataBase(url) {
    var dbTimekey = DateTime.now();
//    var formatDate = DateFormat('MMM d, yyyy');
//    String date = formatDate.format(dbTimekey);
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    var formatDate = DateFormat('yyyy-MM-dd');
    String date = formatDate.format(dbTimekey);

    String time = formatTime.format(dbTimekey);

    UploadMemes rq = UploadMemes();
    rq.image = url;
    rq.date = date;
    rq.time = time;

    Injector.databaseRef
        .collection(Const.memes)
        .doc()
        .set(rq.toJson())
        .then((result) {
      print('news is uploaded');
      setState(() {
        Utils.showToast('News post successfully');
        Navigator.pop(context);
      });
    }).catchError((e) {
      print(e);
    });
  }
}
