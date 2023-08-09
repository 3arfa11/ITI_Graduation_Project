import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:itifinalproject/splash_screens/splash_screen2.dart';

import '../login/login_screen.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}
class _SplashScreen1State extends State<SplashScreen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0,),
            Image.asset("assets/images/onboadring1.jpg"),
            SizedBox(height: 30,),
            Text("Choose Your Favourite Meal",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),),
            SizedBox(height: 20,),
            Text("Choose your favourite meal and explore\n                      our daily offers",style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 5,
                ),
                SizedBox(width: 15,),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange.withOpacity(.5),
                  radius: 5,
                ),
                SizedBox(width: 15,),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange.withOpacity(.5),
                  radius: 5,
                ),
              ],
            ),
            SizedBox(height: 80,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen2(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(17)
                ),
                child: Center(
                  child: Text("Next",style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                  ),),
                ),
                width: 330,
                height: 60,
              ),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text("Skip",style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
