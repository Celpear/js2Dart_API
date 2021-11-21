import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/jsapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Two-way data binding Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
      ),
      home: JStwoWayDataBinding(),
    );
  }
}

class JStwoWayDataBinding extends StatefulWidget {
  @override
  _JStwoWayDataBindingState createState() => _JStwoWayDataBindingState();
}

class _JStwoWayDataBindingState extends State<JStwoWayDataBinding> {
  JSApi js = new JSApi();

  void receive_data_from_js_cb() {
    js.calljsFunction('alertMessage', ['This Function was called by JS']);
  }

  @override
  void initState() {
    // TODO: implement initState
    js.jscallDARTfunction("dartFunction", receive_data_from_js_cb);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello js2Dart Api"),
      ),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Call JS Functions:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('alert("Hello World");'),
            onTap: () {
              try {
                js.calljsFunction(
                    'alertMessage', ['Flutter is calling "Hello World"']);
              } on PlatformException catch (e) {
                print('ERRO: ${e.details}');
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Check Metamask'),
            onTap: () {
              try {
                dynamic result = js.calljsFunction('getChainID');
                print(result.toString());
                if (result.toString() == "3") {
                  js.calljsFunction('alertMessage',
                      ['Metamask works and you use the test network!']);
                } else if (result.toString() == "Metamask is not active") {
                  js.calljsFunction('alertMessage', ['Metamask is not active']);
                } else {
                  js.calljsFunction('alertMessage',
                      ['Metamask works but its the wrong Network']);
                }
              } on PlatformException catch (e) {
                print('ERRO: ${e.details}');
              }
            },
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "Call Dart from JS Function:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Call a Dart function From JS'),
            onTap: () {
              try {
                js.calljsFunction(
                  'callDartFunctioninJS',
                );
              } on PlatformException catch (e) {
                print('ERRO: ${e.details}');
              }
            },
          ),
        ],
      ),
    );
  }
}
