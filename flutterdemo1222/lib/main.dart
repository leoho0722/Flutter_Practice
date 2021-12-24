import 'package:flutter/material.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatefulWidget {
  const HomeApp({ Key? key }) : super(key: key);

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ListView Demo",
      home: Scaffold(
        appBar: AppBar(title: const Text("ListView Demo")),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({ Key? key }) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> detail = {
      "leading": Icons.phone_iphone,
      "title": "iPhone",
      "subTitle": "Best Phone",
      "trailing": Icons.android
    };
    return ListView.builder(
      itemBuilder: (context, index) {
        // return Container(
        //   padding: const EdgeInsets.all(10),
        //   child: Text("ListView Test $index", style: const TextStyle(fontSize: 48),),
        //   color: (index % 2 == 0) ? Colors.blue : Colors.red,
        // );
        return ListTile(
          leading: Icon(detail["leading"]),
          title: Text("${detail["title"]}"),
          subtitle: Text("${detail["subTitle"]}"),
          trailing: Icon(detail["trailing"]),
          onTap: () {
            
          },
        );
      },
      itemCount: 10,
    );
  }
}
