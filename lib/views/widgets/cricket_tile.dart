import 'package:flutter/material.dart';

class CricketTile extends StatelessWidget {
  const CricketTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 10,
            top: 5,
            child: Text(
              "St Lucia Kings vs Trinbago Knight Riders",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(right: Radius.circular(20)),
                  color: Color.fromARGB(255, 176, 202, 215)),
              padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
              child: const Text('SLS',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(20)),
                  color: Color.fromARGB(255, 236, 202, 213)),
              padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
              child: const Text(
                'TKR',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '1h 27m 7s',
                    style: TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Text(
                      'VS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding:const  EdgeInsets.all(4.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  color:const  Color.fromARGB(255, 216, 216, 216),
                  borderRadius: BorderRadius.circular(10)),
              child:const Text(
                'Tap to enter the contests',
                style:  TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
