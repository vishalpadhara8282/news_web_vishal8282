import 'package:news_of_daily/helper/res.dart';
import 'package:news_of_daily/helper/utils.dart';
import 'package:news_of_daily/screen/upload_photo.dart';
import 'package:flutter/material.dart';

import 'memes_upload.dart';

class SelectLanguage extends StatefulWidget {
  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Language'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            showButton(StringResHindi.english, 1),
            SizedBox(height: 10),
            showButton(StringResHindi.gujarati, 2),
            SizedBox(height: 10),
            showButton(StringResHindi.hindi, 3),
            SizedBox(height: 10),
            showButton(StringResHindi.memes, 4)
          ],
        ),
      ),
    );
  }


  showButton(String memes, int i,) {
    return  MaterialButton(
      height: 50,
      minWidth: Utils.getDeviceWidth(context)/1.2,
      color: Colors.deepPurple,
      child: Text(memes, style: TextStyle(color: Colors.white, fontSize: 18),),
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.grey)
      ),
      onPressed: () {

        if(i == 1) {

        } else if(i == 2) {

        } else if(i == 3) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      UploadNewsPage(getLanguage: StringResHindi.hindi, isUpdateValue: false,)));

        } else if(i == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MemesPage()));
        }
      },
    );
  }

}
