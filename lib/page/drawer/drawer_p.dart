import 'package:flutter/material.dart';
import 'package:truckme/core/app_data/constants.dart';
import 'package:truckme/core/component/size_config.dart';

class DrawerP extends StatefulWidget {
  const DrawerP({super.key});

  @override
  State<DrawerP> createState() => _DrawerPState();
}

class _DrawerPState extends State<DrawerP> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: getConfigWidth(0.85),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
              height: getConfigHeight(0.3),
              padding: EdgeInsets.fromLTRB(
                getConfigWidth(0.1),
                getConfigHeight(0.1),
                getConfigWidth(0.1),
                0,
              ),
              decoration: BoxDecoration(
                color: Constants.secondaryColor,
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: getConfigHeight(0.05),
                        backgroundImage:
                            const AssetImage("assets/images/language_logo.png"),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Profile Name',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'profile@truck.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: getConfigHeight(0.001),
                    left: getConfigWidth(0.16),
                    child: InkWell(
                      onTap: () {
                        print('tapped edit');
                      },
                      child: CircleAvatar(
                        backgroundColor: Constants.secondaryColor,
                        radius: getConfigHeight(0.02),
                        child: const Icon(Icons.edit, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.history),
                  title: const Text(
                    'BUYURTMALAR TARIXI',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // selected: _selectedIndex == 0,
                  onTap: () {
                    _onItemTapped(0);
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Colors.black,
                  indent: getConfigWidth(0.03),
                  endIndent: getConfigWidth(0.03),
                  thickness: 0.5,
                ),
                ListTile(
                  leading: const Icon(Icons.credit_card_outlined),
                  title: const Text(
                    'TO\'LOV',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: _selectedIndex == 1,
                  onTap: () {
                    _onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Colors.black,
                  indent: getConfigWidth(0.03),
                  endIndent: getConfigWidth(0.03),
                  thickness: 0.5,
                ),
                ListTile(
                  leading: const Icon(Icons.support_agent),
                  title: const Text(
                    'QO\'LLAB QUVVATLASH',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: _selectedIndex == 2,
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  },
                ),
                Divider(
                  color: Colors.black,
                  indent: getConfigWidth(0.03),
                  endIndent: getConfigWidth(0.03),
                  thickness: 0.5,
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app_outlined),
                  title: const Text(
                    'CHIQISH',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: _selectedIndex == 2,
                  onTap: () {
                    _onItemTapped(2);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
