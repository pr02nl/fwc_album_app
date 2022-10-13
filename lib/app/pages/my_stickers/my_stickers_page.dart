import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_sticker_presenter.dart';

import 'view/my_sticker_view_impl.dart';
import 'widgets/sticker_group.dart';
import 'widgets/sticker_group_filter.dart';
import 'widgets/sticker_status_filter.dart';

class MyStickersPage extends StatefulWidget {
  final MyStickerPresenter presenter;
  const MyStickersPage({super.key, required this.presenter});

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends MyStickerViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas figurinhas'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                StickerStatusFilter(
                  filterSelected: statusFilter,
                ),
                StickerGroupFilter(
                  countries: countries,
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => StickerGroup(
                group: album[index],
                statusFilter: statusFilter,
              ),
              childCount: album.length,
            ),
          ),
        ],
      ),
    );
  }
}
