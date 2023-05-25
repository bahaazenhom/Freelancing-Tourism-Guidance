class PostDataModel {
  PostDataModel({
    required this.title,
    required this.description,
    required this.time,
    required this.price,
    required this.UserID,
  });

  late String title;
  late String description;
  late String time;
  late String price;
  late String UserID;

  PostDataModel.fromJson(json) {
    title =json['title']??"";
    description = json['description'] ?? '';
    time = json['time'] ?? '';
    price=json['price']??'';
    UserID=json['UserID']??"";
  }

  Map<String, dynamic> toJson() {
    return {
      "title" : title,
      'description': description,
      'time': time,
      'price':price,
      'user':UserID,
    };
  }
}
