import 'package:calculator_2sd/calculator.dart';
import 'package:calculator_2sd/myteam.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(
                Icons.calculate_outlined,
                size: 40,
              ),
              title: const Text(
                'Calculator',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Calculator())),
            ),
            ListTile(
              leading: const Icon(
                Icons.person_pin,
                size: 40,
              ),
              title: const Text(
                'Team',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyTeam())),
            )
          ],
        ),
      ),
    );
  }
}
