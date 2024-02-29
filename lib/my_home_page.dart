import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  // Stateを作る定型表現
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String message = "Initial message";

  //awaitを使う場合はasyncを使い、asyncを使うときはFuture型になる(未来から値が来るイメージ)
  Future<void> getRepo() async {
    var url = Uri.https('api.github.com', 'nt010/repos');
    var response = await http.get(url);
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
  }


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
        onPressed: () async {
          await getRepo();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
