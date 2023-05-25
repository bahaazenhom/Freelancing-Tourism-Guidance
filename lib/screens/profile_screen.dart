import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tourism/Constants/constants.dart';
import 'package:tourism/componant/componant.dart';
import 'package:tourism/screens/Login.dart';
import 'package:tourism/shared/shared.dart';

import 'Gnavigation_bar.dart';
import 'Tnavigation_bar.dart';

class Profile extends StatefulWidget {
  static String id = "profilepage";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double width = 0, height = 0;
  Size? size;
  String username = MyAccount.username,
      email = MyAccount.email,
      phone = MyAccount.phone;

  @override
  Widget build(context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColor,
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 12.0,right:12,top:width / 2.5,bottom: width/5.5 ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height / 10,
                    ),
                    Center(
                      child: Text(
                        MyAccount.username,
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 100,
                    ),
                    Center(
                      child: Text(
                        "Tourist",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextForm(
                        onchange: (value) {
                          username = value;
                        },
                        initial: MyAccount.username,
                      ),
                    ),
                    SizedBox(
                      height: height / 70,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextForm(
                        onchange: (value) {
                          email = value;
                        },
                        initial: MyAccount.email,
                      ),
                    ),
                    SizedBox(
                      height: height / 70,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextForm(
                        onchange: (value) {
                          phone = value;
                        },
                        initial: MyAccount.phone,
                      ),
                    ),
                    SizedBox(
                      height: height / 70,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width / 2.3,
                          height: height / 25,
                          decoration: BoxDecoration(
                            color: GreenColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'View Services History',
                              style: TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 50,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: width / 3.3,
                          height: height / 25,
                          decoration: BoxDecoration(
                            color: GreenColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () async {
                                try {
                                  await FirebaseFirestore.instance
                                      .collection("Users")
                                      .doc(MyAccount.uId)
                                      .update({
                                    "username": username,
                                    "email": email,
                                    "phone": phone,
                                  });
                                  await FirebaseAuth.instance.currentUser!
                                      .updateEmail(email!);
                                  MyAccount.username = username;
                                  MyAccount.email = email;
                                  MyAccount.phone = phone;
                                } catch (e) {
                                  showSnackBar(context,
                                      "Some thing wrong in update your profile");
                                }
                              },
                              child: Text(
                                'Edit Profile',
                                style:
                                    TextStyle(fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          signUserOut();
                          Navigator.pushNamedAndRemoveUntil(
                              context, Login.id, (route) => false);
                        },
                        child: Container(
                          width: width / 2.7,
                          height: height / 17,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Log Out',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: height / 28,
              left: width / 3,
              child: SizedBox(
                height: height / 3,
                width: width / 3,
                child: GestureDetector(
                  onDoubleTap: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file = await imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (file != null) {
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference imageDir = referenceRoot.child("images");
                      Reference imageToUpload =
                          imageDir.child(SignedinUser.user!.uid);
                      try {
                        await imageToUpload.putFile(File(file!.path));
                        ImageUrl = await FirebaseStorage.instance
                            .ref()
                            .child('images/${SignedinUser.user!.uid}')
                            .getDownloadURL();
                        await FirebaseFirestore.instance
                            .collection("Users")
                            .doc(SignedinUser.user!.uid)
                            .update({
                          "image": ImageUrl,
                        });

                        setState(() {
                          MyAccount.image = ImageUrl;
                        });
                      } catch (e) {
                        showSnackBar(context,
                            "There are error in upload image, try again");
                      }
                    }
                  },
                  child: CircleAvatar(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(MyAccount.image),
                      radius: width / 5 - 16,
                    ),
                    backgroundColor: SecondaryColor,
                    radius: width / 5,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              left: width / 50,
              child: GestureDetector(
                onTap: () {
                  if(MyAccount.tourist)
                    Navigator.pushNamedAndRemoveUntil(context, TNavigationPage.id, (route) => false);
                  else {
                    Navigator.pushNamedAndRemoveUntil(context, GNavigationPage.id, (route) => false);
                  }
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
          ],
        ),
      ),
    );
  }

  signUserOut() {
    FirebaseAuth.instance.signOut();
  }
}
