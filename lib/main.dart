import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // MaterialAppウィジェットを返すMyAppクラスを定義
      home: MyHomePage(), // ホーム画面としてMyHomePageを表示
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Map data; // late修飾子を使用して、後で初期化することを示す
  late List userData; // late修飾子を使用して、後で初期化することを示す

  Future<void> getData() async {
    // HTTPリクエストでデータを取得するメソッド
    http.Response response = await http.get(Uri.parse("https://reqres.in/api/users?page=2")); // Uri.parseで正しいURLを指定
    data = json.decode(response.body); // レスポンスのデータをMapオブジェクトに変換
    setState(() {
      userData = data["data"]; // 必要なデータのみを取り出してuserDataに格納
    });
  }

  @override
  void initState() {
    super.initState();
    getData(); // initStateメソッドで初期化処理を行う
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // スケルトンとなるマテリアルデザインのウィジェット
      appBar: AppBar(
        title: const Text('Flutter Sample'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder( // ユーザーデータをリスト表示するListView.builderウィジェット
        itemCount: userData.length, // リストアイテムの数はuserDataの長さ
        itemBuilder: (BuildContext context, int index) { // リストアイテムを構築するためのコールバック
          return Card( // ユーザーデータを表示するカードウィジェット
            child: Row(
              children: <Widget>[
                CircleAvatar( // ユーザープロフィール画像
                  backgroundImage: NetworkImage(userData[index]["avatar"]), // ユーザープロフィール画像のURLを指定
                ),
                Text("${userData[index]["first_name"]} ${userData[index]["last_name"]}"), // ユーザーの名前を表示
              ],
            ),
          );
        },
      ),
    );
  }
}