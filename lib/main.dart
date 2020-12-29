import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Widget'),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<DynamicWidget> widgets = List<DynamicWidget>();
  // List<bool> checkValues = List<bool>();
  
  List<TextEditingController> listNamecontrollers = [];
  addWidget() {
    setState(() {
      TextEditingController nameController = TextEditingController();
      listNamecontrollers.add(nameController);
      widgets.insert(
          widgets.length,
          DynamicWidget(
              firstCheckValue: false,
              secondCheckValue: false,
              thirdCheckValue: false,
              initialValue: 1.0,
              controller: listNamecontrollers[listNamecontrollers.length - 1]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: widgets.length,
            itemBuilder: (context, index) {
              return widgets[index];
            },
          ),
          RaisedButton(
            child: Text("click"),
            onPressed: () {
              addWidget();
            },
          ),
          FlatButton(
            child: Text('GetData'),
            color: Colors.green,
            onPressed: () {
              widgets.length == 0 ? print('Empty') : print(widgets[0]);

              for (int i = 0; i < widgets.length; i++) {
                print(widgets[i].controller.text.isEmpty);
                print(
                    '$i value is ${widgets[i].firstCheckValue}, ${widgets[i].secondCheckValue}, ${widgets[i].thirdCheckValue}, ${widgets[i].initialValue.round()}, ${widgets[i].controller.text},');
              }
            },
          )
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class DynamicWidget extends StatefulWidget {
  TextEditingController controller;
  bool firstCheckValue;
  bool secondCheckValue;
  bool thirdCheckValue;
  double initialValue;
  DynamicWidget(
      {this.firstCheckValue,
      this.secondCheckValue,
      this.thirdCheckValue,
      this.initialValue,
      this.controller});

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  // bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(hintText: 'Enter Name'),
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: widget.firstCheckValue,
              activeColor: Colors.green,
              checkColor: Colors.red,
              onChanged: (bool newValue) {
                setState(() {
                  widget.firstCheckValue = newValue;
                });
              },
            ),
            Checkbox(
              value: widget.secondCheckValue,
              activeColor: Colors.green,
              checkColor: Colors.red,
              onChanged: (bool newValue) {
                setState(() {
                  widget.secondCheckValue = newValue;
                });
              },
            ),
            Checkbox(
              value: widget.thirdCheckValue,
              activeColor: Colors.green,
              checkColor: Colors.red,
              onChanged: (bool newValue) {
                setState(() {
                  widget.thirdCheckValue = newValue;
                });
              },
            ),
          ],
        ),
        Slider(
          value: widget.initialValue,
          divisions: 10,
          min: 1.0,
          max: 10.0,
          activeColor: Colors.lightBlue,
          inactiveColor: Colors.lightBlue[50],
          label: '${widget.initialValue.round()}',
          onChanged: (double newValue) {
            setState(() {
              widget.initialValue = newValue;
            });
          },
        ),
      ],
    );
  }
}
