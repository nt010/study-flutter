import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  // Stateを作る定型表現
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "Initial message";

  List dish = ["curry", "pasta", "sushi", "pizza"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                print(value);
                setState(() {
                  message = value;
                });
              },
            ),
            Text(message),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
