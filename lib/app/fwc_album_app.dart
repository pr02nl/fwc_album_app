import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_albim_app/app/core/rest/custom_dio.dart';
import 'package:fwc_albim_app/app/core/ui/theme/theme_config.dart';
import 'package:fwc_albim_app/app/pages/auth/login/login_route.dart';
import 'package:fwc_albim_app/app/pages/home/home_page.dart';
import 'package:fwc_albim_app/app/pages/splash/splash_route.dart';
import 'package:fwc_albim_app/app/repositories/auth/auth_repository.dart';
import 'package:fwc_albim_app/app/repositories/auth/auth_repository_impl.dart';

import 'pages/auth/register/register_route.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
      ],
      child: MaterialApp(
        title: "Fifa World Cup Album",
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const SplashRoute(),
          "/auth/login": (context) => const LoginRoute(),
          "/auth/register": (context) => const RegisterRoute(),
          "/home": (context) => const HomePage(),
        },
      ),
    );
  }
}
