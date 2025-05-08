// Challenge 1: Null Safety
String toUpperCaseOrDefault(String? input) {
  return input?.toUpperCase() ?? "DEFAULT";
}

// Challenge 2: Typecasts
String describeObject(Object obj) {
  if (obj is String) {
    return obj.length.toString();
  } else if (obj is int) {
    return (obj * obj).toString();
  } else {
    return "Unknown type";
  }
}

// Challenge 3: Asynchronous Programming
Future<String> processUserName(
  Future<Map<String, String>> userDataFuture,
) async {
  final userData = await userDataFuture;
  return userData["name"] ?? "Unknown";
}

// Challenge 4: Classes and Constructors
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  Person.named()
      : name = "Default Name",
        age = 18;

  static final Map<String, Person> _cache = {};
  factory Person.factory(String key) {
    if (_cache.containsKey(key)) {
      return _cache[key]!;
    } else {
      final person = Person(key, 30);
      _cache[key] = person;
      return person;
    }
  }
}

// Challenge 5: Optional and Named Parameters
String createUser(String name, [String? email, int age = 18]) {
  return "Name: $name, Age: $age, Email: $email";
}
