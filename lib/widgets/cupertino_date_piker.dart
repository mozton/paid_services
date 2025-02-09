import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/provider/date_notifier.dart';

class CupertinoDatePickerWidget extends ConsumerWidget {
  const CupertinoDatePickerWidget({super.key});

  void _showDatePicker(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: ref.read(dateProvider),
            onDateTimeChanged: (DateTime newDate) {
              ref.read(dateProvider.notifier).setDate(newDate);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(dateProvider); // Escucha cambios en la fecha

    return GestureDetector(
      onTap: () => _showDatePicker(context, ref),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "seletct Date${selectedDate.toLocal()}".split(' ')[0],
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
