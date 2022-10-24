class MaintenanceByIdModel {
  String? success;
  String? message;
  RequestDetailsData? data;
  String? command;

  MaintenanceByIdModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? RequestDetailsData.fromJson(json['data']) : null;
    command = json['command'];
  }
}

class RequestDetailsData {
  String? id;
  String? userId;
  String? communityId;
  String? serviceId;
  String? price;
  String? deposit;
  String? onDate;
  String? timeFrom;
  String? timeTo;
  String? onTime;
  String? status;
  String? staffId;
  String? description;
  String? flatId;
  String? taskStatus;
  String? rating;
  String? comment;
  String? createdBy;
  String? createdOn;
  String? updatedOn;
  String? staffStatus;
  String? staffReason;
  String? staffComment;
  String? document;
  String? permit;
  String? paid;
  String? payStatus;
  String? image;
  String? memo;
  String? service;
  String? serviceAr;
  String? userName;
  String? staffName;
  String? jobStart;
  String? jobEnd;

  RequestDetailsData(
      {this.id,
      this.userId,
      this.communityId,
      this.serviceId,
      this.price,
      this.deposit,
      this.onDate,
      this.timeFrom,
      this.timeTo,
      this.onTime,
      this.status,
      this.staffId,
      this.description,
      this.flatId,
      this.taskStatus,
      this.rating,
      this.comment,
      this.createdBy,
      this.createdOn,
      this.updatedOn,
      this.staffStatus,
      this.staffReason,
      this.staffComment,
      this.document,
      this.permit,
      this.paid,
      this.payStatus,
      this.image,
      this.memo,
      this.service,
      this.serviceAr,
      this.userName,
      this.staffName,
      this.jobStart,
      this.jobEnd});

  factory RequestDetailsData.fromJson(dynamic json) {
    return RequestDetailsData(
      id: json['id'],
      userId: json['user_id'],
      communityId: json['community_id'],
      serviceId: json['service_id'],
      price: json['price'],
      deposit: json['deposit'],
      onDate: json['on_date'],
      timeFrom: json['time_from'],
      timeTo: json['time_to'],
      onTime: json['on_time'],
      status: json['status'],
      staffId: json['staff_id'],
      description: json['description'],
      flatId: json['flat_id'],
      taskStatus: json['task_status'],
      rating: json['rating'],
      comment: json['comment'],
      createdBy: json['created_by'],
      createdOn: json['created_on'],
      updatedOn: json['updated_on'],
      staffStatus: json['staff_status'],
      staffReason: json['staff_reason'],
      staffComment: json['staff_comment'],
      document: json['document'],
      permit: json['permit'],
      paid: json['paid'],
      payStatus: json['pay_status'],
      image: json['image'],
      memo: json['memo'],
      service: json['service'],
      serviceAr: json['service_ar'],
      userName: json['user_name'],
      staffName: json['staff_name'],
      jobStart: json['job_start'],
      jobEnd: json['job_end'],
    );
  }
}
