class Singelton {
  static final _singelton = Singelton._internal();

  factory Singelton() {
    return _singelton;
  }

  Singelton._internal();
}
