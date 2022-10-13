import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_sticker_presenter.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;
  const StickerGroupFilter({super.key, required this.countries});

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: "Filtro",
        tileBuilder: (context, state) {
          return InkWell(
            onTap: state.showModal,
            child: _StrickerGroupTile(
              label: state.selected.title?.join(", ") ?? "Filtro",
              clearCallBack: () {
                setState(() {
                  selectedValue = null;
                  context
                      .get<MyStickerPresenter>()
                      .countryFilter(selectedValue);
                });
              },
            ),
          );
        },
        selectedValue: selectedValue ?? [],
        onChange: (selectedValue) {
          setState(() {
            this.selectedValue = selectedValue.value;
          });
          context.get<MyStickerPresenter>().countryFilter(this.selectedValue);
        },
        choiceItems: S2Choice.listFrom(
          source: widget.countries.entries
              .map((e) => {"value": e.key, "title": e.value})
              .toList(),
          value: ((index, item) => item["value"] ?? ""),
          title: (index, item) => item["title"] ?? "",
        ),
        choiceType: S2ChoiceType.switches,
        modalType: S2ModalType.bottomSheet,
        choiceGrouped: true,
        modalFilter: false,
        placeholder: "",
      ),
    );
  }
}

class _StrickerGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallBack;
  const _StrickerGroupTile({
    Key? key,
    required this.label,
    required this.clearCallBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xfff0f0f0),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(Icons.filter_list),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                label,
                style: context.textStyles.textSecondaryFontRegular.copyWith(
                  fontSize: 11,
                ),
              ),
            ),
            InkWell(
              onTap: clearCallBack,
              child: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }
}
