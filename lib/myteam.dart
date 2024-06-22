import 'package:calculator_2sd/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTeam extends StatelessWidget {
  const MyTeam({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 100),
            child: Text(
              'MyTeam',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMemberInfo(
                    name: 'Nguyễn Tấn Trí',
                    department: 'CNTT',
                    major: 'KTPM',
                    image: 'assets/images/tri.jpg',
                    studentID: '22012035',
                  ),
                  _buildMemberInfo(
                    name: 'Trần Sơn Long',
                    department: 'CNTT',
                    major: 'KTPM',
                    image: 'assets/images/long.jpg',
                    studentID: '22011267',
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMemberInfo(
                    name: 'Nguyễn Hoàng Phúc',
                    department: 'CNTT',
                    major: 'KTPM',
                    image: 'assets/images/phuc.jpg',
                    studentID: '22012490',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberInfo({
    required String name,
    required String department,
    required String major,
    required String image,
    required String studentID,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              image,
              width: 140,
              height: 140, 
              fit: BoxFit.cover, 
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Tên: $name',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Khoa: $department',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Ngành: $major',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'MSSV: $studentID',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}