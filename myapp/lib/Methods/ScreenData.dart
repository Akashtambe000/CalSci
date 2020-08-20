ScreenData buffer = new ScreenData();
ScreenData results = new ScreenData();

class ScreenData {
  String buffer;

  ScreenData({this.buffer = ""});

  void add(String value) {
    buffer += value;
  }

  void remove({int n = 1}) {
    buffer = buffer.substring(0, buffer.length - n);
  }

  void clear() {
    buffer = "";
  }

  String get getbuffer {
    return buffer;
  }
}
