import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itifinalproject/login/login_screen.dart';
import 'package:itifinalproject/login/sign_up_screen.dart';
class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
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
            Container(
              height: 616,
                child: Image.asset("assets/images/map.jpg")),
            SizedBox(height: 20,),
            Text("Free delivry offers",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25,
            ),),
            SizedBox(height: 10,),
            Text("Get all your loved foods in one once place, \n "
                "  you just place the order we do the rest",style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepOrange.withOpacity(.5),
                  radius: 5,
                ),
                SizedBox(width: 15,),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange.withOpacity(.5),
                  radius: 5,
                ),
                SizedBox(width: 15,),
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  radius: 5,
                ),
              ],
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
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
