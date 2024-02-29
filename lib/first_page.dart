import 'package:flutter/material.dart';
import 'package:myapp/second_page.dart';
import 'package:http/http.dart' as http;

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  //awaitを使う場合はasyncを使い、asyncを使うときはFuture型になる(未来から値が来るイメージ)
  Future<void> getRepo() async {
    var url = Uri.https('api.github.com', 'users/nt010/repos');
    var response = await http.get(url);
    debugPrint('Response status: ${response.statusCode}');
    debugPrint('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("First Page"),
            IconButton(
                onPressed: () async {
                  await getRepo();
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SecondPage(),
                    ),
                  );
                },
                icon: const Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}
