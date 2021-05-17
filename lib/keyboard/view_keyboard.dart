import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpayboard/keyboard/view_pwdfield.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'key_event.dart';
import 'keyboard_item.dart';

class CustomKeyboard extends StatefulWidget {
  final String inputTipStr;
  final Widget helpWidget;
  final Color charColor;
  final onKeyDown;
  final onResult;
  final autoBack;
  final pwdLength;
  final double keyHeight;

  const CustomKeyboard(
      {this.inputTipStr = '',
      @required this.helpWidget,
      this.charColor = Colors.black,
      this.onKeyDown,
      this.onResult,
      this.autoBack = false,
      this.pwdLength = 6,
      this.keyHeight = 80});

  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  String data = "";
  List<String> keyList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'a',
    '0',
    'del'
  ];
  List<Widget> keyListWidet = [
    Text(
      '1',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '2',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '3',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '4',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '5',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '6',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '7',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '8',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '9',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      ' ',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    Text(
      '0',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
    SvgPicture.asset(
      'images/pin_del_normal.svg',
      width: 22,
      height: 22,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: keyList.length / 3 * widget.keyHeight + 180,
      width: double.infinity,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          pwdWidget(),
          keyboardWidget(),
          Container(
            height: 20,
          )
        ],
      ),
    );
  }

  Widget pwdWidget() {
    return Container(
      width: double.infinity,
      height: 150,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close, size: 28),
                      onPressed: () => widget.onKeyDown(KeyDownEvent("close")),
                    ),
                    Flexible(
                        child: Center(
                      child: Text(widget.inputTipStr,
                          style: TextStyle(fontSize: 18)),
                    ))
                  ],
                )),
            Divider(
              thickness: 1,
              height: 5,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey.withAlpha(100),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 40,
                      child: CustomPwdField(
                          data, widget.pwdLength, widget.charColor),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                widget.helpWidget,
                SizedBox(
                  width: 8,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
          ]),
    );
  }

  Widget keyboardWidget() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: keyList.length / 3 * widget.keyHeight,
      child: Wrap(
          children: List.generate(
              keyList.length,
              (index) => KeyboardItem(
                    keyHeight: widget.keyHeight,
                    text: keyListWidet[index],
                    callback: () => onKeyDown(context, keyList[index]),
                  ))),
    );
  }

  void onKeyDown(BuildContext context, String text) {
    if ("a" == text) {
      return;
    }
    if ("del" == text && data.length > 0) {
      setState(() {
        data = data.substring(0, data.length - 1);
      });
    }
    if (data.length >= widget.pwdLength) {
      return;
    }
    setState(() {
      if ("del" != text && text != 'a') {
        data += text;
        widget.onKeyDown(KeyDownEvent(text));
      }
    });
    if (data.length == widget.pwdLength && widget.autoBack) {
      widget.onResult(data);
    }
  }
}
