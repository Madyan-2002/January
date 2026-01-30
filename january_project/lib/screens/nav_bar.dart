import 'package:flutter/material.dart';
import 'package:january_project/screens/cart_screen.dart';
import 'package:january_project/screens/favorite_screen.dart';
import 'package:january_project/screens/home_screen.dart';
import 'package:january_project/screens/profile_screen.dart';
import 'package:january_project/styles/color_class.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    ProfileScreen(),
    CartScreen(),
  ];

  Map<String, dynamic> infoScreen = {
    'Home': Icon(Icons.home, color: ColorClass.backG),
    'Favorite': Icon(Icons.favorite, color: ColorClass.backG),
    'Profile': Icon(Icons.person, color: ColorClass.backG),
    'Cart': Icon(Icons.shopping_cart, color: ColorClass.backG),
  };
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0 ? null : normalAppBar(),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorClass.mad,
        selectedItemColor: Colors.white, // اللون للزر المفعل
        unselectedItemColor: Colors.grey, // اللون للغير مفعل
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: infoScreen.entries
            .map((i) => BottomNavigationBarItem(icon: i.value, label: i.key))
            .toList(),
      ),
    );
  }

  AppBar normalAppBar() {
    return AppBar(
      backgroundColor: ColorClass.mad,
      title: ListTile(
        title: Text(
          "One Piece",
          style: TextStyle(
            fontFamily: 'Averia',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        trailing: CircleAvatar(backgroundColor: Colors.white),
      ),
    );
  }
}
