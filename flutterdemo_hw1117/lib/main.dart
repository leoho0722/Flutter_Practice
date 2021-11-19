import 'package:flutter/material.dart';

void main() {
  runApp(const HomeApp());
}

// 整個 App 
class HomeApp extends StatelessWidget {
  const HomeApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text("App Demo")),
        body: const HomeBody()
      ),
    );
  }
}

// App 內容本體
class HomeBody extends StatelessWidget {
  const HomeBody({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const PaletteContainer()
    );
  }
}

// 按下 Toggle 後要做的事
class PaletteContainer extends StatefulWidget {
  const PaletteContainer({ Key? key }) : super(key: key);

  @override
  _PaletteContainerState createState() => _PaletteContainerState();
}

class _PaletteContainerState extends State<PaletteContainer> {
  Color selectedColor = Colors.black;

  @override
    Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            height: 200,
            color: selectedColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 分散對齊
            children: [
              ColorButton(toggleStateChanged: _setColor, btnText: "Red", buttonColor: Colors.red),
              ColorButton(toggleStateChanged: _setColor, btnText: "Yellow", buttonColor: Colors.yellow),
              ColorButton(toggleStateChanged: _setColor, btnText: "Green", buttonColor: Colors.green)
            ],
          )
        ],
      ),
    );
  }

  void _setColor(Color newColor) {
    setState(() {
      selectedColor = newColor;
    });
  }
}

// Toggle Widget 本體
class ColorButton extends StatelessWidget {
  final ValueChanged<Color> toggleStateChanged; // 
  final String btnText;
  final Color buttonColor;
  const ColorButton({ Key? key, required this.toggleStateChanged, required this.btnText, required this.buttonColor }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: _togglePressed,
              child: Text(btnText, style: const TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(primary: buttonColor), // 更改按鈕背景色
            ),                          
          ],
        )
      ],
    );
  }

  void _togglePressed() {
    debugPrint("Button Pressed");
    toggleStateChanged(buttonColor);
  }
}