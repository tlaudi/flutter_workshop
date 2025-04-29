# Dart

- C Style Syntax (void main() { // })
- Garbage collected, reference based

## Typsystem

Darts [eingebauten Typen](https://dart.dev/language/built-in-types) sind:
- Numbers
  - int
  - double
- String
- bool
- Runes (praktisch Characters)
- [Collections](https://dart.dev/language/collections)
  - Lists
  - Sets
  - Maps
- [Records](https://dart.dev/language/records)
- [Functions](https://dart.dev/language/functions#function-types)
- Symbols
- Null (with the only value `null`)

Dart ist statisch typisiert, jede Variable hat also einen festen, zur Compile-Zeit bekannten Typ. Die Richtigkeit der Zuordnungen wird durch statische Analyse sichergestellt.

```dart
// korrekt
bool boolVariable = true;

// kompilliert nicht
String stringVariable = boolVariable;
```


### var

Dart unterstützt implizite Typisierung. Ist eine Variable als `var` deklariert, dann ermittelt die statische Analyse zur Compile-Zeit den Wert der Variable.

```dart
// String Variable
var stringVariable = "wert";

// List<String> Variable
var stringList = [stringVariable];
```

### final und const

Dart unterstützt auch Konstanten. Dabei gibt es zwei verschiedene Arten:  
`final` Variablen werden zur Zeit der Initialisierung berechnet und dürfen dann nicht mehr verändert werden.

```dart
final name = 'Bob'; // Without a type annotation
final String nickname = 'Bobby';
name = 'Alice'; // Error: a final variable can only be set once.
```

Falls die `final` Variable auf ein Objekt mit Attributen verweist, dürfen diese Attribute verändert werden, nicht aber die Referenz, die in der Variable hinterlegt ist.

```dart
class Counter {
  var count = 0;
}

void main() {
  final counter = Counter();
  counter.count++; // Erlaubt
}
```

Eine mit `const` annotierte Variable dagegen wird schon zur Compile-Zeit berechnet, der Wert wird dann vom Compiler eingesetzt. Daher sind hier nur einfache Ausdrücke und keine Funktionsaufrufe erlaubt.

```dart
const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere

baz = [42]; // Error: Constant variables can't be assigned a value.
```

Da `const` Objekte komplett zur Compile-Zeit bekannt sein müssen, können ihre Attribute, im Gegensatz zu `final`, später nicht verändert werden.

### Typecasts




___
___
# TODO


1.  **`is` / `is!`**  
    Wird verwendet, um den Typ eines Objekts zu überprüfen.  
    Beispiel:  
    ```dart
    if (obj is String) {
      print("Es ist ein String!");
    }
    ```
- is, as, typeof


- Optionale Typen


- final und const
1. **`final`**  
   Deklariert eine Variable, deren Wert nach der Initialisierung nicht mehr geändert werden kann.  
   Beispiel: `final age = 25;`
2. **`const`**  
   Deklariert eine Konstante, deren Wert zur Kompilierzeit festgelegt wird und unveränderlich ist.  
   Beispiel: `const pi = 3.14;`


- Funktionen
4. **`void`**  
   Gibt an, dass eine Funktion keinen Rückgabewert hat.  
   Beispiel: `void greet() { print("Hello!"); }`


- Klassen und Vererbung
6. **`class`**  
   Wird verwendet, um eine Klasse zu definieren.  
   Beispiel:  
   ```dart
   class Person {
     String name;
     Person(this.name);
   }
   ```
   - named und unnamed Parameter

7. **`extends`**  
   Wird verwendet, um eine Klasse von einer anderen abzuleiten (Vererbung).  
   Beispiel: `class Student extends Person {}`

8. **`implements`**  
   Wird verwendet, um eine Klasse zu definieren, die ein Interface implementiert.  
   Beispiel: `class MyClass implements MyInterface {}`

9. **`this`**  
   Verweist auf die aktuelle Instanz der Klasse.  
   Beispiel:  
   ```dart
   class Person {
     String name;
     Person(this.name);
   }
   ```

10. **`super`**  
    Verweist auf die Superklasse und wird verwendet, um Konstruktoren oder Methoden der Superklasse aufzurufen.  
    Beispiel:  
    ```dart
    class Student extends Person {
      Student(String name) : super(name);
    }
    ```

11. **`new`**  
    Wird verwendet, um eine neue Instanz einer Klasse zu erstellen (optional in Dart 2).  
    Beispiel: `var person = new Person("Timo");`

    ```


- Asynchrone Programmierung
5. **`async` / `await`**  
   Wird für asynchrone Programmierung verwendet. `async` markiert eine Funktion als asynchron, und `await` wartet auf das Ergebnis einer asynchronen Operation.  
   Beispiel:  
   ```dart
   Future<void> fetchData() async {
     var data = await getData();
     print(data);
   }
   ```

- Error Handling
6.  **`try` / `catch` / `finally`**  
    Wird verwendet, um Ausnahmen zu behandeln.  
    Beispiel:  
    ```dart
    try {
      var result = 10 ~/ 0;
    } catch (e) {
      print("Fehler: $e");
    } finally {
      print("Fertig.");
    }
    ```