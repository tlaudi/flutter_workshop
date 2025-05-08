// Challenge 1: Null Safety
String toUpperCaseOrDefault(String? input) {
  // TODO: Implement logic to return the uppercase version or "DEFAULT" if null
  return "";
}

// Challenge 2: Typecasts
String describeObject(Object obj) {
  // TODO: Implement logic to handle String, int, and other types
  // If the object is a String, return its length
  // If the object is an int, return its square
  // For other types, return "Unknown type"
  return "";
}

// Challenge 3: Asynchronous Programming
Future<String> processUserName(
  Future<Map<String, String>> userDataFuture,
) async {
  // TODO: Wait for the future to complete and extract the "name" value
  // If the "name" key is not present, return "Unknown"
  return "";
}

// Challenge 4: Classes and Constructors
// Tests are commented out to avoid errors
class Person {
  String name;
  int age;

  // TODO: Add default constructor

  // TODO: Add named constructor with default values "Default Name" and 18

  // TODO: Add factory constructor with caching logic

  Person(this.name, this.age);
}

// Challenge 5: Optional and Named Parameters
// Tests are commented out to avoid errors
String createUser() {
  // TODO: Add the right parameters to the function
  // return "Name: $name, Age: $age, Email: $email";
  return "";
}
