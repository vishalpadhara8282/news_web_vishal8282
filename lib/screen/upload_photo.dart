import 'dart:io';
import 'package:news_of_daily/helper/constant.dart';
import 'package:news_of_daily/helper/res.dart';
import 'package:news_of_daily/helper/utils.dart';
import 'package:news_of_daily/inject/injector.dart';
import 'package:news_of_daily/model/upload_news.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UploadNewsPage extends StatefulWidget {
  final String getLanguage;

  final bool isUpdateValue;
  final String title;
  final String image;
  final String description;
  final String date;
  final String appBarTitle;
  final String longDescription;
  final String documentId;

  const UploadNewsPage({Key key,
    this.getLanguage,
    this.isUpdateValue,
    this.title,
    this.image,
    this.description,
    this.longDescription,
    this.date,
    this.appBarTitle,
    this.documentId})
      : super(key: key);

  @override
  _UploadNewsPageState createState() => _UploadNewsPageState();
}

class _UploadNewsPageState extends State<UploadNewsPage> {
  TextEditingController titleTxtF = new TextEditingController();
  TextEditingController descriptionTxtF = new TextEditingController();
  TextEditingController longDescriptionTxtF = new TextEditingController();

  File sampleImage;
  final formKey = GlobalKey<FormState>();
  String category;
  String url;
  String title;
  String description;
  String longDescription;
  int _groupValue = 0;

  List downloadUrlList = List();

  // List<Asset> images = List<Asset>();
  List<String> imageUrls = <String>[];

