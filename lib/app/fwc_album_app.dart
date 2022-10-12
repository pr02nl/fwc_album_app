import 'package:flutter/material.dart';
import 'package:fwc_albim_app/app/core/ui/theme/theme_config.dart';

import 'pages/splash_page.dart';

class FwcAlbumApp extends StatelessWidget {
  const FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fifa World Cup Album",
      theme: ThemeConfig.theme,
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const SplashPage(),
      },
    );
  }
}
