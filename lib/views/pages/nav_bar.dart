import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:player/views/my_matches.dart';
import 'package:player/views/pages/home_page.dart';
import 'package:player/views/pages/refer_ern.dart';
import 'package:player/views/pages/rewards.dart';

class Bottomnavigationbarpae extends StatefulWidget {
  const Bottomnavigationbarpae({Key? key}) : super(key: key);

  @override
  State<Bottomnavigationbarpae> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbarpae> {
  int _currentIndex = 0;
  final List pages = [
    const HomePage(),
    const MatchesPage(),
    const RewardsPage(),
    const ReferPage()


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
    body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        selectedFontSize: 11.0,
        unselectedItemColor: Colors.white,
        unselectedFontSize: 11.0,
        backgroundColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          items:  const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),backgroundColor: Colors.black,
               label: 'Home'
              ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.trophy),
              label: 'My Matches',
              ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.gift),
              label: 'Rewards'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_add_alt_sharp),
                label: 'Refer & Earn'
                )
          ]),
    );
  }
}

