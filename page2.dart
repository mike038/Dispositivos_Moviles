import 'package:flutter/material.dart';
import 'dart:math';

class Page2 extends StatefulWidget {
  final String texto;
  Page2({Key key, this.texto}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();

}

class _Page2State extends State<Page2> {
  var _ranNum = 0;
  TextEditingController _titleController = new TextEditingController();

  @override
  void initState() {
    _titleController.text= widget.texto;
    super.initState();
  }
    
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _generateRandom() {
    setState(() {
      _ranNum = new Random().nextInt(200);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 1],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Genere numero random',
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '$_ranNum',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RaisedButton(
                child: Text('Generar'),
                onPressed: _generateRandom,
              ),
              RaisedButton(
                child: Text('Guardar'),
                onPressed: () {
                  Navigator.of(context).pop(_titleController.text + ' ' + _ranNum.toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
