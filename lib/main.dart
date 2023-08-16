import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'features/auth/cubit/auth_cubit.dart';
import 'features/auth/screens/login_screen.dart';
import 'features/reset_password/cubit/reset_password_cubit.dart';
import 'features/user_profile/cubit/upload_user_image_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
  print('Message data: ${message.data}');
  print('Message notification: ${message.notification?.title}');
  print('Message notification: ${message.notification?.body}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Initialize the Firebase app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize local notifications plugin
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Request permission for foreground notifications
  final NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

  // Configure and show foreground notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Handling a foreground message: ${message.messageId}");
    print('Message data: ${message.data}');
    print('Message notification: ${message.notification?.title}');
    print('Message notification: ${message.notification?.body}');

    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      'channel_id',
      'Channel Name'
          'Channel Description',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
    );
    final NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      notificationDetails,
    );
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<ResetPasswordCubit>(
          create: (context) => ResetPasswordCubit(),
        ),
        BlocProvider<UploadUserImageCubit>(
          create: (context) => UploadUserImageCubit(),
        )
      ],
      child: const MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}
