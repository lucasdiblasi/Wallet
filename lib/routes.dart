import 'package:flutter/material.dart';

import 'pages/wallet_page.dart';
import 'package:wallet/dependencies.dart' as dependencyInjector;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => dependencyInjector.injectWalletDependencies(
          WalletPage(),
        ),
      );
    case '/profile':
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                  appBar: AppBar(
                backgroundColor: Colors.indigo[800],
                title: Text('Profile'),
              )));
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo[800],
          ),
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
