import 'dart:convert';

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

    // print('json');
    print('json' + json.toString());
    if (json['Competition'] != null) {
      competition = new Competition(
          id: json['Competition']['id'],
          state: json['Competition']['state'],
          ruPoint: json['Competition']['ruPoint'],
          auPoint: json['Competition']['auPoint'],
          startAt: json['Competition']['startAt'],
          endAt: json['Competition']['endAt'],
          acceptId: json['Competition']['acceptId'],
          requestId: json['Competition']['requestId']);
    }
  }
}

class Competition {
  int id = 0;
  //String? name;
  bool state = false;
  int ruPoint = 0;
  int auPoint = 0;
  String? startAt;
  String? endAt;
  int requestId = 0;
  int acceptId = 0;

  Competition(
      {required this.id,
      //this.name,
      required this.state,
      required this.ruPoint,
      required this.auPoint,
      this.startAt,
      this.endAt,
      required this.requestId,
      required this.acceptId});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    //name = json['name'];
    state = json['state'];
    ruPoint = json['ruPoint'];
    auPoint = json['auPoint'];
    final cnt1 = json['startAt'];
    final cnt2 = json['endAt'];

    if (cnt1 == null) {
      startAt = "0";
    } else
      startAt = json['startAt'];
    if (cnt2 == null) {
      endAt = "0";
    } else
      endAt = json['endAt'];
    requestId = json['requestId'];
    acceptId = json['acceptId'];
  }
}
