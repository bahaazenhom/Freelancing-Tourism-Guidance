import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../models/chat_model.dart';
import 'messeges.dart';

class Chat extends StatelessWidget {
   Chat({Key? key}) : super(key: key);
  static String id = "Chat_screen";

  double width = 0, height = 0;
  int index = 0;
   List chats = [
     ChatModel(
       name: 'Youssef Gemy',
       profilePic:
       "https://mir-s3-cdn-cf.behance.net/project_modules/disp/3aeeef98389917.5edadc860cdf1.png",
       contactId: '',
       timeSent: DateTime.now(),
       lastMessage: 'Hi Hofny, I\'m Youssef Gamal',
     ),
     ChatModel(
       name: 'Bahaa Zenhom',
       profilePic:
       "https://cdna.artstation.com/p/assets/images/images/045/842/536/large/ryuuto-teste.jpg?1643670907",
       contactId: '',
       timeSent: DateTime.now(),
       lastMessage: 'Hi Hofny, I\'m Bahaa Zenhom',
     ),
     ChatModel(
       name: 'Moustafa Gamal',
       profilePic:
       "https://cdna.artstation.com/p/assets/images/images/058/903/440/large/zmplzn-sanemi-shinazugawa.jpg?1675208589",
       contactId: '',
       timeSent: DateTime.now(),
       lastMessage: 'Hi Hofny, I\'m Moustafa Gamal',
     ),
     ChatModel(
       name: 'Arwa Ashraf',
       profilePic:
       "https://aniyuki.com/wp-content/uploads/2022/09/aniyuki-nezuko-phone-wallpaper-73.jpg",
       contactId: '',
       timeSent: DateTime.now(),
       lastMessage: 'Hi Hofny, I\'m Arwa Ashraf',
     ),
   ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        return ChatBubble(user: chats[index]);
      },
    );
  }
}

class ChatBubble extends StatelessWidget {
  ChatBubble({required this.user});
  ChatModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return MessegesScreen(name: user.name, image: user.profilePic);
        }));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        decoration: BoxDecoration(
            color: SecondaryColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(25)),
        height: 80,
        padding: EdgeInsets.only(left: 8, right: 14, top: 10, bottom: 10),
        child: Row(
          children: [
            SizedBox(
              width: 7,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  user.profilePic,
                ),
                radius: 23,
              ),
              radius: 25,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      user.name,
                      style: TextStyle(
                          fontSize: 16,
                          color: SecondaryColor,
                          fontWeight:
                          true ? FontWeight.bold : FontWeight.normal),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            user.lastMessage,
                            style: TextStyle(
                                fontSize: 12,
                                color: SecondaryColor,
                                fontWeight:
                                true ? FontWeight.bold : FontWeight.normal),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            user.timeSent.toString().substring(5, 16),
                            style: TextStyle(
                                fontSize: 12,
                                color: SecondaryColor,
                                fontWeight:
                                true ? FontWeight.bold : FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}