import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jdonuts_app/features/auth/presentation/auth_controller.dart';

Future<void> followAuth(BuildContext context, Future<AuthNext> next) async {
  final result = await next;
  if (!context.mounted) {
    return;
  }
  switch (result) {
    case AuthNext.stay:
      return;
    case AuthNext.otp:
      context.push('/auth/otp');
    case AuthNext.name:
      context.pushReplacement('/auth/name');
    case AuthNext.dob:
      context.push('/auth/dob');
    case AuthNext.welcome:
      context.go('/welcome');
    case AuthNext.home:
      context.go('/home');
  }
}
