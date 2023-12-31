import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:itifinalproject/cubit/shopping_info_cubit.dart';
import 'package:itifinalproject/dio/dio_helper.dart';
import 'package:itifinalproject/screens/LogoScreen.dart';
import 'package:itifinalproject/screens/payment_page1.dart';

import 'package:itifinalproject/splash_screens/splash_screen1.dart';
import 'package:itifinalproject/splash_screens/splash_screen2.dart';
import 'login/login_screen.dart';
import 'login/shopping_info_screen.dart';
import 'login/sign_up_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login/sign_up_screen.dart';
import 'screens/navigationBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  Hive.initFlutter();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => ShoppingInfoCubit(),
      child: GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('en'),
        debugShowCheckedModeBanner: false,
        home:  LogoScreen(),
      ),
    );
  }
}

