class mUser {
  late String state;
  late String name;

  late int totalp;
  late String percentile;
  late int missionp;
  late int quizp;
  late int newsp;
  late int campaignp;

  mUser({
    required this.state,
    required this.name,
    required this.totalp,
    required this.percentile,
    required this.missionp,
    required this.quizp,
    required this.newsp,
    required this.campaignp,
  });

  //get
  factory mUser.fromJson(Map<String, dynamic> json) {
    return mUser(
      state: json['state'],
      name: json['name'],
      totalp: json['total_point'] as int,
      percentile: json['percentile'],
      missionp: json['mission_point'] as int,
      quizp: json['quiz_point'] as int,
      newsp: json['news_point'] as int,
      campaignp: json['campaign_point'] as int,
    );
  }

  //post
}
