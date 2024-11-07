import 'package:biospot/core/core.dart';
import 'package:biospot/modules/suspect_detail/models/plague_type_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DefaultSingleDropdownButton extends StatefulWidget {
  final String label;
  final PlagueTypeModel? value;
  final Function(PlagueTypeModel?) onChanged;
  final List<PlagueTypeModel> items;
  final bool readOnly;
  final String? hintText;
  final bool required;
  final bool loading;

  const DefaultSingleDropdownButton({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.items,
    this.readOnly = false,
    this.hintText,
    this.required = false,
    this.loading = false,
  });

  @override
  State<DefaultSingleDropdownButton> createState() =>
      _DefaultSingleDropdownButtonState();
}

class _DefaultSingleDropdownButtonState
    extends State<DefaultSingleDropdownButton> {
  final _dropdownKey = GlobalKey<DropdownSearchState<String>>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 6.h),
          child: Row(
            crossAxisAlignment: widget.required
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              Text(
                widget.label,
                style: context.textStyles.medium.copyWith(fontSize: 14.sp),
              ),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
              ),
              if (widget.required)
                Text(
                  "*",
                  style: context.textStyles.bold.copyWith(
                    color: context.colors.warning,
                    fontSize: 14.sp,
                  ),
                )
              else
                Text(
                  "(opcional)",
                  style: context.textStyles.bold.copyWith(
                    color: context.colors.primary,
                    fontSize: 10.sp,
                  ),
                ),
            ],
          ),
        ),
        DropdownSearch<PlagueTypeModel>(
          dropdownButtonProps: DropdownButtonProps(
            icon: widget.loading
                ? LoadingAnimationWidget.discreteCircle(
                    color: context.colors.primary,
                    size: 20.r,
                  )
                : Icon(
                    Icons.arrow_downward,
                    color: widget.readOnly
                        ? Colors.grey[400]
                        : const Color(0XFF686868),
                  ),
          ),
          key: _dropdownKey,
          dropdownBuilder: (context, selectedItem) {
            return Text(
              selectedItem?.name ?? widget.label,
              style: TextStyle(
                fontSize: 14.sp,
                color: selectedItem == null
                    ? const Color(0XFF686868)
                    : const Color(0XFF252525),
              ),
            );
          },
          enabled: !widget.readOnly,
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            menuProps: MenuProps(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            fit: FlexFit.loose,
            showSearchBox: false,
            searchFieldProps: TextFieldProps(
              cursorColor: context.colors.primary,
              decoration: context.styles.defaultInputDecoration.copyWith(
                hintText: widget.hintText ?? 'Pesquisar',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            itemBuilder: (context, item, isSelected) {
              return ListTile(
                title: Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0XFF252525),
                  ),
                ),
              );
            },
            loadingBuilder: (context, searchEntry) {
              return Center(
                child: LoadingAnimationWidget.stretchedDots(
                  color: context.colors.primary,
                  size: 36.w,
                ),
              );
            },
            emptyBuilder: (context, searchEntry) {
              return const Center(
                child: Text(
                  'Nenhuma opção encontrada',
                ),
              );
            },
          ),
          items: widget.items,
          onChanged: widget.onChanged,
          validator: widget.required
              ? (value) {
                  if (value == null || value.name.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                }
              : null,
          compareFn: (a, b) => a.name.compareTo(b.name) == 1 ? true : false,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          selectedItem: widget.value,
          itemAsString: (PlagueTypeModel item) => item.name,
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: TextStyle(
              fontSize: 14.sp,
              color: const Color(0XFF252525),
            ),
            dropdownSearchDecoration:
                context.styles.defaultInputDecoration.copyWith(
              hintText: widget.label,
            ),
          ),
        ),
      ],
    );
  }
}
