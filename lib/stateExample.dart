import 'package:flutter/material.dart';
import 'package:states/IState.dart';
import 'package:states/stateContext.dart';
import 'package:states/states/noResultsState.dart';

class StateExample extends StatefulWidget {
  @override
  _StateExampleState createState() => _StateExampleState();
}

class _StateExampleState extends State<StateExample> {
  var _stateContext = StateContext();

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(horizontal: 200),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 200,
            ),
            FlatButton(
              child: Text(
                'Carregar nomes',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              onPressed: _changeState,
            ),
            // const SizedBox(height: 200),
            StreamBuilder(
              initialData: NoResultsState(),
              stream: _stateContext.outState,
              builder: (_, AsyncSnapshot<IState> snapshot) =>
                  snapshot.data.render(),
            ),
          ],
        ),
      ),
    );
  }
}
