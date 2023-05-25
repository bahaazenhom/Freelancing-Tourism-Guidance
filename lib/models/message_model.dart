// class Message {
//   final String senderId;
//   final String recieverid;
//   final String text;
//   final DateTime timeSent;
//   final String messageId;
//   final bool isSeen;
//
//   Message({
//     required this.senderId,
//     required this.recieverid,
//     required this.text,
//     required this.timeSent,
//     required this.messageId,
//     required this.isSeen,
//   });
//
//   Map<String, dynamic> tojson() {
//     return {
//       'senderId': senderId,
//       'recieverid': recieverid,
//       'text': text,
//       'timeSent': timeSent.millisecondsSinceEpoch,
//       'messageId': messageId,
//       'isSeen': isSeen,
//     };
//   }
//
//   factory Message.fromjson(Map<String, dynamic> map) {
//     return Message(
//       senderId: map['senderId'] ?? '',
//       recieverid: map['recieverid'] ?? '',
//       text: map['text'] ?? '',
//       timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
//       messageId: map['messageId'] ?? '',
//       isSeen: map['isSeen'] ?? false,
//     );
//   }
// }

class Message{
  final String message;
  final String date;
  final String id;


  Message(this.message, this.date, this.id);
  factory Message.fromJson(jsondata){
    return Message(jsondata['message'], jsondata['date'],jsondata['id']);
  }
}