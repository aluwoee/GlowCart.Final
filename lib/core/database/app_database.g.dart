// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteProductsTable extends FavoriteProducts
    with TableInfo<$FavoriteProductsTable, FavoriteProduct> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _brandMeta = const VerificationMeta('brand');
  @override
  late final GeneratedColumn<String> brand = GeneratedColumn<String>(
      'brand', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _thumbnailMeta =
      const VerificationMeta('thumbnail');
  @override
  late final GeneratedColumn<String> thumbnail = GeneratedColumn<String>(
      'thumbnail', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, price, brand, thumbnail];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_products';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteProduct> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('brand')) {
      context.handle(
          _brandMeta, brand.isAcceptableOrUnknown(data['brand']!, _brandMeta));
    } else if (isInserting) {
      context.missing(_brandMeta);
    }
    if (data.containsKey('thumbnail')) {
      context.handle(_thumbnailMeta,
          thumbnail.isAcceptableOrUnknown(data['thumbnail']!, _thumbnailMeta));
    } else if (isInserting) {
      context.missing(_thumbnailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteProduct map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteProduct(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      brand: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand'])!,
      thumbnail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}thumbnail'])!,
    );
  }

  @override
  $FavoriteProductsTable createAlias(String alias) {
    return $FavoriteProductsTable(attachedDatabase, alias);
  }
}

