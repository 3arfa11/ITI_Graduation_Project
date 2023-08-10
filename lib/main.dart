import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:itifinalproject/LogoScreen.dart';
import 'package:itifinalproject/cubit/shopping_info_cubit.dart';
import 'package:itifinalproject/payment_page1.dart';
import 'package:itifinalproject/payment_page2.dart';
import 'package:itifinalproject/popular_now.dart';
import 'package:itifinalproject/profile_page.dart';
import 'package:itifinalproject/splash_screens/splash_screen1.dart';
import 'package:itifinalproject/splash_screens/splash_screen2.dart';
import 'cart.dart';
import 'category.dart';
import 'home_screen.dart';
import 'login/login_screen.dart';
import 'login/shopping_info_screen.dart';
import 'login/sign_up_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login/sign_up_screen.dart';
import 'navigationBar.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShoppingInfoCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LogoScreen(),
      ),
    );
  }
}

