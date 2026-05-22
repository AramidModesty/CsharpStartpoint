import 'package:flutter/material.dart';
import 'package:flutter_application_2/src/routes/my_heart_app_route.dart';
void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  // This widget is the root of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyHeartAppRoute.router,
    );
  }
}

/*
      Column(
              mainAxisAlignment: .center,
              children: [//Para mostrar texto anidado
                const Text('Tu has presionado el botón estas veces:'),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
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
*/
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