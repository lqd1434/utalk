class ChatHistory {
  String id;
  String from;
  String to;
  String content;
  String? time;

  ChatHistory({this.id = '', this.from = '', this.to = '', this.content = '', this.time});

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
