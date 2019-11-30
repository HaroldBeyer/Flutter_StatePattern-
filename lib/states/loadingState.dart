import 'package:flutter/material.dart';
import 'package:states/IState.dart';
import 'package:states/fakeApi.dart';
import 'package:states/stateContext.dart';
import 'package:states/states/errorState.dart';
import 'package:states/states/loadedState.dart';
import 'package:states/states/noResultsState.dart';

class LoadingState implements IState {
  final FakeApi _api = FakeApi();

  @override
  Future nextState(StateContext context) async {
    try {
      var resultList = await _api.getNames();

      if (resultList.isEmpty) {
        context.setState(NoResultsState());
      } else {
        context.setState(LoadedState(resultList));
      }
    } on Exception {
      context.setState(ErrorState());
    }
  }

  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
      ),
    );
  }
}
