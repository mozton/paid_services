import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paid_services/provider/state_providers.dart';

class ConfigScreen extends ConsumerWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkmode = ref.watch(darkModeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Configuration"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              const Text(
                "Theme",
                style: TextStyle(fontSize: 20),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text("Dark Theme"),
                CupertinoSwitch(
                  value: isDarkmode,
                  onChanged: (bool? value) {
                    value = false;
                    ref.read(darkModeProvider.notifier).toggleDarkMode();
                  },
                )
              ])
            ])));
  }
}
