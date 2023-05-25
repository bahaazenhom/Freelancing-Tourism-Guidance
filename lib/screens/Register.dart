import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:tourism/Constants/constants.dart';
import 'package:tourism/models/user_model.dart';
import 'package:tourism/screens/Login.dart';
import 'package:tourism/componant/componant.dart';
import 'package:tourism/shared/shared.dart';

class Regester extends StatefulWidget {
  static String id = "Register";
  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  String email = "", password = "", username = "", re_password = "", phone = "";
  List checkListItems = [
    {
      "id": 0,
      "value": false,
      "title": "Tourist",
    },
    {
      "id": 1,
      "value": false,
      "title": "Guide",
    },
  ];

  bool hide1 = true, hide2 = true, isreload = false;

  double width = 0, height = 0;

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final copasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ModalProgressHUD(
      inAsyncCall: isreload,
      child: Scaffold(
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
                    height: height / 30,
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
                            'Sign Up',
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
                    height: height / 40,
                  ),
                  TextForm(
                      onchange: (value) {
                        username = value;
                      },
                      prefxicon: Icon(
                        Icons.person,
                      ),
                      hinttext: 'Username',
                      validator: (value) {
                        if (value!.isEmpty) return "Enter Username";
                      }),
                  SizedBox(
                    height: height / 42,
                  ),
                  TextForm(
                      onchange: (value) {
                        email = value;
                      },
                      prefxicon: Icon(Icons.attach_email_rounded),
                      hinttext: 'Email Adress',
                      validator: (value) {
                        return RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)
                            ? null
                            : "Please enter a valid email";
                      }),
                  SizedBox(
                    height: height / 42,
                  ),
                  TextForm(
                      Type: TextInputType.number,
                      onchange: (value) {
                        phone = value;
                      },
                      prefxicon: Icon(Icons.phone),
                      hinttext: 'Phone Number',
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Enter Email Address";
                        else if (value.length < 11)
                          return "Enter valid Phone Number";
                      }),
                  SizedBox(
                    height: height / 42,
                  ),
                  TextForm(
                      sufficon: IconButton(
                        onPressed: () {
                          hide1 = !hide1;
                          setState(() {});
                        },
                        icon: hide1
                            ? Icon(
                                Icons.visibility,
                                color: MainColor,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: MainColor,
                              ),
                      ),
                      hide: hide1,
                      onchange: (value) {
                        password = value;
                      },
                      prefxicon: Icon(Icons.password),
                      hinttext: 'Password',
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Enter Password";
                        else if (value.length < 8)
                          return "Enter Strong Password";
                      }),
                  SizedBox(
                    height: height / 42,
                  ),
                  TextForm(
                      sufficon: IconButton(
                        onPressed: () {
                          hide2 = !hide2;
                          setState(() {});
                        },
                        icon: hide2
                            ? Icon(
                                Icons.visibility,
                                color: MainColor,
                              )
                            : Icon(
                                Icons.visibility_off,
                                color: MainColor,
                              ),
                      ),
                      hide: hide2,
                      onchange: (value) {
                        re_password = value;
                      },
                      prefxicon: Icon(Icons.password),
                      hinttext: 'Re-Password',
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Enter Password";
                        else if (password != re_password)
                          return "Must Password Equal Re_password";
                      }),
                  // SizedBox(
                  //   height: height / 35,
                  // ),
                  Column(
                    children: List.generate(
                      checkListItems.length,
                      (index) => CheckboxListTile(
                        side: BorderSide(
                          color: SecondaryColor,
                          width: 2,
                        ),
                        activeColor: GreenColor,
                        checkColor: SecondaryColor,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        title: Text(
                          checkListItems[index]["title"],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.bold,
                            color: SecondaryColor,
                          ),
                        ),
                        value: checkListItems[index]["value"],
                        onChanged: (value) {
                          setState(() {
                            for (var element in checkListItems) {
                              element["value"] = false;
                            }
                            checkListItems[index]["value"] = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width / 2.5,
                    height: height / 16,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(SecondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                        ),
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (checkListItems[0]['value'] == true) {
                            setState(() {
                              isreload = !isreload;
                            });
                            try {
                              await createUser();
                              UserModel Ruser = UserModel(
                                uId: SignedinUser.user!.uid,
                                username: username,
                                email: email,
                                image:
                                    "https://www.pngitem.com/pimgs/m/30-307416_profile-icon-png-image-free-download-searchpng-employee.png",
                                tourist: true,
                                phone: phone,
                              );
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(SignedinUser.user!.uid)
                                  .set(Ruser.toJson());
                              showSnackBar(
                                context,
                                'Success In Create Account',
                              );
                              navigate(context: context, PageName: Login.id);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackBar(
                                  context,
                                  'User Not Found',
                                );
                              } else if (e.code == 'wrong-password') {
                                showSnackBar(
                                  context,
                                  'Wrong Password',
                                );
                              }
                            } catch (e) {
                              showSnackBar(
                                context,
                                e.hashCode.toString(),
                              );
                            }
                            setState(() {
                              isreload = !isreload;
                            });
                          } else if (checkListItems[1]['value'] == true) {
                            setState(() {
                              isreload = !isreload;
                            });
                            try {
                              await createUser();
                              UserModel Ruser = UserModel(
                                uId: SignedinUser.user!.uid,
                                username: username,
                                email: email,
                                image: "",
                                tourist: false,
                                phone: phone,
                              );
                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(SignedinUser.user!.uid)
                                  .set(Ruser.toJson());
                              showSnackBar(
                                context,
                                'Success In Create Account',
                              );
                              navigate(context: context, PageName: Login.id);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackBar(
                                  context,
                                  'User Not Found',
                                );
                              } else if (e.code == 'wrong-password') {
                                showSnackBar(
                                  context,
                                  'Wrong Password',
                                );
                              }
                            } catch (e) {
                              showSnackBar(
                                context,
                                e.hashCode.toString(),
                              );
                            }
                            setState(() {
                              isreload = !isreload;
                            });
                          } else {
                            showSnackBar(context,
                                "Choose if you are Tour Guide or Tourist");
                          }
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Color(0xff364958),
                            fontSize: width / 18,
                            fontFamily: 'Taile',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: TextStyle(
                            color: SecondaryColor,
                            fontSize: width / 25,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            navigate(context: context, PageName: Login.id);
                          },
                          child: Text(
                            'Sign in!',
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
      ),
    );
  }

  Future<void> createUser() async {
    SignedinUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
