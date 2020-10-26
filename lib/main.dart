import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: const Text("Test"),
        ),
        body: new ListView(
            padding: const EdgeInsets.all(32.0),
            children: [new Text("Click the FAB")]),
        floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          tooltip: "New Dialog",
          onPressed: () {
            showDialog(context: context, child: new MyDialog());
          },
        ));
  }
}

class MyDialog extends StatefulWidget {
  const MyDialog();
  @override
  State createState() => new MyDialogState();
}

class MyDialogState extends State<MyDialog> {
  String _selectedId;

  Widget build(BuildContext context) {
    return new SimpleDialog(
      title: new Text("New Dialog"),
      contentPadding: const EdgeInsets.all(10.0),
      children: <Widget>[
        new DropdownButton<String>(
          hint: const Text("Pick a thing"),
          value: _selectedId,
          onChanged: (String value) {
            setState(() {
              _selectedId = value;
            });
          },
          items: <String>['One', 'Two', 'Three', 'Four'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
        ),
        new RaisedButton(
          child: const Text("Save"),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
      ],
    );
  }
}