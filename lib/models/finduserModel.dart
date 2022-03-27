class mFinduser {
  String? state;
  List<Result>? result;

  mFinduser({this.state, this.result});

  mFinduser.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
   
    return data;
  }
}

class Result {
  int? id;
  String? name;
  int? point;
  int? isFriend;

  Result({this.id, this.name, this.point});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    point = json['point'];
    isFriend = json['isFriend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['point'] = this.point;
    data['isFriend'] = this.isFriend;
    return data;
  }
}
