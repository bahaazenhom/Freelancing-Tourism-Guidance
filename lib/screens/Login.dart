import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tourism/Constants/constants.dart';
import 'package:tourism/screens/Home_screen.dart';
import 'package:tourism/screens/Register.dart';
import 'package:tourism/componant/componant.dart';
import 'package:tourism/screens/forget_screen.dart';
import 'package:tourism/screens/Gnavigation_bar.dart';
import 'package:tourism/shared/shared.dart';

import '../models/user_model.dart';
import 'Tnavigation_bar.dart';

class Login extends StatefulWidget {
  static String id = "Login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  double width = 0, height = 0;

  String email = "", password = "";

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool hide1 = true;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColor,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(width / 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 13,
                ),
                Image.asset(
                  'assets/images/Group 320.png',
                  width: width / 1.7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                            color: SecondaryColor,
                            fontSize: width / 13,
                            fontFamily: 'Taile',
                          ),
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(
                              color: SecondaryColor,
                              fontSize: width / 14,
                              fontFamily: 'Taile',
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 15,
                ),
                TextForm(
                  prefxicon: Icon(Icons.person),
                  hinttext: 'Email',
                  validator: (value) {
                    return RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!)
                        ? null
                        : "Please enter a valid email";
                  },
                  controller: emailController,
                  onchange: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: height / 20,
                ),
                TextForm(
                  sufficon: IconButton(
                    onPressed: () {
                      hide1=!hide1;
                      setState(() {});
                    },
                    icon: hide1 ? Icon(
                      Icons.visibility,
                      color: MainColor,
                    ): Icon(
                      Icons.visibility_off,
                      color: MainColor,
                    ),
                  ),
                  hide: hide1,
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty)
                      return "Please enter strong password";
                  },
                  onchange: (value) {
                    password = value;
                  },
                  prefxicon: Icon(Icons.password),
                  hinttext: 'Password',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forget Your ',
                        style: TextStyle(
                            color: SecondaryColor,
                            fontSize: width / 25,
                            fontFamily: 'Taile',
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigate(
                              context: context, PageName: ForgetPassword.id);
                        },
                        child: Text(
                          'Password ?',
                          style: TextStyle(
                              color: GreenColor,
                              fontSize: width / 25,
                              fontFamily: 'Taile',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 17,
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
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          SignedinUser = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                          await FirebaseFirestore.instance
                              .collection('Users')
                              .doc(SignedinUser.user!.uid)
                              .get()
                              .then((value) {
                            MyAccount = UserModel.fromJson(value.data()!);
                          }).catchError((error) {
                          });
                          emailController.clear();
                          passwordController.clear();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                        if(MyAccount.tourist)
                          Navigator.pushNamedAndRemoveUntil(context, TNavigationPage.id, (route) => false);
                        else {
                          Navigator.pushNamedAndRemoveUntil(context, GNavigationPage.id, (route) => false);
                        }
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xff364958),
                        fontSize: width / 18,
                        fontFamily: 'Taile',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have an account? ',
                        style: TextStyle(
                          color: SecondaryColor,
                          fontSize: width / 25,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          navigate(context: context, PageName: Regester.id);
                        },
                        child: Text(
                          'Sign up!',
                          style: TextStyle(
                            color: GreenColor,
                            fontSize: width / 25,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginuser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
