import 'dart:io';
void main() {
  print("ingresa el numero 1: ");
  double? num1 = double.tryParse(stdin.readLineSync()!);
  print("ingresa el numero 2: ");
  double? num2 = double.tryParse(stdin.readLineSync()!);
  if (num1!=null && num2 != null) {
    print("suma: ${num1 + num2},"+
    "resta: ${num1 - num2},"+
    "multiplicacion: ${num1 * num2},"+
    "division: ${num1!=0 ? num1 / num2 : "Indefinido"}");
  }//bool==true ? "entonces" : "de lo contrario"
  else {
    print("Uno de los numeros es invalido");
  }
}