import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:itifinalproject/home_screen.dart';
import 'package:itifinalproject/login/login_screen.dart';
import 'package:itifinalproject/profile_page.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  static final email = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _retypepasswordController = TextEditingController();
  bool obsecureText = true;
  bool isCorrect = true;
  final _form = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
   static late Box box1;
  void _togglePasswordtext() {
    obsecureText = !obsecureText;
    setState(() {});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBox("boxName");
  }
  void createBox(String boxName) async {
    box1 = await Hive.openBox(boxName);
    getData();
  }
  void getData()async{
    if(box1.get("name")!=null){
          _nameController.text = box1.get("name");
          setState(() {

          });
    }
    if(box1.get("email")!=null){
      _emailController.text = box1.get("email");
      setState(() {

      });
    }
    if(box1.get("password")!=null){
      _passwordController.text = box1.get("password");
      setState(() {

      });
    }
    if(box1.get("re_password")!=null){
      _retypepasswordController.text = box1.get("re_password");
      setState(() {

      });
    }


  }
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
                  height: 710,
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
                              "Name",
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
                          controller: _nameController,
                          validator: (value) {
                            if (_nameController.text.length == 0) {
                              return "Empty Fields,Enter yourName";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(13)),
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            hintText: "Mohamed Sami",
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
                            } else {
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
                          obscureText: obsecureText,
                          controller: _passwordController,
                          validator: (value) {
                            if (_passwordController.text.length == 0) {
                              return "Empty Fields,Enter your Email";
                            } else if (_passwordController.text.length <= 6) {
                              return "Pasword length should be more than 6 digits";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: _togglePasswordtext,
                              child: Icon(
                                obsecureText
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash_fill,
                                color: Colors.black.withOpacity(.4),
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
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 33),
                        child: Row(
                          children: [
                            Text(
                              "Re-Type Password",
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
                          obscureText: obsecureText,
                          controller: _retypepasswordController,
                          validator: (value) {
                            if (_retypepasswordController.text.length == 0) {
                              return "Empty Fields,Enter your Email";
                            } else if (_retypepasswordController.text !=
                                _passwordController.text) {
                              return "Doesn't match with your password";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: _togglePasswordtext,
                              child: Icon(
                                obsecureText
                                    ? CupertinoIcons.eye_fill
                                    : CupertinoIcons.eye_slash_fill,
                                color: Colors.black.withOpacity(.4),
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
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          if (_form.currentState!.validate()) {
                            box1.put("name",_nameController.text);
                            box1.put("email", _emailController.text);
                            box1.put("password", _passwordController.text);
                            box1.put("re_password", _retypepasswordController);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.circular(17)),
                          child: Center(
                            child: Text(
                              "SIGN UP",
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
                          Text(
                            "Have an account?",
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "LOGIN",
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
}
