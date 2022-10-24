class MaintenanceRequestsModel {
  String? success;
  String? message;
  List<MaintenanceRequestsData>? data;
  String? command;

  MaintenanceRequestsModel(
      {this.success, this.message, this.data, this.command});

  MaintenanceRequestsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MaintenanceRequestsData>[];
      json['data'].forEach((v) {
        data!.add(MaintenanceRequestsData.fromJson(v));
      });
    }
    command = json['command'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['command'] = command;
    return data;
  }
}

class MaintenanceRequestsData {
  String? panicId;
  String? requestId;
  String? service;
  String? serviceAr;
  String? price;
  String? serviceId;
  String? onDate;
  String? timeFrom;
  String? timeTo;
  String? status;
  String? userName;
  String? userId;
  String? taskStatus;
  String? rating;
  String? comment;
  String? staffName;
  String? staffStatus;
  String? staffReason;
  String? memo;
  String? image;
  String? jobStart;
  String? jobEnd;

  MaintenanceRequestsData(
      {this.panicId,
      this.requestId,
      this.service,
      this.serviceAr,
      this.price,
      this.serviceId,
      this.onDate,
      this.timeFrom,
      this.timeTo,
      this.status,
      this.userName,
      this.userId,
      this.taskStatus,
      this.rating,
      this.comment,
      this.staffName,
      this.staffStatus,
      this.staffReason,
      this.memo,
      this.image,
      this.jobStart,
      this.jobEnd});

  MaintenanceRequestsData.fromJson(Map<String, dynamic> json) {
    panicId = json['panic_id'];
    requestId = json['request_id'];
    service = json['service'];
    serviceAr = json['service_ar'];
    price = json['price'];
    serviceId = json['service_id'];
    onDate = json['on_date'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    status = json['status'];
    userName = json['user_name'];
    userId = json['user_id'];
    taskStatus = json['task_status'];
    rating = json['rating'];
    comment = json['comment'];
    staffName = json['staff_name'];
    staffStatus = json['staff_status'];
    staffReason = json['staff_reason'];
    memo = json['memo'];
    image = json['image'];
    jobStart = json['job_start'];
    jobEnd = json['job_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['panic_id'] = panicId;
    data['request_id'] = requestId;
    data['service'] = service;
    data['service_ar'] = serviceAr;
    data['price'] = price;
    data['service_id'] = serviceId;
    data['on_date'] = onDate;
    data['time_from'] = timeFrom;
    data['time_to'] = timeTo;
    data['status'] = status;
    data['user_name'] = userName;
    data['user_id'] = userId;
    data['task_status'] = taskStatus;
    data['rating'] = rating;
    data['comment'] = comment;
    data['staff_name'] = staffName;
    data['staff_status'] = staffStatus;
    data['staff_reason'] = staffReason;
    data['memo'] = memo;
    data['image'] = image;
    data['job_start'] = jobStart;
    data['job_end'] = jobEnd;
    return data;
  }
}
