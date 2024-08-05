final class UserRequestModel {
  UserRequestModel({this.key, this.id, this.csrfToken});

  UserRequestModel.fromJson(Map<String, dynamic> json) {
    key = json['key'] as String?;
    id = json['id'] as String?;
    csrfToken = json['csrfToken'] as String?;
  }
  String? key;
  String? id;
  String? csrfToken;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['id'] = id;
    data['csrfToken'] = csrfToken;
    return data;
  }
}
