import 'package:flutter/material.dart';
import 'generated/i18n.dart';
import 'routes.dart' as route;

void main() {
  final i18n = I18n.delegate;

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'Source-Sans-Pro-Regular',
        textTheme: TextTheme(
            title: TextStyle(
                fontSize: 14,
                fontFamily: 'Source-Sans-Pro-SemiBold',
                color: Colors.grey[700]),
            display1: TextStyle(
                fontSize: 22,
                fontFamily: 'Source-Sans-Pro-Bold',
                color: Colors.black),
            headline:
                TextStyle(fontSize: 16, fontFamily: 'Source-Sans-Pro-Light'),
            subtitle: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Source-Sans-Pro-Bold')),
      ),
      initialRoute: '/',
      onGenerateRoute: route.generateRoute,
      supportedLocales: i18n.supportedLocales,
      localizationsDelegates: [i18n],
      localeResolutionCallback: i18n.resolution(
        fallback: new Locale('en'),
      ),
    ),
  );
}