  String _error = 'multiple image upload No Error Dectected';
  List<String> sliderImagesList = List<String>();

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      sampleImage = File(tempImage.path);
    });
  }

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();

    if (widget.isUpdateValue == true) {
      titleTxtF.text = widget.title.toString();
      descriptionTxtF.text = widget.description.toString();
      longDescriptionTxtF.text = widget.longDescription.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUpdateValue ? "Update News Post" : "News Post"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            dropDownList(),
            selectTopNews(),
            selectImage(),
            titleTextField(),
            descriptionTextFiled(1),
            descriptionTextFiled(2),
//            longDescriptionTextFiled(),
            submitButton()
          ],
        ),
      ),
    );
  }

  User selectedUser;
  List<User> users = <User>[
    User(1, StringResHindi.homepage),
    User(2, StringResHindi.topNews),
    User(3, StringResHindi.corona),
    User(9, StringResHindi.manoranjan),
    User(10, StringResHindi.review),
    User(4, StringResHindi.bharat),
    User(5, StringResHindi.vigyan),
    User(6, StringResHindi.khel),
    User(7, StringResHindi.hasyajanak),
    User(8, StringResHindi.lifeStyle),
  ];

  dropDownList() {
    return Container(
      height: 50,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: DropdownButton<User>(
        value: selectedUser,
        underline: Container(),
        onChanged: (User newValue) {
          setState(() {
            selectedUser = newValue;
            category = newValue.name;
            print(category);
          });
        },
        items: users.map((User user) {
          return new DropdownMenuItem<User>(
            value: user,
            child: new Text(
              user.name,
              style: new TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
      ),
    );
  }

  selectTopNews() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: RadioListTile(
                  value: 0,
                  groupValue: _groupValue,
                  title: Text(StringResHindi.yesTopNews,
                      style: TextStyle(color: Colors.black)),
                  onChanged: (newValue) =>
                      setState(() => _groupValue = newValue),
                  activeColor: Colors.deepPurple,
                  selected: false,
                ),
              ),
              Expanded(
                flex: 1,
                child: RadioListTile(
                  value: 1,
                  groupValue: _groupValue,
                  title: Text(StringResHindi.noTopNews,
                      style: TextStyle(color: Colors.black)),
                  onChanged: (newValue) =>
                      setState(() => _groupValue = newValue),
                  activeColor: Colors.deepPurple,
                  selected: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  titleTextField() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.deepPurple),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: EdgeInsets.only(left: 5, right: 5),
      margin: EdgeInsets.only(top: 10, bottom: 5),
      child: TextField(
        maxLines: 50,
        cursorColor: Colors.black,
        controller: titleTxtF,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: StringResHindi.enterTitle),
        onChanged: (value) {
          title = value;
        },
      ),
    );
  }

  descriptionTextFiled(int i) {
    return Container(
      height: i == 1 ? 200 : 350,
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.deepPurple),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: EdgeInsets.only(left: 5, right: 5),
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: TextField(
        maxLines: 5000,
        cursorColor: Colors.black,
        controller: i == 1 ? descriptionTxtF : longDescriptionTxtF,
        decoration: InputDecoration(
            border: InputBorder.none,
//            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            hintText: StringResHindi.enterDescription),
        onChanged: (value) {
          if (i == 1) {
            description = value;
          } else {
            longDescription = value;
            print(longDescription);
          }
        },
      ),
    );
  }

//  longDescriptionTextFiled() {
//    return Container(
//      height: 200,
//      decoration: BoxDecoration(
//          border: Border.all(width: 2.0, color: Colors.deepPurple),
//          borderRadius: BorderRadius.all(Radius.circular(10.0))),
//      padding: EdgeInsets.only(left: 5, right: 5),
//      margin: EdgeInsets.only(top: 5, bottom: 5),
//      child: TextField(
//        maxLines: 5000,
//        cursorColor: Colors.black,
//        controller: descriptionTxtF,
//        decoration: InputDecoration(
//            border: InputBorder.none,
////            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
//            hintText: StringResHindi.enterDescription),
//        onChanged: (value) {
//          longDescription = value;
//          print(longDescription);
//        },
//      ),
//    );
//  }

  selectImage() {
    return InkResponse(
      child: Container(
        height: 150,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        margin: EdgeInsets.only(top: 10, bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.deepPurple, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child:/* images.length == 0
            ? Text("Select an Image")
            :*/ Image.asset(Utils.getAssetsImg('logo'),
            height: MediaQuery
                .of(context)
                .size
                .height / 2.5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width
    ),
      ),
      onTap: () {
        // multipleImageSelect();
//        loadAssets();
      },
    );
  }


 /* Future<void> multipleImageSelect() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: false,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Upload Image",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
      print(resultList.length);
      print((await resultList[0].getThumbByteData(122, 100)));
      print((await resultList[0].getByteData()));
      print((await resultList[0].metadata));

    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;
    setState(() {
      images = resultList;
//      imageShow = images[0].toString();
      _error = error;
    });
  }*/

  submitButton() {
    return MaterialButton(
        height: 50,
        minWidth: Utils.getDeviceWidth(context),
        padding: EdgeInsets.only(top: 5, bottom: 5),
        color: Colors.deepPurple,
        child: Text(
            widget.isUpdateValue == true
                ? StringResHindi.postUpdate
                : StringResHindi.postNews,
            style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () {
//          uploadFile();
//           uploadImages();
        });
  }


  Future uploadFile() async {
    String fileName = sampleImage.path
        .split('/')
        .last;

    StorageReference storageReference =
    FirebaseStorage.instance.ref().child('image/$fileName');
    StorageUploadTask uploadTask = storageReference.putFile(sampleImage);
    // await uploadTask.onComplete;
    Future.value(uploadTask);

    // Reference storageReference =
    // FirebaseStorage.instance.ref().child('image/$fileName');
    // UploadTask uploadTask = storageReference.putFile(sampleImage);
    // // await uploadTask.onComplete;
    // Future.value(uploadTask);
    print('File Uploaded');
//    saveToDataBase(url);

    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
//        saveToDataBase(fileURL);
      });
    }).catchError((e) {
      print(e);
    });
  }

