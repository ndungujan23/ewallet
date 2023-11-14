import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final int balance;
  final Function()? onAdd;

  const BalanceCard({
    Key? key,
    this.balance = 0,
    this.onAdd,
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
            clipBehavior: Clip.antiAliasWithSaveLayer,
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
            child: GestureDetector(
              onTap: onAdd,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                child: const Icon(Icons.add),
              ),
            ))
      ],
    );
  }
}
