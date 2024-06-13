class QnaModel {
  String? question;
  List<String>? answer;

  QnaModel({this.question, this.answer});

  QnaModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}
