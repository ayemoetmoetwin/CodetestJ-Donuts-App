sealed class AppFailure {
  const AppFailure(this.code);

  final String code;
}

final class DatabaseFailure extends AppFailure {
  const DatabaseFailure([super.code = 'database']);
}

final class OfflineFailure extends AppFailure {
  const OfflineFailure() : super('offline');
}

final class NotFoundFailure extends AppFailure {
  const NotFoundFailure() : super('notFound');
}
