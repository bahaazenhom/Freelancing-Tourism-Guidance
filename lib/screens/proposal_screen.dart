import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/constants.dart';
import '../models/proposal_model.dart';
import '../models/user_model.dart';
import '../shared/shared.dart';

class MyProposal extends StatelessWidget {
  MyProposal({Key? key}) : super(key: key);
  double width = 0, height = 0;
  final animationcontroller = ScrollController();

  Future getdata() async {
    myProposal = [];
    if (MyAccount.tourist == true) {
      await FirebaseFirestore.instance
          .collection('Proposal')
          .orderBy('time', descending: true)
          .where("TouristID", isEqualTo: MyAccount.uId)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          myProposal.add(
            {
              "post": ProposalModel.fromJson(element.data()),
              "id":element.id,
            }
          );
        });
      });
    }
    else {
      await FirebaseFirestore.instance
          .collection('Proposal')
          .orderBy('time', descending: true)
          .where("GuideID", isEqualTo: MyAccount.uId)
          .get()
          .then((value) {
        value.docs.forEach((element) {
          myProposal.add(
              {
                "post": ProposalModel.fromJson(element.data()),
                "id":element.id,
              }
          );
          // print(element.data());
        });
      });
    }
    return myProposal;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(
              color: SecondaryColor,
            ));
          } else if (snapshot.hasData) {
            return ListView.builder(
              controller: animationcontroller,
              itemCount: myProposal.length,
              itemBuilder: (context, index) {
                return MyAccount.tourist ? TProposalPost(
                  width: width,
                  height: height,
                    title: myProposal[index]["post"].title,
                    GuideID:myProposal[index]["post"].GuideID,
                    TouristID: myProposal[index]["post"].TouristID,
                    time: myProposal[index]["post"].time,
                    proposalprice: myProposal[index]["post"].proposalprice,
                    status: myProposal[index]["post"].status,
                    ServiceID: myProposal[index]["post"].ServiceID,
                    desc: myProposal[index]["post"].desc,
                    id:myProposal[index]['id'],
                ): ProposalPost(
                  width: width,
                  height: height,
                  title: myProposal[index]["post"].title,
                  GuideID:myProposal[index]["post"].GuideID,
                  TouristID: myProposal[index]["post"].TouristID,
                  time: myProposal[index]["post"].time,
                  proposalprice: myProposal[index]["post"].proposalprice,
                  status: myProposal[index]["post"].status,
                  ServiceID: myProposal[index]["post"].ServiceID,
                  desc: myProposal[index]["post"].desc,
                  id:myProposal[index]['id'],
                );
              },
            );
          } else {
            return Text("error");
          }
        });
  }
}

class ProposalPost extends StatelessWidget {
  ProposalPost({
    required this.width,
    required this.height,
    required this.title,
    required this.status,
    required this.desc,
    required this.time,
    required this.TouristID,
    required this.proposalprice,
    required this.GuideID,
    required this.ServiceID,
    required this.id,
  });

  final String id;
  final double width;
  final double height;
  final String title;
  final String desc;
  final String GuideID;
  final String ServiceID;
  final String TouristID;
  final String proposalprice;
  final String status;
  final String time;

  late final UserModel userModel;

