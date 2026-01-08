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

## When does an app rebuild & how to optimize?

**Rebuld triggers**

- setState
- Provider/Riverpod state change
- Parent widget rebuld
- MediaQuery change
- Theme change

**Optimization techniques**

- use const widgets
- split widgets into smaller widgets
- use consumer
- avoid heavy logic in build()
- cache values in initState
- use ListView.builder
- avoid rebuilding entire screen

## What are Method Channels?

*Method Channels allow Flutter (Dart) to communicate with native code (Android/iOS)*

## Types of Method Channels

- **MethodChannel** get single response

``` dart
MethodChannel('battery').invokeMethod('getBatteryLevel');
```

- **EventChannel** continuous data streams

``` dart
EventChannel('connectivity').receiveBroadcastStream();
```

- **BasicMessageChannel** two way communication, used rarely

## Dart define

while running a flutter application you can pass in more arguments using --dart-define key=value values to Flutter

## Flutter Dynamic components

The Flutter Dynamic Components package enables the creation of dynamic Flutter screens based on backend-provided JSON configurations. With this powerful tool, developers can define UI elements through JSON, including sliders, text blocks, images, and category views. This approach greatly accelerates UI development and iteration, allowing for quick updates without needing app redeployment.

## Flutter flavours

allow the developer to create separate environments for your app using the same code base. For example, you might have one flavor for your full-fledged production app, another as a limited "free" app, another for testing experimental features, and so on

## DAST and SAST report 

a combined security analysis report generated by running both Dynamic Application Security Testing (DAST) and Static Application Security Testing (SAST) tools on a Flutter application

## DAST Dynamic application security testing

Scans a running Flutter application by simulating real-world attacks to identify vulnerabilities like insecure authentication, improper input validation, or cross-site scripting (XSS) that might only appear during runtime
does not require access to the source code

## SAST static application security testing

Analyzes the Flutter application's source code directly to identify potential security flaws like hardcoded passwords, insecure coding practices, or vulnerabilities within libraries used

## Flutter hooks

Hooks are a new kind of object that manage the life-cycle of a Widget. They exist for one reason: increase the code-sharing between widgets by removing duplicates.

## Polymorphism in dart

Polymorphism is a core concept in Object-Oriented Programming (OOP) that allows objects to be treated as instances of their parent class rather than their actual class. In Dart, polymorphism is primarily achieved through inheritance, method overriding, and interfaces

## Interfaces In dart

Any class can act as an interface.
Interfaces enforce the implementation of methods and properties declared in the class or interface being implemented.
A class can implement multiple interfaces.
*You use the implements keyword to define that a class is implementing an interface.*

``` dart
class Printer {
  void printData() {
    print("Printing data...");
  }
}

class Scanner {
  void scanData() {
    print("Scanning data...");
  }
}

// Implementing the Printer and Scanner interfaces
class AllInOneDevice implements Printer, Scanner {
  @override
  void printData() {
    print("All-in-one printing");
  }

  @override
  void scanData() {
    print("All-in-one scanning");
  }
}

void main() {
  AllInOneDevice device = AllInOneDevice();
  device.printData();
  // Output: All-in-one printing
  device.scanData();  
  // Output: All-in-one scanning
}
```

### Abstract classes

An abstract class is a class that cannot be instantiated directly. It serves as a blueprint for other classes to inherit from, enforcing a contract for method implementation while optionally providing base functionality. Abstract classes are commonly used to define common behaviors or properties for subclasses.

``` dart
abstract class Animal {
  void sound(); // Abstract method
  void eat() {
    print("This animal eats food."); // Concrete method
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print("Dog barks");
  }
}

void main() {
  // Animal animal = Animal(); // Error: Cannot instantiate abstract class
  Dog dog = Dog();
  dog.sound(); // Output: Dog barks
  dog.eat();   // Output: This animal eats food.
}
```

## Singleton classes

A singleton class is a design pattern where only one instance of the class is created throughout the application
There are two common ways to implement a singleton in Dart:

*using Factory Constructor*

``` dart
class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal(); // Private named constructor
}

void main() {
  var instance1 = Singleton();
  var instance2 = Singleton();

  print(identical(instance1, instance2)); // Output: true
}
```

## Code Obfuscation

Code obfuscation is the process of making applications difficult or impossible to decompile or disassemble, and the retrieved application code more difficult for humans to parse. Application developers must harden the code at various layers.

## apk full form

The full form of APK is an Android Application Package. APK is the application file type used in the Android operating system
An APK (Android Package Kit) is the file format for applications used on the Android operating system. APK files are compiled with Android Studio, which is the official integrated development environment (IDE) for building Android software. An APK file includes all of the software program's code and assets.

## AutomaticKeepAliveClientMixin

used to preserve widget state line in TabBarView, PageView, ListView

``` dart
class MyTab extends StatefulWidget {
  @override
  _MyTabState createState() => _MyTabState();
}

class _MyTabState extends State<MyTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
}
```
