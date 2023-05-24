import 'package:auto_route/annotations.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_dashboard/presentation/auth/profile.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  List pages = [
    const SizedBox(),
    const SizedBox(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: pages[selected],
        switchInCurve: Curves.linear,
        switchOutCurve: Curves.linear,
      ),
      bottomNavigationBar: FlashyTabBar(
        items: [
          FlashyTabBarItem(
              icon: const Icon(Icons.shopping_cart),
              title: const Text(
                "items",
                style: TextStyle(fontSize: 19),
              ),
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Theme.of(context).primaryColor),
          FlashyTabBarItem(
              icon: const Icon(Icons.list),
              title: const Text("people", style: TextStyle(fontSize: 20)),
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Theme.of(context).primaryColor),
          FlashyTabBarItem(
              icon: const Icon(Icons.person),
              title: const Text("profile", style: TextStyle(fontSize: 19)),
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Theme.of(context).primaryColor),
        ],
        onItemSelected: (n) {
          setState(() {
            selected = n;
          });
        },
        selectedIndex: selected,
        iconSize: 30,
        height: 55,
      ),
    );
  }
}
