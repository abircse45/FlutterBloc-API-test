import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_test/bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(UserAlldata());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Home Page"),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLaoding) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserDataLoaded) {
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: state.userModel.length,
              itemBuilder: (context, index) {
                var data = state.userModel[index];
                return ListTile(
                  title: Text("${data.name}"),
                  subtitle: Text("${data.phone}"),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
