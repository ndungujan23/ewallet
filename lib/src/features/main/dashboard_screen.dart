import 'package:ebank/src/core/index.dart';
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
    final walletState = ref.watch(walletProvider);
    final user = ref.watch(userProvider).user;

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
                padding: const EdgeInsets.only(
                    left: 12, right: 12, top: 24.0, bottom: 24.0),
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      forceMaterialTransparency: true,
                      titleSpacing: 0,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            greeting(),
                            textAlign: TextAlign.left,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                          Text(
                            '${user?.firstName ?? '--'} ${user?.lastName ?? '--'}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          )
                        ],
                      ),
                      actions: [
                        IconButton(
                            onPressed: () async {
                              await showAddWalletModal(context);
                            },
                            icon: const Icon(Icons.add_outlined)),
                        GestureDetector(
                            onTap: () {},
                            child: const Icon(Icons.more_horiz_outlined)),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    BalanceCard(
                      balance: 1000,
                      onAdd: () async {
                        await showAddWalletModal(context);
                      },
                    ),
                  ],
                )),
            Container(
              height: 120,
              padding: const EdgeInsets.only(left: 10, right: 12),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const PageScrollPhysics(),
                  itemCount: walletState.wallets.length,
                  itemBuilder: (context, index) {
                    return WalletAccountCard(
                        account: walletState.wallets.elementAt(index));
                  }),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
              child: const TransactionsChart(),
            ),
          ],
        ),
      )),
    );
  }
}

Future<void> showAddWalletModal(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(builder: (context, ref, _) {
        final formKey = GlobalKey<FormState>();
        final accountNumberController = TextEditingController();
        var accountTypeController =
            TextEditingController(text: WalletAccountType.current.name);

        void onSubmit() {
          if (formKey.currentState!.validate()) {
            final wallet = WalletAccount(
                accountNumber: accountNumberController.text, 
                amount: 0, 
                type: WalletAccountType.fromValue(accountTypeController.text),
            );
            ref.read(walletProvider.notifier).addWallet(wallet).then((value) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Saved successfully',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                ),
              );
            });
          }
        }

        return AlertDialog(
            title: const Text('Add Account'),
            actions: [
              TextButton(onPressed: onSubmit, child: const Text('Submit'))
            ],
            content: SizedBox(
              width: 400,
              // height: 400,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomFormField(
                      hintText: 'Account Number',
                      controller: accountNumberController,
                      validator: (val) {
                        val = val ?? '';
                        return val.trim().isNotEmpty ? null : 'Invalid Field value';
                      },
                    ),
                    const SizedBox(height: 15,),
                    DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Account Type',
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.secondaryContainer,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.error,
                              )
                          ),
                        ),
                        value: accountTypeController.text,
                        onChanged: (String? newValue) {
                          accountTypeController = TextEditingController(text: newValue);
                        },
                        validator: (val) {
                          val = val ?? '';
                          return val.trim().isNotEmpty ? null : 'Invalid Field value';
                        },
                        items: WalletAccountType.values
                            .map((WalletAccountType type) {
                          return DropdownMenuItem<String>(
                              value: type.name, child: Text(type.name));
                        }).toList())
                  ],
                ),
              ),
            ));
      });
    },
  );
}
