import 'package:network_core/network_module/network/http_method.dart';
import 'package:network_core/network_module/request/request_api.dart';

class GetPoss extends RequestApi {
  GetPoss({required super.parser});

  @override
  String get endPath => "posts";

  @override
  HTTPMethod get method => HTTPMethod.get;
}
