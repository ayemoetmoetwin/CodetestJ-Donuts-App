import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/home/domain/entities/home_snapshot.dart';

abstract class HomeRepository {
  Future<Result<HomeSnapshot>> load();

  Future<Result<void>> refresh();
}
