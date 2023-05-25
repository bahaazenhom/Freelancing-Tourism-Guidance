// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:tourism/Constants/constants.dart';
// import 'package:tourism/screens/Register.dart';
// import 'package:tourism/screens/verification_screen.dart';
//
// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);
//   static String id = "Home_screen";
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   double width = 0, height = 0;
//   @override
//   Widget build(BuildContext context) {
//     width = MediaQuery.of(context).size.width;
//     height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MainColor,
//         actions: [
//           IconButton(
//               onPressed: () {
//                 signUserOut();
//               },
//               icon: Icon(Icons.logout)),
//         ],
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             GestureDetector(
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                   return Verif();
//                 }),);
//               },
//               child: Container(
//                 margin: EdgeInsets.only(
//                     right: width / 25, left: width / 25, top: height / 80),
//                 height: height / 3.2,
//                 decoration: BoxDecoration(
//                     color: MainColor, borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         clipBehavior: Clip.hardEdge,
//                         margin: EdgeInsets.only(
//                             left: width / 35, right: width / 35, top: height / 80),
//                         width: double.infinity,
//                         decoration:
//                             BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                         child: Image.asset(
//                           "assets/images/ace.jpg",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: width / 35, vertical: height / 100),
//                       child: Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Ahmed Mohamed Hofny",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: GreenColor,
//                                       fontSize: width / 30,
//                                       fontFamily: "Poppins",
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     "going to pyramids and museums pla pla pla pla pla",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: SecondaryColor,
//                                       fontSize: width / 33,
//                                       fontFamily: "Poppins",
//                                     ),
//                                   ),
//                                   Text(
//                                     "10-5-2023",
//                                     style: TextStyle(
//                                       color: SecondaryColor,
//                                       fontSize: width / 33,
//                                       fontFamily: "Poppins",
//                                       fontWeight: FontWeight.w100
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                                   return Regester();
//                                 }),);
//                               },
//                               icon: Icon(
//                                 Icons.chat_bubble,
//                                 color: SecondaryColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                   return Verif();
//                 }),);
//               },
//               child: Container(
//                 margin: EdgeInsets.only(
//                     right: width / 25, left: width / 25, top: height / 80),
//                 height: height / 3.2,
//                 decoration: BoxDecoration(
//                     color: MainColor, borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         clipBehavior: Clip.hardEdge,
//                         margin: EdgeInsets.only(
//                             left: width / 35, right: width / 35, top: height / 80),
//                         width: double.infinity,
//                         decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                         child: Image.asset(
//                           "assets/images/ace.jpg",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: width / 35, vertical: height / 100),
//                       child: Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Ahmed Mohamed Hofny",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: GreenColor,
//                                       fontSize: width / 30,
//                                       fontFamily: "Poppins",
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     "going to pyramids and museums pla pla pla pla pla",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: SecondaryColor,
//                                       fontSize: width / 33,
//                                       fontFamily: "Poppins",
//                                     ),
//                                   ),
//                                   Text(
//                                     "10-5-2023",
//                                     style: TextStyle(
//                                         color: SecondaryColor,
//                                         fontSize: width / 33,
//                                         fontFamily: "Poppins",
//                                         fontWeight: FontWeight.w100
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                                   return Regester();
//                                 }),);
//                               },
//                               icon: Icon(
//                                 Icons.chat_bubble,
//                                 color: SecondaryColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                   return Verif();
//                 }),);
//               },
//               child: Container(
//                 margin: EdgeInsets.only(
//                     right: width / 25, left: width / 25, top: height / 80),
//                 height: height / 3.2,
//                 decoration: BoxDecoration(
//                     color: MainColor, borderRadius: BorderRadius.circular(10)),
//                 child: Column(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         clipBehavior: Clip.hardEdge,
//                         margin: EdgeInsets.only(
//                             left: width / 35, right: width / 35, top: height / 80),
//                         width: double.infinity,
//                         decoration:
//                         BoxDecoration(borderRadius: BorderRadius.circular(10)),
//                         child: Image.asset(
//                           "assets/images/ace.jpg",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: width / 35, vertical: height / 100),
//                       child: Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Ahmed Mohamed Hofny",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: GreenColor,
//                                       fontSize: width / 30,
//                                       fontFamily: "Poppins",
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                     "going to pyramids and museums pla pla pla pla pla",
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       color: SecondaryColor,
//                                       fontSize: width / 33,
//                                       fontFamily: "Poppins",
//                                     ),
//                                   ),
//                                   Text(
//                                     "10-5-2023",
//                                     style: TextStyle(
//                                         color: SecondaryColor,
//                                         fontSize: width / 33,
//                                         fontFamily: "Poppins",
//                                         fontWeight: FontWeight.w100
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                                   return Regester();
//                                 }),);
//                               },
//                               icon: Icon(
//                                 Icons.chat_bubble,
//                                 color: SecondaryColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,)
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         color: MainColor,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
//           child: GNav(
//               gap: 15,
//               backgroundColor: MainColor,
//               color: SecondaryColor,
//               activeColor: GreenColor,
//               tabBackgroundColor: SecondaryColor,
//               padding: EdgeInsets.all(10),
//               tabs: [
//                 GButton(
//                   icon: Icons.home,
//                   text: "Home",
//                 ),
//                 GButton(
//                   icon: Icons.chat,
//                   text: "Chat",
//                 ),
//                 GButton(
//                   icon: Icons.settings,
//                   text: "Settings",
//                 ),
//                 GButton(
//                   icon: Icons.person,
//                   text: "Profile",
//                 ),
//               ]),
//         ),
//       ),
//     );
//   }
//
//   signUserOut() {
//     FirebaseAuth.instance.signOut();
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tourism/Constants/constants.dart';
import 'package:tourism/models/user_model.dart';
import 'package:tourism/screens/details_screen.dart';
import '../models/post_model.dart';
import '../shared/shared.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);
  static String id = "Home_screen";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double width = 0, height = 0;


  Future getdata() async {
    postsList=[];
    await FirebaseFirestore.instance
        .collection('Guide_Services')
        .orderBy('time',descending: true)
        .get()
        .then((value) {
      value.docs.forEach((element) {
          postsList.add({
            "id":element.id,
          "post":PostDataModel.fromJson(element.data()),
        });
        // print(element.data());
      });
    });
    return postsList;
  }

  final animationcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return FutureBuilder(
      future: getdata(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasData){
          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 13),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {

                        });
                      },
                      child: Text(
                        "Most popular tour guides",
                        style: TextStyle(
                          fontSize: width / 18,
                          fontWeight: FontWeight.bold,
                          color: SecondaryColor,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 100,
              ),
              Expanded(
                child: ListView.builder(
                  controller: animationcontroller,
                  itemCount: postsList.length,
                  itemBuilder: (context, index) {
                    return HomePost(
                      width: width,
                      height: height,
                      title: postsList[index]["post"].title,
                      desc: postsList[index]["post"].description,
                      price: postsList[index]["post"].price,
                      time: postsList[index]["post"].time,
                      UserId: postsList[index]["post"].UserID,
                      ServiceID: postsList[index]["id"],
                    );
                  },
                ),
              ),
            ],
          );
        }
        else {
          return Text("Error");
        }
      },
    );
  }
}

