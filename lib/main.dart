import 'package:flutter/material.dart';
import 'package:fwc_albim_app/app/core/config/env/env.dart';

import 'app/fwc_album_app.dart';

Future<void> main() async {
  await Env.i.load();
  runApp(const FwcAlbumApp());
}
