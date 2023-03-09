import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screens = {

      'DashBoard': {
        'routeName': '/dashboard',
        'icon': const Icon(Icons.book_online_outlined),
      },
      'Menu': {
        'routeName': '/menu',
        'icon': const Icon(Icons.menu_book),
      },

      'Settings': {
        'routeName': '/settings',
        'icon': const Icon(Icons.lock_clock),
      },
    };

    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 65.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Text(
                'Top Care',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          ...screens.entries.map((screen) {
            return ListTile(
              leading: screen.value['icon'],
              title: Text(screen.key),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  screen.value['routeName'],
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
