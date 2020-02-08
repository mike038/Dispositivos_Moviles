import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final String texto;
  Page3({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla 3'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    child: Text('(◕‿◕✿)'),
                    onPressed: () {
                      Navigator.of(context).pop('(◕‿◕✿)');
                    }),
                RaisedButton(
                    child: Text('ʕ•ᴥ•ʔ'),
                    onPressed: () {
                      Navigator.of(context).pop('ʕ•ᴥ•ʔ');
                    }),
                RaisedButton(
                  child: Text('¯\_(ツ)_/¯'),
                  onPressed: () {
                    Navigator.of(context).pop('¯\_(ツ)_/¯');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
