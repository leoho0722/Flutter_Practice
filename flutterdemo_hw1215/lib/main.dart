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
      title: "BMI 計算",
      home: Scaffold(
        appBar: AppBar(title: const Text("BMI 計算")),
        body: const HomeBody(),
      )
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
    return Container(
      child: BMIInputForm(),
    );
  }
}

class BMIInputForm extends StatefulWidget {
  const BMIInputForm({ Key? key }) : super(key: key);

  @override
  _BMIInputFormState createState() => _BMIInputFormState();
}

class _BMIInputFormState extends State<BMIInputForm> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          FormInput(),
        ],
      ),
    );
  }
}

// Form Widgets
class FormInput extends StatefulWidget {
  const FormInput({ Key? key }) : super(key: key);

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _formKey = GlobalKey<FormState>();
  final _heightTextController = TextEditingController();
  final _weightTextController = TextEditingController();

  bool _isHeightIn100To250(String str) {
    if (double.tryParse(str)! < 100 || double.tryParse(str)! > 250) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  bool _isWeightIn5To200(String str) {
    if (double.tryParse(str)! < 5 || double.tryParse(str)! > 200) {
      return false;
    }
    return double.tryParse(str) != null;
  }  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "身高(cm)"),
            controller: _heightTextController,
            keyboardType: TextInputType.number,
            validator: (value) {
              debugPrint("身高：$value");
              return _isHeightIn100To250(value!) ? null : "請輸入正確範圍的數字 (100cm~250cm)";
            },            
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "體重(kg)"),
            controller: _weightTextController,
            validator: (value) {
              debugPrint("體重：$value");
              return _isWeightIn5To200(value!) ? null : "請輸入正確範圍的數字 (5kg~200kg)";
            },
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(onPressed: () {
            debugPrint("檢查結果：${_formKey.currentState?.validate()}");
            if (_formKey.currentState?.validate() == true) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(
                height: double.tryParse(_heightTextController.text),
                weight: double.tryParse(_weightTextController.text),
              )));
            } else {
              debugPrint("檢查失敗");
            }
          }, child: const Text("Submit"))
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final double? height;
  final double? weight;

  SecondPage({required this.height, required this.weight, Key? key }) : super(key: key);

  double calcBMI(double height, double weight) {
    return weight / ((height/100) * (height/100));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BMI 結果")),
      body: Column(
        children: [
          Text("Height: $height cm"),
          Text("Weight: $weight kg"),
          Text("BMI 結果: ${calcBMI(height!, weight!)}"),

        ],
      )
    );
  }
}