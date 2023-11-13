import 'package:ebank/src/ui/widgets/index.dart';
import 'package:flutter/material.dart';
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
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 16, right: 16, top: 24.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // _greetingSection(context, greeting()),
                  // const SizedBox(height: 15,),
                  _walletListSection(context, greeting()),
                ],
              ),
            )),
      ),
    );
  }
}

Widget _walletListSection(BuildContext context, String greeting) {
  return Column(
    children: [
      AppBar(
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              greeting,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            ),
            Text(
              'Amanda Alex',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_outlined)),
          GestureDetector(
              onTap: () {}, child: const Icon(Icons.more_horiz_outlined)),
        ],
      ),
    ],
  );
}
