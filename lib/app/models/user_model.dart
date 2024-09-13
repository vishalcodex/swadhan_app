class User {
  int? id;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? firstName;
  String? lastName;
  String? birthdate;
  String? gender;
  String? phoneNumber;
  String? gstNumber;
  String? businessName;
  String? businessCategoryId;
  String? ownerName;
  String? businessDocument;
  String? officeLocation;
  String? aadharCardNumber;
  String? aadharCardUpload;
  String? panCardNumber;
  String? panCardUpload;
  String? photo;
  String? maritalStatus;
  String? location;
  String? taluka;
  String? district;
  String? state;
  String? pincode;
  String? token;
  String? password;
  int? isApproved;

  User(
      {this.id,
      this.email,
      this.createdAt,
      this.updatedAt,
      this.firstName,
      this.lastName,
      this.birthdate,
      this.gender,
      this.phoneNumber,
      this.gstNumber,
      this.businessName,
      this.businessCategoryId,
      this.ownerName,
      this.businessDocument,
      this.officeLocation,
      this.aadharCardNumber,
      this.aadharCardUpload,
      this.panCardNumber,
      this.panCardUpload,
      this.photo,
      this.token,
      this.maritalStatus,
      this.location,
      this.taluka,
      this.district,
      this.state,
      this.pincode,
      this.isApproved});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    gstNumber = json['gst_number'];
    businessName = json['business_name'];
    businessCategoryId = json['business_category_id'].toString();
    ownerName = json['owner_name'];
    businessDocument = json['business_document'];
    officeLocation = json['office_location'];
    aadharCardNumber = json['aadhar_card_number'];
    aadharCardUpload = json['aadhar_card_upload'];
    panCardNumber = json['pan_card_number'];
    panCardUpload = json['pan_card_upload'];
    photo = json['photo'];
    maritalStatus = json['marital_status'];
    location = json['location'];
    taluka = json['taluka'];
    district = json['district'];
    state = json['state'];
    pincode = json['pincode'];
    isApproved = json['is_approved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    data['phone_number'] = this.phoneNumber;
    data['gst_number'] = this.gstNumber;
    data['business_name'] = this.businessName;
    data['business_category_id'] = this.businessCategoryId;
    data['owner_name'] = this.ownerName;
    data['business_document'] = this.businessDocument;
    data['office_location'] = this.officeLocation;
    data['aadhar_card_number'] = this.aadharCardNumber;
    data['aadhar_card_upload'] = this.aadharCardUpload;
    data['pan_card_number'] = this.panCardNumber;
    data['pan_card_upload'] = this.panCardUpload;
    data['photo'] = this.photo;
    data['marital_status'] = this.maritalStatus;
    data['location'] = this.location;
    data['taluka'] = this.taluka;
    data['district'] = this.district;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['is_approved'] = this.isApproved;
    data['password'] = this.password;
    return data;
  }
}
