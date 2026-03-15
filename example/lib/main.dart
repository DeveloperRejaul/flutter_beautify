import 'package:example/demo/accordion_example.dart';
import 'package:example/demo/avatar_example.dart';
import 'package:example/demo/badge_example.dart';
import 'package:example/demo/bottom_navigation_bar_example.dart';
import 'package:example/demo/bottom_sheet_example.dart';
import 'package:example/demo/breadcrumb_example.dart';
import 'package:example/demo/button_example.dart';
import 'package:example/demo/calendar_example.dart';
import 'package:example/demo/card_example.dart';
import 'package:example/demo/checkbox_example.dart';
import 'package:example/demo/date_picker_example.dart';
import 'package:example/demo/dialog_example.dart';
import 'package:example/demo/dropdown_example.dart';
import 'package:example/demo/pagination_example.dart';
import 'package:example/demo/progress_example.dart';
import 'package:example/demo/radio_button_example.dart';
import 'package:example/demo/sidebar_example.dart';
import 'package:example/demo/slider_example.dart';
import 'package:example/demo/snackbar_example.dart';
import 'package:example/demo/switch_example.dart';
import 'package:example/demo/tabs_example.dart';
import 'package:example/demo/textfield_example.dart';
import 'package:example/demo/toast_example.dart';
import 'package:example/demo/tooltip_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(child: SidebarExample()),
    );
  }
}
