import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pretium_replica/Presentation/onboarding/pages/onboarding_page.dart';
import 'package:pretium_replica/presentation/onboarding/pages/forgot_password_page.dart';
import 'package:pretium_replica/presentation/onboarding/pages/login_page.dart';
import 'package:pretium_replica/presentation/onboarding/pages/registration_page.dart';
import 'package:pretium_replica/presentation/routing/route_names.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: rootPage,
      builder: (BuildContext context, GoRouterState state) => OnboardingPage(),
    ),
    GoRoute(
      path: loginPage,
      builder: (BuildContext context, GoRouterState state) => LoginPage(),
    ),
    GoRoute(
      path: registerPage,
      builder: (BuildContext context, GoRouterState state) => RegistrationPage(),
    ),
    GoRoute(
      path: forgotPasswordPage,
      builder: (BuildContext context, GoRouterState state) => ForgotPasswordPage(),
    ),
  ],
);
