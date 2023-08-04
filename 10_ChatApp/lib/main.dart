import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlutterChat',
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.indigo,
          onPrimary: Colors.white,
          secondary: Colors.yellow,
          onSecondary: Colors.grey,
          error: Colors.red,
          onError: Colors.grey,
          background: Colors.lime,
          onBackground: Colors.grey,
          surface: Colors.green,
          onSurface: Colors.grey,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.pink,
          textTheme: ButtonTextTheme.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        iconTheme: const IconThemeData(
          color: Colors.deepOrange,
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}
