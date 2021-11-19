import 'package:flutter/material.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: Scaffold(
        appBar: AppBar(title: const Text("AppBar Title"),),
        body: const Homework()
      )
    );
  }
}

class Homework extends StatelessWidget {
  const Homework({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Homework1103("iPhone 13", "2021/9/24", "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-13-family-select-2021?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=1629842667000"),
          Homework1103("iPhone 12", "2020/10/13", "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-12-family-select-2021?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=1617135051000"),
          Homework1103("iPhone SE 2nd generation", "2020/4/7", "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-se-family-select-2020?wid=882&hei=1058&fmt=jpeg&qlt=80&.v=1586794486444"),
          Homework1103("iPhone 11", "2019/9/13", "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone11-select-2019-family?wid=882&hei=1058&fmt=jpeg&qlt=80&.v=1567022175704")
        ]
      )
    );
  }
}

class Homework1103 extends StatelessWidget {
  final String iPhoneModel;
  final String iPhoneReleaseDate;
  final String iPhoneImageURL;
  
  const Homework1103(this.iPhoneModel, this.iPhoneReleaseDate, this.iPhoneImageURL, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children:[
          Container(
            constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200),
            child: Image.network(iPhoneImageURL)
            // child: const Icon(Icons.phone_iphone, color: Colors.blue, size: 36),
          ),

          Container(
            child: Column(
              children: [
                Text(iPhoneModel, style: const TextStyle(color: Colors.black, fontSize: 20,), textAlign: TextAlign.left,),
                Container(
                  child: Text(iPhoneReleaseDate, style: const TextStyle(color: Colors.grey, fontSize: 14,), textAlign: TextAlign.left,),
                  // alignment: Alignment.centerLeft,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            margin: const EdgeInsets.only(left: 15),
          )
        ]
      ),
    );
  }
}