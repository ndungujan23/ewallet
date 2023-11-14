import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final int balance;

  const BalanceCard({
    Key? key,
    this.balance = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 120.0,
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
                  child: Text("Total Balance",
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                            fontSize: 14,
                            // fontWeight: FontWeight.w600,
                          )),
                ),
                Text('USD $balance.00',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onInverseSurface,
                          // fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
              ],
            ),
          ),
        ),
        Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                shape: BoxShape.circle,
                border: Border.all(),
              ),
              child: const Icon(Icons.add),
            ))
      ],
    );
  }
}

// class BalanceCard extends StatelessWidget {
//   const BalanceCard({Key? key, required this.balance}) : super(key: key);
//
//   final String balance;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           height: 120,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.onPrimaryContainer,
//             borderRadius: BorderRadius.circular(30),
//             boxShadow: [
//               BoxShadow(
//                 color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.1),
//                 spreadRadius: 1,
//                 blurRadius: 1,
//                 offset: Offset(1, 1), // changes position of shadow
//               ),
//             ],
//             // image: DecorationImage(
//             //   colorFilter: new ColorFilter.mode(
//             //     Colors.black.withOpacity(0.2),
//             //     BlendMode.dstATop,
//             //   ),
//             //   image: AssetImage('assets/images/bgcard.png'),
//             // ),
//           ),
//           child: _buildBalance(context),
//         ),
//         Positioned(top: 100, left: 0, right: 0, child: _buildAddButton(context))
//       ],
//     );
//   }
//
//   Widget _buildBalance(BuildContext context) {
//     return Column(
//       children: [
//         const SizedBox(
//           height: 25,
//         ),
//         Text(
//           "Your Balance",
//           style: TextStyle(
//             color: Colors.grey,
//             fontSize: 14,
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Text(
//           balance,
//           style: TextStyle(
//             color: Theme.of(context).colorScheme.onInverseSurface,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildAddButton(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(5),
//       decoration: BoxDecoration(
//         color: Theme.of(context).colorScheme.secondary,
//         shape: BoxShape.circle,
//         border: Border.all(),
//       ),
//       child: Icon(Icons.add),
//     );
//   }
// }
