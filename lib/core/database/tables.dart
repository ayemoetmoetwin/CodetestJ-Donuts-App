import 'package:drift/drift.dart';

const orderAgainSectionId = 'order_again';
const seasonalSectionId = 'seasonal';

class Accounts extends Table {
  TextColumn get id => text()();
  TextColumn get phoneE164 => text().unique()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text().withDefault(const Constant(''))();
  TextColumn get birthIso => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Members extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get tier => text()();
  IntColumn get points => integer()();
  IntColumn get pointsToNext => integer()();
  TextColumn get nextTier => text()();
  RealColumn get tierProgress => real()();
  IntColumn get notificationCount => integer()();
  IntColumn get rewardsBadge => integer()();
  TextColumn get photoAsset => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Products extends Table {
  TextColumn get id => text()();
  TextColumn get code => text()();
  TextColumn get name => text()();
  IntColumn get priceMmk => integer()();
  BoolColumn get isNew => boolean().withDefault(const Constant(false))();
  IntColumn get discountPercent => integer().nullable()();
  TextColumn get imageAsset => text()();
  TextColumn get imageUrl => text().withDefault(const Constant(''))();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class Banners extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get badge => text()();
  TextColumn get imageAsset => text()();
  TextColumn get imageUrl => text().withDefault(const Constant(''))();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class Sections extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@TableIndex(name: 'section_products_order', columns: {#sectionId, #position})
class SectionProducts extends Table {
  TextColumn get sectionId => text()();
  TextColumn get productId => text()();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {sectionId, productId};
}

class Shops extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get distanceLabel => text()();
  TextColumn get imageAsset => text()();
  TextColumn get imageUrl => text().withDefault(const Constant(''))();
  IntColumn get position => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class CartLines extends Table {
  TextColumn get productId => text()();
  IntColumn get quantity => integer()();

  @override
  Set<Column> get primaryKey => {productId};
}

class Challenges extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  IntColumn get progress => integer()();
  IntColumn get goal => integer()();
  IntColumn get rewardPoints => integer()();
  TextColumn get art => text()();
  TextColumn get tabKind => text()();
  IntColumn get position => integer()();
  BoolColumn get claimed => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
