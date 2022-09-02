import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:player/views/pages/basketball.dart';
import 'package:player/views/pages/cricket.dart';
import 'package:player/views/pages/football.dart';
import 'package:player/views/widgets/title_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var daysInWeek = [
      "Today",
      'Fri',
      'Sat',
      'Sun',
      'Mon',
      'Tue',
      'wed',
    ];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: const Icon(Icons.person_pin),
        centerTitle: true,
        title: const TitlePage(size: 20),
        actions: const [
          Icon(
            Icons.notifications,
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: [
          ColoredBox(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 12,
                    color: Colors.white,
                  ),
                  const RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Matches',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black,
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 80,
                                  mainAxisExtent: 60,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 5),
                          itemCount: 7,
                          itemBuilder: (BuildContext ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                                bottom: 5,
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? Colors.green
                                        : const Color.fromARGB(255, 37, 37, 36),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: index == 0
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                    Text(
                                      daysInWeek[index],
                                      style: TextStyle(
                                          color: index == 0
                                              ? Colors.black
                                              : Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  const Text(
                    "sep\n 2022",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: Colors.grey.shade900,
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    Container(
                      color: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const TabBar(
                        unselectedLabelColor: Colors.black,

                        // indicatorSize: TabBarIndicatorSize.label,
                        indicator: BoxDecoration(color: Colors.black),
                        tabs: [
                          Tab(
                            icon: Icon(Icons.sports_cricket),
                            text: 'Cricket',
                          ),
                          Tab(
                            icon: Icon(MdiIcons.baseball),
                            text: 'Football',
                          ),
                          Tab(
                            icon: Icon(Icons.sports_basketball),
                            text: 'Basketball',
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      child: TabBarView(children: [
                        CricketPage(),
                        FootballPage(),
                        BasketballPage(),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
