// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteItemsTable extends FavoriteItems
    with TableInfo<$FavoriteItemsTable, FavoriteItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta = const VerificationMeta(
    'productId',
  );
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
    'product_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ingredientsMeta = const VerificationMeta(
    'ingredients',
  );
  @override
  late final GeneratedColumn<String> ingredients = GeneratedColumn<String>(
    'ingredients',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    productId,
    title,
    description,
    imageUrl,
    category,
    price,
    ingredients,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<FavoriteItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(
        _productIdMeta,
        productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('ingredients')) {
      context.handle(
        _ingredientsMeta,
        ingredients.isAcceptableOrUnknown(
          data['ingredients']!,
          _ingredientsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId};
  @override
  FavoriteItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteItem(
      productId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      ingredients: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredients'],
      )!,
    );
  }

  @override
  $FavoriteItemsTable createAlias(String alias) {
    return $FavoriteItemsTable(attachedDatabase, alias);
  }
}

class FavoriteItem extends DataClass implements Insertable<FavoriteItem> {
  final int productId;
  final String title;
  final String description;
  final String imageUrl;
  final String category;
  final double price;
  final String ingredients;
  const FavoriteItem({
    required this.productId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.ingredients,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<int>(productId);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['image_url'] = Variable<String>(imageUrl);
    map['category'] = Variable<String>(category);
    map['price'] = Variable<double>(price);
    map['ingredients'] = Variable<String>(ingredients);
    return map;
  }

  FavoriteItemsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteItemsCompanion(
      productId: Value(productId),
      title: Value(title),
      description: Value(description),
      imageUrl: Value(imageUrl),
      category: Value(category),
      price: Value(price),
      ingredients: Value(ingredients),
    );
  }

