import 'dart:io';

// import every file under subDarts; you can either import
// each source individually (possibly with prefixes) or use a
// single "barrel" export file as shown below.  The barrel file is
// defined in `subDarts/sub_darts.dart` and simply re‑exports the
// three Dart files in that directory.
// This part was made with copilot
// with reason being dart doesn't want me to
// be able to execute other than index in the main folder.
// unable to execute mains in the others but
// still very able to use the classes and functions defined in those files.
// and can execute these mains by f5 in these.
// import 'subDarts/sub_darts.dart';
import 'challenges/index.dart';
import 'menu/index.dart';
void main(List<String> args) {

  Menu menu = Menu();
  menu.MostrarMenu();

  String? userInput = stdin.readLineSync();
  if (userInput == null || userInput.trim().isEmpty) {
    print('No se recibió una opción válida. Saliendo.');
    return;
  }

  switch (userInput.trim()) {
    case '1':
      Challenge1().run();
      break;
    case '2':
      Challenge2().run();
      break;
    case '3':
      Challenge3().run();
      break;
    case '4':
      Challenge4().run();
      break;
    case '5':
      Challenge5().run();
      break;
    case '6':
      Challenge6().run();
      break;
    case '7':
      Challenge7().run();
      break;
    case '8':
      Challenge8().run();
      break;
    case '9':
      Challenge9().run();
      break;
    case '10':
      Challenge10().run();
      break;
    case '11':
      Challenge11().run();
      break;
    case '12':
      Challenge12().run();
      break;
    case '13':
      Challenge13().run();
      break;
    case '14':
      Challenge14().run();
      break;
    case '15':
      Challenge15().run();
      break;
    case '0':
    case 'q':
    case 'exit':
      print('Saliendo del programa. ¡Hasta luego!');
      return;
    default:
      print('Opción no válida. Por favor, elige una opción del menú.');
  }
}
void birthdayCalculator() {
  String? nameInput;
  String? birthdayInput;
  print('¡Hola! Bienvenido al calculador de años.');
  stdout.write('Escribe tu nombre: ');
  nameInput = stdin.readLineSync();
  stdout.write('Escribe tu fecha de nacimiento en formato dd/mm/yyyy: ');
  birthdayInput = stdin.readLineSync();
  if (birthdayInput == null || birthdayInput.trim().isEmpty) {
    print('No se recibió una fecha de nacimiento. Saliendo.');
    return;
  }

  DateTime? dateConverted = _convertToDateTime(birthdayInput.trim());
  if (dateConverted == null) {
    print('La fecha de nacimiento es inválida, nos enviaste: $birthdayInput');
    return;
  }

  var person = Person(
    name: nameInput?.trim(),
    birthday: dateConverted,
    age: DateTime.now().year - dateConverted.year,
  );

  print('Tu nombre: ${person.name}');
  print('Tu fecha de nacimiento: ${person.birthday}');
  print('¡Tu edad es ${person.age} años!');
}

DateTime? _convertToDateTime(String date) {
  List<String> parts = date.split('/');
  if (parts.length != 3) return null;
  return DateTime.tryParse('${parts[2]}-${parts[1]}-${parts[0]}');
}

class Person {
  final String? name;
  final DateTime? birthday;
  final int? age;
  Person({this.name, this.birthday, this.age});
}
