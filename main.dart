import 'package:flutter/material.dart';
import 'package:tarea_1/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _params = "hola desde p1";
  String _callBackParams = '';
  String _datoRetornadoDeThirdPage = '';
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'BIENVENIDOS',
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 30, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Image.asset('assets/images/dart_side.png'),
            SizedBox(height: 50),
            Text(
              'Seleccione la accion a realizar',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 130),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                    child: Text('Pagina 2'),
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue,
                    onPressed: () {
                      _showAlertDialog(context);
                    }),
                RaisedButton(
                    child: Text('Pagina 3'),
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue,
                    onPressed: () {
                      _openThirdPage(context);
                    })
              ],
            ),
            SizedBox(height: 60),
            Text('Pg.2 => $_callBackParams'),
            SizedBox(height: 30),
            Text('Pg.3 => $_datoRetornadoDeThirdPage')
          ],
        ),
      ),
    );
  }

  _openThirdPage(BuildContext context) async {
    // await para esperar que se regrese dato desde la pantalla que se abre

    await Navigator.of(context)
        .pushNamed(
      "/thirdPage",
      arguments: _params,
    )
        .then(
      (response) {
        _datoRetornadoDeThirdPage = response;
      },
    );
  }

  _showAlertDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (context) {
          TextEditingController _textController = TextEditingController();

          return AlertDialog(
            title: Text("Ingrese datos"),
            content: TextField(
              controller: _textController,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Ingrese palabra",
                hintText: "Palabra",
              ),
            ),
            actions: <Widget>[
              RaisedButton(
                child: Text("Siguiente"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  await Navigator.of(context)
                      .pushNamed(
                    "/secondPage",
                    arguments: _textController.text,
                  )
                      .then(
                    (response) {
                      _callBackParams = response;
                    },
                  );
                },
              ),
              RaisedButton(
                child: Text("Cancelar"),
                onPressed: () {},
              ),
            ],
          );
        });
  }
}
