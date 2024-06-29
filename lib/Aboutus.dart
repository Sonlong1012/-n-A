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
                    'Xin chào Thầy (Cô) nhóm chúng em đã làm ra dự án máy tính khoa học \n\n'
                    'Tuy ứng dụng vẫn chưa phải là hoàn chỉnh nhất nhưng nhóm chúng em đã cố gắng nổ lực để hoàn thiện một cách tốt nhất.\n\n'
                    'Ứng dụng được viết trên ngôn ngữ dart và sử dụng flutter framework để làm ra.\n\n'
                    'Ứng dụng có giao diện dễ sử dụng và dễ tiếp cận với người mới'
                    // style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/images/maytinh.png',
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
