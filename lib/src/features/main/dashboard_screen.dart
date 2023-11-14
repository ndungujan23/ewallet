import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ebank/src/core/providers/index.dart';
import 'package:ebank/src/ui/widgets/index.dart';
import 'package:ebank/src/core/index.dart';

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
    final walletState = ref.watch(walletProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const TopBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).colorScheme.primaryContainer,
                padding: const EdgeInsets.only(left: 12, right: 12, top: 24.0, bottom: 24.0),
                child: _walletListSection(context, greeting())),
            // _insightSection(context),
          ],
        ),
      )),
    );
  }
}

Widget _walletListSection(BuildContext context, String greeting) {
  return Column(
    children: [
      AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
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
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            Text(
              'Amanda Alex',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onBackground,
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
      const SizedBox(
        height: 15.0,
      ),
      const BalanceCard(balance: 1000,),
    ],
  );
}

Widget _insightSection(BuildContext context) {
  return const Placeholder();
}
