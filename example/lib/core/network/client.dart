import 'package:network_core/network_module/config/network_configuration.dart';
import 'package:network_core/network_module/network/network.dart';

NetworkClient client = NetworkClient.fromConfig(BaseNetworkConfig(
    baseURL: BaseURL(
        baseURL: "https://jsonplaceholder.typicode.com/",
        baseVersionEndPath: ''),
    interceptors: [],
    adapters: []));

class BaseNetworkConfig extends NetworkConfiguration {
  BaseNetworkConfig(
      {required super.baseURL, super.adapters, super.interceptors});
}
