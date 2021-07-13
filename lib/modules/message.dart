class MessageBody {

  String userId;
  String friendId;
  String content;


  MessageBody(this.userId, this.friendId, this.content);

  MessageBody.fromJsonMap(Map<String, dynamic> map):
        userId = map["userId"],
        friendId = map["friendId"],
        content = map["content"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['friendId'] = friendId;
    data['content'] = content;
    return data;
  }
}