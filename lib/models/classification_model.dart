class ClassificationModel {
  String? scheduleName;
  String? shortDescription;
  String? difficulty;
  String? totalSleep;
  String? link;
  List<int>? contains;

  ClassificationModel(
      {this.scheduleName,
      this.shortDescription,
      this.difficulty,
      this.totalSleep,
      this.link,
      this.contains});

  ClassificationModel.fromJson(Map<String, dynamic> json) {
    scheduleName = json['schedule_name'];
    shortDescription = json['short_description'];
    difficulty = json['Difficulty'];
    totalSleep = json['Total Sleep'];
    link = json['link'];
    contains = json['contains'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_name'] = this.scheduleName;
    data['short_description'] = this.shortDescription;
    data['Difficulty'] = this.difficulty;
    data['Total Sleep'] = this.totalSleep;
    data['link'] = this.link;
    data['contains'] = this.contains;
    return data;
  }
}
