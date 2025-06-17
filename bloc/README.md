# Bloc

Bloc ist eine beliebte Lösung für State Management in Flutter Anwendungen. Grundsätzlich basiert Bloc auf einer eventgetriebenen Architektur, die große Vorteile für die observability und traceability bietet. Mit Cubits wird allerdings auch eine [vereinfachte Variante angeboten](https://bloclibrary.dev/bloc-concepts/#cubit-vs-bloc), die ohne Events auskommt.

## [Blocs](https://bloclibrary.dev/bloc-concepts/#bloc)

Die grundsätzliche Einheit von Zustand ist ein Bloc Objekt. Diese können genau ein Objekt einer beliebigen Dart-Klasse speichern. Die Manipulation des Zustands  erfolgt generell über Events.

Im unteren Beispiel wird als Zustand ein einfacher `int` gespeichert, der bei jedem `IncrementEvent` um einen erhöht wird. die `emit()` Funktion setzt dabei den neuen Zustand und benachrichtigt alle Komponenten, die von diesem Bloc abhängen.

``` dart
class CounterBloc extends Bloc<IncrementEvent, int> {
	CounterBloc() : super(0) {
		on<IncrementEvent>((event, emit) {
			emit(state + 1);
		});
	}
}
```

Um auf verschiedene Events reagieren zu können, kann die `on()` Methode überladen werden. Für diesen Use Case bieten sich auch [`sealed`](https://dart.dev/language/class-modifiers#sealed) Klassen an.

``` Dart
sealed class CounterEvent {}

final class IncrementEvent extends CounterEvent {}

final class DecrementEvent extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
	CounterBloc() : super(0) {

		on<IncrementEvent>((event, emit) {
			emit(state + 1);
		});

		on<DecrementEvent>((event, emit) {
			emit(state - 1);
		});
	}
}
```

### [Observability](https://bloclibrary.dev/bloc-concepts/#observing-a-bloc)

Die Bloc Klasse hat drei wichtige Methoden für Observability, die jede Implementierung überschreiben kann:

- `onError()` wird aufgerufen, wenn irgendwo in einer Methode des Objekts die `addError()` Methode aufgerufen wird. So können wir Fehler an einem zentralen Ort behandeln.
- `onTransition()` wird bei jedem Übergang in einen neuen Zustand aufgerufen, mit einem `Transition` Objekt, welches den alten und neuen Zustand sowie das Eventobjekt enthält.
- `onChange()` wird auch bei jedem Übergang aufgerufen, direkt nach der `onTransition()` Methode, und erhält ein `Change` Objekt, welches nur den alten und neuen Zustand enthält, nicht aber das Event. Dieser Unterschied wird mit der Nutzung von [Cubits](#cubits) bedeutsam.

Alternativ können wir alle drei Methoden auch in einme zentralen [BlocObserver](https://bloclibrary.dev/bloc-concepts/#blocobserver-1) implementieren, der für alle Übergänge in allen Blocs und Cubits angesprochen wird, und so eine gute Stelle für zentrales Logging und Error Handling bietet.

``` Dart
class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
}
```

### Zustand nutzen

TODO: Was genau muss ich in Flutter einbauen, um an diesen State zu kommen?

- BlocBuilder gives a state to its immediate child; We can also control when to rebuild
- BlocProvider gives state to all descendants with BlocProvider.of<T> oder context.read<T>

## [Cubits](https://bloclibrary.dev/bloc-concepts/#cubit)

TODO:
 - Was ist die Motivation für Cubits? https://github.com/felangel/cubit/issues/69
 - Was unterscheidet sie von Blocs?
 - Code beispiel Cubit

## Architecture

TODO: Blocs/Cubits, Repositories, DataProviders

TODO: Verweis auf Repository für Beispiele