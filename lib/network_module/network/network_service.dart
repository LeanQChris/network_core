import 'package:network_core/network_module/config/network_configuration.dart';
import 'package:network_core/entity/entity.dart';
import 'package:network_core/network_module/network/network_failure.dart';
import 'package:network_core/network_module/request/request_api.dart';
import 'package:network_core/network_module/response/response_model.dart';
import 'package:network_core/network_module/utils/results.dart';

abstract class NetworkService {
  final NetworkConfiguration config;
  NetworkService({required this.config});

  Future<Result<NetworkFailure, NetworkResponseModel<T>>> get<T extends Entity>(
      RequestApi api);

  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      post<T extends Entity>(RequestApi api);

  Future<Result<NetworkFailure, NetworkResponseModel<T>>> put<T extends Entity>(
      RequestApi api);

  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      delete<T extends Entity>(RequestApi api);

  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      patch<T extends Entity>(RequestApi api);
}
