import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:dio/dio.dart';

import 'package:gunio/models/auth.dart';

const API_HOST = "http://192.168.0.101:8000/";

class GenericResponse {
  late int statusCode;

  GenericResponse(this.statusCode);

  GenericResponse.fromResponse(Response response) {

    statusCode = response.statusCode!;
  }
}

class LoginResponse extends GenericResponse {
  final AuthTokens authTokens;

  LoginResponse(statusCode, this.authTokens) : super(statusCode);
}

class RegisterResponse extends GenericResponse {
  final HashMap<String, String> validationErrors;

  RegisterResponse(statusCode, this.validationErrors) : super(statusCode);
}

class CreateRealtyItemResponse extends GenericResponse {
  CreateRealtyItemResponse(statusCode) : super(statusCode);
}

class APIClient {
  final Dio _dio = Dio();

  Future<AuthTokens?> refreshToken(BuildContext context) async {
    final AuthTokens? authTokens = await getCurrentTokens();
    if (authTokens == null) {
      return null;
    }
    return _dio
        .post(API_HOST + "jwt/refresh/",
        data: {'refresh': authTokens.refreshToken},
        options: Options(validateStatus: (status) => status! < 500))
        .then((response) {
      authTokens.accessToken = response.data['access'];
      if (response.data['access'] != null) {
        authTokens.save();
        return authTokens;
      }
      return null;
    });
  }

  void createRealtyItem(point, name, type, transaction, Function(CreateRealtyItemResponse) callback) {
    _dio
        .post(API_HOST,
        data: {
          // 'seller_point': point,
          // 'seller_name': name,
          // 'seller_type': type,
          // 'seller_transaction': transaction,
        },
        options: Options(validateStatus: (status) => status! < 500))
        .then((response) {
      callback(new CreateRealtyItemResponse(response.statusCode));
    });
  }
  /*
  void listRealtyItems() {
    _dio
        .get(API_HOST + "realty/?point=42.34,74.124&point=42.2352,74.424",
        options: Options(validateStatus: (status) => status < 500))
        .then((response) {
      callback(new RealtyListResponse(response.statusCode));
    });
  }

   */
  void login(password, phone_number, Function(LoginResponse) callback) {

    _dio
        .post(API_HOST + "jwt/create/",
        data: {
          'password': password,
          'phone number': phone_number,
        }, //password
        options: Options(validateStatus: (status) => status! < 500))
        .then((response) {
      AuthTokens? authTokens = response.statusCode == 200
          ? AuthTokens.fromJson(response.data)
          : null;
      authTokens?.save();
      callback(new LoginResponse(response.statusCode, authTokens!));
    });
  }

  void register(String phone_number, String password, String first_name, String last_name, String how_do_you_know,
      Function(RegisterResponse) callback) async {
    _dio
        .post(API_HOST + "users/",
        data: {
          'phone number': phone_number,
          'password': password,
          'first name': first_name,
          'last name': last_name,
          'how do you know': how_do_you_know,
        },
        options: Options(validateStatus: (status) => status! < 500))
        .then((response) {
      callback(new RegisterResponse(
          response.statusCode,
          HashMap.from(response.data.map((key, value) => MapEntry(
              key.toString(),
              value != null ? value[0].toString() : null)))));
    });
  }
}