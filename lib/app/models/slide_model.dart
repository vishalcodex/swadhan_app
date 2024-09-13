import '../providers/api_endpoints.dart';

class Slide {
  int? id;
  String? sliderImage;
  String? sliderName;
  String? sliderDescription;
  String? createdAt;
  String? updatedAt;

  Slide(
      {this.id,
      this.sliderImage,
      this.sliderName,
      this.sliderDescription,
      this.createdAt,
      this.updatedAt});

  Slide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sliderImage = Urls.getImageUrl(json['image']);
    sliderName = json['name'] ?? json["title"];
    sliderDescription = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slider_image'] = this.sliderImage;
    data['slider_name'] = this.sliderName;
    data['slider_description'] = this.sliderDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
