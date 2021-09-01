class OnlineUser {
  int id;
  String name;
  String icon;

  OnlineUser({this.id = 0, this.name = '', this.icon = ''});

  getFromMap(Map userMap) {
    print(userMap['id']);
    this.id = userMap['id'];
    this.name = userMap['name'];
    this.icon = userMap['icon'];
  }
}
