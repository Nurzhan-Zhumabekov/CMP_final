// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

part of 'coffee_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CoffeeApiService extends CoffeeApiService {
  _$CoffeeApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CoffeeApiService;

  @override
  Future<Response<String>> getHotCoffees() {
    final Uri $url = Uri.parse('/coffee/hot');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }

  @override
  Future<Response<String>> getIcedCoffees() {
    final Uri $url = Uri.parse('/coffee/iced');
    final Request $request = Request('GET', $url, client.baseUrl);
    return client.send<String, String>($request);
  }
}
