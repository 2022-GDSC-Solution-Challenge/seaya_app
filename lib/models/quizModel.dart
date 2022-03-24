class mQuiz {
  String? state;
  List<mquiz>? quiz;

  mQuiz({this.state, this.quiz});

  mQuiz.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['quiz'] != null) {
      quiz = <mquiz>[];
      json['quiz'].forEach((v) {
        quiz!.add(new mquiz.fromJson(v));
      });
    }
  }
}

class mquiz {
  int? id;
  String? quistion;
  int? point;
  List<Answers>? answers;

  mquiz({this.id, this.quistion, this.point, this.answers});

  mquiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quistion = json['quistion'];
    point = json['point'];
    if (json['Answers'] != null) {
      answers = <Answers>[];
      json['Answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }
}

class Answers {
  int? id;
  String? content;
  bool? ansCheck;

  Answers({this.id, this.content, this.ansCheck});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    ansCheck = json['ans_check'];
  }
}
