import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const TopBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      child: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        elevation: 0.0,
        leadingWidth: 40,
        titleSpacing: 0,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
            ),
          ],
        ),
        title: Container(
          margin: const EdgeInsets.only(left: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200]
            // color: Theme.of(context).colorScheme.surface,
          ),
          child: const TextField(
            readOnly: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
              hintText: "Search",
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Badge(
              label: Text('10'),
              child: Icon(
                Icons.notifications,
                size: 26,
              ),
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
    );
  }
}
