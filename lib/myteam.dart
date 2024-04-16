import 'package:calculator_2sd/navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTeam extends StatelessWidget {
  const MyTeam({super.key});

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/corgi.jpg',
                          width: 150,
                          height: 200,
                        ),
                      )
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Khoa: CNTT',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Ngành: KTPM',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Tên: Nguyễn Tấn Trí',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Khoa: CNTT',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Ngành: KTPM',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Tên: Trần Sơn Long',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/corgi.jpg',
                          width: 150,
                          height: 200,
                        ),
                      )
                    ],
                  ),
                ],
              )),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/corgi.jpg',
                          width: 150,
                          height: 200,
                        ),
                      )
                    ],
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Khoa: CNTT',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Ngành: KTPM',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Tên: Nguyễn Hoàng Phúc',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    ));
  }
}
