import 'package:ebank/src/ui/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  String greeting() {
    var hour = DateTime.now().hour;
    var timeOfDay = hour <= 12
        ? 'Morning'
        : hour <= 17
        ? 'Afternoon'
        : 'Evening';
    return "Good $timeOfDay 👋";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TopBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: const Center(child: Text("Content")),
          ),
        ),
      ),
    );
  }
}
