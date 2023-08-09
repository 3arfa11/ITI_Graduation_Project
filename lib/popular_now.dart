import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class PopularNowScreen extends StatefulWidget {
  const PopularNowScreen({super.key});

  @override
  State<PopularNowScreen> createState() => _PopularNowScreenState();
}

class _PopularNowScreenState extends State<PopularNowScreen> {
  List<String> itemNameList =[

  ];
  List<String> itemDetailsList =[];
  List<String> itemPriceList =[];
  List<String> itemImageList =[
    "Fettuccine.png",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Color(0xFFE54A00),
  ),
  backgroundColor: Color(0xFFE54A00),
  leading: Icon(Icons.arrow_back_ios_new_rounded),
  centerTitle: true,
  title: Text("Popular Now",style: TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),),
),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: GridView.builder(
          itemBuilder: (BuildContext context,int index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemHomeBuild(itemName: "Pizaa",
                    itemDetails: "with  sss",
                    itemPrice: "90",
                    itemImage: "assets/images/pizza5.png")
              ],
            );
          },
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2

          ),

        ),
      ),
    );
  }
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
            width:100,
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
                // onTap: (){
                //   ScaffoldMessenger.of(context as BuildContext).showMaterialBanner(
                //     MaterialBanner(
                //         padding: EdgeInsets.all(20),
                //         leading: Icon(Icons.notifications_active_outlined),
                //         backgroundColor: Color(0xFFE54A00),
                //         content: Text("Added to cart"),
                //         actions: [InkWell(
                //             onTap: (){
                //             },
                //             child: Icon(Icons.exit_to_app))]
                //     ),
                //   );
                // },
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

