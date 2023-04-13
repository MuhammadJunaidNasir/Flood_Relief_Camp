import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices{

  FirebaseMessaging messaging= FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterlocalnotificationsplugin= FlutterLocalNotificationsPlugin();

  void requestNotificationPermission()async{
       NotificationSettings settings= await messaging.requestPermission(
         alert: true,
         badge: true,
         announcement: true,
         carPlay: true,
         sound: true,
         criticalAlert: true,
         provisional: true,
       );

       if(settings.authorizationStatus==AuthorizationStatus.authorized){
         print('User granted permission');
       }
       else if(settings.authorizationStatus==AuthorizationStatus.denied){
         print('User denied permission');
       }

  }

  void initLocalNotifications(BuildContext context, RemoteMessage message)async{
    var androidinitializationSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSetting= InitializationSettings(
      android: androidinitializationSettings,
    );

    await _flutterlocalnotificationsplugin.initialize(
      initializationSetting,
      onDidReceiveNotificationResponse: (payload){

      }

    );




  }

  void FirebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {

    });
  }

  Future<String> getDeviceToken()async{
    String? token= await messaging.getToken();
    return token!;
  }

  isTokenRefresh(){
    messaging.onTokenRefresh.listen((event) {
      event.toString();
    });
  }




}