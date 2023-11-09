import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetStartedScreen extends ConsumerWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get started'),
      ),
      body: const SafeArea(
        child: Text('body'),
      ),
    );
  }
}
