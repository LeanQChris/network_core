import 'package:network_core/entity/entity.dart';
import 'package:network_core/network_module/network/network_client.dart';
import 'package:network_core/network_module/network/network_failure.dart';
import 'package:network_core/network_module/request/request_api.dart';
import 'package:network_core/network_module/response/response_model.dart';
import 'package:network_core/network_module/utils/results.dart';

abstract class Adapter {
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      onResponse<T extends Entity>(
          Result<NetworkFailure, NetworkResponseModel<T>> response,
          RequestApi api,
          NetworkClient client);
}
