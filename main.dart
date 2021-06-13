import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
//

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool themeSwitch = false;
  IconData _iconLight = Icons.dark_mode;
  IconData _iconDark = Icons.wb_sunny;
  Color _bgColorLight = Colors.white;
  Color _bgColorDark = Colors.black;
  Color _textLightColor = Colors.black;
  Color _textDarkColor = Colors.white;

  iconTheme() {
    if (themeSwitch) {
      return _iconDark;
    } else {
      return _iconLight;
    }
  }

  bgColorsTheme() {
    if (themeSwitch) {
      return _bgColorDark;
    } else {
      return _bgColorLight;
    }
  }

  textColorsTheme() {
    if (themeSwitch) {
      return _textDarkColor;
    } else {
      return _textLightColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Dark And Light Mode",
            style: TextStyle(
              color: textColorsTheme(),
            ),
          ),
          backgroundColor: bgColorsTheme(),
          elevation: 0,
          brightness: themeSwitch ? Brightness.dark : Brightness.light,
        ),
        body: SafeArea(
          child: Container(
            color: bgColorsTheme(),
            child: Center(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    themeSwitch = !themeSwitch;
                  });
                },
                icon: themeSwitch
                    ? Icon(
                        _iconDark,
                        color: textColorsTheme(),
                      )
                    : Icon(
                        _iconLight,
                        color: textColorsTheme(),
                      ),
                iconSize: 70,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
