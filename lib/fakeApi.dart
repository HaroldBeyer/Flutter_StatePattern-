import 'dart:math';

class FakeApi {
  var random = new Random();
  Future<List<String>> getNames() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        if (random.nextBool()) {
          return _getRandomNames();
        }

        throw Exception('Unexpected error');
      },
    );
  }

  List<String> _getRandomNames() {
    if (random.nextBool()) {
      return [];
    }

    return [
      "haroldo",
      "mario jorge",
      "neiva",
    ];
  }
}
