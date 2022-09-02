import 'package:flutter/material.dart';
import 'package:player/views/widgets/cricket_tile.dart';

class CricketPage extends StatelessWidget {
  const CricketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/cricket12.jpg'))),
            height: size.height * 0.26,
            width: double.infinity,
            child: const Center(
                child: Text(
              'No Live Matches',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ))),
        ColoredBox(
          color: const Color.fromARGB(255, 214, 211, 211),
          child: Row(
            children: const [
              Icon(Icons.keyboard_arrow_down_rounded),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "Select Upcoming Matches",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) => const CricketTile(),
          itemCount: 10,
        ))
      ],
    );
  }
}
