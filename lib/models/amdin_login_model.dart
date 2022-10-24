class AdminLoginModel {
  String? success;
  String? message;
  LoginData? data;
  String? command;

  AdminLoginModel({this.success, this.message, this.data, this.command});

  AdminLoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ?  LoginData.fromJson(json['data']) : null;
    command = json['command'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['command'] = command;
    return data;
  }
}

class LoginData {
  String? userId;
  String? name;
  String? email;
  String? image;
  String? mobile;
  String? countryCode;
  String? status;
  String? userType;
  String? communityName;
  String? communityId;
  String? isVerified;
  String? isApproved;
  String? communityStatus;
  String? communityCountryCode;
  String? areaUnitId;
  String? unit;
  String? userStatus;

  LoginData(
      {this.userId,
        this.name,
        this.email,
        this.image,
        this.mobile,
        this.countryCode,
        this.status,
        this.userType,
        this.communityName,
        this.communityId,
        this.isVerified,
        this.isApproved,
        this.communityStatus,
        this.communityCountryCode,
        this.areaUnitId,
        this.unit,
        this.userStatus});

  LoginData.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    mobile = json['mobile'];
    countryCode = json['country_code'];
    status = json['status'];
    userType = json['user_type'];
    communityName = json['community_name'];
    communityId = json['community_id'];
    isVerified = json['is_verified'];
    isApproved = json['is_approved'];
    communityStatus = json['community_status'];
    communityCountryCode = json['community_country_code'];
    areaUnitId = json['area_unit_id'];
    unit = json['unit'];
    userStatus = json['user_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['mobile'] = mobile;
    data['country_code'] = countryCode;
    data['status'] = status;
    data['user_type'] = userType;
    data['community_name'] = communityName;
    data['community_id'] = communityId;
    data['is_verified'] = isVerified;
    data['is_approved'] = isApproved;
    data['community_status'] = communityStatus;
    data['community_country_code'] = communityCountryCode;
    data['area_unit_id'] = areaUnitId;
    data['unit'] = unit;
    data['user_status'] = userStatus;
    return data;
  }
}
