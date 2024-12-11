import 'package:network_core/entity/entity.dart';
import 'package:network_core/network_module/network_module.dart';
import 'package:network_core/network_module/utils/results.dart';

class CustomNetworkService extends NetworkService {
  CustomNetworkService({required super.config});
  final Dio dioClient = Dio();
  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      delete<T extends Entity>(RequestApi api) {
    throw UnimplementedError();
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>> get<T extends Entity>(
      RequestApi api) async {
    try {
      String finalUrl = config.baseURL.baseURL +
          config.baseURL.baseVersionEndPath +
          api.endPath;

      Response<dynamic> response = await dioClient.get(
        finalUrl,
        queryParameters: api.queryParams,
        options: Options(
          headers: api.headers,
        ),
      );
      Map<String, dynamic> customResponse = {};
      customResponse["data"] = response.data;
      return Success(NetworkResponseModel(
          api: api,
          statusCode: response.statusCode ?? 0,
          message: response.statusMessage ?? "",
          rawObject: customResponse));
    } catch (e) {
      return await _parseError(e);
    }
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      patch<T extends Entity>(RequestApi api) {
    throw UnimplementedError();
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      post<T extends Entity>(RequestApi api) {
    throw UnimplementedError();
  }

  @override
  Future<Result<NetworkFailure, NetworkResponseModel<T>>> put<T extends Entity>(
      RequestApi api) {
    throw UnimplementedError();
  }

  Future<Result<NetworkFailure, NetworkResponseModel<T>>>
      _parseError<T extends Entity>(e) async {
    try {
      if (e is DioException) {
        if (e.response?.data != null) {
          final data = e.response?.data as Map<String, dynamic>;
          final error = data["message"] as String?;
          return Failure(NetworkFailure(
            message: error ?? e.toString(),
            statusCode: e.response?.statusCode ?? 400,
            rawObject: data,
          ));
        } else {
          return Failure(
              const NetworkFailure(statusCode: 0, message: "dont try it"));
        }
      } else {
        return Failure(NetworkFailure(message: e.toString(), statusCode: 400));
      }
    } catch (e) {
      return Failure(NetworkFailure(message: e.toString(), statusCode: 400));
    }
  }
}
