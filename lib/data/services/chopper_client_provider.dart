import 'package:chopper/chopper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_constants.dart';
import 'coffee_api_service.dart';

final chopperClientProvider = Provider<ChopperClient>((ref) {
  return ChopperClient(
    baseUrl: Uri.parse(AppConstants.baseUrl),
    services: [CoffeeApiService.create()],
    interceptors: [HttpLoggingInterceptor()],
  );
});

final coffeeApiServiceProvider = Provider<CoffeeApiService>((ref) {
  return ref.watch(chopperClientProvider).getService<CoffeeApiService>();
});
