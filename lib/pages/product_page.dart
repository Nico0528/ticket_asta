import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  const ProductPage(this.image);
  final String image;
  @override
  Widget build(BuildContext context) {
    torna() {
      Navigator.pop(context);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.1,
                0.9
              ],
              colors: [
                Colors.black,
                Color.fromARGB(255, 65, 65, 65),
              ]),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 75),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'TicketAsta',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Icon(
                    FeatherIcons.gift,
                    color: Colors.white,
                    size: 45,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset(
                image,
                width: 200,
              ),
              ElevatedButton(onPressed: torna, child: const Text('return')),
              SizedBox(
                height: 80,
              ),
              GestureDetector(
                child: Container(
                  height: 200,
                  width: 200,
                  child: const Center(
                      child: Text('PUNTA',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 255, 255, 255)))),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.3,
                          0.99999
                        ],
                        colors: [
                          Color.fromARGB(255, 255, 111, 0),
                          Colors.white,
                        ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class Tickets extends StatefulWidget {
  Tickets(this.owntickets, this.tickets);
  int tickets, owntickets;
  @override
  State<Tickets> createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  addTickets() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('Tickets: ' + widget.tickets.toString()),
          ElevatedButton(onPressed: addTickets, child: Text('addTickets')),
          Text('Tickets: ' + widget.owntickets.toString()),
        ],
      ),
    );
  }
}
