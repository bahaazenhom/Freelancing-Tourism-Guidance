import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../componant/componant.dart';
import '../shared/shared.dart';
import 'Gnavigation_bar.dart';
import 'Tnavigation_bar.dart';

class NewProposal extends StatelessWidget {
  NewProposal({Key? key}) : super(key: key);
  double width = 0, height = 0;
  static String id = "newproposal";
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SecondaryColor,
        leadingWidth: width * .5,
        leading: Center(
          child: Text(
            "Offer Proposal",
            style: TextStyle(
                color: MainColor, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: MainColor,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enter your offer price",
                  style: TextStyle(
                    fontSize: width / 26,
                    color: SecondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(

                  width: 80,
                  height: 40,
                  child: TextForm(
                    hinttext:r"25$",

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
