class mNews {
  String? state;
  List<News>? news;

  mNews({this.state, this.news});

  mNews.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }
  }
}

class News {
  int? id;
  String? date;
  String? title;
  String? publisher;
  String? reporter;
  int? point;
  bool? isRead;

  News({this.id, this.date, this.title, this.point, this.isRead});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    title = json['title'];
    publisher = json['publishing_company'];
    reporter = json['reporter'];
    point = json['point'];
    isRead = json['isRead'] == 1 ? true : false;
  }
}
