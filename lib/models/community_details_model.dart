class CommunityDetailsModel {
  String? success;
  String? message;
  Data? data;
  String? command;

  CommunityDetailsModel({this.success, this.message, this.data, this.command});

  CommunityDetailsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    command = json['command'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['command'] = command;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? jobCodeStaus;
  String? description;
  String? cityId;
  String? areaId;
  String? contact;
  String? location;
  double? latitude;
  double? longitude;
  String? city;
  String? area;
  String? pincode;
  String? areaUnitId;
  String? totalArea;
  String? unit;
  String? communityCountryCode;
  String? shortname;
  List<String>? images;

  Data(
      {this.id,
      this.name,
      this.jobCodeStaus,
      this.description,
      this.cityId,
      this.areaId,
      this.contact,
      this.location,
      this.latitude,
      this.longitude,
      this.city,
      this.area,
      this.pincode,
      this.areaUnitId,
      this.totalArea,
      this.unit,
      this.communityCountryCode,
      this.shortname,
      this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    jobCodeStaus = json['job_code_staus'];
    description = json['description'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    contact = json['contact'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    city = json['city'];
    area = json['area'];
    pincode = json['pincode'];
    areaUnitId = json['area_unit_id'];
    totalArea = json['total_area'];
    unit = json['unit'];
    communityCountryCode = json['community_country_code'];
    shortname = json['shortname'];
    if (json['images'] != null) {
      images = <String>[];
      json['images'].forEach((v) {
        images!.add(v['image']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['job_code_staus'] = jobCodeStaus;
    data['description'] = description;
    data['city_id'] = cityId;
    data['area_id'] = areaId;
    data['contact'] = contact;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['city'] = city;
    data['area'] = area;
    data['pincode'] = pincode;
    data['area_unit_id'] = areaUnitId;
    data['total_area'] = totalArea;
    data['unit'] = unit;
    data['community_country_code'] = communityCountryCode;
    data['shortname'] = shortname;
    if (images != null) {
      data['images'] = images!.map((v) => v).toList();
    }
    return data;
  }
}


