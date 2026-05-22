import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/feature/widgets/my_heart_drawer.dart';
class AgeScreen extends StatefulWidget{
  const AgeScreen({super.key});

  @override
  _AgeScreenState createState() => _AgeScreenState();

}
class _AgeScreenState extends State<AgeScreen>{
  DateTime? _selectedDate;
  int? _calculatedAge;
  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _calculateAge(picked);
      });
    }
  }
  void _calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    _calculatedAge = today.year - birthDate.year;
    if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
      _calculatedAge = _calculatedAge! - 1;
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: MyHeartDrawer(),
      appBar: AppBar(title: Text("Age space")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Age Screen',
              style: TextStyle( fontSize: 25),
            ),
            ElevatedButton(
              onPressed: (){
                _selectDate(context);
              },
              child: Text('Select Date'),
            ),
            if (_calculatedAge != null)
              Text(
                'Your age is: $_calculatedAge',
                style: TextStyle(fontSize: 20),
              ),
          ],
        ),
      ),
    );
  }
}


/*
  //Progress saver start
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
    //Progress saver end
  @override


appBar: AppBar( //Header
        backgroundColor: const Color.fromARGB(255, 255, 145, 0),
        title: Text(widget.title),
      ),
      body: Center(
        child: AgeScreen( )
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
    ),
*/