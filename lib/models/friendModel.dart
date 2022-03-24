class mFriend {
  String? state;
  List<Friends>? friends;
  List<Friends>? acceptWaiting;
  List<Friends>? requestWaiting;

  mFriend({this.state, this.friends, this.acceptWaiting, this.requestWaiting});

  mFriend.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['friends'] != null) {
      friends = <Friends>[];
      json['friends'].forEach((v) {
        friends!.add(new Friends.fromJson(v));
      });
    }
    if (json['accept_waiting'] != null) {
      acceptWaiting = <Friends>[];
      json['accept_waiting'].forEach((v) {
        acceptWaiting!.add(new Friends.fromJson(v));
      });
    }
    if (json['request_waiting'] != null) {
      requestWaiting = <Friends>[];
      json['request_waiting'].forEach((v) {
        requestWaiting!.add(new Friends.fromJson(v));
      });
    }
  }
}

class Friends {
  int? id;
  String? name;
  int? point;
  Firend? firend;

  Friends({this.id, this.name, this.point, this.firend});

  Friends.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    point = json['point'];
    firend =
        json['Firend'] != null ? new Firend.fromJson(json['Firend']) : null;
  }
}

class Firend {
  bool? state;
  int? requestId;
  int? acceptId;

  Firend({this.state, this.requestId, this.acceptId});

  Firend.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    requestId = json['requestId'];
    acceptId = json['acceptId'];
  }
}
