class ScheduleModel {
  String? scheduleName;
  String? link;
  List<ScheduleTypeModel>? types;

  ScheduleModel({
    this.scheduleName,
    this.link,
  });

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    scheduleName = json['schedule_name'];
    if (json['types'] != null) {
      types = <ScheduleTypeModel>[];
      json['types'].forEach((v) {
        types!.add(ScheduleTypeModel.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_name'] = this.scheduleName;
    if (this.types != null) {
      data['types'] = this.types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ScheduleTypeModel {
  String? scheduleType;
  String? duration;
  String? classification;
  String? specification;
  String? mechanism;
  String? adaptationDifficulty;
  String? idealScheduling;
  String? link;

  ScheduleTypeModel(
      {this.scheduleType,
      this.duration,
      this.classification,
      this.specification,
      this.mechanism,
      this.adaptationDifficulty,
      this.idealScheduling,
      this.link});

  ScheduleTypeModel.fromJson(Map<String, dynamic> json) {
    scheduleType = json["schedule_type"];
    duration = json["duration"];
    classification = json["classification"];
    specification = json["specification"];
    mechanism = json["mechanism"];
    adaptationDifficulty = json["adaptation_difficulty"];
    idealScheduling = json["ideal_scheduling"];
    link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["schedule_type"] = scheduleType;
    data["duration"] = duration;
    data["classification"] = classification;
    data["specification"] = specification;
    data["mechanism"] = mechanism;
    data["adaptation_difficulty"] = adaptationDifficulty;
    data["ideal_scheduling"] = idealScheduling;
    data["link"] = link;
    return data;
  }
}
