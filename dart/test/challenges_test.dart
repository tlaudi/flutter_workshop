import 'package:test/test.dart';
import '../challenges.dart';

void main() {
  // Test for Challenge 1: Null Safety
  test('toUpperCaseOrDefault returns uppercase or DEFAULT', () {
    expect(toUpperCaseOrDefault("hello"), equals("HELLO"));
    expect(toUpperCaseOrDefault(null), equals("DEFAULT"));
  });

  // Test for Challenge 2: Typecasts
  test('describeObject handles different types correctly', () {
    expect(describeObject("hello"), equals("5")); // Length of string
    expect(describeObject(4), equals("16")); // Square of int
    expect(describeObject(3.14), equals("Unknown type"));
  });

  // Test for Challenge 3: Asynchronous Programming
  test('processUserName processes a future and returns the name', () async {
    // Simulate a future that resolves with user data
    final simulatedFuture = Future.value({"id": "123", "name": "John Doe"});

    // Call the function and verify the result
    final result = await processUserName(simulatedFuture);
    expect(result, equals("John Doe"));

    // Test with missing "name" key
    final missingNameFuture = Future.value({"id": "456"});
    final missingNameResult = await processUserName(missingNameFuture);
    expect(missingNameResult, equals("Unknown"));
  });

  // Test for Challenge 4: Classes and Constructors
  test('Person constructors work as expected', () {
    final person = Person("Alice", 30);
    expect(person.name, equals("Alice"));
    expect(person.age, equals(30));

    final namedPerson = Person.named();
    expect(namedPerson.name, equals("Default Name"));
    expect(namedPerson.age, equals(18));

    final cachedPerson = Person.factory("cached");
    final sameCachedPerson = Person.factory("cached");
    expect(cachedPerson, same(sameCachedPerson));
  });

  // Test for Challenge 5: Optional and Named Parameters
  test('createUser handles optional and named parameters', () {
    expect(createUser("Alice"), equals("Name: Alice, Age: 18, Email: null"));
    expect(
      createUser("Bob", "bob@example.com"),
      equals("Name: Bob, Age: 18, Email: bob@example.com"),
    );
    expect(
      createUser("Charlie", null, 25),
      equals("Name: Charlie, Age: 25, Email: null"),
    );
  });
}
