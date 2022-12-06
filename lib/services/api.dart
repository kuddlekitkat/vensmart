import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testmanga/models/category.dart';
import 'package:testmanga/models/transaction.dart';

import '../models/auth_response/auth_response.dart';
// import '../models/product.dart';
import '../models/product_response/product.dart';
import '../models/product_response/product_response.dart';

class ApiService {
  late String token;

  ApiService(String token) {
    this.token = token;
  }

  final String baseUrl = 'http://flutter-api.laraveldaily.com/api/';

  final String productUrl = 'https://api.vensemart.com/api/';

  Future<List<Category>> fetchCategories() async {
    http.Response response = await http.get(
      Uri.parse('${baseUrl}categories'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    List categories = jsonDecode(response.body);

    return categories.map((category) => Category.fromJson(category)).toList();
  }

  Future<Category> addCategory(String name) async {
    String uri = '${baseUrl}categories';

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
        body: jsonEncode({'name': name}));

    if (response.statusCode != 201) {
      throw Exception('Error happened on create');
    }

    return Category.fromJson(jsonDecode(response.body));
  }

  Future<Category> updateCategory(Category category) async {
    String uri = '${baseUrl}categories/${category.id}';

    http.Response response = await http.put(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
        body: jsonEncode({'name': category.name}));

    if (response.statusCode != 200) {
      throw Exception('Error happened on update');
    }

    return Category.fromJson(jsonDecode(response.body));
  }

  Future<void> deleteCategory(id) async {
    String uri = '${baseUrl}categories/$id';
    http.Response response = await http.delete(
      Uri.parse(uri),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Error happened on delete');
    }
  }

  Future<List<Transaction>> fetchTransactions() async {
    http.Response response = await http.get(
      Uri.parse('${baseUrl}transactions'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    List transactions = jsonDecode(response.body);

    return transactions
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();
  }

  Future<Transaction> addTransaction(
      String amount, String category, String description, String date) async {
    String uri = '${baseUrl}transactions';

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
        body: jsonEncode({
          'amount': amount,
          'category_id': category,
          'description': description,
          'transaction_date': date
        }));

    if (response.statusCode != 201) {
      throw Exception('Error happened on create');
    }

    return Transaction.fromJson(jsonDecode(response.body));
  }

  Future<Transaction> updateTransaction(Transaction transaction) async {
    String uri = '${baseUrl}transactions/${transaction.id}';

    http.Response response = await http.put(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
        body: jsonEncode({
          'amount': transaction.amount,
          'category_id': transaction.categoryId,
          'description': transaction.description,
          'transaction_date': transaction.transactionDate
        }));

    if (response.statusCode != 200) {
      throw Exception('Error happened on update');
    }

    return Transaction.fromJson(jsonDecode(response.body));
  }

  Future<void> deleteTransaction(id) async {
    String uri = '${baseUrl}transactions/$id';
    http.Response response = await http.delete(
      Uri.parse(uri),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    if (response.statusCode != 204) {
      throw Exception('Error happened on delete');
    }
  }

  Future<AuthResponse> register(String name, String email, String password,
      String passwordConfirm, String deviceName) async {
    String uri = '${productUrl}register';

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        /*    body: jsonEncode({
        /// TODO: MAKE THIS TYPE ID FIELD DYNAMIC
        'type': 23,
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirm,
        'device_name': deviceName
      }), */

        /// TODO: MAKE All THIS FIELDS DYNAMIC

        body: jsonEncode({
          "type": 903,
          "device_id": "123123132133324",
          "device_type": "ios",
          "device_name": "iphone 12",
          "device_token":
              "fWmhg-bbSfGEqOoHZkKCmj:APA91bGpk7jbGRVP75GFgf0g65_mDjYpWI259vsgAlcm_3EXqVI-h4n069lhPC1euSKSuUfDolkUZnW6OXIN7oQc3YpMeUPYUeXi9AgHAGEg_SE9xmtlrRhdnf2PSVpEM73flWRxi3vxV1",
          "name": "David Adokuru1",
          "email": "gsdfsdf@gmail.com",
          "mobile": "9054354353453",
          "password": "Mypassword12",
          "state": "FCT",
          "town": "Abuja"
        }));

    if (response.statusCode == 422) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> errors = body['errors'];
      String errorMessage = '';
      errors.forEach((key, value) {
        value.forEach((element) {
          errorMessage += element + '\n';
        });
      });
      throw Exception(errorMessage);
    }

    // return token
    return AuthResponse.fromJson(json.decode(response.body));
  }

  Future<AuthResponse> login(
      String email, String password, String deviceName) async {
    String uri = '${productUrl}login';

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },

        /// TODO: MAKE All THIS FIELDS DYNAMIC

        body: jsonEncode({
          "type": 1,
          "device_id": "12312313213",
          "device_type": "ios",
          "device_name": "iphone 12",
          "device_token":
              "fWmhg-bbSfGEqOoHZkKCmj:APA91bGpk7jbGRVP75GFgf0g65_mDjYpWI259vsgAlcm_3EXqVI-h4n069lhPC1euSKSuUfDolkUZnW6OXIN7oQc3YpMeUPYUeXi9AgHAGEg_SE9xmtlrRhdnf2PSVpEM73flWRxivxV",
          "username": "08055636587",
          "email": "davidadokuru1@gmail.com",
          "mobile": "08055636587",
          "password": "Mypassword12"
        }));

