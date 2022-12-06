import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:testmanga/models/category.dart';
import 'package:testmanga/models/transaction.dart';

import '../models/product.dart';

class ApiService {
  late String token;

  ApiService(String token) {
    this.token = token;
  }

  final String baseUrl = 'http://flutter-api.laraveldaily.com/api/';

  final String productUrl = 'https://api.vensemart.com/api/';

  Future<List<Category>> fetchCategories() async {
    http.Response response = await http.get(
      Uri.parse(baseUrl + 'categories'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    List categories = jsonDecode(response.body);

    return categories.map((category) => Category.fromJson(category)).toList();
  }

  Future<Category> addCategory(String name) async {
    String uri = baseUrl + 'categories';

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
    String uri = baseUrl + 'categories/' + category.id.toString();

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
    String uri = baseUrl + 'categories/' + id.toString();
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
      Uri.parse(baseUrl + 'transactions'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      },
    );

    List transactions = jsonDecode(response.body);

    return transactions.map((transaction) => Transaction.fromJson(transaction)).toList();
  }

  Future<Transaction> addTransaction(String amount, String category, String description, String date) async {
    String uri = baseUrl + 'transactions';

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
    String uri = baseUrl + 'transactions/' + transaction.id.toString();

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
    String uri = baseUrl + 'transactions/' + id.toString();
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

  Future<String> register(String name, String email, String password,
      String passwordConfirm, String deviceName) async {
    String uri = productUrl + 'register';

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirm,
          'device_name': deviceName
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
    return response.body;
  }

  Future<String> login(String email, String password, String deviceName) async {
    String uri = productUrl + 'login';

    http.Response response = await http.post(Uri.parse(uri),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.acceptHeader: 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'device_name': deviceName
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
    return response.body;
  }




    Future<List<Product>> fetchProducts() async {



    http.Response response = await http.get(
      Uri.parse(productUrl + 'product_details/8'),
      headers: {
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiM2UwZWRiOGU0NjcxODIxMTlkYTE3NzU0Y2VmMmU2ZGNkZGVjOTRmNzNmMmY1YWI4MGUzMzc3NzcxYjZjMmIzZTBkZGI2MmY1NmVjYmRlNDEiLCJpYXQiOjE2NzAxODM0OTUuNDk2MDgzLCJuYmYiOjE2NzAxODM0OTUuNDk2MDksImV4cCI6MTcwMTcxOTQ5NS40NzY5NjUsInN1YiI6IjMzMCIsInNjb3BlcyI6W119.JYHgcJnAmBW6kuh4mitw6Wrx5p8GHS8zGKqs8TGo_L83FD7QeH9n5hbXvr07z-nGqIjj7mhiAZ3mu5qf40-1Q-N3AUv5DBUGoj2zfWYPh27X6lD-St-1OfwTjeUHf_WFvKSAcUlVlmjo8SkW7bMyWjKjuupoSlYbAIJPKXDHnjM3g79x3I_Yk7_aBvlIy_uhmZl7sdE-17bAvdAhvD9CYBnHMN0mbFA7R1P0miHV6W53N5girpK6WhajhLFjYjBSG6eMa2FtYzTbtccbk4T8s34kleIXxJiwT-4mG5N1hRyjMPlAhV5X9K0MiqmfukVK0BKFQHWJSd-Dsl3i4RyhmSEaPSt1KvfjGse9Q9xdKoZHcyKCHx_mSW0oWTvIhGy_0yO0C_dYVdKlMEftIdZR3ThqxBdlMIgxz2ocz8XX0VGy2CcixTLcWf2z7-Cvh3y-NG5WGD11L8bSTPFAny_Dcsp1-PZ4o73C-dJje7zjTN6dB2gD-jusL5fWh0gICwbdGHEBspkM4en2scknzb2-xMsach8Aj-n_QUCCYTCWDfyka66meC-_49JD43RNnRETHaF7F9PBi78fKzqYUH2yQgAtMI26NKfidyCzBXfi40vlwmYFxjVwqL9Db23J8CSGF8Cmel8aS5veAsqVAq30Tw8D3iecghENXA1g36pcaoQ'
      },
    );

    final extractedData = jsonDecode(response.body)['data'];
    print(extractedData);
    List products = jsonDecode(extractedData);

    print(products.length);
    return products.map((product) => Product.fromJson(product)).toList();

     }
    }
