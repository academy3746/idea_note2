class IdeaInfo {
  /// Instance
  int? id; // PK (AUTO INCREMENT: Index of table)
  String title;
  String motive;
  String content;
  int importance;
  String feedback;
  int datetime;

  /// Constructor
  IdeaInfo({
    this.id,
    required this.title,
    required this.motive,
    required this.content,
    required this.importance,
    required this.feedback,
    required this.datetime,
  });

  /// ToMap
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "motive": motive,
      "content": content,
      "importance": importance,
      "feedback": feedback,
      "datetime": datetime,
    };
  }

  /// FromMap
  factory IdeaInfo.formMap(Map<String, dynamic> map) {
    return IdeaInfo(
      id: map["id"],
      title: map["title"],
      motive: map["motive"],
      content: map["content"],
      importance: map["importance"],
      feedback: map["feedback"],
      datetime: map["datetime"],
    );
  }
}
