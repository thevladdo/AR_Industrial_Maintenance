//import 'dart:html';
//import 'dart:js';

//import 'package:flutter_web_plugins/url_strategy.dart'; //Don't remove
//import 'package:ar_manager/Screens/zone_view.dart';

import 'package:ar_manager/Screens/home.dart';
import 'package:ar_manager/Screens/machine.dart';
import 'package:ar_manager/Screens/zone.dart';
import 'package:ar_manager/Screens/data.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/*void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Loccioni | AR Manager',
      theme: ThemeData(fontFamily: 'SFMono'),
      routerConfig: _goRouter,
    );
  }
}

final GoRouter _goRouter = GoRouter(
  initialLocation: '/home',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home',
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const MachineHomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      path: '/machine',
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const ZoneHomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
  ],
);*/
void main () {
  return runApp(App());
}

class App extends StatelessWidget{
   App({Key? key}) : super(key: key);

  static const String title = 'Loccioni:';

  @override 
  Widget build (BuildContext context) => MaterialApp.router(
    routerDelegate : _router.routerDelegate,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,
  );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(

        routes:  <GoRoute>[
          
          GoRoute(
            path:'machine',
            builder: (BuildContext context, GoRouterState state) => 
            const Machine(),       
          ),

          GoRoute(
            path: 'zone',
            builder : (BuildContext context, GoRouterState state) => 
            const Zone(),      
          ),
 
          GoRoute(
            path: 'data',
            builder : (BuildContext context, GoRouterState state) => 
            const Data(),      
          ),

        ],

        path:'/',
        builder: (BuildContext context, GoRouterState state) => 
        const Home(),
      ),
    ]
  );
}