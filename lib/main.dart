import 'package:cinemapedia/config/route/app_router.dart';
import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  /*
    Un Future representa principalmente el resultado de
      una operación asíncrona. Es una promesa de que
      pronto tendrás un valor. La promesa puede falla y hay
      que manejar la excepción. Los futures son un acuerdo
      de que en el futuro tendrás un valor para ser usado
  */
  await dotenv.load(fileName: '.env');
  //Esta parte "await dotenv..." nos permite configurar las variables de entorno para nuestra API_KEY THE_MOVIEDB_KEY
  //Revisar documentacion https://pub.dev/packages/flutter_dotenv
  runApp(const ProviderScope(child: MainApp()));
  /*ProviderScope.- Mantiene una referencia a todos los providers que utilicemos*/
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner:
          false, //Le quita la etiqueta a la aplicacion dentro del emulador
      theme: AppTheme()
          .getTheme(), //Configuracion del interfaz de nuestra aplicacion
    );
  }
}
