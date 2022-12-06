import 'package:flutter/material.dart';
import 'package:testmanga/models/product.dart';
import 'package:testmanga/providers/AuthProvider.dart';
import 'package:testmanga/services/api.dart';

import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  late ApiService apiService;
  late AuthProvider authProvider;

  ProductProvider(AuthProvider authProvider) {
    this.authProvider = authProvider;
    this.apiService = ApiService(authProvider.token);

    init();
  }

  Future init() async {
    products = await apiService.fetchProducts();
    notifyListeners();
  }


}