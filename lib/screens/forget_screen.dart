import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../componant/componant.dart';

class ForgetPassword extends StatefulWidget {
  static String id = "forgetpage";
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  double width = 0, height = 0;
  bool emailornumber=true;

  @override
  Widget build(context) {
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
                        'Find Your Account',
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
              emailornumber ? "Enter your Email Address":"Enter your Phone Number",
              style: TextStyle(
                color: SecondaryColor,
                fontSize: width / 18,
                fontFamily: "Poppins",
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width/15,vertical: height/60),
              child: TextForm(
                hinttext: emailornumber ? 'Email Adress':"Phone Number",
              ),
            ),
            SizedBox(
              height: height / 15,
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
                onPressed: () {},
                child: Text(
                  'Find',
                  style: TextStyle(
                    color: Color(0xff364958),
                    fontSize: width / 18,
                    fontFamily: 'Taile',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Search with',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        emailornumber=!emailornumber;
                      });
                    },
                    child: Text(
                      emailornumber ? 'Phone Number?':'Email Adress',
                      style: TextStyle(
                        color: Color(0xFF6c968a),
                        fontSize: 18,
                      ),
                    ))
              ],
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