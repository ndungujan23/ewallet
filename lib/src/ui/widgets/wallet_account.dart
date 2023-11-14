import 'package:ebank/src/core/index.dart';
import 'package:flutter/material.dart';

class WalletAccountCard extends StatelessWidget {
  final WalletAccount account;

  const WalletAccountCard({
    Key? key,
    required this.account,
  }) : super(key: key);

  Color walletColor() {
    return switch (account.type) {
      WalletAccountType.current => const Color(0xFF36B552),
      WalletAccountType.fixedDeposit => const Color(0xFFFF9C41),
      WalletAccountType.nominated => const Color(0xFF3B64F4),
      WalletAccountType.personal => const Color(0xFF03A5e1),
      WalletAccountType.savings => const Color(0xFF03A5e1),
    };
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;

    return SizedBox(
      height: 100.0,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
              child: Text("Account Number",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color:
                    Theme.of(context).colorScheme.onInverseSurface,
                    fontSize: 14,
                  )),
            ),
            Text(account.accountNumber,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  // fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 4,),
            Text(account.type.name,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color:
                  Theme.of(context).colorScheme.onInverseSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
          ],
        ),
      ),
    );

    // return Container(
    //   margin: EdgeInsets.only(right: 16),
    //   width: we * 0.9,
    //   height: 123,
    //   // decoration: BoxDecoration(
    //   //     boxShadow: [
    //   //       BoxShadow(
    //   //         color: Theme.of(context).colorScheme.inverseSurface,
    //   //         blurRadius: 10,
    //   //         spreadRadius: 5,
    //   //         offset: Offset(8.0, 8.0),
    //   //       )
    //   //     ],
    //   //     borderRadius: BorderRadius.circular(15),
    //   //     color: Colors.white),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       // SvgPicture.asset(
    //       //     widget.isSelected ? widget.selectedIcon : widget.unselectedIcon),
    //       SizedBox(
    //         height: 9,
    //       ),
    //       Text(
    //         account.accountNumber,
    //         textAlign: TextAlign.center,
    //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
    //           fontSize: 15,
    //           fontWeight: FontWeight.w700,
    //         ),
    //       )
    //     ],
    //   ),
    // );

    // return Card(
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
    //   child: Container(
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(colors: [
    //         // const Color(0xFFE96443),
    //         walletColor(),
    //         walletColor(),
    //       ], begin: Alignment.topLeft, end: Alignment.bottomCenter),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.withOpacity(0.5),
    //           blurRadius: 7,
    //           offset: const Offset(0, 3),
    //         )
    //       ],
    //       borderRadius: BorderRadius.circular(25),
    //     ),
    //     child: Padding(
    //       // padding: const EdgeInsets.all(25.0),
    //       padding: const EdgeInsets.all(20.0),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               Text(account.accountNumber,
    //                   style: const TextStyle(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 25)),
    //               Image.asset(
    //                 'assets/images/logo.png',
    //                 // width: 12,
    //                 // height: 12,
    //                 width: we * 0.07,
    //                 height: he * 0.07,
    //                 color: Colors.white,
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: he * 0.03,
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: <Widget>[
    //               const Text("••••",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold)),
    //               SizedBox(width: we * 0.04),
    //               const Text("••••",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold)),
    //               SizedBox(width: we * 0.04),
    //               const Text("••••",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold)),
    //               SizedBox(width: we * 0.04),
    //               const Text("7450",
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.bold)),
    //             ],
    //           ),
    //           SizedBox(
    //             height: he * 0.05,
    //           ),
    //           Container(
    //               // margin: const EdgeInsets.only(right: 200),
    //               child: const Text(
    //                 "Available Balance",
    //                 textAlign: TextAlign.left,
    //                 style: TextStyle(color: Colors.white),
    //               )),
    //           SizedBox(height: he * 0.01),
    //           Row(children: <Widget>[
    //             Image.asset("assets/images/logo.png",
    //               width: we * 0.06,
    //               height: we * 0.06,
    //               color: Colors.white,
    //             ),
    //             // Image.asset('assets/images/logo.png',
    //             //     width: we * 0.06, height: we * 0.06, color: Colors.white),
    //             Text(
    //               account.amount.toString(),
    //               style: const TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 26,
    //                   fontWeight: FontWeight.bold),
    //             ),
    //             // SizedBox(width: we * 0.45),
    //             Image.asset('assets/images/logo.png',
    //                 width: we * 0.09, height: we * 0.09, color: Colors.white)
    //           ]),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
