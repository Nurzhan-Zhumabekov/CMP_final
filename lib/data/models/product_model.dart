import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int id;
  final String title;
  final String description;
  final List<String> ingredients;
  final String image;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  Product toEntity({required String category}) => Product(
        id: id,
        title: title,
        description: description,
        ingredients: ingredients,
        imageUrl: image,
        category: category,
        price: 3.49 + (id % 6) * 0.50,
      );
}
