import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DropDown<T> extends StatelessWidget {
  const DropDown({
    required this.value,
    required this.items,
    required this.onChanged,
    super.key,
  });

  final T value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownButtonFormField<T>(
        menuMaxHeight: MediaQuery.of(context).size.height * 0.4,
        isExpanded: true,
        icon: const Icon(Iconsax.arrow_down_1_outline, size: 18),
        iconEnabledColor: Theme.of(context).primaryColor,
        focusColor: Colors.transparent,
        style: Theme.of(context).textTheme.bodyMedium,
        dropdownColor: Colors.white,
        alignment: Alignment.center,
        value: value,
        elevation: 2,
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
