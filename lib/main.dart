import 'package:app_de_teste/PreachedAt.dart';
import 'package:app_de_teste/sermon.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const YourApp());
}

class YourApp extends StatelessWidget {
  const YourApp({super.key});

  @override
  Widget build(BuildContext context) {
    Sermon s1 = Sermon(author: "Celio", theme: "O Anjo do Senhor");
    Sermon s2 = Sermon(author: "Marlon", theme: "Ouvindo a voz de Deus");
    Sermon s3 = Sermon(author: "Christian", theme: "Verdadeira Educacao");

    PreachedAt pa1 = PreachedAt(
      place: "Campo Grande",
      date: DateTime(2025,12,1),
      preacher: "Nicholas",
      sermon: s1);// TODO: implement build
    PreachedAt pa2 = PreachedAt(
      place: "Cuiaba",
      date: DateTime(2026-4-6), 
      preacher: "Nicholas",
      sermon: s2);
    PreachedAt pa3 = PreachedAt(
      place: "Curitiba",
      date: DateTime(2027-8-23),
      preacher: "Nicholas",
      sermon: s3);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sermoes"),
          backgroundColor: Colors.blue[100],
          leading: Icon(Icons.menu)),
        body: Column(
          children: [
            Card(
              child: ListTile(
                leading: Center(child: Icon(Icons.access_time)),
                title: Text(pa1.sermon.theme),
                subtitle: Text("autor: ${pa1.sermon.author} pregador: ${pa1.preacher}                   data: ${pa1.date}"),
                trailing: Icon(Icons.menu), //TODO trocar para preacher
                isThreeLine: true,
                focusColor: Colors.purple[100],
                //tileColor: Colors.blue[200],
                hoverColor: Colors.green,
                selectedColor: Colors.red, 
                onTap: (){print("Tile 1 clicado.");}),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.access_time),
                  title: Text(pa2.sermon.theme),
                  subtitle: Text("autor: ${pa2.sermon.author} pregador: ${pa2.preacher}"),
                  trailing: Icon(Icons.menu), //TODO trocar para preacher
                  isThreeLine: true,
                  focusColor: Colors.blue[100],
                  //tileColor: Colors.blue[200],
                  hoverColor: Colors.green,
                  selectedColor: Colors.amber, 
                  onTap: (){print("Tile 2 clicado.");}),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.access_time),
                  title: Text(pa3.sermon.theme),
                  subtitle: Text("autor: ${pa3.sermon.author} pregador: ${pa3.preacher}"),
                  trailing: Icon(Icons.menu), //TODO trocar para preacher
                  isThreeLine: true,
                  focusColor: Colors.blue[100],
                  //tileColor: Colors.blue[200],
                  hoverColor: Colors.green,
                  selectedColor: Colors.amber, 
                  onTap: (){print("Tile 3 clicado.");}),
            )
          ],
        ))
        );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
