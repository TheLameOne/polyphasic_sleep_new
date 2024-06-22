class TypesModel {
  int? id;
  String? scheduleType;
  String? shortDescription;
  String? totalSleep;
  String? classification;
  int? difficulty;
  String? idealScheduling;
  String? setup;
  String? link;
  String? svg;

  TypesModel(
      {this.id,
      this.scheduleType,
      this.shortDescription,
      this.totalSleep,
      this.classification,
      this.difficulty,
      this.idealScheduling,
      this.setup,
      this.link,
      this.svg});

  TypesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduleType = json['schedule_type'];
    shortDescription = json['short_description'];
    totalSleep = json['Total Sleep'];
    classification = json['classification'];
    difficulty = json['Difficulty'];
    idealScheduling = json['ideal_scheduling'];
    setup = json['setup'];
    link = json['link'];
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['schedule_type'] = this.scheduleType;
    data['short_description'] = this.shortDescription;
    data['Total Sleep'] = this.totalSleep;
    data['classification'] = this.classification;
    data['Difficulty'] = this.difficulty;
    data['ideal_scheduling'] = this.idealScheduling;
    data['setup'] = this.setup;
    data['link'] = this.link;
    data['svg'] = this.svg;
    return data;
  }
}
