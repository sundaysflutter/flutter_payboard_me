import 'package:flutter/material.dart';

import 'keyboard/view_keyboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '支付键盘Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("支付"),
          onPressed: _showKeyboard,
        ),
      ),
    );
  }

  void _showKeyboard() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (builder) {
        return CustomKeyboard(
          inputTipStr: '提示',
          helpWidget: Text(
            'help',
            style: TextStyle(color: Colors.white),
          ),
          charColor: Colors.grey,
          keyHeight: 46,
          autoBack: true,
          pwdLength: 6,
          onKeyDown: (keyEvent) {
            if (keyEvent.isClose()) {
              Navigator.pop(context);
            }
            debugPrint(keyEvent.key);
          },
          onResult: (data) {
            print('$data-------');
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
