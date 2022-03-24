class mCampaign {
  String? state;
  List<Campaign>? campaign;

  mCampaign({this.state, this.campaign});

  mCampaign.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['campaign'] != null) {
      campaign = <Campaign>[];
      json['campaign'].forEach((v) {
        campaign!.add(new Campaign.fromJson(v));
      });
    }
  }
}

class Campaign {
  int? id;
  String? url;
  String? title;
  String? info;
  int? point;
  String? createdAt;
  String? updatedAt;

  Campaign(
      {this.id,
      this.url,
      this.title,
      this.info,
      this.point,
      this.createdAt,
      this.updatedAt});

  Campaign.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
    info = json['info'];
    point = json['point'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
