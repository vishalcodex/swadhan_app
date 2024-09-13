class Setting {
  int? id;
  String? content;
  String? createdAt;
  String? updatedAt;

  Setting({this.id, this.content, this.createdAt, this.updatedAt});

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Notice {
  int? id;
  String? notice;
  String? createdAt;
  String? updatedAt;

  Notice({this.id, this.notice, this.createdAt, this.updatedAt});

  Notice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notice = json['notice'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notice'] = this.notice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
