import 'package:bloc_practice/config/app_routes.dart';
import 'package:bloc_practice/screens/dashboard/widget/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => CardWidget(
          title: items[index]['title'],
          icon: items[index]['icon'],
          onTap: () => GoRouter.of(context).push(items[index]['route']),
        ),
      ),
    );
  }

  static final List<Map<String, dynamic>> items = [
    {
      'title': 'Users',
      'icon': Icons.person,
      'route': Routes.user,
    },
    {
      'title': 'Posts',
      'icon': Icons.post_add,
      'route': Routes.post,
    },
    {
      'title': 'Comments',
      'icon': Icons.comment,
      'route': Routes.comment,
    }
  ];
}
