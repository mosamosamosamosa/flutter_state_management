import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_state_management/screens/my_home_page.dart';
import 'package:flutter_state_management/state/my_home_state.dart';
import 'package:flutter_state_management/view_model/my_home_view_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

final myHomePageProvider =
    StateNotifierProvider<MyHomePageStateNotify, MyHomePageState>(
        (ref) => MyHomePageStateNotify());

// class MyHomePageState extends ChangeNotifier {
//   int counter = 0;
//   void increment() {
//     counter++;
//     //通知、再描画
//     notifyListeners();
//   }
// }


// class MyHomePageInheritedWidget extends InheritedWidget {
//   const MyHomePageInheritedWidget(
//       {Key? key,
//       required Widget child,
//       required this.data,
//       required this.counter})
//       : super(key: key, child: child);

//   final MyHomePageState data;
//   final int counter;

//   //以下決まり文句
//   static MyHomePageState of(BuildContext context, {bool listen = true}) {
//     if (listen) {
//       return (context
//               .dependOnInheritedWidgetOfExactType<MyHomePageInheritedWidget>())!
//           .data;
//     } else {
//       return (context
//               .getElementForInheritedWidgetOfExactType<
//                   MyHomePageInheritedWidget>()!
//               .widget as MyHomePageInheritedWidget)
//           .data;
//     }
//   }

//   @override
//   bool updateShouldNotify(MyHomePageInheritedWidget oldWidget) {
//     //条件つけれるよ
//     return counter != oldWidget.counter;
//   }
// }

// class MyHomePageLogic {
//   MyHomePageLogic() {
//     _counterController.sink.add(_counter);
//   }
//   final StreamController<int> _counterController = StreamController();
//   int _counter = 0;

//   Stream<int> get count => _counterController.stream;

//   void increment() {
//     _counter++;
//     _counterController.sink.add(_counter);
//   }

//   void dispose() {
//     _counterController.close();
//   }
// }
