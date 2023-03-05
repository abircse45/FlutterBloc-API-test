import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_api_test/services/api_services.dart';
import 'package:meta/meta.dart';

import '../model/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  APIServices _apiServices = APIServices();

  List<UserModel> userlist = [];

  UserBloc() : super(UserInitial()) {
    on<UserAlldata>((event, emit) async {
      emit(UserLaoding());

      userlist = (await _apiServices.getUserData())!;
      emit(UserDataLoaded(userlist));
    });
  }
}
