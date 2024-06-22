import 'package:calculator_2sd/Aboutus.dart';
import 'package:calculator_2sd/program.dart';
import 'package:calculator_2sd/scientific.dart';
import 'package:calculator_2sd/myteam.dart';
import 'package:calculator_2sd/standard.dart';
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
                'Standard',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Standard())),
            ),
            ListTile(
              leading: const Icon(
                Icons.science_outlined,
                size: 40,
              ),
              title: const Text(
                'Scientific',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Scientific())),
            ),
            ListTile(
              leading: const Icon(
                Icons.code,
                size: 40,
              ),
              title: const Text(
                'Program',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Program())),
            ),
            const Divider(),
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
            ),
            ListTile(
              leading: const Icon(
                Icons.groups_sharp,
                size: 40,
              ),
              title: const Text(
                'About us',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  const AboutUs())),
            )
          ],
        ),
      ),
    );
  }
}
