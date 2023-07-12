import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xff2862f5));
}

/**
 * Material 3 es la versión más reciente del sistema de diseño de código abierto de Google. 
 *     Se expandió la compatibilidad de Flutter para compilar aplicaciones estéticamente agradables con 
 *     Material 3.
 * El tema tiene un esquema de color, ThemeData.colorScheme, que puede pasarse como un parámetro al 
 *     constructor o mediante los parámetros 'brightness' y 'colorSchemeSeed' (que se usan para generar 
 *     un esquema con ColorScheme.fromSeed).
 */
