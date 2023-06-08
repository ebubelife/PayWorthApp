import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:dio/dio.dart' as eos;

class Auth {
  //static String userId = Hive.box('name').get('userID');
  static String baseUrl = "http://192.168.43.183:8000/api/";

  Future<dynamic> signup({
    @required String? username,
    @required String? email,
    @required String? password,
    @required String? dob,
    @required String? gender,
    @required String? phone,
    @required String? address,
    @required String? firstName,
    @required String? lastName,
  }) async {
    var dio = eos.Dio();

    var formData = eos.FormData.fromMap({
      'username': username,
      'email': email,
      'password': password,
      'gender': gender,
      'phone': phone,
      'dob': "20/12/23",
      'first_name': firstName,
      'last_name': lastName,
      'address': address,
    });

    try {
      var response = await dio.post('${baseUrl}signup',
          data: formData,
          options: eos.Options(
            headers: {
              "accept": "application/json",
            },
          ));

      print(response.data.toString());
      var data = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("oleku " + data["user_id"].toString());
        Hive.box("payworth").put("user_id", data["user_id"].toString());
        return 201;
      }
    } on eos.DioError catch (e) {
      if (e.response!.statusCode == 406) {
        return 406;
      } else {
        return e.response!.statusCode;
      }
    }
  }

  Future<dynamic> login({
    @required String? password,
    @required String? email,
  }) async {
    var dio = eos.Dio();

    var formData = eos.FormData.fromMap({
      'email': email,
      'password': password,
    });

    try {
      var response = await dio.post('${baseUrl}login',
          data: formData,
          options: eos.Options(
            headers: {
              "accept": "application/json",
            },
          ));

      print(response.data.toString());
      var data = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        Hive.box("payworth").put("user_details", data["user_details"]);
        Hive.box("payworth").put("access_token", data["access_token"]);

        Hive.box("payworth")
            .put("login_pin", data["user_details"]["login_pin"]);

        print(data["user_details"]["login_pin"]);
        return 201;
      }
    } on eos.DioError catch (e) {
      if (e.response!.statusCode == 405) {
        return 405;
      } else if (e.response!.statusCode == 403) {
        return 403;
      } else {
        return 500;
      }
    }
  }

  Future<dynamic> verifyEmail({
    @required String? code,
  }) async {
    var dio = eos.Dio();
    String user_id = Hive.box("payworth").get("user_id");

    var formData = eos.FormData.fromMap({
      'otp': code,
      'user_id': int.parse(user_id),
    });

    try {
      var response = await dio.post('${baseUrl}verify_email_otp',
          data: formData,
          options: eos.Options(
            headers: {
              "accept": "application/json",
            },
          ));

      print(response.data.toString());
      var data = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 201;
      }
    } on eos.DioError catch (e) {
      if (e.response!.statusCode == 406) {
        print(e.response!.statusCode.toString());
        return 406;
      } else {
        print(e.response!.statusCode.toString());
        return e.response!.statusCode;
      }
    }
  }

  Future<dynamic> setTransactionPin({
    @required String? pin,
  }) async {
    var dio = eos.Dio();
    String user_id = Hive.box("payworth").get("user_id");

    String accessToken = Hive.box("payworth").get("access_token");

    var formData = eos.FormData.fromMap({
      'transaction_pin': pin,
      'user_id': int.parse(user_id),
    });

    try {
      var response = await dio.post('${baseUrl}set_transaction_pin',
          data: formData,
          options: eos.Options(
            headers: {
              "accept": "application/json",
              "Authorization": "Bearer $accessToken",
            },
          ));

      print(response.data.toString());
      var data = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        Hive.box("payworth").put("loggedIn", true);
        return 201;
      }
    } on eos.DioError catch (e) {
      if (e.response!.statusCode == 500) {
        print(e.response!.statusCode.toString());
        return 500;
      } else {
        print(e.response!.statusCode.toString());
        return e.response!.statusCode;
      }
    }
  }

  Future<dynamic> setLoginPin({
    @required String? pin,
  }) async {
    var dio = eos.Dio();
    String userID = Hive.box("payworth").get("user_id");
    String accessToken = Hive.box("payworth").get("access_token");

    var formData = eos.FormData.fromMap({
      'login_pin': pin,
      'user_id': int.parse(userID),
    });

    try {
      var response = await dio.post('${baseUrl}set_login_pin',
          data: formData,
          options: eos.Options(
            headers: {
              "accept": "application/json",
              "Authorization": "Bearer $accessToken",
            },
          ));

      print(response.data.toString());
      var data = response.data;
      if (response.statusCode == 200 || response.statusCode == 201) {
        return 201;
      }
    } on eos.DioError catch (e) {
      print("oleku  " + e.response!.statusCode.toString());

      if (e.response!.statusCode == 500) {
        print(e.response!.statusCode.toString());
        return 500;
      } else {
        print(e.response!.statusCode.toString());
        return e.response!.statusCode;
      }
    }
  }
}
