import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateNotifier extends StateNotifier<DateTime> {
  DateNotifier() : super(DateTime.now());

  void setDate(DateTime newDate) {
    state = newDate;
  }
}

final dateProvider =
    StateNotifierProvider<DateNotifier, DateTime>((ref) => DateNotifier());
