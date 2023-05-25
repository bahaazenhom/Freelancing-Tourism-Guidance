import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourism/Constants/constants.dart';
import 'package:tourism/componant/componant.dart';
import 'package:tourism/screens/Home_screen.dart';
import 'package:tourism/screens/chat_screen.dart';
import 'package:tourism/screens/myservice_screen.dart';
import 'package:tourism/screens/profile_screen.dart';
import 'package:tourism/screens/proposal_screen.dart';
import 'package:tourism/shared/shared.dart';

class GNavigationPage extends StatefulWidget {
  const GNavigationPage({Key? key}) : super(key: key);
  static String id = "GNavigationPage_screen";

  @override
  State<GNavigationPage> createState() => _GNavigationPageState();
}

class _GNavigationPageState extends State<GNavigationPage> {
  double width = 0, height = 0;
  int index = 0;
  String title = "", desc = "", price = "";
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();

  List<String> name = [
    "Home",
    "My Service",
    "My Proposal",
    "Chat",
  ];
  List pages = [
    Home(),
    MyScervices(),
    MyProposal(),
    Chat(),
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MainColor,
      appBar: AppBar(
        backgroundColor: SecondaryColor,
        leadingWidth: 150,
        leading: Center(
          child: Text(
            name[index],
            style: TextStyle(
              color: MainColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              onTap: () {
                navigate(context: context, PageName: Profile.id);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(MyAccount.image),
              ),
            ),
          )
        ],
        elevation: 0,
      ),
      body: pages[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: SecondaryColor.withOpacity(.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: GNav(
              onTabChange: (ind) {
                setState(() {
                  index = ind;
                });
              },
              selectedIndex: index,
              gap: 15,
              color: SecondaryColor,
              activeColor: GreenColor,
              tabBackgroundColor: SecondaryColor,
              padding: EdgeInsets.all(10),
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.person,
                  text: "My services",
                ),
                GButton(
                  icon: Icons.menu,
                  text: "My Proposal",
                ),
                GButton(
                  icon: Icons.chat,
                  text: "Chat",
                ),
              ]),
        ),
      ),
      floatingActionButton: index == 1
          ? FloatingActionButton(
              backgroundColor: SecondaryColor,
              onPressed: () {
                showDialog(
                    useSafeArea: false,
                    context: context,
                    builder: (context) {
                      return Form(
                        key: formKey,
                        child: AlertDialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          clipBehavior: Clip.none,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width / 1.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: MainColor,
                                ),
                                padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Add New Service",
                                          style: TextStyle(
                                            color: SecondaryColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(2.5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: SecondaryColor,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        title = value;
                                      },
                                      controller: titleController,
                                      style: TextStyle(
                                        color: SecondaryColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Title",
                                        hintStyle: TextStyle(
                                          color: SecondaryColor,
                                          fontSize: 15,
                                          fontFamily: "Poppins",
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: SecondaryColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: SecondaryColor,
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        labelStyle: TextStyle(
                                          color: SecondaryColor,
                                        ),
                                      ),
                                      showCursor: true,
                                      cursorColor: SecondaryColor,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        desc = value;
                                      },
                                      controller: descController,
                                      style: TextStyle(
                                        color: SecondaryColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Description",
                                        hintStyle: TextStyle(
                                          color: SecondaryColor,
                                          fontSize: 15,
                                          fontFamily: "Poppins",
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: SecondaryColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: SecondaryColor,
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        labelStyle: TextStyle(
                                          color: SecondaryColor,
                                        ),
                                      ),
                                      showCursor: true,
                                      cursorColor: SecondaryColor,
                                      maxLines: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      onChanged: (value) {
                                        price = value;
                                      },
                                      controller: priceController,
                                      style: TextStyle(
                                        color: SecondaryColor,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Price",
                                        hintStyle: TextStyle(
                                          color: SecondaryColor,
                                          fontSize: 15,
                                          fontFamily: "Poppins",
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: SecondaryColor,
                                            width: 2,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: SecondaryColor,
                                            width: 1.5,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        labelStyle: TextStyle(
                                          color: SecondaryColor,
                                        ),
                                      ),
                                      showCursor: true,
                                      cursorColor: SecondaryColor,
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Image ",
                                          style: TextStyle(
                                            color: SecondaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Poppins",
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
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
                                                setState(() {
                                                  MyAccount.image = ImageUrl;
                                                });
                                              } catch (e) {
                                                showSnackBar(context,
                                                    "There are error in upload image, try again");
                                              }
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: SecondaryColor,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: MainColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      try {
                                        await FirebaseFirestore.instance
                                            .collection('Guide_Services')
                                            .add({
                                          "UserID": MyAccount.uId,
                                          "description": desc,
                                          "price": price,
                                          "time": DateTime.now().toString(),
                                          "title": title,
                                        });
                                        titleController.clear();
                                        priceController.clear();
                                        descController.clear();
                                        Navigator.pop(context);
                                      } catch (e) {
                                        showSnackBar(context,
                                            "There are error in adding new service");
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 10),
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: SecondaryColor,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        "Save",
                                        style: TextStyle(
                                          color: GreenColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Icon(
                Icons.add,
                size: 35,
                color: MainColor,
              ),
            )
          : null,
    );
  }
}
