import 'package:flutter/material.dart';
import 'package:testmanga/providers/AuthProvider.dart';
import 'package:testmanga/services/api.dart';

import '../models/product_response/product.dart';

// import '../models/product.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  late ApiService apiService;
  late AuthProvider authProvider;

  ProductProvider(this.authProvider) {
    apiService = ApiService(authProvider.token);

    init();
  }

  Future init() async {
    final data = await apiService.fetchProducts();
    if (data.data != null) products = data.data ?? [];

    /// TODO: DO SOME HANDLING HERE WHEN THERE IS NO DATA
    notifyListeners();
  }
}
