import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        // backgroundColor: Color(0xFF141414),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'My name is Nick Endle, and I started Endle Home Goods (formerly known as Nick\'s Wood Shop) in 2014.\n\n'
                    'Although I grew up in a family full of craftspeople, I was always more interested in technology and computers than woodworking.\n\n'
                    'I had great respect and admiration for what they were doing, and I spent lots of time helping-but I never had any ambition to be covered in sawdust all day working my hands to the bone like them.\n\n'
                    'Now, I use my skills to create beautiful and functional home goods that people can enjoy for years to come.',
                    // style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/tri.png',
                width: 300,
                height: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
