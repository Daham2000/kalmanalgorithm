import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(BuildContext context) : super(HomeState.initialState);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    switch (event.runtimeType) {
      case ChangeRoute:
        final data = event as ChangeRoute;
        yield state.clone(routeDropValue: data.value);
        break;

      case ChangeStartPoint:
        final data = event as ChangeStartPoint;
        yield state.clone(startPoint: data.value);
        break;

      case ChangeEndPoint:
        final data = event as ChangeEndPoint;
        yield state.clone(endPoint: data.value);
        break;
    }
  }
}
