import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/main.dart';
import 'package:flutter_state_management/state/my_home_state.dart';
import 'package:flutter_state_management/view_model/my_home_view_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print('myhomepage build');
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[WidgetA(), WidgetB(), WidgetC()],
          ),
        ),
      ),
    );
    ;
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    print('widgetA build');
    return Text('カウントしてみて');
  }
}

class WidgetB extends ConsumerWidget {
  const WidgetB({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final MyHomePageState state = MyHomePageInheritedWidget.of(context);
    print('WidgetB Build');
    final int counter = ref.watch(myHomePageProvider).counter;
    // final int counter =
    //     context.select<MyHomePageState, int>((state) => state.counter);
    return Text('$counter', style: Theme.of(context).textTheme.headline4);
  }
}

class WidgetC extends ConsumerWidget {
  const WidgetC({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('widgetC build');
    final Function increment = ref.read(myHomePageProvider.notifier).increment;
    //final MyHomePageState state =
    // MyHomePageInheritedWidget.of(context, listen: false);
    return ElevatedButton(
        onPressed: () {
          //state.incrementCounter();
          increment();
        },
        child: const Text('カウント'));
  }
}
