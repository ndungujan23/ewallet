import 'package:flutter/material.dart';
import 'package:ebank/src/core/index.dart';

class WalletAccountCard extends StatelessWidget {
  final WalletAccount account;

  const WalletAccountCard({
    Key? key,
    required this.account,
  }) : super(key: key);

  Color walletColor() {
    return switch(account.type) {
      WalletAccountType.current => const Color(0xFF36B552),
      WalletAccountType.fixedDeposit => const Color(0xFFFF9C41),
      WalletAccountType.nominated => const Color(0xFF3B64F4),
      WalletAccountType.personal => const Color(0xFF03A5e1),
      WalletAccountType.savings => const Color(0xFFF5F5F5),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 175,
        width: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: walletColor(),
          boxShadow: const [
            BoxShadow(
                color: Color(0x10000000),
                blurRadius: 10,
                spreadRadius: 4,
                offset: Offset(0.0, 8.0))
          ],
        ),
      child: Stack(
        children: <Widget>[

        ],
      ),
    );
  }
}
