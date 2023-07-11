import 'package:flutter/material.dart';

Widget cube(String name, int puntate, String deadline, String image,
    BuildContext context, Widget page) {
  navigare() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: GestureDetector(
      onTap: navigare,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        width: 160,
        height: 210,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Image.asset(
              image,
              width: 160,
              height: 80,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
            ),
            Text(
              'puntate:' + ' ' + puntate.toString(),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    ),
  );
}
