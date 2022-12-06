import 'package:flutter/material.dart';
import 'package:testmanga/providers/AuthProvider.dart';
import 'package:testmanga/screens/categories.dart';
import 'package:testmanga/screens/products.dart';
import 'package:testmanga/screens/transactions.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = [products()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: widgetOptions.elementAt(selectedIndex),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Products'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.logout), label: 'Log out')
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
          ),
        ),
      ),
    );
  }

  Future<void> onItemTapped(int index) async {
    if (index == 1) {
      final AuthProvider provider =
          Provider.of<AuthProvider>(context, listen: false);

      await provider.logOut();
    } else {
      setState(() {
        selectedIndex = index;
      });
    }
  }
}
