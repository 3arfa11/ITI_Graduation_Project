import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itifinalproject/profile_page.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
        ),
       backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Resto",
          style: TextStyle(
            color: Color(0xFFE54A00),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        leading: Icon(Icons.menu_sharp,
          color: Color(0xFF262626),
        ),
        actions: [
          InkWell(
            onTap: (){
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
              child: Icon(
                Icons.person,
                color: Color(0xFF262626),
                size: 30,
              ),

          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
                child: Container(
                    width: 365,
                    height: 53,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black.withOpacity(.5),
                        ),
                        label: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                        fillColor: Colors.grey.shade300,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                      ),
                    ))),
            SizedBox(

              height: 20,
            ),
            Container(
              width: 365,
              height: 145,
              decoration: BoxDecoration(
                color: Color(0xFFE54A00),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 19, left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Buy 2 Get 1 Free",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "275 L.E",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: 110,
                            height: 38,
                            child: Center(
                                child: Text(
                                  "Order now",
                                  style: TextStyle(
                                    color: Color(0xFFE54A00),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                )),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 222,
                    child: Image.asset("assets/images/threeburgeres2.png"),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: 68,
                            width: 80,
                            child: Image.asset("assets/images/bur1.png")),
                        Text("Burger",style: TextStyle(
                          fontWeight:FontWeight.bold,
                          fontSize: 17
                        ),)
                      ],
                    ),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            width: 70,
                            height: 60,
                            child: Image.asset("assets/images/pizza2.png")),
                          SizedBox(height: 7,),
                        Text("Pizza",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),)
                      ],
                    ),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: 66,
                            child: Image.asset("assets/images/crepe.png")),
                        Text("Creap",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),)
                      ],
                    ),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                            height: 66,
                            width: 55,
                            child: Image.asset("assets/images/meal.png")),
                        Text("Meals",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),)
                      ],
                    ),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                    ),
                  ),

                ],

              ),
            ),
            SizedBox(height: 25,),
            Row(
              children: [
                SizedBox(width: 20,),
               itemHomeBuild(
                   itemName: "Beef Burger",
                   itemDetails: "Double beef+cheese",
                   itemPrice: "138 L.E",
                   itemImage: "assets/images/beefburger.png"),
                SizedBox(width: 25,),
                // Container(
                //   child: Column(
                //     children: [
                //       Container(
                //           width:140,
                //           child: Image.asset("assets/images/chickenburger.png")),
                //       SizedBox(height: 6,),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 9),
                //         child: Row(children: [Text("Chicken Burger",style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 17
                //         ),)],),
                //       ),
                //       SizedBox(height:5,),
                //       Padding(
                //         padding: const EdgeInsets.only(left:9),
                //         child: Row(
                //           children: [
                //             Text("Double chicken+cheese",style: TextStyle(
                //               color: Colors.black.withOpacity(.5),
                //             ),),
                //           ],
                //         ),
                //       ),
                //       SizedBox(height: 12,),
                //       Padding(
                //         padding: const EdgeInsets.only(left: 9.0),
                //         child: Row(children: [
                //           Text("122 L.E",style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 17,
                //           ),),
                //           Spacer(),
                //           Padding(
                //             padding: const EdgeInsets.only(right: 8.0),
                //             child: Container(
                //               width: 30,
                //               height: 30,
                //               decoration: BoxDecoration(
                //                   color: Color(0xFFE54A00),
                //                   borderRadius: BorderRadius.circular(10)
                //               ),
                //               child: Icon(Icons.add,color: Colors.white,size: 25,),
                //             ),
                //           )
                //         ],),
                //       )
                //     ],
                //   ),
                //   width: 165,
                //   height: 200,
                //   decoration:BoxDecoration(
                //       color: Colors.white,
                //     borderRadius: BorderRadius.circular(20)
                //   ) ,
                // ),
                itemHomeBuild(
                    itemName: "Chicken Burger",
                    itemDetails: "Double chicken+cheese",
                    itemPrice: "122 L.E",
                    itemImage: "assets/images/chickenburger.png"),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width:15 ,),
                Text("Popular Now",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text("See All",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),),
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              child: Row(
                children: [
                  Image.asset("assets/images/pizza5.png"),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Text("Pizza with sausages\n and mushroom",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),),
                      SizedBox(height: 10,),
                      Text(" with Ranch sause",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black.withOpacity(.5)
                      ),)
                    ],
                  )
                ],
              ),
              width: 360,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemHomeBuild({
    required String itemName,
    required String itemDetails,
    required String itemPrice,
    required String itemImage
}) {
    return Container(
                child: Column(
                  children: [
                    Container(
                        width:140,
                          child: Image.asset(itemImage)),
                        SizedBox(height: 6,),
                    Padding(
                      padding: const EdgeInsets.only(left: 9),
                      child: Row(children: [Text(itemName,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17
                      ),)],),
                    ),
                    SizedBox(height:5,),
                    Padding(
                      padding: const EdgeInsets.only(left:9),
                      child: Row(
                        children: [
                          Text(itemDetails,style: TextStyle(
                            color: Colors.black.withOpacity(.5),
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(height: 12,),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Row(children: [
                        Text(itemPrice,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: (){
                              ScaffoldMessenger.of(context).showMaterialBanner(
                                  MaterialBanner(
                                    padding: EdgeInsets.all(20),
                                    leading: Icon(Icons.notifications_active_outlined,color: Colors.white,),
                                      backgroundColor: Color(0xFFE54A00),
                                      content: Text("Added to cart",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      actions: [InkWell(
                                          onTap: (){
                                            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                                          },
                                          child: Icon(Icons.exit_to_app,color: Colors.white,))]
                                  ),
                              );
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0xFFE54A00),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Icon(Icons.add,color: Colors.white,size: 25,),
                            ),
                          ),
                        )
                      ],),
                    )
                  ],
                ),
                width: 165,
                height: 200,
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ) ,
              );
  }
}