  @override
  getdata() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(TouristID)
        .get()
        .then((value) {
          print(value);
      userModel = UserModel.fromJson(value.data());
      return userModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column();
          } else {
            return Container(
              width: width,
              margin: EdgeInsets.only(left: 13,right: 13, top: 12),
              padding: EdgeInsets.only(top: 8, bottom: 12, right: 8, left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: SecondaryColor.withOpacity(.1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(userModel.image),
                            radius: width / 19 - 1.5,
                          ),
                          backgroundColor: Colors.white,
                          radius: width / 19,
                        ),
                      ),
                      SizedBox(
                        width: width / 50,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userModel.username,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: SecondaryColor,
                                fontSize: width / 25,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "At " + time.substring(5, 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: SecondaryColor.withOpacity(.5),
                                fontSize: width / 35,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: GreenColor,
                          fontSize: width / 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          desc,
                          style: TextStyle(
                            fontSize: width / 25,
                            color: SecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: SecondaryColor,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        r"Proposal Price : " +proposalprice+r"$",
                        style: TextStyle(
                          color: SecondaryColor,
                          fontSize: width / 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Proposal status",
                        style: TextStyle(
                          color: SecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: width / 22,
                        ),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: height / 30,
                          decoration: BoxDecoration(
                              color: Color(0xffB98802),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width / 27,
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: SecondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                clipBehavior: Clip.none,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        color: SecondaryColor,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          20, 20, 20, 20),
                                      child: Text(
                                        "Are you sure you want to delete this service?",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 16,
                                                vertical: 10),
                                            margin:
                                            const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                            ),
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                color: SecondaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            try{
                                              await FirebaseFirestore.instance.collection("Proposal").doc(id).delete();
                                              Navigator.pop(context);
                                            }catch (e){

                                            }
                                          },
                                          child: Container(
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 10),
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                            ),
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                color: SecondaryColor,
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
                              );
                            },
                          );
                        },
                        child: Container(
                          height: height / 30,
                          decoration: BoxDecoration(
                              color: Color(0xffB90202),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width / 28,
                              ),
                              child: Text(
                                "Cancel Proposal",
                                style: TextStyle(
                                  color: SecondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        });
  }
}

class TProposalPost extends StatelessWidget {
  TProposalPost({
    required this.width,
    required this.height,
    required this.title,
    required this.status,
    required this.desc,
    required this.time,
    required this.TouristID,
    required this.proposalprice,
    required this.GuideID,
    required this.ServiceID,
    required this.id,
  });

  final String id;
  final double width;
  final double height;
  final String title;
  final String desc;
  final String GuideID;
  final String ServiceID;
  final String TouristID;
  final String proposalprice;
  final String status;
  final String time;

  late final UserModel userModel;

  @override
  getdata() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(TouristID)
        .get()
        .then((value) {
      print(value);
      userModel = UserModel.fromJson(value.data());
      return userModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Column();
          } else {
            return Container(
              width: width,
              margin: EdgeInsets.only(left: 13,right: 13, top: 12),
              padding: EdgeInsets.only(top: 8, bottom: 12, right: 8, left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: SecondaryColor.withOpacity(.1),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: CircleAvatar(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(userModel.image),
                            radius: width / 19 - 1.5,
                          ),
                          backgroundColor: Colors.white,
                          radius: width / 19,
                        ),
                      ),
                      SizedBox(
                        width: width / 50,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userModel.username,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: SecondaryColor,
                                fontSize: width / 25,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "At " + time.substring(5, 16),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: SecondaryColor.withOpacity(.5),
                                fontSize: width / 35,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: GreenColor,
                          fontSize: width / 20,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          desc,
                          style: TextStyle(
                            fontSize: width / 25,
                            color: SecondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 15),
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: SecondaryColor,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        r"Proposal Price : " +proposalprice+r"$",
                        style: TextStyle(
                          color: SecondaryColor,
                          fontSize: width / 25,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Proposal status",
                        style: TextStyle(
                          color: SecondaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: width / 22,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: height / 30,
                          decoration: BoxDecoration(
                              color: Color(0xffB98802),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width / 27,
                              ),
                              child: Text(
                                status,
                                style: TextStyle(
                                  color: SecondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.transparent,
                                insetPadding: EdgeInsets.zero,
                                contentPadding: EdgeInsets.zero,
                                clipBehavior: Clip.none,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        color: SecondaryColor,
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          20, 20, 20, 20),
                                      child: Text(
                                        "Are you sure you want to delete this service?",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 16,
                                                vertical: 10),
                                            margin:
                                            const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                            ),
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                color: SecondaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            try{
                                              await FirebaseFirestore.instance.collection("Proposal").doc(id).delete();
                                              Navigator.pop(context);
                                            }catch (e){

                                            }
                                          },
                                          child: Container(
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 10),
                                            margin: EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  10),
                                            ),
                                            child: Text(
                                              "Yes",
                                              style: TextStyle(
                                                color: SecondaryColor,
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
                              );
                            },
                          );


                        },
                        child: Container(
                          height: height / 30,
                          decoration: BoxDecoration(
                              color: Color(0xffB90202),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: width / 28,
                              ),
                              child: Text(
                                "Cancel Proposal",
                                style: TextStyle(
                                  color: SecondaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: width / 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        });
  }
}
