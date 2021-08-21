class ApiResultModel {
  bool ok;
  LinkModel result;

  ApiResultModel({required this.ok, required this.result});

  static fromJson(Map<String, dynamic> json) {
    return ApiResultModel(
        ok: json['ok'], result: LinkModel.fromJson(json['result']));
  }
}

class LinkModel {
  String code;
  String short_link;
  String full_short_link;
  String short_link2;
  String full_short_link2;
  String share_link;
  String full_share_link;
  String original_link;

  LinkModel(
      {required this.code,
      required this.short_link,
      required this.full_short_link,
      required this.short_link2,
      required this.full_short_link2,
      required this.share_link,
      required this.full_share_link,
      required this.original_link});

  static fromJson(Map<String, dynamic> json) {
    return LinkModel(
        code: json['code'],
        short_link: json['short_link'],
        full_short_link: json['full_short_link'],
        short_link2: json['short_link2'],
        full_short_link2: json['full_short_link2'],
        share_link: json['share_link'],
        full_share_link: json['full_share_link'],
        original_link: json['original_link']);
  }
}
