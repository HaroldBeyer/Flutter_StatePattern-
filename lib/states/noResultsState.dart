import 'package:flutter/material.dart';
import 'package:states/IState.dart';
import 'package:states/stateContext.dart';
import 'package:states/states/loadingState.dart';

class NoResultsState implements IState {
  @override
  Future nextState(StateContext context) async {
    context.setState(LoadingState());
  }

  @override
  Widget render() {
    return Text(
      'Sem resultado',
      style: TextStyle(fontSize: 24.0),
      textAlign: TextAlign.center,
    );
  }
}
