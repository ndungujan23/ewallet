import 'package:ebank/src/core/data/constants/avatar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const TopBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 2);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final TextEditingController _searchText = TextEditingController();
  bool _isSearchVisible = false;

  @override
  void initState() {
    super.initState();
  }

  void toggleSearch() {
    setState(() {
      _isSearchVisible = !_isSearchVisible;
    });
  }

  PreferredSizeWidget _searchBox() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: SizedBox(
        height: 35,
        child: TextFormField(
          controller: _searchText,
          textAlign: TextAlign.start,
          textInputAction: TextInputAction.search,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            prefixIcon: const Icon(Icons.search),
            suffixIcon: InkWell(
              child: const Icon(Icons.close),
              onTap: () {
                _searchText.clear();
              },
            ),
            hintText: 'Search...',
            contentPadding: const EdgeInsets.all(0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      height: _isSearchVisible ? kToolbarHeight * 4 : kToolbarHeight * 2,
      padding: const EdgeInsets.only(left: 12.0, right: 8.0, top: 8.0, bottom: 8.0),
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
              child: CircleAvatar(
                backgroundImage: NetworkImage(avatarPlaceholders.first),
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
          GestureDetector(onTap: toggleSearch, child: const Icon(Icons.search)),
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
        bottom: _isSearchVisible ? _searchBox() : null,
      ),
    );
  }
}
