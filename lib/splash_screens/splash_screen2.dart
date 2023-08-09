import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itifinalproject/login/login_screen.dart';
import 'package:itifinalproject/splash_screens/splash_screen3.dart';
class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0,),
            Image.asset("assets/images/onboarding2.png"),
            SizedBox(height: 45,),
            Text("Deliver your order fast ",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 27,
            ),),
            SizedBox(height: 30,),
            Text("Fast delivery of your order and available\n                      cash on delivry",style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepOrange.withOpacity(.5),
                  radius: 5,
                ),
                SizedBox(width: 15,),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
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
                    builder: (context) => const SplashScreen3(),
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
