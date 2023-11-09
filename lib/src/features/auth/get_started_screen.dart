import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetStartedScreen extends ConsumerWidget {
  const GetStartedScreen({super.key});

  Widget _footerContent(BuildContext context) {
    return Row(
      children: [
        Text('One button'),
        Text('Two button'),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: _footerContent(context),
            body: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      // Replace with your image asset path
                      height: 150,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'SwiftPay',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'With Swift Pay',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )));
  }
}