    if (response.statusCode == 422) {
      Map<String, dynamic> body = jsonDecode(response.body);
      Map<String, dynamic> errors = body['errors'];
      String errorMessage = '';
      errors.forEach((key, value) {
        value.forEach((element) {
          errorMessage += element + '\n';
        });
      });
      throw Exception(errorMessage);
    }

    // return token
    return AuthResponse.fromJson(json.decode(response.body));
  }

  Future<ProductResponse> fetchProducts() async {
    http.Response response = await http.get(
      Uri.parse('${productUrl}products/1'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzNhNjlkMDk2YWEyYjIzZGExOWI0Zjk4NzRmN2E4ZWY3ZDQzNjkwODhjMjQ5NWZiNTZjYjNmYzdhZTc4NTA3NjRjNzg0NjQzMTU1ODIyZGYiLCJpYXQiOjE2NzAzNTg4MTAuNTQ5NTMyLCJuYmYiOjE2NzAzNTg4MTAuNTQ5NTM3LCJleHAiOjE3MDE4OTQ4MTAuNTM2MzgsInN1YiI6IjMzNyIsInNjb3BlcyI6W119.IkNzLfeh57SvSgRuky6awpmQFWLMUKClCh76g2yASWyElij5BxnyJBeJzaoVoRkADeB0a0RZBwpqTdIA1Jtz7gRDNRxATMEr1XuBb2oubrwix1B5nwlIpJxRKVKA1ttn6yVRLt_AnqfM7iBV0nxmV_W_Z7D0Pw0qyzENlI2GEWxFXRTGoen4sDVs9kQdYtx0l5X80lOdhtoKGBMUj4PWyGpalJev8hi-7S-lZwDfW32eO5FDH--E-Tw_tqd6ZpbHEekDRJI6tGFtpkY18hJr_QREfJIV8Lvbzkv3wvv44U5rhBweMbvF-6ckS6pCqhoN_F3PmZYZBVoE7FHJxMqCuq9D59IOxofbuEartRog6Vbr5tU3u8s3jtNPDJHVuqv8dhnM77YtdzgvE0lcMEV-fNkbHGlLle0JE7_QCIF_SdGgEuA7S-6vIXUv423s45peJGqX0ybfodXLLJnq32cT0P9fvfmR2fXROYbhEc0P2S0pOvS7a-qZzImr7EgtpI5En7q897Yma99CubNfzx0phF_y2m2a8yszErWoW4Ef8pHW_FsVH2bXnGgowqjjjWBDbUa_e9kZow4LcP_iBOhiNLssjyCj2IEEAwiGzX0_9Zh_ILipcBDUGdbSTQuntBs70awNfXZhSeCuSgxDpBcHPw8SDpg1fVJpYi4DTpBom20'
      },
    );

    print('Jaycee was here: ${response.body}');

    // final extractedData = jsonDecode(response.body)['data'];
    // print(extractedData);
    // List products = jsonDecode(extractedData);

    return ProductResponse.fromJson(json.decode(response.body));
  }
}
