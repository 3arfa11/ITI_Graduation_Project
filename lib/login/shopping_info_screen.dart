import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itifinalproject/hive/hive_helper.dart';
import 'package:itifinalproject/cubit/shopping_info_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itifinalproject/payment_page1.dart';
class ShoppingInfoScreen extends StatefulWidget {
  const ShoppingInfoScreen({super.key});

  @override
  State<ShoppingInfoScreen> createState() => _ShoppingInfoScreenState();
}
class _ShoppingInfoScreenState extends State<ShoppingInfoScreen> {
  String currentOption = HiveHelper.infoList[0];
  final _textFieldController =TextEditingController();
  final _textFieldController2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShoppingInfoCubit>();
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        actions: [InkWell(
            onTap: () async{
              _textFieldController.text = "";
              await showDialog(
                context: context,
                builder:(context){
                  return AlertDialog(
                    title: Text("Shopping information"),
                    content: TextField(
                      controller: _textFieldController,
                      decoration:InputDecoration(
                          hintText: "Enter your location"
                      ),
                    ),
                    actions: [
                      MaterialButton(
                        child: Text("Add"),
                        onPressed:(){
                          if(_textFieldController.text.isNotEmpty){
                            cubit.addNote(_textFieldController.text);
                          }
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              ).then((value) => setState(() {}));
            },
            child: Icon(Icons.add,color: Colors.black,size: 32,))],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white
        ),
        centerTitle: true,
        title: Text("Shopping Informaion",style: TextStyle(
          color: Colors.black
        ),),
        leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        backgroundColor: Colors.white,
        elevation:0 ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("continue"),
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const PaymentScreen(),
            ),
          );

        },

      ),
      body: BlocBuilder<ShoppingInfoCubit,ShoppingInfoState>(
        builder: (context,state){
          if(state is ShoppingLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(state is ShoppingEmptyState){
            return Center(
              child:Text("There is no locations",style: TextStyle(fontSize: 35),),
            );
          }
          else{
            return ListView.separated(
              padding: EdgeInsets.all(20),
                itemBuilder: (context,index) =>_buildNoteItem(
                  text: HiveHelper.infoList[index],
                  index: index,
                  cubit: cubit,
                ),

                separatorBuilder: (context,index) =>SizedBox(height: 20,),
                itemCount: HiveHelper.infoList.length


            );
          }
        },
      )
    );
  }

Widget _buildNoteItem({
  required String text,
  required int index,
  required ShoppingInfoCubit cubit,
}) {
  return Stack(
    children: [
      InkWell(
        onTap: () async {
          _textFieldController2.text = HiveHelper.infoList[index];
          await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('TextField in Dialog'),
                content: TextField(
                  controller: _textFieldController2,
                  decoration:
                  const InputDecoration(hintText: "Enter Location"),
                ),
                actions: [
                  MaterialButton(
                    child: const Text('CANCEL'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  MaterialButton(
                    child: const Text('OK'),
                    onPressed: () {
                      // HiveHelper.update(
                      //     index, _textFieldController2.text, _refresh);
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ).then((value) => setState(() {}));
        },
        child: Container(
          height: 75,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  SizedBox(width: 35,),
                  Text(
                    text,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Spacer(),
                  Radio(
                      value: HiveHelper.infoList[index],
                      groupValue: currentOption,
                      onChanged: (value){
                        setState(() {
                          currentOption=value.toString();
                        });
                      })
                ],
              ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: InkWell(
            onTap: () {
              cubit.removeNote(index);
            },
            child: const Icon(
              Icons.delete,size: 15,
              color: Colors.red,
            )),
      )
    ],
  );
}
}

