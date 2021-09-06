
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Injector {

  static SharedPreferences prefs;
  static FirebaseFirestore databaseRef;
  static FirebaseMessaging firebaseMessaging;
  static int badgeCount = 0;

  static  getInstance() async {

    prefs = await SharedPreferences.getInstance();
    databaseRef = FirebaseFirestore.instance;
    firebaseMessaging = FirebaseMessaging();

    print("Hello1");

  }
}