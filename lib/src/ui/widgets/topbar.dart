import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const TopBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight * 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        forceMaterialTransparency: true,
        elevation: 0.0,
        titleSpacing: 0,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {
                context.push('/profile');
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
          ],
        ),
        centerTitle: true,
        title: Text(
          'SwiftPay',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        actions: [
          GestureDetector(onTap: () {}, child: const Icon(Icons.search)),
          IconButton(
            onPressed: () {},
            icon: const Badge(
              label: Text('10'),
              child: Icon(
                Icons.notifications_outlined,
                size: 26,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150),
          child: SizedBox(
            height: 35,
            child: TextFormField(
              textAlign: TextAlign.start,
              // controller: _searchText,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: InkWell(
                  child: const Icon(Icons.close),
                  onTap: () {
                    // _searchText.clear();
                  },
                ),
                hintText: 'Search...',
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
