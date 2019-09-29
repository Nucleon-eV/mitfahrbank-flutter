class Journey {
  List<Data> _data;

  Journey.fromJson(Map<String, dynamic> parsedJson) {
    List<Data> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Data data = Data.fromJson(parsedJson['results'][i]);
      temp.add(data);
    }
    _data = temp;
  }

  List<Data> get data => _data;
}

class Data {
  Data.fromJson(Map<String, dynamic> parsedJson) {
    // TODO figure out return type
  }
}
