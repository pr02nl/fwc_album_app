import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context.dart';
import 'package:fwc_album_app/app/core/ui/global/global_context_impl.dart';
import 'package:fwc_album_app/app/core/ui/theme/theme_config.dart';
import 'package:fwc_album_app/app/pages/auth/login/login_route.dart';
import 'package:fwc_album_app/app/pages/home/home_route.dart';
import 'package:fwc_album_app/app/pages/splash/splash_route.dart';
import 'package:fwc_album_app/app/repositories/auth/auth_repository.dart';
import 'package:fwc_album_app/app/repositories/auth/auth_repository_impl.dart';

import 'pages/auth/register/register_route.dart';
import 'pages/my_stickers/my_stickers_route.dart';

class FwcAlbumApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();
  FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>(
          (i) => GlobalContextImpl(
            navigatorKey: navigatorKey,
            authRepository: i(),
          ),
        ),
      ],
      child: MaterialApp(
        title: "Fifa World Cup Album",
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        routes: {
          "/": (context) => const SplashRoute(),
          "/auth/login": (context) => const LoginRoute(),
          "/auth/register": (context) => const RegisterRoute(),
          "/home": (context) => const HomeRoute(),
          "/my-stickers": (context) => const MyStickersRoute(),
        },
      ),
    );
  }
}
