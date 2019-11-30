import 'package:flutter/material.dart';
import 'package:states/stateContext.dart';

abstract class IState {
  Future nextState(StateContext context);
  Widget render();
}
