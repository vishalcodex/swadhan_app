import 'package:intl/intl.dart';

class Event {
  int? id;
  String? name;
  String? image;
  String? date;
  String? venue;
  String? description;
  String? createdAt;
  String? updatedAt;

  Event(
      {this.id,
      this.name,
      this.image,
      this.date,
      this.venue,
      this.description,
      this.createdAt,
      this.updatedAt});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    date = json["date"] == null
        ? ""
        : DateFormat("dd MMM yyyy")
            .format(DateFormat("yyyy-MM-dd").parse(json['date']));
    venue = json['venue'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['date'] = this.date;
    data['venue'] = this.venue;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