/*  void uploadImages() {
    for (var imageFile in images) {
      postImageSubCate(imageFile).then((downloadUrl) {
//          saveToDataBase(downloadUrl.toString());
        sliderImagesList.add(downloadUrl);
        if (sliderImagesList.length == images.length) {
          saveToDataBase();
        }
      }).catchError((err) {
        print(err);
      });
    }
  }*/

/*  Future<dynamic> postImageSubCate(Asset imageFile) async {
    String fileName = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
    Reference reference = FirebaseStorage.instance.ref().child('${selectedUser.name}/$fileName');
    UploadTask uploadTask = reference.putData(
        (await imageFile.getByteData()).buffer.asUint8List());
    TaskSnapshot storageTaskSnapshot = await Future.value(uploadTask);
    // StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    print(storageTaskSnapshot.ref.getDownloadURL());
    return storageTaskSnapshot.ref.getDownloadURL();
  }*/

  saveToDataBase() {
    var dbTimekey = DateTime.now();
    var formatDate = DateFormat('yyyy-MM-dd');
    String date = formatDate.format(dbTimekey);

//    var formatDate1 = DateFormat('MMM d, yyyy');
    var formatDate1 = DateFormat('MMMM dd, yyyy');
    String dateShow = formatDate1.format(dbTimekey);

    var formatTime = DateFormat('EEEE, hh:mm aaa');
    String time = formatTime.format(dbTimekey);

//    DatabaseReference ref = FirebaseDatabase.instance.reference();
//    ref.child("Posts").push().set(date);

    /*var data = {
      "image": url,
      "description": _myValue,
      "date": date,
      "time": time,
    };*/

    UploadRequest rq = UploadRequest();
    rq.category = category;
    rq.image = sliderImagesList[0];
    rq.groupValue = _groupValue;
    rq.title = title;
    rq.description = description;
    rq.longDescription = longDescription;
    rq.date = date;
    rq.dateShow = dateShow;
    rq.time = time;
    rq.imageList = sliderImagesList;

    if (widget.isUpdateValue == true) {
      Injector.databaseRef
          .collection(Const.hindiNews)
          .doc(widget.appBarTitle)
          .collection("1")
          .doc(widget.documentId)
          .update(rq.toJson())
          .then((result) {
        setState(() {
          titleTxtF.clear();
          descriptionTxtF.clear();
          Utils.showToast('News post successfully');
          Navigator.pop(context);
        });
      }).catchError((e) {
        print(e);
      });
    } else {
      Injector.databaseRef
          .collection(Const.hindiNews)
          .doc(category)
          .collection(_groupValue.toString())
          .add(rq.toJson())
          .then((result) {
        print('news is uploaded');
        setState(() {
          titleTxtF.clear();
          descriptionTxtF.clear();
          Utils.showToast('News post successfully');
          Navigator.pop(context);
        });
      }).catchError((e) {
        print(e);
      });
    }
  }

/*bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
  }*/

/*Widget enableUpload() {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            Image.file(sampleImage,
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width),
            SizedBox(
              height: 15.0,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              validator: (value) {
                return value.isEmpty ? 'Description required' : null;
              },
              onSaved: (value) {
                return description = value;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            RaisedButton(
                elevation: 10.0,
                child: Text("Add a new Post"),
                textColor: Colors.black,
                color: Colors.amberAccent,
                onPressed: () {
//                  uploadStatusImage();
                  uploadFile();
                })
          ],
        ),
      ),
    );
  }*/

}

class User {
  const User(this.id, this.name);

  final String name;
  final int id;
}



/* InkResponse(
          child: Container(
            height: 150,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: sampleImage == null
                ? Text("Select an Image")
                : Image.file(sampleImage,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2.5,
                *//*width: MediaQuery
                    .of(context)
                    .size
                    .width*//*),
          ),
          onTap: () {
            getImage();

//        loadAssets();
          },
        ),*/