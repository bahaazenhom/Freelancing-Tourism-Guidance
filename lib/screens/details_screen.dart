import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tourism/Constants/constants.dart';
import 'package:tourism/animation.dart';
import 'package:tourism/screens/new_Proposal.dart';

import '../shared/shared.dart';

class Details extends StatelessWidget {
  late String title;
  late String desc;
  late String price;
  late String ServiceID;
  Details({
    Key? key,
    required this.desc,
    required this.price,
    required this.title,
    required this.ServiceID
  });
  double height = 0, width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: height,
            width: double.infinity,
            child: Image.network(
              "https://www.eiffeltowertour.com/wp-content/uploads/2021/01/Eiffel-Tower-in-Paris-at-sunset.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: height / 20,
            left: width / 40,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: height / 18,
                width: width / 9,
                decoration: BoxDecoration(
                  color: MainColor.withOpacity(.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.arrow_back_rounded,
                  size: width / 12,
                  color: SecondaryColor,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * .7,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [.1, 0.5, 0.8, 1],
                  colors: [
                    MainColor,
                    MainColor.withOpacity(.85),
                    MainColor.withOpacity(.62),
                    MainColor.withOpacity(0.01)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: width / 13,
            width: width * .8,
            child: Container(
              height: height / 1.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeAnimation(
                    delay: .2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            fontSize: width / 8,
                            color: SecondaryColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: SecondaryColor,
                              size: width / 15,
                            ),
                            SizedBox(
                              width: width / 100,
                            ),
                            Text(
                              "3.8",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: width / 25,
                                color: SecondaryColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 500,
                  ),
                  FadeAnimation(
                    delay: .3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.wallet,
                              color: SecondaryColor,
                              size: width / 18,
                            ),
                            SizedBox(
                              width: width / 80,
                            ),
                            RichText(
                              text: TextSpan(
                                text: r"$",
                                style: TextStyle(
                                    fontSize: width / 25,
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: price,
                                    style: TextStyle(fontSize: width / 25),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 50,
                  ),
                  FadeAnimation(
                    delay: .5,
                    child: Container(
                      height: height / 4,
                      child: SingleChildScrollView(
                        child: Text(
                          desc,
                          style: TextStyle(
                            fontSize: width / 23,
                            color: SecondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  FadeAnimation(
                    delay: .6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: width / 10,
                          color: SecondaryColor,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: ()  {
                              Navigator.pushNamed(context, NewProposal.id);
                              // try{
                              //   await FirebaseFirestore.instance
                              //       .collection('Guide_Services').add({
                              //     "UserID":MyAccount.uId,
                              //     "description": desc,
                              //     "price":price,
                              //     "time":DateTime.now().toString(),
                              //     "title":title,
                              //   });
                              //   titleController.clear();
                              //   priceController.clear();
                              //   descController.clear();
                              //   Navigator.pop(context);
                              // }catch(e){
                              //   showSnackBar(context, "There are error in adding new service");
                              // }
                            },
                            child: Container(
                              height: height / 15,
                              decoration: BoxDecoration(
                                  color: GreenColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  "Send Proposal",
                                  style: TextStyle(
                                    color: SecondaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width / 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
