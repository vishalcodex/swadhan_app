class Package {
  int? id;
  String? packageName;
  String? packageDescription;
  String? packagePrice;
  int? numberOfDays;
  String? createdAt;
  String? updatedAt;

  Package(
      {this.id,
      this.packageName,
      this.packageDescription,
      this.packagePrice,
      this.numberOfDays,
      this.createdAt,
      this.updatedAt});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    packageDescription = json['package_description'];
    packagePrice = json['package_price'];
    numberOfDays = json['number_of_days'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['package_name'] = this.packageName;
    data['package_description'] = this.packageDescription;
    data['package_price'] = this.packagePrice;
    data['number_of_days'] = this.numberOfDays;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
