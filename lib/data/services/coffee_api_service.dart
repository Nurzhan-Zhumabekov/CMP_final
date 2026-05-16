import 'package:chopper/chopper.dart';

part 'coffee_api_service.chopper.dart';

@ChopperApi(baseUrl: '/coffee')
abstract class CoffeeApiService extends ChopperService {
  static CoffeeApiService create([ChopperClient? client]) =>
      _$CoffeeApiService(client);

  @GET(path: '/hot')
  Future<Response<String>> getHotCoffees();

  @GET(path: '/iced')
  Future<Response<String>> getIcedCoffees();
}
