import 'package:flutter/material.dart';

class KeyboardItem extends StatefulWidget {
  final Widget text;

  final callback;
  final double keyHeight;

  const KeyboardItem({Key key, this.callback, this.text, this.keyHeight})
      : super(key: key);

  @override
  ButtonState createState() => ButtonState();
}

class ButtonState extends State<KeyboardItem> {
  double keyHeight = 44;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    var _screenWidth = mediaQuery.size.width;
    if (null != widget.keyHeight) {
      keyHeight = widget.keyHeight;
    }
    return Container(
      height: keyHeight,
      width: _screenWidth / 3,
      child: OutlineButton(
        onPressed: widget.callback,
        child: widget.text,
      ),
    );
  }
}
