import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  final int currentIndex;

  const CustomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  State<CustomNavBar> createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState
    extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Discover',
        ),
        NavigationDestination(
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Cart',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.add_circle_outline_rounded,
          ),
          label: 'Sell',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.inbox_rounded,
          ),
          label: 'Inbox',
        ),
        NavigationDestination(
          icon: Icon(
            Icons.person_2_outlined,
          ),
          label: 'Profile',
        ),
      ],
      selectedIndex: widget.currentIndex,
      onDestinationSelected: (int index) {
        setState(() {
          index;
        });
      },
    );
  }
}
