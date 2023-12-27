import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:solana_wallet_pof/pages/generate_phrase.dart';
import 'package:solana_wallet_pof/pages/home.dart';
import 'package:solana_wallet_pof/pages/input_phrase.dart';
import 'package:solana_wallet_pof/pages/login.dart';
import 'package:solana_wallet_pof/pages/setup_account.dart';
import 'package:solana_wallet_pof/pages/setup_password.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/setup',
      builder: (context, state) {
        return const SetupAccountScreen();
      },
    ),
    GoRoute(
      path: '/inputPhrase',
      builder: (context, state) {
        return const InputPhraseScreen();
      },
    ),
    GoRoute(
      path: '/generatePhrase',
      builder: (context, state) {
        return const GeneratePhraseScreen();
      },
    ),
    GoRoute(
      path: '/passwordSetup/:privateKey',
      builder: (context, state) {
        return SetupPasswordScreen(
            privateKey: state.pathParameters["privateKey"]);
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
