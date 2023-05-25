class ProposalModel {
  ProposalModel({
    required this.GuideID,
    required this.ServiceID,
    required this.TouristID,
    required this.time,
    required this.proposalprice,
    required this.status,
    required this.desc,
    required this.title
  });

  late String desc;
  late String GuideID;
  late String ServiceID;
  late String TouristID;
  late String proposalprice;
  late String status;
  late String time;
  late String title;

  ProposalModel.fromJson(json) {
    GuideID =json['GuideID']??"";
    ServiceID = json['ServiceID'] ?? '';
    time = json['time'] ?? '';
    TouristID=json['TouristID']??'';
    proposalprice=json['proposalprice']??"";
    status=json['status']??"";
    desc=json["desc"]??"";
    title=json["title"]??"";
  }

  Map<String, dynamic> toJson() {
    return {
      "GuideID" : GuideID,
      'ServiceID': ServiceID,
      'time': time,
      'TouristID':TouristID,
      'proposalprice':proposalprice,
      'status':status,
      'desc':desc,
      'title':title,
    };
  }
}
