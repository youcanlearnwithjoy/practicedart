class Logger {
  final String name;

  // Internal cache of instances
  static final Map<String, Logger> _cache = <String, Logger>{};

  // Generative private constructor
  Logger._internal(this.name);

  // Factory constructor that returns cached or new instance
  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  void log(String msg) => print('[$name] $msg');
}

void main() {

  var log1 = Logger('UI');
  print({log1});
  var log2 = Logger('UI');

  // Both variables reference the exact same instance
  print(identical(log1, log2)); // true
}