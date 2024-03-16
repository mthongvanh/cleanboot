import 'data/app_service_locator.dart';
import 'domain/service_locator.dart';

/// Configure the service locator and app dependencies
Future<ServiceLocator> configureServices() async {
  final sl = AppServiceLocator();
  return sl;
}
