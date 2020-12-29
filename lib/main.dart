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

  addWidget() {
    setState(() {
      widgets.insert(
          widgets.length,
          DynamicWidget(
            checkValue: false,
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            // print(widgets[0].checkValue);

            for(int i =0; i<widgets.length; i++){
              print('$i value is ${widgets[i].checkValue}');
            }


            // // print(widgets[0]);
            // // print(DynamicWidget().getString);
            // print(widgets[0]);
            
            // // widgets.map((widget) {
            // //   print(widget);
            // // });
          },
        )
      ],
    );
  }
}



// ignore: must_be_immutable
class DynamicWidget extends StatefulWidget {
  bool checkValue;
  DynamicWidget({this.checkValue});
  String getString() {
    return 'DynamicWidget(checkValue: $checkValue)';
  }

  @override
  _DynamicWidgetState createState() => _DynamicWidgetState();
}

class _DynamicWidgetState extends State<DynamicWidget> {
  // bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.checkValue,
      activeColor: Colors.green,
      checkColor: Colors.red,
      onChanged: (bool newValue) {
        setState(() {
          widget.checkValue = newValue;
        });
      },
    );
  }
}
