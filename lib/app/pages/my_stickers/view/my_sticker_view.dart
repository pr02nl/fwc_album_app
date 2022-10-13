import '../../../models/groups_stickers.dart';

abstract class MyStickerView {
  void loadedPage(List<GroupsStickers> album);
  void error(String message);
  void updateStatusFilter(String status);
  void updateAlbum(List<GroupsStickers> album);
}
