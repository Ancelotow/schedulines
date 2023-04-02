import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:t_paris/ui/views/landing_page/landing_page.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: TransportSchedulingPage, initial: true),
  ],
)

class AppRouter extends _$AppRouter {}

