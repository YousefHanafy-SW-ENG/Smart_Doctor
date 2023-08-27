import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppDropDownSearch extends StatelessWidget {
  final String? selectedValue;
  // final List<dynamic> items;
  final Future<List<dynamic>> Function(String)? asyncItems;
  final void Function(dynamic)? onChange;
  final bool alwaysEnableEditing;
  final Color borderColor;
  final String? hint;

  const AppDropDownSearch({
    // this.items = const [],
    required this.asyncItems,
    required this.onChange,
    this.alwaysEnableEditing = true,
    this.borderColor = Colors.grey,
    this.selectedValue,
    this.hint,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return IgnorePointer(
      ignoring: !alwaysEnableEditing,
      child: Container(
        height: 5.1.h,
        // height: 3.5.h,
        color: alwaysEnableEditing ? Colors.white : Colors.grey[300],
        child: DropdownSearch(
          // items: items,
          popupProps: PopupProps.menu(
            constraints: BoxConstraints(maxHeight: 40.h),
            showSearchBox: true,
            isFilterOnline: true,
            searchFieldProps: TextFieldProps(
              controller: searchController,
            ),
            searchDelay: const Duration(seconds: 1),
            menuProps: const MenuProps(),
          ),
          asyncItems: asyncItems,
          dropdownDecoratorProps: DropDownDecoratorProps(
            baseStyle: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          selectedItem: selectedValue,
          onChanged: onChange,
          // onBeforePopupOpening: (_) {

          // },
        ),
      ),
    );
  }
}
