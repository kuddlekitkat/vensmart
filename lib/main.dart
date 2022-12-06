import 'package:flutter/material.dart';
import 'package:testmanga/providers/AuthProvider.dart';
import 'package:testmanga/providers/CategoryProvider.dart';
import 'package:testmanga/providers/ProductProvider.dart';
import 'package:testmanga/providers/TransactionProvider.dart';
import 'package:testmanga/screens/categories.dart';
import 'package:testmanga/screens/home.dart';
import 'package:testmanga/screens/login.dart';
import 'package:testmanga/screens/register.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthProvider(),
        child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<CategoryProvider>(
                    create: (context) => CategoryProvider(authProvider)),
                ChangeNotifierProvider<ProductProvider>(
                    create: (context) => ProductProvider(authProvider)),
                ChangeNotifierProvider<TransactionProvider>(
                    create: (context) => TransactionProvider(authProvider))
              ],
              child: MaterialApp(title: 'Welcome to Flutter', routes: {
                '/': (context) {
                  final authProvider = Provider.of<AuthProvider>(context);
                  if (authProvider.isAuthenticated) {
                    return Home();
                  } else {
                    return Login();
                  }
                },
                '/login': (context) => Login(),
                '/register': (context) => Register(),
                '/home': (context) => Home(),
                '/categories': (context) => Categories(),
              }));
        }));
  }
}
