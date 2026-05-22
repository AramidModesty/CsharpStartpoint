import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador demo 3.0',
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
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 0, 174, 255)),
      ),
      home: const MyHomePage(title: 'Contador demo 3.0'),
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
  final SharedPreferencesAsyncAndroidOptions options = SharedPreferencesAsyncAndroidOptions(
      backend: SharedPreferencesAndroidBackendLibrary.SharedPreferences,
      originalSharedPreferencesOptions: AndroidSharedPreferencesStoreOptions(
        fileName: 'numbersSaved',
      )
  );
  void eraser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
  late SharedPreferences prefs;
  //initState es equivalente a un metodo constructor.
  int _counter = 0;
  @override
  void initState() {
    super.initState();
    _initPrefs();
  }
  //initPrefs obtiene los valores guardados en numbersSaved,
  //si no hay nada guardado, se asigna el valor 0 a _counter.
  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter') ?? 0;
    });
  }
  
  // persist the counter value without blocking the UI
  void _saveCounter([bool force = false]) {
    // only write to disk when the user has made enough progress or if
    // something explicitly demands it; SharedPreferences calls are
    // asynchronous and cheap, so we fire-and-forget.
    if (force || _counter % 5 == 0) {
      prefs.setInt('counter', _counter);
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    _saveCounter(true); // ensure storage is updated but don't await
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // save in the background, user experience isn't blocked
    _saveCounter();
  }
  void _clearProgress() {//Borrar tu progreso
    showDialog(
      //Deseo que tenga color rojo, para que se vea la advertencia de borrado definitivo.
      barrierColor: const Color.fromARGB(255, 255, 17, 0),
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Advertencia de borrado definitivo'),
          content: const Text('Deseas borrar el contador? Esta acción no se puede deshacer.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Clear'),
              onPressed: () {
                eraser();
                Navigator.of(context).pop();
                _resetCounter();
              },
            ),
          ],
        );
      },
    );
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
        //Este es el color.
        //Previo: backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: const Color.fromARGB(255, 255, 145, 0),
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
          mainAxisAlignment: .center,
          children: [
            const Text('Tu has presionado el botón estas veces:'),
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
      ),
      //eraser button
      persistentFooterButtons: [
        ElevatedButton(//onPressed llama a la función _clearProgress
        //Este metodo pide confirmación antes de borrar el progreso,
        //para evitar borrados accidentales.
          onPressed: _clearProgress,
          child: const Text('Clear Progress'),
        ),
      ],
    );
  }
}

//Para acceder a modo desarollador vaya a la configuración
//de su dispositivo, busque "Acerca del teléfono" y toque 
//el número de compilación siete veces. 
//Luego, regrese a la configuración principal y 
//encontrará una nueva sección llamada "Opciones de desarrollador".
//Dentro de esa sección, busque la opción "Depuración USB" y
//actívela.
//Esto permitirá que su dispositivo se comunique con su
//computadora para depurar aplicaciones Flutter.
//No olvide conectar su dispositivo a la computadora mediante un
//cable USB o wifi.
//Para conectar mediante Wi-Fi, ejecute el siguiente comando en la terminal:
//flutter connect <dirección IP de su dispositivo>:5555
//para ip de su dispositivo, vaya a la configuración de su dispositivo,
//busque "Acerca del teléfono" y luego "Estado" o
//"Información del teléfono".
//Allí encontrará la dirección IP de su dispositivo.
//Asegúrese de que su computadora y su dispositivo
//estén conectados a la misma red Wi-Fi para que esto
//funcione correctamente.