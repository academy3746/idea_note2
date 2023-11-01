class IdeaInfo {
  /// Instance
  int? id; // AUTO INCREMENT
  String title; // 아이디어 제목
  String motive; // 아이디어 동기
  String content; // 아이디어 내용
  int importance; // 아이디어 중요도 점수
  String feedback; // 유저 피드백
  int datetime; // 게시글 작성 시간

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
  /// <form method="post" action="">
  ///   <input type="hidden" value="">
  /// </form>
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
  /// print_r($_POST)
  /// $instance = $_POST["key"]
  factory IdeaInfo.fromMap(Map<String, dynamic> map) {
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
