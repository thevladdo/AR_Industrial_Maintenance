import 'package:ar_industrial_maintenance/Model/data_model.dart';
import 'package:ar_industrial_maintenance/Screens/loading_page.dart';
import 'package:ar_industrial_maintenance/Screens/qrview.dart';
import 'package:ar_industrial_maintenance/Screens/widget_projection_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Loccioni | AR Maintenance App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffAF182B),
        fontFamily: 'SFMono',
      ),
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
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/scanqr',
      builder: (context, state) {
        return const ScanQRPage();
      },
    ),
    GoRoute(
      path: '/arpage',
      builder: (BuildContext context, GoRouterState state) {
        List<DataModel> data = state.extra as List<DataModel>;
        return WidgetProjectionPage(data: data);
      },
    ),
    GoRoute(
      path: '/loading',
      builder: (BuildContext context, GoRouterState state) {
        String? result = state.extra as String?;
        return LoadingPage(zoneId: result);
      },
    ),
  ],
);
