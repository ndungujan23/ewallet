import 'package:flutter/material.dart';

class TransactionsChart extends StatelessWidget {
  final String title;
  final int amount;

  const TransactionsChart({
    Key? key,
    this.title = 'Debit & Credit',
    this.amount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250.0,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.surface.withOpacity(0.01),
              spreadRadius: 10,
              blurRadius: 3,
              // changes position of shadow
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: const Color(0xff67727d),
                    ),
                  ),
                  const SizedBox(height: 8,),
                  Text(
                    "\$$amount.00",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: (MediaQuery.of(context).size.width - 20),
                height: 150,
                // child: LineChart(
                //   mainData(),
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
