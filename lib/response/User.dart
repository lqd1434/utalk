// ignore_for_file: file_names
class User {
  String birth;
  String created_at;
  String email;
  int gender;
  String icon;
  int id;
  String name;
  String sign;
  String telephone;
  String updated_at;

  User(
      {this.birth = '',
      this.created_at = '',
      this.email = '',
      this.gender = 0,
      this.icon = '',
      this.id = 0,
      this.name = '',
      this.sign = '',
      this.telephone = '',
      this.updated_at = ''});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      birth: json['birth'],
      created_at: json['created_at'],
      email: json['email'],
      gender: json['gender'],
      icon: json['icon'],
      id: json['id'],
      name: json['name'],
      sign: json['sign'],
      telephone: json['telephone'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['birth'] = birth;
    data['created_at'] = created_at;
    data['email'] = email;
    data['gender'] = gender;
    data['icon'] = icon;
    data['id'] = id;
    data['name'] = name;
    data['sign'] = sign;
    data['telephone'] = telephone;
    data['updated_at'] = updated_at;
    return data;
  }
}
