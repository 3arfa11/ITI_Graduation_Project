import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:itifinalproject/home_screen.dart';
import 'package:itifinalproject/login/sign_up_screen.dart';
import 'package:url_launcher/url_launcher.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  launchURL(String url) async{
    if(await canLaunch(url)){
      await launch(url);
    }
    else{throw "could not launch $url";}
  }
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool obsecureText = true;
  bool isCorrect = true;
  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  void _togglePasswordtext() {
    obsecureText = !obsecureText;
    setState(() {});
  }

   bool  isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset("assets/images/logo2.png"),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35),
                          topLeft: Radius.circular(35))),
                  width: double.infinity,
                  height: 600,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 330,
                        height: 60,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (_emailController.text.length == 0) {
                              return "Empty Fields,Enter your Email";
                            }
                            else if (_emailController.text != SignUpScreenState.box1.get("email")){
                              return"Wrong email address";
                            }
                            else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w ]{2,4}').hasMatch(value!))
                            {
                              return "email form is not validated";
                            }
                            else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(13)),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: "example@gmail.com",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          children: [
                            Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 330,
                        height: 60,
                        child: TextFormField(
                          obscureText: obsecureText ,
                          controller: _passwordController,
                          validator: (value){

                            if(_passwordController.text.length==0){
                              return "Empty Fields,Enter your Email";
                            }
                            else if(_passwordController.text.length <= 6){
                              return "Pasword length should be more than 6 digits";
                            }
                            else if(_passwordController.text!=SignUpScreenState.box1.get("password")){
                              return"Incorrect password";

                            }
                            else{return null;}
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: _togglePasswordtext,
                              child: Icon(
                                obsecureText
                                    ?CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash_fill,color: Colors.black.withOpacity(.4),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(13)),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: "* * * * * * * * * * ",

                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Checkbox(
                              value: isChecked,
                              side: BorderSide(color: Colors.grey),
                              activeColor: Colors.deepOrange,
                              onChanged: (newBool) {
                                setState(() {
                                  isChecked = newBool!;
                                });
                              },
                            ),
                          ),
                          Text(
                            "Remember me ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 105),
                            child: Text(
                              "Frogot Password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: (){
                          if(_form.currentState!.validate()){
                            if(_emailController.text==SignUpScreenState.box1.get("email") && _passwordController.text==SignUpScreenState.box1.get("password")){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ),
                              );
                            }

                          }
                        },

                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(17)),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26,
                              ),
                            ),
                          ),
                          width: 330,
                          height: 60,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Or",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap:(){
                              const url = "https://www.facebook.com";
                              launch(url);

                            },
                            child: CircleAvatar(
                              backgroundImage:
                              AssetImage("assets/images/facebook.png"),
                              radius: 18,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap:(){
                              const url = "https://accounts.google.com";
                              launch(url);

                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage("assets/images/googleicon.png"),
                              radius: 18,
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap:(){
                              const url = "https://github.com/login";
                              launch(url);

                            },
                            child: CircleAvatar(
                              backgroundImage:
                              AssetImage("assets/images/g1.png"),
                              radius: 18,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const SignUpScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void login(){
    if(isChecked){
      SignUpScreenState.box1.put("rememberEmail",_emailController.text);
      SignUpScreenState.box1.put("rememberPassword",_emailController.text);
    }
  }
}
