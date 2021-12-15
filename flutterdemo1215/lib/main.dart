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
      title: "Flutter Demo 1207",
      home: Scaffold(
        appBar: AppBar(title: const Text("Flutter Demo 1207")),
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
          TextFieldInput(),
          SliderInput(),
          SwitchInput(),
          CheckBoxInput(),
          RadioInput(),
          FormInput(),
        ],
      ),
    );
  }
}

// TextField Widgets + ElevatedButton Widgets
class TextFieldInput extends StatefulWidget {
  const TextFieldInput({ Key? key }) : super(key: key);

  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  String _inputValue = ""; // 設定 TextField 預設值

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            labelText: 'Please Input Here',
            hintText: '(ex: ABC)',
          ),
          onChanged: (value) {
            debugPrint(value);
            _inputValue = value;
          },
        ),
        ElevatedButton(
          onPressed: () {
            debugPrint("輸入值為 $_inputValue");
          },
          child: const Text('Submit'),
        )
      ]
    );
  }
}

// Slider Widgets
class SliderInput extends StatefulWidget {
  const SliderInput({ Key? key }) : super(key: key);

  @override
  _SliderInputState createState() => _SliderInputState();
}

class _SliderInputState extends State<SliderInput> {
  double _curSliderValue = 0; // 設定 Slider 預設值
  
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _curSliderValue,
      min: 0, max: 50, // 設定 Slider 的最大、最小值
      label: _curSliderValue.round().toString(), // 將 Slider 的值四捨五入，轉為字串
      divisions: 9,
      onChanged: (value) {
        setState(() {
          _curSliderValue = value;
          debugPrint("Slider's value = $_curSliderValue");
        });
      },
    );
  }
}


// Switch Widgets
class SwitchInput extends StatefulWidget {
  const SwitchInput({ Key? key }) : super(key: key);

  @override
  _SwitchInputState createState() => _SwitchInputState();
}

class _SwitchInputState extends State<SwitchInput> {
  bool _switchValue = false; // 設定 Switch 預設值

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Text('Function to turn on'),
          ),
        ),
        Switch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
              debugPrint("switch = $_switchValue");
            });
          },
        )
      ],
    );
  }
}

// CheckBox Widgets
class CheckBoxInput extends StatefulWidget {
  const CheckBoxInput({ Key? key }) : super(key: key);

  @override
  _CheckBoxInputState createState() => _CheckBoxInputState();
}

class _CheckBoxInputState extends State<CheckBoxInput> {
  final _itemCount = 5; // 幾個 CheckBox 選項
  final List<bool> _checked = []; // 每個 CheckBox 的勾選狀態

  @override
  void initState() {
    for (var i = 0; i < _itemCount; i++) {
      _checked.add(false); // 講每個 CheckBox 預設都設為未勾選
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> itemWidgets = [];
    for (var i = 0; i < _itemCount; i++) {
      itemWidgets.add(
        Row(
          children: [
            Checkbox(value: _checked[i], onChanged: (value) {
              setState(() {
                _checked[i] = value!;
                if (_checked[i]) {
                  debugPrint("第 ${i + 1} 個被勾選");
                } else {
                  debugPrint("第 ${i + 1} 個被取消勾選");
                }
              });
            }),
            Text("Item ${i + 1}")
          ],
        )
      );
    }
    return Column(children: itemWidgets);
  }
}

// Radio Button Widgets
class RadioInput extends StatefulWidget {
  const RadioInput({ Key? key }) : super(key: key);

  @override
  _RadioInputState createState() => _RadioInputState();
}

class _RadioInputState extends State<RadioInput> {
  final _itemCount = 5; // 幾個 Radio Button
  int? _selectValue = 0; // 第幾個被選

  @override
  Widget build(BuildContext context) {
    List<Widget> itemWidgets = [];
    for (var i = 0; i < _itemCount; i++) {
      itemWidgets.add(
        ListTile(
          leading: Radio(
            groupValue: _selectValue,
            value: i,
            onChanged: (int? value) {
              setState(() {
                _selectValue = value;
                debugPrint("第 ${i + 1} 個選取");
              });
            }
          ),
          title: Text("Item ${i + 1}"),
        ),
      );
    }
    return Column(children: itemWidgets);
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

  bool _isNumeric(String? str) {
    if (str == null) {
      return false;
    } else if (int.tryParse(str)! > 200) {
      return false;
    }
    return double.tryParse(str) != null;
  }

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