import 'package:asset_management_app/main.dart';
import 'package:asset_management_app/screens/Dashboard/DashBoardScreen.dart';
import 'package:asset_management_app/screens/Devices/DeviceScreen.dart';
import 'package:asset_management_app/screens/Settings/SettingsScreen.dart';
import 'package:asset_management_app/screens/Tickets/TicketsScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRouterConfig {
  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  GoRouter get route => GoRouter(
          initialLocation: DashBoardScreen.screenPath,
          debugLogDiagnostics: true,
          navigatorKey: _rootNavigatorKey,
          routes: [
            ShellRoute(
                navigatorKey: _shellNavigatorKey,
                builder:
                    (BuildContext context, GoRouterState state, Widget child) {
                  return MyHomePage(child: child);
                },
                routes: [
                  GoRoute(
                      path: DashBoardScreen.screenPath,
                      name: DashBoardScreen.screenName,
                      builder: (context, state) => DashBoardScreen()),
                  GoRoute(
                      path: DevicesScreen.screenPath,
                      name: DevicesScreen.screenName,
                      builder: (context, state) => DevicesScreen()),
                  GoRoute(
                      path: TicketScreen.screenPath,
                      name: TicketScreen.screenName,
                      builder: (context, state) => TicketScreen()),
                  GoRoute(
                      path: SettingsScreen.screenPath,
                      name: SettingsScreen.screenName,
                      builder: (context, state) => SettingsScreen()),
                ]),
          ]);
}
