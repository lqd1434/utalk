class ResToJs<T> {
  String? name = '';
  String? type = 'state';
  T? data;
  String? desc = '';

  ResToJs({this.name, this.data, this.desc, this.type});

  static ResToJs fromJson(Map resJson) {
    var res = ResToJs();
    res.name = resJson['name'];
    res.type = resJson['type'];
    res.data = resJson['data'];
    res.desc = resJson['desc'];
    return res;
  }

  static Map toJson(ResToJs resFromJs) {
    var res = {};
    res['name'] = resFromJs.name;
    res['type'] = resFromJs.type;
    res['data'] = resFromJs.data;
    res['desc'] = resFromJs.desc;
    return res;
  }
}