  factory FavoriteItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteItem(
      productId: serializer.fromJson<int>(json['productId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      category: serializer.fromJson<String>(json['category']),
      price: serializer.fromJson<double>(json['price']),
      ingredients: serializer.fromJson<String>(json['ingredients']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<int>(productId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'category': serializer.toJson<String>(category),
      'price': serializer.toJson<double>(price),
      'ingredients': serializer.toJson<String>(ingredients),
    };
  }

  FavoriteItem copyWith({
    int? productId,
    String? title,
    String? description,
    String? imageUrl,
    String? category,
    double? price,
    String? ingredients,
  }) => FavoriteItem(
    productId: productId ?? this.productId,
    title: title ?? this.title,
    description: description ?? this.description,
    imageUrl: imageUrl ?? this.imageUrl,
    category: category ?? this.category,
    price: price ?? this.price,
    ingredients: ingredients ?? this.ingredients,
  );
  FavoriteItem copyWithCompanion(FavoriteItemsCompanion data) {
    return FavoriteItem(
      productId: data.productId.present ? data.productId.value : this.productId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      category: data.category.present ? data.category.value : this.category,
      price: data.price.present ? data.price.value : this.price,
      ingredients: data.ingredients.present
          ? data.ingredients.value
          : this.ingredients,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteItem(')
          ..write('productId: $productId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('ingredients: $ingredients')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    productId,
    title,
    description,
    imageUrl,
    category,
    price,
    ingredients,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteItem &&
          other.productId == this.productId &&
          other.title == this.title &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl &&
          other.category == this.category &&
          other.price == this.price &&
          other.ingredients == this.ingredients);
}

class FavoriteItemsCompanion extends UpdateCompanion<FavoriteItem> {
  final Value<int> productId;
  final Value<String> title;
  final Value<String> description;
  final Value<String> imageUrl;
  final Value<String> category;
  final Value<double> price;
  final Value<String> ingredients;
  const FavoriteItemsCompanion({
    this.productId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.category = const Value.absent(),
    this.price = const Value.absent(),
    this.ingredients = const Value.absent(),
  });
  FavoriteItemsCompanion.insert({
    this.productId = const Value.absent(),
    required String title,
    required String description,
    required String imageUrl,
    required String category,
    required double price,
    required String ingredients,
  }) : title = Value(title),
       description = Value(description),
       imageUrl = Value(imageUrl),
       category = Value(category),
       price = Value(price),
       ingredients = Value(ingredients);
  static Insertable<FavoriteItem> custom({
    Expression<int>? productId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? imageUrl,
    Expression<String>? category,
    Expression<double>? price,
    Expression<String>? ingredients,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
      if (category != null) 'category': category,
      if (price != null) 'price': price,
      if (ingredients != null) 'ingredients': ingredients,
    });
  }

  FavoriteItemsCompanion copyWith({
    Value<int>? productId,
    Value<String>? title,
    Value<String>? description,
    Value<String>? imageUrl,
    Value<String>? category,
    Value<double>? price,
    Value<String>? ingredients,
  }) {
    return FavoriteItemsCompanion(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      price: price ?? this.price,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteItemsCompanion(')
          ..write('productId: $productId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('category: $category, ')
          ..write('price: $price, ')
          ..write('ingredients: $ingredients')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteItemsTable favoriteItems = $FavoriteItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteItems];
}

typedef $$FavoriteItemsTableCreateCompanionBuilder =
    FavoriteItemsCompanion Function({
      Value<int> productId,
      required String title,
      required String description,
      required String imageUrl,
      required String category,
      required double price,
      required String ingredients,
    });
typedef $$FavoriteItemsTableUpdateCompanionBuilder =
    FavoriteItemsCompanion Function({
      Value<int> productId,
      Value<String> title,
      Value<String> description,
      Value<String> imageUrl,
      Value<String> category,
      Value<double> price,
      Value<String> ingredients,
    });

class $$FavoriteItemsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteItemsTable> {
  $$FavoriteItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnFilters(column),
  );
}

class $$FavoriteItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteItemsTable> {
  $$FavoriteItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get productId => $composableBuilder(
    column: $table.productId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$FavoriteItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteItemsTable> {
  $$FavoriteItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get ingredients => $composableBuilder(
    column: $table.ingredients,
    builder: (column) => column,
  );
}

class $$FavoriteItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoriteItemsTable,
          FavoriteItem,
          $$FavoriteItemsTableFilterComposer,
          $$FavoriteItemsTableOrderingComposer,
          $$FavoriteItemsTableAnnotationComposer,
          $$FavoriteItemsTableCreateCompanionBuilder,
          $$FavoriteItemsTableUpdateCompanionBuilder,
          (
            FavoriteItem,
            BaseReferences<_$AppDatabase, $FavoriteItemsTable, FavoriteItem>,
          ),
          FavoriteItem,
          PrefetchHooks Function()
        > {
  $$FavoriteItemsTableTableManager(_$AppDatabase db, $FavoriteItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> ingredients = const Value.absent(),
              }) => FavoriteItemsCompanion(
                productId: productId,
                title: title,
                description: description,
                imageUrl: imageUrl,
                category: category,
                price: price,
                ingredients: ingredients,
              ),
          createCompanionCallback:
              ({
                Value<int> productId = const Value.absent(),
                required String title,
                required String description,
                required String imageUrl,
                required String category,
                required double price,
                required String ingredients,
              }) => FavoriteItemsCompanion.insert(
                productId: productId,
                title: title,
                description: description,
                imageUrl: imageUrl,
                category: category,
                price: price,
                ingredients: ingredients,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$FavoriteItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoriteItemsTable,
      FavoriteItem,
      $$FavoriteItemsTableFilterComposer,
      $$FavoriteItemsTableOrderingComposer,
      $$FavoriteItemsTableAnnotationComposer,
      $$FavoriteItemsTableCreateCompanionBuilder,
      $$FavoriteItemsTableUpdateCompanionBuilder,
      (
        FavoriteItem,
        BaseReferences<_$AppDatabase, $FavoriteItemsTable, FavoriteItem>,
      ),
      FavoriteItem,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteItemsTableTableManager get favoriteItems =>
      $$FavoriteItemsTableTableManager(_db, _db.favoriteItems);
}
