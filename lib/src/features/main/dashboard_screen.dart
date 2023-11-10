import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  String greeting() {
    var hour = DateTime.now().hour;
    return hour < 12 ? 'Morning' : hour < 17 ? 'Afternoon' : 'Morning';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Color(0x44000000),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text("Title"),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
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
