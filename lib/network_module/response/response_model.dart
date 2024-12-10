import 'package:network_core/entity/entity.dart';
import 'package:network_core/network_module/request/request_api.dart';

class NetworkResponseModel<T extends Entity> {
  final RequestApi? api;
  final int? statusCode;
  final String? message;
  final Map<String, dynamic>? rawObject;
  T? object;

  NetworkResponseModel(
      {this.api, this.statusCode, this.message, this.rawObject, this.object});
}
