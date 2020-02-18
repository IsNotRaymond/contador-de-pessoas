import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'Contador de Pessoas',
      home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _text = 'Pode entrar!';

  void _changePeople(int value) {
    setState(() {
      _people += value;

      if (_people < 0) {
        _text = 'Mundo invertido?';
      }
      else if (_people <= 10) {
        _text = 'Pode entrar';
      }
      else {
        _text = 'Lotado';
        _people = 10;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg", fit: BoxFit.cover, height: 1920.0,),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Text('Pessoas: $_people',
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                    child: Text('+1',
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    onPressed: () {
                      _changePeople(1);
                    })),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: FlatButton(
                    child: Text('-1',
                        style: TextStyle(fontSize: 40, color: Colors.white)),
                    onPressed: () {
                      _changePeople(-1);
                    }))
          ]),
          Text(_text,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0)),
        ]),
      ],
    );
  }
}

