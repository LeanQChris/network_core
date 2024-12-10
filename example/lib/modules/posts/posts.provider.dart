import 'package:example/core/network/client.dart';
import 'package:example/modules/posts/data/entity_parser.dart';
import 'package:example/modules/posts/data/get.api.dart';
import 'package:example/modules/posts/entity/post.dart';
import 'package:flutter/material.dart';
import 'package:network_core/network_module/network/network.dart';
import 'package:network_core/network_module/response/response_model.dart';
import 'package:network_core/network_module/utils/results.dart';

class PostProvider extends ChangeNotifier {
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  void setPost(List<Post> posts) {
    _posts = posts;
    notifyListeners();
  }

  Future<Result<NetworkFailure, NetworkResponseModel<Post>>> getPosts() async {
    var result =
        await cusclient.request<Post>(GetPoss(parser: PostEntityParser()));
    result.fold((failure) {
      return Failure(failure);
    }, (response) {
      List<Post> posts = response.rawObject!["data"]
          .map<Post>((e) => Post.fromJson(e))
          .toList();
      setPost(posts);
    });
    return result;
  }
}
