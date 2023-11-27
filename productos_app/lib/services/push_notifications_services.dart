//5B:1B:F1:51:72:0C:93:07:8B:81:2F:F3:F7:18:1B:37:26:FD:C7:2C

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{

  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStreamController = new StreamController.broadcast();
  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future initializeApp() async {

    //Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    //Handlers
    FirebaseMessaging.onBackgroundMessage( _backgroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler );
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp );

    //Local Notifications
    

  }

  static Future _backgroundHandler( RemoteMessage message) async {

    _messageStreamController.add( message.notification?.title ?? 'No title' );

  }

  static Future _onMessageHandler( RemoteMessage message) async {

    _messageStreamController.add( message.notification?.title ?? 'No title' );

  }

  static Future _onMessageOpenApp( RemoteMessage message) async {

    _messageStreamController.add( message.notification?.title ?? 'No title' );

  }

  static CloseStreams(){
    _messageStreamController.close();
  }

}