# Dart

- C Style Syntax (void main() { // })
- Garbage collected, reference based
- late & lazy

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
- Null (mit dem einzigen möglichen Wert `null`)

Dart ist statisch typisiert, jede Variable hat also einen festen, zur Compile-Zeit bekannten Typ. Die Richtigkeit der Zuordnungen wird durch statische Analyse sichergestellt.

```dart
// korrekt
bool boolVariable = true;

// kompilliert nicht
String stringVariable = boolVariable;
```

### [Type Inference](https://dart.dev/language/type-system#type-inference)

Dart unterstützt implizite Typisierung. Ist eine Variable als `var` deklariert, dann ermittelt die statische Analyse zur Compile-Zeit den Wert der Variable.

```dart
// String Variable
var stringVariable = "wert";

// List<String> Variable
var stringList = [stringVariable];
```

Hat die Analyse zu wenig Informationen, um den Typ klar fetzulegen, kann sie die Daten als `dynamic` kennzeichnen und zur Laufzeit alle Objekte zulassen.

```dart
// List<dynamic> Variable
var dynamicList = [];
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

### [Typecasts](https://dart.dev/language/operators#type-test-operators)

Die statische Typinferenz ist nützlich, aber nicht perfekt. Daher bietet Dart das keyword `as`, mit dem wir Objekte explizit casten können, wenn wir wissen, welchen Typ es hat.
Sind wir nicht sicher, ob das Objekt einen bestimmten Typ hat, können wir dies mit `is` oder `is!` prüfen:

```dart
void setName(Object employee) {
	if(employee is Persion) {
		(employee as Person).firstName = 'Bob';
	}
}
```

## Null Safety und Nullable Types

### Sound Null Safety

Dart implementiert [Sound Null Safety](https://dart.dev/null-safety). Sprich: Wenn der Compiler feststellt, dass ein Wert nicht `null` ist, dann *kann dieser Wert niemals `null` sein*.

Per default sind alle Variablen *non-nullable*. Sie müssen mit einem valide Wert initialisiert werden, und ihnen kann später nicht `null` zugewiesen werden.

```dart
// Fehler: Muss initialisiert werden
String firstName;

String lastName = "Müller";
// Fehler: Darf nicht null sein
lastName = null;

// Ist immer false
lastName is Null;
```

Die technischen Hintergründe im Typsystem sind [hier](https://dart.dev/null-safety/understanding-null-safety#nullability-in-the-type-system) erklärt.

### Nullable Types

Wollen wir `null` benutzen, können wir *Nullable Types* benutzen, indem wir ein `?` an unseren Typen anhängen. Variablen mit nullable types können entweder einen Wert oder `null` enthalten.

```dart
// Beide Fälle sind jetzt erlaubt.
String? firstName;
firstName = null;
```

### Die Operatoren `?` und `!`

Auf die Attribute und Methoden von Nullable Types kann nicht direkt zugegriffen werden, da sie ja `null` sein können. Sind wir sicher, dass die Variable nicht `null` ist, können wir den [Non-Null Assertion Operator](https://dart.dev/null-safety/understanding-null-safety#non-null-assertion-operator) `!` benutzen, um die Variable zu einen non-nullable type zu casten. Schlägt dieser cast fehl, wird eine runtime exception geworfen.

Sind wir nicht ganz sicher, ob die Variable `null` ist oder nicht, können wir den binären [Null Aware Operator](https://dart.dev/null-safety/understanding-null-safety#smarter-null-aware-methods) `?.` benutzen. Ist hier die linke Seite null, wird die rechte Seite ignoriert und `null` zurückgegeben. Andernfalls wird die rechte Seite ausgeführt wie normal. Auf diese Weise spart man sich verbose null-checks.

```dart
String? nullableString = "value";
// Hier ist upperCase 'VALUE'
String upperCase = nullableString?.toUppercase();
// Mit ! casten wir String? zu String
String strictString = nullableString!;

nullableString = null;
// Hier ist lowerCase null
String? lowerCase = nullableString?.toLowerCase();
// Fehler: Wirft RuntimeException
strictString = nullableString!;

// Ein Beispiel für verkettete ?. Operatoren:
// Ist user null oder gibt getArticle(3)
// null zurück wird die Ausführung abgebrochen
user?.getBasket().getArticle(3)?.setSize(9);
```

## Klassen

Dart ist eine objektorientierte Sprache und bietet damit natürlich auch die Möglichkeit, eigene Klassen zu definieren. Die meisten Features von Klassen in Dart sind Java-Entwicklern bereits geläufig: Die Schlüsselwörter `class`, `this`, `new`, `extends`, `implements` und `super` werden analog benutzt.

___
___

# TODO

### Mixins

## Asynchrone Programmierung

### `async` und `await`

### Streams

- Asynchrone Programmierung
  
1. **`async` / `await`**  
   Wird für asynchrone Programmierung verwendet. `async` markiert eine Funktion als asynchron, und `await` wartet auf das Ergebnis einer asynchronen Operation.  
   Beispiel:

   ```dart
   Future<void> fetchData() async {
     var data = await getData();
     print(data);
   }
   ```

## Funktionen

- named and unnamed parameters

## Patterns
