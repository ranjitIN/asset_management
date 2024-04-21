import 'package:asset_management_app/Router/MyRouterConfig.dart';
import 'package:asset_management_app/Sidebar/CustomDesktopSideBar.dart';
import 'package:asset_management_app/provider/authProvider.dart';
import 'package:asset_management_app/screens/Dashboard/DashBoardScreen.dart';
import 'package:asset_management_app/screens/Devices/DeviceScreen.dart';
import 'package:asset_management_app/screens/Settings/SettingsScreen.dart';
import 'package:asset_management_app/screens/Tickets/TicketsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRouterConfig().route,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.child});

  final Widget child;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider())
      ],
      child: Scaffold(
        body: Row(
          children: [
            Expanded(flex:2,child: CustomDesktopSideBar()),
            Expanded(flex: 8,child: widget.child),
          ],
        ),
      ),
    );
  }
}