import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter Demo 1124",
      home: RoutePage(),
    );
  }
}

class RoutePage extends StatefulWidget {
  const RoutePage({ Key? key }) : super(key: key);

  @override
  _RoutePageState createState() => _RoutePageState();
}

class _RoutePageState extends State<RoutePage> {
  int _index = 0; // 根據 index 來切換到對應的 Tab
  final List<Widget> _pages = [
    const HomeBody(),
    const History()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page"),),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "History"
          )
        ],
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text("Home Page"),
      ElevatedButton(
        onPressed: () {
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SecondPage(
              name: "123456",
            ))
          ).then((value) => debugPrint(value));
        },
        child: const Text("Push to Second Page"),
      )
    ]);
  }
}

class History extends StatelessWidget {
  const History({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("History Page"),
      ],
    );
  }
}

class SecondPage extends StatelessWidget {
  final String name;
  const SecondPage({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: SecondPageBody(name: name,),
    );
  }
}

class SecondPageBody extends StatelessWidget {
  final String name;
  const SecondPageBody({required this.name, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
        ElevatedButton(onPressed: () {
          Navigator.pop(context, "Return Data");
        }, child: const Text("Pop to Main Page"),
        )
      ],
    );
  }
}
