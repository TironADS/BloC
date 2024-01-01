import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'BloC',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo BloC Page'),
      ),
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
    print("Rebuilded");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(state.counterValue.toString());
              },
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.green,
                      child: Center(
                          child: Text(
                        "+",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.red,
                      child: Center(
                          child: Text(
                        "-",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    context.read<CounterBloc>().add(multiplyEvent());
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.blue,
                      child: Center(
                          child: Text(
                        "x",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    context.read<CounterBloc>().add(divitionEvent());
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      color: Colors.orange,
                      child: Center(
                          child: Text(
                        "/",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ))),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: GestureDetector(
                onTap: () {
                  context.read<CounterBloc>().add(clearEvent());
                },
                child: Container(
                    height: 30,
                    width: 180,
                    color: Colors.purple,
                    child: Center(
                        child: Text(
                      "clear All",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ))),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
