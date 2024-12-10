import 'package:example/app/app.dart';
import 'package:example/modules/posts/posts.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => PostProvider()..getPosts()),
  ], child: const MyApp()));
}
