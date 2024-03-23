import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PlatformPage(),
    );
  }
}

class PlatformPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Platform Page'),
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UniversalPlatform.isAndroid
                ? AndroidPage()
                : UniversalPlatform.isWeb
                ? WebPage()
                : Text('Unsupported Platform'),
          ],
        ),
      ),
    );
  }
}

class AndroidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Wellcome to this page!',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _showPlatform(context);
          },
          child: Text(
              'Klick!',
              style: TextStyle(fontSize: 20)
          ),
        ),
      ],
    );
  }

  void _showPlatform(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Platform'),
          content: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/кот-моргает.gif'),
                  Text(
                    'This app is running on Android',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                ],
              )
              //Text('This app is running on Android')],
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class WebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Wellcome to this page!',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _showPlatform(context);
          },
          child: Text('Show Platform'),
        ),
      ],
    );
  }

  void _showPlatform(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('!!!!!'),
          content: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/chipichipichapachapa.gif'),
                  Text(
                      'This app is running on Web',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              )
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
