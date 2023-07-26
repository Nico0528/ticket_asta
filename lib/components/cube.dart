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
              width: 140,
              height: 70,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
            Text(
              'puntate:' + ' ' + puntate.toString(),
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            )
          ],
        ),
        decoration: const BoxDecoration(
            color: Color(0xFFEAFDE6),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(151, 231, 231, 231),
                offset: Offset(8.5, 8.5),
                blurRadius: 4,
              )
            ]),
      ),
    ),
  );
}
