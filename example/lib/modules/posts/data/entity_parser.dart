import 'package:example/modules/posts/entity/post.dart';
import 'package:network_core/entity/entity.dart';

class PostEntityParser extends EntityParser<Post> {
  @override
  Post parseObject(Map<String, dynamic> json) {
    return Post();
  }
}