class FavoriteProduct extends DataClass implements Insertable<FavoriteProduct> {
  final int id;
  final String title;
  final double price;
  final String brand;
  final String thumbnail;
  const FavoriteProduct(
      {required this.id,
      required this.title,
      required this.price,
      required this.brand,
      required this.thumbnail});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['price'] = Variable<double>(price);
    map['brand'] = Variable<String>(brand);
    map['thumbnail'] = Variable<String>(thumbnail);
    return map;
  }

  FavoriteProductsCompanion toCompanion(bool nullToAbsent) {
    return FavoriteProductsCompanion(
      id: Value(id),
      title: Value(title),
      price: Value(price),
      brand: Value(brand),
      thumbnail: Value(thumbnail),
    );
  }

  factory FavoriteProduct.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteProduct(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      price: serializer.fromJson<double>(json['price']),
      brand: serializer.fromJson<String>(json['brand']),
      thumbnail: serializer.fromJson<String>(json['thumbnail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'price': serializer.toJson<double>(price),
      'brand': serializer.toJson<String>(brand),
      'thumbnail': serializer.toJson<String>(thumbnail),
    };
  }

  FavoriteProduct copyWith(
          {int? id,
          String? title,
          double? price,
          String? brand,
          String? thumbnail}) =>
      FavoriteProduct(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        brand: brand ?? this.brand,
        thumbnail: thumbnail ?? this.thumbnail,
      );
  FavoriteProduct copyWithCompanion(FavoriteProductsCompanion data) {
    return FavoriteProduct(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      price: data.price.present ? data.price.value : this.price,
      brand: data.brand.present ? data.brand.value : this.brand,
      thumbnail: data.thumbnail.present ? data.thumbnail.value : this.thumbnail,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteProduct(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('brand: $brand, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, price, brand, thumbnail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteProduct &&
          other.id == this.id &&
          other.title == this.title &&
          other.price == this.price &&
          other.brand == this.brand &&
          other.thumbnail == this.thumbnail);
}

class FavoriteProductsCompanion extends UpdateCompanion<FavoriteProduct> {
  final Value<int> id;
  final Value<String> title;
  final Value<double> price;
  final Value<String> brand;
  final Value<String> thumbnail;
  const FavoriteProductsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.price = const Value.absent(),
    this.brand = const Value.absent(),
    this.thumbnail = const Value.absent(),
  });
  FavoriteProductsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required double price,
    required String brand,
    required String thumbnail,
  })  : title = Value(title),
        price = Value(price),
        brand = Value(brand),
        thumbnail = Value(thumbnail);
  static Insertable<FavoriteProduct> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<double>? price,
    Expression<String>? brand,
    Expression<String>? thumbnail,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (price != null) 'price': price,
      if (brand != null) 'brand': brand,
      if (thumbnail != null) 'thumbnail': thumbnail,
    });
  }

  FavoriteProductsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<double>? price,
      Value<String>? brand,
      Value<String>? thumbnail}) {
    return FavoriteProductsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      brand: brand ?? this.brand,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (brand.present) {
      map['brand'] = Variable<String>(brand.value);
    }
    if (thumbnail.present) {
      map['thumbnail'] = Variable<String>(thumbnail.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteProductsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('price: $price, ')
          ..write('brand: $brand, ')
          ..write('thumbnail: $thumbnail')
          ..write(')'))
        .toString();
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productTitlesMeta =
      const VerificationMeta('productTitles');
  @override
  late final GeneratedColumn<String> productTitles = GeneratedColumn<String>(
      'product_titles', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalPriceMeta =
      const VerificationMeta('totalPrice');
  @override
  late final GeneratedColumn<double> totalPrice = GeneratedColumn<double>(
      'total_price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, productTitles, totalPrice, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'orders';
  @override
  VerificationContext validateIntegrity(Insertable<Order> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_titles')) {
      context.handle(
          _productTitlesMeta,
          productTitles.isAcceptableOrUnknown(
              data['product_titles']!, _productTitlesMeta));
    } else if (isInserting) {
      context.missing(_productTitlesMeta);
    }
    if (data.containsKey('total_price')) {
      context.handle(
          _totalPriceMeta,
          totalPrice.isAcceptableOrUnknown(
              data['total_price']!, _totalPriceMeta));
    } else if (isInserting) {
      context.missing(_totalPriceMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Order(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productTitles: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_titles'])!,
      totalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}total_price'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(attachedDatabase, alias);
  }
}

class Order extends DataClass implements Insertable<Order> {
  final int id;
  final String productTitles;
  final double totalPrice;
  final DateTime createdAt;
  const Order(
      {required this.id,
      required this.productTitles,
      required this.totalPrice,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_titles'] = Variable<String>(productTitles);
    map['total_price'] = Variable<double>(totalPrice);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  OrdersCompanion toCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      id: Value(id),
      productTitles: Value(productTitles),
      totalPrice: Value(totalPrice),
      createdAt: Value(createdAt),
    );
  }

  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Order(
      id: serializer.fromJson<int>(json['id']),
      productTitles: serializer.fromJson<String>(json['productTitles']),
      totalPrice: serializer.fromJson<double>(json['totalPrice']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productTitles': serializer.toJson<String>(productTitles),
      'totalPrice': serializer.toJson<double>(totalPrice),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Order copyWith(
          {int? id,
          String? productTitles,
          double? totalPrice,
          DateTime? createdAt}) =>
      Order(
        id: id ?? this.id,
        productTitles: productTitles ?? this.productTitles,
        totalPrice: totalPrice ?? this.totalPrice,
        createdAt: createdAt ?? this.createdAt,
      );
  Order copyWithCompanion(OrdersCompanion data) {
    return Order(
      id: data.id.present ? data.id.value : this.id,
      productTitles: data.productTitles.present
          ? data.productTitles.value
          : this.productTitles,
      totalPrice:
          data.totalPrice.present ? data.totalPrice.value : this.totalPrice,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('id: $id, ')
          ..write('productTitles: $productTitles, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productTitles, totalPrice, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Order &&
          other.id == this.id &&
          other.productTitles == this.productTitles &&
          other.totalPrice == this.totalPrice &&
          other.createdAt == this.createdAt);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<int> id;
  final Value<String> productTitles;
  final Value<double> totalPrice;
  final Value<DateTime> createdAt;
  const OrdersCompanion({
    this.id = const Value.absent(),
    this.productTitles = const Value.absent(),
    this.totalPrice = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  OrdersCompanion.insert({
    this.id = const Value.absent(),
    required String productTitles,
    required double totalPrice,
    required DateTime createdAt,
  })  : productTitles = Value(productTitles),
        totalPrice = Value(totalPrice),
        createdAt = Value(createdAt);
  static Insertable<Order> custom({
    Expression<int>? id,
    Expression<String>? productTitles,
    Expression<double>? totalPrice,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productTitles != null) 'product_titles': productTitles,
      if (totalPrice != null) 'total_price': totalPrice,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  OrdersCompanion copyWith(
      {Value<int>? id,
      Value<String>? productTitles,
      Value<double>? totalPrice,
      Value<DateTime>? createdAt}) {
    return OrdersCompanion(
      id: id ?? this.id,
      productTitles: productTitles ?? this.productTitles,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productTitles.present) {
      map['product_titles'] = Variable<String>(productTitles.value);
    }
    if (totalPrice.present) {
      map['total_price'] = Variable<double>(totalPrice.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdersCompanion(')
          ..write('id: $id, ')
          ..write('productTitles: $productTitles, ')
          ..write('totalPrice: $totalPrice, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteProductsTable favoriteProducts =
      $FavoriteProductsTable(this);
  late final $OrdersTable orders = $OrdersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [favoriteProducts, orders];
}

typedef $$FavoriteProductsTableCreateCompanionBuilder
    = FavoriteProductsCompanion Function({
  Value<int> id,
  required String title,
  required double price,
  required String brand,
  required String thumbnail,
});
typedef $$FavoriteProductsTableUpdateCompanionBuilder
    = FavoriteProductsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<double> price,
  Value<String> brand,
  Value<String> thumbnail,
});

class $$FavoriteProductsTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteProductsTable> {
  $$FavoriteProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => ColumnFilters(column));
}

class $$FavoriteProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteProductsTable> {
  $$FavoriteProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brand => $composableBuilder(
      column: $table.brand, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get thumbnail => $composableBuilder(
      column: $table.thumbnail, builder: (column) => ColumnOrderings(column));
}

class $$FavoriteProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteProductsTable> {
  $$FavoriteProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get brand =>
      $composableBuilder(column: $table.brand, builder: (column) => column);

  GeneratedColumn<String> get thumbnail =>
      $composableBuilder(column: $table.thumbnail, builder: (column) => column);
}

class $$FavoriteProductsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteProductsTable,
    FavoriteProduct,
    $$FavoriteProductsTableFilterComposer,
    $$FavoriteProductsTableOrderingComposer,
    $$FavoriteProductsTableAnnotationComposer,
    $$FavoriteProductsTableCreateCompanionBuilder,
    $$FavoriteProductsTableUpdateCompanionBuilder,
    (
      FavoriteProduct,
      BaseReferences<_$AppDatabase, $FavoriteProductsTable, FavoriteProduct>
    ),
    FavoriteProduct,
    PrefetchHooks Function()> {
  $$FavoriteProductsTableTableManager(
      _$AppDatabase db, $FavoriteProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String> brand = const Value.absent(),
            Value<String> thumbnail = const Value.absent(),
          }) =>
              FavoriteProductsCompanion(
            id: id,
            title: title,
            price: price,
            brand: brand,
            thumbnail: thumbnail,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required double price,
            required String brand,
            required String thumbnail,
          }) =>
              FavoriteProductsCompanion.insert(
            id: id,
            title: title,
            price: price,
            brand: brand,
            thumbnail: thumbnail,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoriteProductsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoriteProductsTable,
    FavoriteProduct,
    $$FavoriteProductsTableFilterComposer,
    $$FavoriteProductsTableOrderingComposer,
    $$FavoriteProductsTableAnnotationComposer,
    $$FavoriteProductsTableCreateCompanionBuilder,
    $$FavoriteProductsTableUpdateCompanionBuilder,
    (
      FavoriteProduct,
      BaseReferences<_$AppDatabase, $FavoriteProductsTable, FavoriteProduct>
    ),
    FavoriteProduct,
    PrefetchHooks Function()>;
typedef $$OrdersTableCreateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  required String productTitles,
  required double totalPrice,
  required DateTime createdAt,
});
typedef $$OrdersTableUpdateCompanionBuilder = OrdersCompanion Function({
  Value<int> id,
  Value<String> productTitles,
  Value<double> totalPrice,
  Value<DateTime> createdAt,
});

class $$OrdersTableFilterComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productTitles => $composableBuilder(
      column: $table.productTitles, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$OrdersTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productTitles => $composableBuilder(
      column: $table.productTitles,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$OrdersTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdersTable> {
  $$OrdersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get productTitles => $composableBuilder(
      column: $table.productTitles, builder: (column) => column);

  GeneratedColumn<double> get totalPrice => $composableBuilder(
      column: $table.totalPrice, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$OrdersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrdersTable,
    Order,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableAnnotationComposer,
    $$OrdersTableCreateCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder,
    (Order, BaseReferences<_$AppDatabase, $OrdersTable, Order>),
    Order,
    PrefetchHooks Function()> {
  $$OrdersTableTableManager(_$AppDatabase db, $OrdersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> productTitles = const Value.absent(),
            Value<double> totalPrice = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              OrdersCompanion(
            id: id,
            productTitles: productTitles,
            totalPrice: totalPrice,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String productTitles,
            required double totalPrice,
            required DateTime createdAt,
          }) =>
              OrdersCompanion.insert(
            id: id,
            productTitles: productTitles,
            totalPrice: totalPrice,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrdersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrdersTable,
    Order,
    $$OrdersTableFilterComposer,
    $$OrdersTableOrderingComposer,
    $$OrdersTableAnnotationComposer,
    $$OrdersTableCreateCompanionBuilder,
    $$OrdersTableUpdateCompanionBuilder,
    (Order, BaseReferences<_$AppDatabase, $OrdersTable, Order>),
    Order,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteProductsTableTableManager get favoriteProducts =>
      $$FavoriteProductsTableTableManager(_db, _db.favoriteProducts);
  $$OrdersTableTableManager get orders =>
      $$OrdersTableTableManager(_db, _db.orders);
}
