import 'package:flutter/material.dart';
import 'package:restaurants/screens/profile.dart';
import 'package:restaurants/screens/restaurants.dart';
import 'package:restaurants/screens/map_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    RestaurantsScreen(),
    MapScreen(x: 18.850608243826077, y: -99.20070330026431),
    Profile()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: _widgetOptions.elementAt(_selectedIndex), 
    bottomNavigationBar: Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white, 
      ),
      child:  BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Restaurantes',
          ),
         
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(icon: 
          Icon(Icons.person),
          label: 'Perfil')
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(242, 148, 165, 1),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        onTap: _onItemTapped,
      ),
    ),
  );
}

}
