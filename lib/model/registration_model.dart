// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.status,
    this.msg,
    this.description,
    this.data,
  });

  int? status;
  String? msg;
  String? description;
  Data? data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    description: json["description"] == null ? null : json["description"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "description": description == null ? null : description,
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
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.password,
    this.id,
    this.fullName,
    this.genderName,
    this.customerPhoto,
    this.defaultPhoto,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic? address;
  String? password;
  int? id;
  String? fullName;
  String? genderName;
  String? customerPhoto;
  String? defaultPhoto;

  factory CustomerInfo.fromJson(Map<String, dynamic> json) => CustomerInfo(
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    address: json["address"],
    password: json["password"] == null ? null : json["password"],
    id: json["id"] == null ? null : json["id"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    genderName: json["gender_name"] == null ? null : json["gender_name"],
    customerPhoto: json["customer_photo"] == null ? null : json["customer_photo"],
    defaultPhoto: json["default_photo"] == null ? null : json["default_photo"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "address": address,
    "password": password == null ? null : password,
    "id": id == null ? null : id,
    "full_name": fullName == null ? null : fullName,
    "gender_name": genderName == null ? null : genderName,
    "customer_photo": customerPhoto == null ? null : customerPhoto,
    "default_photo": defaultPhoto == null ? null : defaultPhoto,
  };
}
