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
      child: const SwitchContainer()
    );
  }
}

// Toggle Widget 本體
class PowerSwitch extends StatelessWidget {
  final VoidCallback toggleStateChanged; // 

  const PowerSwitch({ Key? key, required this.toggleStateChanged }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _togglePressed,
          child: const Text("開關")
        ),
      ],
    );
  }

  void _togglePressed() {
    debugPrint("Button Pressed");
    toggleStateChanged();
  }
}

// 按下 Toggle 後要做的事
class SwitchContainer extends StatefulWidget {
  const SwitchContainer({ Key? key }) : super(key: key);

  @override
  _SwitchContainerState createState() => _SwitchContainerState();
}

class _SwitchContainerState extends State<SwitchContainer> {
  bool _toggle = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PowerSwitch(toggleStateChanged: _setToggleState,),
        Text(_toggle ? "On" : "Off")
      ],
    );
  }

  void _setToggleState() {
    setState(() {
      _toggle = !_toggle;
    });
  }
}
