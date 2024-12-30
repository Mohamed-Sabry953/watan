
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class Firebase_Messeging{
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void>initnotification()async {
    await messaging.requestPermission();
    String? token=await messaging.getToken();
    print("Token : $token");
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    messaging.subscribeToTopic("all");


  }
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    print("+++++++++++${message.data}====================");


  }



}