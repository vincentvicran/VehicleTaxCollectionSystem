import 'package:flutter/material.dart';
import 'package:vehicle_tax_collection_system/homePage.dart';
import 'package:vehicle_tax_collection_system/Settings/settings.dart';
import 'package:vehicle_tax_collection_system/test.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  static final List _widgetOptions = [
    HomePage(),
   Test(),
    Test(),
    Test(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Colors.black54,
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bike_scooter_outlined,),
              label: 'Vehicle Info',

            ),
            BottomNavigationBarItem(
              icon: Icon(null),
              label: "Insurance Info",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment,),
              label: 'Payment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,),
              label: 'Settings',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          backgroundColor: Colors.black54,
          unselectedItemColor: Colors.white,
          unselectedFontSize: 12.0,
          selectedFontSize: 12.0,
          iconSize: 30.0,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: Icon(Icons.info,size: 35.0,color: Colors.white,),
          // backgroundColor: Colors.white,
          onPressed: () {
            _selectedIndex=2;
            setState(() {

            });
          },
          elevation: 2.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //backgroundColor: Colors.transparent,
    );
  }
}
