class ChatHistory {
  int id;
  int from;
  int to;
  String content;
  String? time;

  ChatHistory({this.id = 0, this.from = 0, this.to = 0, this.content = '', this.time});

  static ChatHistory fromJson(Map jsonString) {
    var res = ChatHistory();
    res.id = jsonString['id'];
    res.from = jsonString['from'];
    res.to = jsonString['to'];
    res.content = jsonString['content'];
    res.time = jsonString['time'];
    return res;
  }
}
