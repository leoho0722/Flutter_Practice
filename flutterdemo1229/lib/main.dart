import 'package:flutter/material.dart';
import 'package:flutterdemo1229/API/station_api.dart';

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
      title: "AQIList Demo",
      home: Scaffold(
        appBar: AppBar(title: const Text("空氣品質指數 AQI")),
        body: const AQIList(),
      ),
    );
  }
}

class AQIList extends StatefulWidget {
  const AQIList({ Key? key }) : super(key: key);

  @override
  _AQIListState createState() => _AQIListState();
}

class _AQIListState extends State<AQIList> {
  Future<List<Station>>? futureStationList;

  @override
  void initState() {
    super.initState();
    futureStationList = fetchAQI();
  }
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Station>>(
        future: futureStationList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print("build: $index");
                return ListTile(
                  title: Text(snapshot.data![index].siteName),
                  subtitle: Text(snapshot.data![index].aqi.toString()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}
