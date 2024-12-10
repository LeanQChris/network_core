import 'package:network_core/network_module/request/interceptor.dart';
import 'package:network_core/network_module/request/request_type.dart';
import 'package:network_core/network_module/response/adapter.dart';

class BaseURL {
  String baseURL;
  String baseVersionEndPath;
  BaseURL({required this.baseURL, this.baseVersionEndPath = ""});
}

abstract class NetworkConfiguration {
  BaseURL baseURL;
  double timeout;
  RequestType networkRequestType;
  List<AppInterceptor> interceptors;
  List<Adapter> adapters;

  NetworkConfiguration(
      {required this.baseURL,
      this.interceptors = const [],
      this.adapters = const [],
      this.timeout = 70,
      this.networkRequestType = RequestType.rest});
}
