import 'package:jdonuts_app/core/result/result.dart';
import 'package:jdonuts_app/features/auth/domain/entities/app_user.dart';

abstract class AuthRepository {
  Future<Result<bool>> phoneExists(String phoneE164);

  Future<Result<void>> pause();

  Future<Result<AppUser?>> findByPhone(String phoneE164);

  Future<Result<AppUser>> register(NewUser user);
}

abstract class SessionStore {
  Future<Session?> read();

  Future<void> write(Session session);

  Future<void> clear();
}
