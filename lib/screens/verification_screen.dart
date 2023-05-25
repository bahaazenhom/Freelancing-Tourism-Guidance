import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tourism/Constants/constants.dart';
import 'package:tourism/componant/componant.dart';

class Verif extends StatelessWidget {
  Verif({Key? key}) : super(key: key);
  double width = 0, height = 0;
  static String id ="Verf";
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: Customshape(),
              child: Container(
                color: SecondaryColor,
                height: height / 4.5,
                width: width,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      child: Text(
                        'Verification Code',
                        style: TextStyle(
                          fontSize: width / 15,
                          color: MainColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                      ),
                      top: height / 13,
                      left: width / 4.5,
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              "assets/images/Group 320.png",
              width: width / 1.5,
            ),
            SizedBox(
              height: height / 30,
            ),
            Text(
              "Enter Your Verification code",
              style: TextStyle(
                color: SecondaryColor,
                fontSize: width / 18,
                fontFamily: "Poppins",
              ),
            ),
            Text(
              "To reset your password",
              style: TextStyle(
                color: SecondaryColor,
                fontSize: width / 19,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width / 7,
                  height: height / 11,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: MainColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      fontSize: width / 18,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      filled: true,
                      fillColor: SecondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 7,
                  height: height / 11,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: MainColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      fontSize: width / 18,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      filled: true,
                      fillColor: SecondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 7,
                  height: height / 11,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: MainColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      fontSize: width / 18,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      filled: true,
                      fillColor: SecondaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: width / 7,
                  height: height / 11,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).unfocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: MainColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                      fontSize: width / 18,
                    ),
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      filled: true,
                      fillColor: SecondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            SizedBox(
              width: width / 2.5,
              height: height / 16,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(SecondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                  ),
                ),
                onPressed: () {

                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Color(0xff364958),
                    fontSize: width / 18,
                    fontFamily: 'Taile',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double width = size.width;
    double height = size.height;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
