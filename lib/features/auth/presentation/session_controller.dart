import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdonuts_app/core/providers.dart';
import 'package:jdonuts_app/features/auth/domain/entities/app_user.dart';

class SessionController extends AsyncNotifier<Session?> {
  @override
  Future<Session?> build() {
    return ref.read(sessionStoreProvider).read();
  }

  Future<void> open(Session session, {bool fresh = false}) async {
    await ref.read(sessionStoreProvider).write(session);
    await ref.read(memberAccountLinkProvider).apply(session, fresh: fresh);
    state = AsyncData(session);
  }

  Future<void> close() async {
    await ref.read(sessionStoreProvider).clear();
    state = const AsyncData(null);
  }
}

final sessionProvider = AsyncNotifierProvider<SessionController, Session?>(
  SessionController.new,
);
