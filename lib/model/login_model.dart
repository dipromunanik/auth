// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.msg,
    this.discription,
    this.data,
  });

  int? status;
  String? msg;
  String? discription;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    discription: json["discription"] == null ? null : json["discription"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "discription": discription == null ? null : discription,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.customerInfo,
    this.apiToken,
  });

  CustomerInfo? customerInfo;
  String? apiToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerInfo: json["customer_info"] == null ? null : CustomerInfo.fromJson(json["customer_info"]),
    apiToken: json["api_token"] == null ? null : json["api_token"],
  );

  Map<String, dynamic> toJson() => {
    "customer_info": customerInfo == null ? null : customerInfo!.toJson(),
    "api_token": apiToken == null ? null : apiToken,
  };
}

class CustomerInfo {
  CustomerInfo({
    this.id,
    this.customerId,
    this.deviceId,
    this.apiToken,
    this.lastLogin,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? customerId;
  String? deviceId;
  String? apiToken;
  dynamic? lastLogin;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
    id: json["id"] == null ? null : json["id"],
    customerId: json["customer_id"] == null ? null : json["customer_id"],
    deviceId: json["device_id"] == null ? null : json["device_id"],
    apiToken: json["api_token"] == null ? null : json["api_token"],
    lastLogin: json["last_login"],
    status: json["status"] == null ? null : json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "customer_id": customerId == null ? null : customerId,
    "device_id": deviceId == null ? null : deviceId,
    "api_token": apiToken == null ? null : apiToken,
    "last_login": lastLogin,
    "status": status == null ? null : status,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
  };
}
