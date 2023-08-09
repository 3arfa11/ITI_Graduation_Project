import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:itifinalproject/popular_now.dart';
import 'package:itifinalproject/profile_page.dart';
import 'home_screen.dart';
import 'login/login_screen.dart';
import 'login/sign_up_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login/sign_up_screen.dart';

void main() async{
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

