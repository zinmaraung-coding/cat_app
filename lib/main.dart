import 'package:cat_app_project/auth/auth.dart';
import 'package:cat_app_project/auth/login_or_register.dart';
import 'package:cat_app_project/pages/home_page.dart';
import 'package:cat_app_project/pages/login_page.dart';
import 'package:cat_app_project/pages/profile_page.dart';
import 'package:cat_app_project/pages/register_page.dart';
import 'package:cat_app_project/pages/users_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:firebase_cloud_firestore/firebase_cloud_firestore.dart";

void main () async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDjdT9NwZ_oKwU_Q-6SbBcw2f7kmISiXLA",
        appId: "1:210215884532:android:a5022029e155186ed030a1",
        messagingSenderId: "210215884532",
        projectId: "cat-application-cd15a")
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        "/login_register_page" : (context) => const LoginOrRegister(),
        "/home_page" : (context) => const HomePage(),
        "/profile_page" : (context) => const ProfilePage(),
        "/users_page" : (context) => const UsersPage()
      },
    );
  }
}
