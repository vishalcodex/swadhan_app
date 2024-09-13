class Video {
  int? id;
  String? title;
  String? thumbnail;
  String? link;
  String? description;
  String? createdAt;
  String? updatedAt;

  Video(
      {this.id,
      this.title,
      this.thumbnail,
      this.link,
      this.description,
      this.createdAt,
      this.updatedAt});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    link = json['link'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['link'] = this.link;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
