class mMission {
  List<Missions>? missions;

  mMission({this.missions});

  mMission.fromJson(Map<String, dynamic> json) {
    if (json['missions'] != null) {
      missions = <Missions>[];
      json['missions'].forEach((v) {
        missions!.add(new Missions.fromJson(v));
      });
    }
  }
}

class Missions {
  int? id;
  String? title;
  String? info;
  int? point;
  String? createdAt;
  bool? isClear;

  Missions(
      {this.id,
      this.title,
      this.info,
      this.point,
      this.createdAt,
      this.isClear});

  Missions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    info = json['info'];
    point = json['point'];
    createdAt = json['createdAt'];
    isClear = json['isClear'] == '1' ? true : false;
  }
}
