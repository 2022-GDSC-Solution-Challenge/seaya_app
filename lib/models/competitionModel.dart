class mCompetition {
  String? state;
  List<Competitors>? competitors;
  List<Competitors>? acceptWaiting;
  List<Competitors>? requestWaiting;

  mCompetition(
      {this.state, this.competitors, this.acceptWaiting, this.requestWaiting});

  mCompetition.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['competitors'] != null) {
      competitors = <Competitors>[];
      json['competitors'].forEach((v) {
        competitors!.add(new Competitors.fromJson(v));
      });
    }
    if (json['accept_waiting'] != null) {
      acceptWaiting = <Competitors>[];
      json['accept_waiting'].forEach((v) {
        acceptWaiting!.add(new Competitors.fromJson(v));
      });
    }
    if (json['request_waiting'] != null) {
      requestWaiting = <Competitors>[];
      json['request_waiting'].forEach((v) {
        requestWaiting!.add(new Competitors.fromJson(v));
      });
    }
  }
}

class Competitors {
  int? id;
  String? name;
  Competition? competition;

  Competitors({this.id, this.name, this.competition});

  Competitors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    competition = json['Competition'] != null
        ? new Competition.fromJson(json['Competition'])
        : null;
  }
}

class Competition {
  int? id;
  //String? name;
  bool? state;
  int? ruPoint;
  int? auPoint;
  String? startAt;
  String? endAt;
  int? requestId;
  int? acceptId;

  Competition(
      {this.id,
      //this.name,
      this.state,
      this.ruPoint,
      this.auPoint,
      this.startAt,
      this.endAt,
      this.requestId,
      this.acceptId});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    //name = json['name'];
    state = json['state'];
    ruPoint = json['ruPoint'];
    auPoint = json['auPoint'];
    startAt = json['startAt'];
    endAt = json['endAt'];
    requestId = json['requestId'];
    acceptId = json['acceptId'];
  }
}
