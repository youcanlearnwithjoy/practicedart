import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: JankScreen());
  }
}

class JankScreen extends StatefulWidget {
  const JankScreen({super.key});

  @override
  State<JankScreen> createState() => _JankScreenState();
}

class _JankScreenState extends State<JankScreen> {
  // ⚠️ PROBLEM 1: Heavy CPU calculation executed directly inside the widget tree!
  int _heavyComputation() {
    int total = 0;
    for (int i = 0; i < 500000000; i++) {
      total += i % 2;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    // This blocks the UI thread for ~100ms every time the screen builds!
    final computedValue = _heavyComputation();

    return Scaffold(
      appBar: AppBar(title: Text('Jank Example: $computedValue')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircularProgressIndicator(), // ⚠️ PROBLEM 2: Animating everywhere without isolation
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}






/*
import 'package:companion/mvvm/user_viewmodel.dart';
import 'package:companion/widgetex/expandable_flex.dart';
import 'package:companion/widgetex/intrinsic_dimensions.dart';
import 'package:companion/widgetex/layoutbuilder_mediaquery.dart';
import 'package:companion/widgetex/repaind_boundary.dart';
import 'package:companion/widgets/bottom_sheet.dart';
import 'package:companion/widgets/checkbox_listtile.dart';
import 'package:companion/widgets/circleavatar.dart';
import 'package:companion/widgets/interactive_viewer.dart';
import 'package:companion/widgets/longpress_draggable.dart';
import 'package:companion/widgets/reorderable_list.dart';
import 'package:flutter/material.dart' hide PreferredSizeWidget;
import 'package:companion/widgets/preferred_size.dart';
import 'package:companion/widgets/material_banner.dart';

import 'justtest/lsp.dart';
import 'keys/todo.dart';
import 'keys/unique_key.dart';
import 'keys/value_globalkeys.dart';
import 'lifecycles/deactivate_dispose.dart';
import 'lifecycles/widget_lifecycle.dart';
import 'mvc/view_ex.dart';
import 'mvvm/user_profile_mvvmview.dart';
import 'mvvm/user_repo.dart';

void main() {
  // 1. Instantiating Model / Repository
  final userRepository = UserRepository();

  // 2. Injecting Repository into ViewModel
  final userViewModel = UserViewmodel(userRepository);
  runApp(MyApp(userViewModel: userViewModel));
}

class MyApp extends StatelessWidget {
  // Declare field and add to constructor
  final UserViewmodel userViewModel;

  const MyApp({super.key, required this.userViewModel});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: IsolatedRepaintExample(),
      // home:  UserProfileMvvmView(viewModel: userViewModel),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
*/
