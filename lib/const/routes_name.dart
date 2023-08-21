// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unforgett/view/screens/game_detail_screen.dart';
import 'package:unforgett/view/screens/games_list_screen.dart';
import 'package:unforgett/view/screens/login_screen.dart';
import 'package:unforgett/view/screens/user_info_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'games',
          builder: (BuildContext context, GoRouterState state) {
            return const GamesListScreen();
          },
          routes: [
            GoRoute(
              path: 'game/:gameCode',
              builder: (BuildContext context, GoRouterState state) {
                return GameDetailScreen(
                  gameCode: state.params['gameCode'],
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const UserInfoScreen();
          },
        ),
      ],
    ),
  ],
);
