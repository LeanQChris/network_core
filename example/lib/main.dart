import 'package:example/core/network/client.dart';
import 'package:example/modules/posts/data/entity_parser.dart';
import 'package:example/modules/posts/data/get.api.dart';
import 'package:example/modules/posts/entity/post.dart';
import 'package:flutter/material.dart';
import 'package:network_core/network_module/network/network.dart';
import 'package:network_core/network_module/response/response_model.dart';
import 'package:network_core/network_module/utils/results.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  Future<Result<NetworkFailure, NetworkResponseModel<Post>>> getPosts() async {
    return await client.request(GetPoss(parser: PostEntityParser()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await getPosts();
          result.fold(
            (response) {
              print("Response: ");
              print(response);
            },
            (error) {
              print("Failure:");
            },
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