class HomePost extends StatelessWidget {
  HomePost({
    required this.width,
    required this.height,
    required this.desc,
    required this.price,
    required this.time,
    required this.UserId,
    required this.title,
    required this.ServiceID,
  });

  final String ServiceID;
  final String title;
  final double width;
  final double height;
  final String desc;
  final String price;
  final String time;
  final String UserId;

  late final UserModel userModel;

  @override
  getdata() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(UserId)
        .get()
        .then((value) {
          // print(value.data());
        userModel =UserModel.fromJson(value.data());
      return userModel;
      });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdata(),
      builder: (context,snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Column();
        }
        else {
          return Container(
            width: width,
            margin: EdgeInsets.symmetric(horizontal: 13,vertical: 4),
            padding: EdgeInsets.only(top: 8, bottom: 12, right: 8, left: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: SecondaryColor.withOpacity(.1),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CircleAvatar(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(userModel!.image),
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
                            "At "+time.substring(11,16)+" "+time.substring(5,10),
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
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.favorite_outline,
                        color: SecondaryColor,
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
                const SizedBox(
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
                SizedBox(
                  height: height / 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: GreenColor,
                        ),
                        Text(
                          "4.9",
                          style: TextStyle(
                            color: GreenColor,
                            fontSize: width / 25,
                          ),
                        ),
                        Text(
                          " (320) ",
                          style: TextStyle(
                            color: SecondaryColor,
                            fontSize: width / 25,
                          ),
                        ),
                        Text(
                          " -  From ",
                          style: TextStyle(
                            color: SecondaryColor,
                            fontSize: width / 25,
                          ),
                        ),
                        Text(
                          price + r"$",
                          style: TextStyle(
                            color: SecondaryColor,
                            fontSize: width / 25,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return Details(desc: desc, price: price, title: title,ServiceID: ServiceID,);
                              }),
                            );
                          },
                          child: Container(
                            height: height / 30,
                            decoration: BoxDecoration(
                                color: SecondaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width / 22,
                                ),
                                child: Text(
                                  "Preview",
                                  style: TextStyle(
                                    color: GreenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width / 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }
    },
    );
  }
}

