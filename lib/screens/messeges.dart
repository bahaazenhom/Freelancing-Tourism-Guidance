import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism/models/message_model.dart';

import '../componant/componant.dart';

class MessegesScreen extends StatelessWidget {
  MessegesScreen({required this.name,required this.image}) ;
  String name,image;
  static String id ="MessegesScreen";
  final animationcontroller = ScrollController();
  TextEditingController messagecontrller = TextEditingController();
  List messagesList=[
    Message("hi", "7", "true"),
    Message("hello", "8", "false"),
    Message("How are you", "9", "true"),
    Message("and where are you", "10", "true"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff2B475E),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_outlined,
          ), onPressed: () {
            Navigator.pop(context);
        },
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: animationcontroller,
              itemCount: messagesList.length,
              itemBuilder: (context, index) {
                if(messagesList[index].id=="true"){
                  return ChatBubleforfriend(messagesList[index]);
                }
                else {
                  return ChatBuble(messagesList[index]);
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextForm(
              ontap: (){
                animationcontroller.animateTo(
                  animationcontroller.position.minScrollExtent,
                  duration: Duration(
                    seconds: 1,
                  ),
                  curve: Curves.easeIn,
                );
              },
              controller: messagecontrller,

              hinttext: "Type anything",
              sufficon: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.send,
                  color: Color(0xff2B475E),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
