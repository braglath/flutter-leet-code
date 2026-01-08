# Flutter Questions

## security measures

start with local security measures like
local authentication, Https, detecting jailbreak and tampered devices,
obtaining only necessary permissions, ssl pinning, background snapshot protection
Code obfuscation, Encrypting api keys, payloads and user data.

## Difference between start debugging Vs Start without debugging

When you start with debugging it allows you to add break points and step through the code as it will load the debugging symbols.
If you start without debugging then the symbols dont get loaded so you cannot step through the code with the break points,
much like a release build.

## Void vs Future vs Stream

- **Void** does not return anything, it does not return null. even if the code has return null; we cannot obtain the returned value.
- **Futures** are about one-shot request/response (I ask, there is a delay,
I get a notification that my Future is ready to collect, and I'm done!)
- **Streams** are a continuous series of responses to a single request (I ask, there is a delay then I keep getting responses until the stream dries up.)

## Stopwatch Class

A stopwatch which measures time while it's running.
A stopwatch is either running or stopped. It measures the elapsed time that passes while the stopwatch is running.

## What’s Linting?

Linting is the process of checking the source code for Programmatic as well as Stylistic errors and unformatted code.
It’s helpful in identifying some common and uncommon mistakes that are made during coding like logical errors, unused variables,
empty if-else statements among others.
Linter/Lint is a tool that analyzes source code to flag programming errors, bugs, stylistic errors, and suspicious constructs.
It supports verifying code quality. we use analysis_options.yaml file to define the lint rules. we use flutter_lints package

## Extension Methods

Extension methods add functionality to existing libraries.

## Dart does not support multiple class inheritance directly to avoid complexity and ambiguity issues like the diamond problem

Instead, you can achieve similar functionality using mixins and implementing multiple interfaces

```dart

mixin CanFly {
void fly() {
print('I can fly!');
}
}

mixin CanSwim {
void swim() {
print('I can swim!');
}
}

class Duck with CanFly, CanSwim {
// The Duck class now has both fly() and swim() methods.
void quack() {
print('Quack quack!');
}
}

void main() {
var duck = Duck();
duck.fly();
duck.swim();
duck.quack();
}
```

## Flutter Stateful widget lifecycle

createState, initState, didChangeDependencies, build, setState, didUpdateWidget, deactivate, dispose

## Android activity lifecycle

onCrate, onStart, onResume, onPause, onStop, onDestroy, (onRestart)

## How does FCM (Firebase Cloud Messaging) work?

*FCM is used to send push notifications to mobile apps.*

**Flow:**

- App installs → Firebase generates a device token
- App sends this token to backend (or Firestore)
- Backend uses FCM server key to send message to Firebase
- Firebase delivers message to the device

**App handles it:**

- Foreground → onMessage
- Background → onMessageOpenedApp
- Terminated → getInitialMessage


## ValueNotifier vs ChangeNotifier

- **ValueNotifier** holds a single value, it notifies listeners when the value changes. Its lightweight
- **ChangeNotifier** can manage multiple values, show call notifyListeners() manually. used by provider/riverpod

## What are inherited widgets
It is used to share data down the widget tree, avoids passing data using contructor. eg. Theme, MediaQuery. Provder, Riverpod are build on top of this

## BLoC and Riverpod

- **BLoC** uses streams, event as input and outputs States. Good for large apps but more boilerplate

- **Riverpod** No BuildContext needed, Compile-time safety, uses inherited widgets, less boilerplate, better testability

## HTTP vs Dio

- **HTTP** - basic REST calls, less configuration

- **Dio** - advanced HTTP client, supports (interceptors, cancel request, retry, timeout, multipart upload), Dio is preferred for production apps

## What is Dio Interceptor

It lets you to intercept request and responses. Use cases - Add auth token, log api call, handle errors globally, refresh token

## What is build_runner and its use case

It is a code generation tool used with Freezed(models), JSON serialization, Riverpod generator, Drift/Floor, Hive
*flutter pub run build_runner build*

## How does setState work
It marks the widget as dirty then triggers build(), only that widget subtree gets rebulds. not for large or shared state