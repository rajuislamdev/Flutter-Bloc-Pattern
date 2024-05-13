import 'package:bloc_practice/blocs/user_bloc.dart';
import 'package:bloc_practice/events/user_event.dart';
import 'package:bloc_practice/models/user_model.dart';
import 'package:bloc_practice/states/user_state.dart';
import 'package:bloc_practice/widgets/error.dart';
import 'package:bloc_practice/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final UsersBloc usersBloc = UsersBloc();
  @override
  void initState() {
    usersBloc.add(UsersInitialFetchUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Screen'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<UsersBloc, UsersState>(
      bloc: usersBloc,
      builder: ((context, state) {
        switch (state.runtimeType) {
          case const (UsersLoading):
            return const CustomLoadingWidget();
          case (const (UsersError)):
            return CustomErrorWidget(
                errorMessage: (state as UsersError).errorMessage);
          case const (UsersLoaded):
            return _buildListView(users: (state as UsersLoaded).users);
          default:
            return const SizedBox();
        }
      }),
      listener: (context, state) {},
    );
  }

  Widget _buildListView({required List<User> users}) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            onTap: () {},
          );
        });
  }
}
