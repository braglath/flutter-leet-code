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

## void vs Future vs Stream

- **Void** does not return anything, it does not return null. even if the code has return null; we cannot obtain the returned value.

```dart
void addCounter(){
  return null; // a void does not return null, we cannot obtain the returned value
}
```

- **Futures** are about one-shot request/response (I ask, there is a delay,

```dart
Future<String> fetchUserName() async {
  await Future.delayed(Duration(seconds: 2));
  return "Bragu";
}
```

I get a notification that my Future is ready to collect, and I'm done!)

- **Streams** are a continuous series of responses to a single request (I ask, there is a delay then I keep getting responses until the stream dries up.)

```dart
Stream<int> counterStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
```

## Stopwatch Class

A stopwatch which measures time while it's running.
A stopwatch is either be running or stopped. It measures the elapsed time that passes while the stopwatch is running.

## What’s Linting?

Linting is the process of checking the source code for Programmatic as well as Stylistic errors and unformatted code.
It’s helpful in identifying some common and uncommon mistakes that are made during coding like logical errors, unused variables,
empty if-else statements among others.
Linter/Lint is a tool that analyzes source code to flag programming errors, bugs, stylistic errors, and suspicious constructs.
It supports verifying code quality. we use analysis_options.yaml file to define the lint rules. we use flutter_lints package

## Extension Methods

Extension methods add functionality to existing libraries.

```dart
extension ConvertString on String{
  int get toInt => int.parse(this);
}
```

## Why dart does not allow multiple inheritance

To avoid complexity and ambiguity issues like the diamond problem.

```dart
class A {
  void sayHello() => print("Hello from A");
}

class B extends A {}

class C extends A {}

class D extends B, C {} // ambiguous
```

- B inherits sayHello()
- C inherits sayHello()
- D inherits both B and C

Which sayHello() should D use?

This is called the **Diamond Problem**.

## Mixin

Dart does not support multiple class inheritance directly to avoid complexity and ambiguity issues like the diamond problem. Instead, you can achieve similar functionality using mixins and implementing multiple interfaces

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
}u
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

## Difference Between deactivate() and dispose()

**deactivate():**

- Called when widget is removed from tree temporarily.
- Might reinsert again.
- Rarely used.

**dispose():**

- Called permanently.
- Widget is destroyed.
- Release resources here.

## How does FCM (Firebase Cloud Messaging) work?

_FCM is used to send push notifications to mobile apps._

**Flow:**

- App installs → Firebase generates a device token
- App sends this token to backend (or Firestore)
- Backend uses FCM server key to send message to Firebase
- Firebase delivers message to the device

**App handles it:**

- Foreground → onMessage
- Background → onMessageOpenedApp
- Terminated → getInitialMessage

```dart
void setupInteractedMessage() async {
    // When app is in foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Foreground message: ${message.notification?.title}");
    });

    // When app is opened from background (user taps notification)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Opened from background: ${message.notification?.title}");
    });

    // When app is terminated and opened by notification
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
  }
```

## ValueNotifier vs ChangeNotifier

- **ValueNotifier** holds a single value, it notifies listeners when the value changes. Its lightweight
- **ChangeNotifier** can manage multiple values, should call notifyListeners() manually. used by provider/riverpod

## What are inherited widgets

It is used to share data down the widget tree, avoids passing data using contructor. eg. Theme, MediaQuery. Provder, Riverpod are build on top of this

## BLoC and Riverpod

- **BLoC** uses streams, event as input and outputs States. Good for large apps but more boilerplate

- **Riverpod** No BuildContext needed, Compile-time safety, uses inherited widgets, less boilerplate, better testability

## HTTP vs Dio

- **HTTP** - basic REST calls, less configuration

```dart
await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
  );
```

- **Dio** - advanced HTTP client, supports (interceptors, cancel request, retry, timeout, multipart upload), Dio is preferred for production apps

```dart
 await dio.get(
      'https://jsonplaceholder.typicode.com/posts/1',
    );
```

## What is Dio Interceptor

It lets you to intercept request and responses. Use cases - Add auth token, log api call, handle errors globally, refresh token

```dart
import 'package:dio/dio.dart';

class NetworkService {
  final Dio dio = Dio();

  NetworkService() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 🔹 Add Authorization Header
          options.headers["Authorization"] = "Bearer my_token";

          print("➡️ REQUEST: ${options.method} ${options.path}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("✅ RESPONSE: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          print("❌ ERROR: ${e.response?.statusCode}");

          if (e.response?.statusCode == 401) {
            print("Unauthorized! Token might be expired.");
          }

          return handler.next(e);
        },
      ),
    );
  }

  Future<void> fetchPost() async {
    final response =
        await dio.get("https://jsonplaceholder.typicode.com/posts/1");

    print(response.data);
  }
}
```

## What is build_runner and its use case

It is a code generation tool used with Freezed(models), JSON serialization, Riverpod generator, Drift/Floor, Hive, Pigeon

- _flutter pub run build_runner build_

## How does setState work

It marks the widget as dirty then triggers build(), only that widget subtree gets rebuilds. not for large or shared state. setState() does NOT immediately rebuild. Multiple setState() calls in one frame → batched.

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
- using select() in riverpod

## What are Method Channels?

_Method Channels allow Flutter (Dart) to communicate with native code (Android/iOS)_

## Types of Method Channels

- **MethodChannel** get single response

```dart
MethodChannel('battery').invokeMethod('getBatteryLevel');
```

- **EventChannel** continuous data streams

```dart
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
_You use the implements keyword to define that a class is implementing an interface._

```dart
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

```dart
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

_using Factory Constructor_

```dart
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

```dart
Without obfuscation (readable in decompiled APK)
    class UserAuthService {
      Future<void> loginWithEmail(String email, String password) { ... }
    }

With obfuscation (what attackers see)
    class a {
      Future<void> b(String c, String d) { ... }
    }
```

## apk full form

The full form of APK is an Android Application Package. APK is the application file type used in the Android operating system
An APK (Android Package Kit) is the file format for applications used on the Android operating system. APK files are compiled with Android Studio, which is the official integrated development environment (IDE) for building Android software. An APK file includes all of the software program's code and assets.

## AutomaticKeepAliveClientMixin

used to preserve widget state line in TabBarView, PageView, ListView

```dart
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

## Generics in flutter

Generics allow you to write type-safe reusable code. Instead of fixing a type, you make it flexible using <T>

```dart
class Box<T> {
  final T value;
  Box(this.value);
}
```

## How to Implement Concurrency in Flutter

- Async/Await
- Futures in parallel

```dart
await Future.wait([
  fetchUser(),
  fetchGyms(),
  fetchTrainers(),
]);
```

- streams

```dart
Stream<int> counter() async* {
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}
```

- Isolates (True Parallelism) - For CPU-heavy tasks (image compression, encryption)

```dart
compute(parseJson, jsonString);
```

## What is yield in Flutter?

yield is used inside a generator function. It emits values in a Stream

```dart
Stream<int> numbers() async* {
  yield 1;
  yield 2;
  yield 3;
}
```

## How to Solve a Bug / Crash from Crash Report

- Identify the crash source (firebase crashlytics/stack trace)
- Analyze stack trace
- Reproduce (check device, check OS version, check user data, check network condition)
- Fix and Add logging

## Dio cancel token

CancelToken is a feature of the dio HTTP client that allows you to cancel an ongoing network request before it completes.
A CancelToken is an object that: Is attached to a request, Can cancel that request anytime, Throws a DioException with type cancel

It is especially useful in:

- Screen disposal (user navigates back)
- Search APIs (cancel previous request when user types new text)
- Avoiding memory leaks
- Preventing unnecessary API calls

```dart
import 'package:dio/dio.dart';

final dio = Dio();
final cancelToken = CancelToken();

void fetchData() async {
  try {
    final response = await dio.get(
      'https://api.example.com/data',
      cancelToken: cancelToken,
    );

    print(response.data);
  } catch (e) {
    if (e is DioException && CancelToken.isCancel(e)) {
      print("Request was cancelled");
    } else {
      print("Other error: $e");
    }
  }
}

void cancelRequest() {
  cancelToken.cancel("User navigated back");
}
```

## Flutter frame rendering pipeline

Flutter renders at 60 FPS, meaning one frame must complete in: 1000ms / 60 = 16.67ms.
If build + layout + paint exceed 16ms → dropped frame → jank

**Build Phase**

widgets rebuild, creates new element tree

**Layout Phase**

calculates size & position

**Paint Phase**

creates layer tree

**Rasterization**

converts layers to pixels

## What Causes Jank?

- Heavy computation in build()
- Large lists without ListView.builder
- JSON parsing on main isolate
- Excessive rebuilds

## Secure local storage

flutter_secure_storage

```dart
final storage = FlutterSecureStorage();
await storage.write(key: "token", value: token);
```

## Handle/detect app state (background, foreground)

```dart
class LifecycleHandle with WidgetsBindingObserver{
  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    if(state == AppLifecycleState.paused){
      // handle app in background
    }
  }
}
```

## Unicode Characters

unicode is a universal character set standard. It assigns a unique number to ever character
₹ → U+20B9
😀 → U+1F600
Unicode = character → unique number mapping

## UTF - 8

is an encoding format that stores unicode characters as bytes

- Uses 1–4 bytes per character
- Backward compatible with ASCII
- Most used encoding on the web

₹ → 3 bytes
😀 → 4 bytes

```dart
import 'dart:convert';

final bytes = utf8.encode("Hello");
final text = utf8.decode(bytes);
```

## AES vs RSA Encryption

**AES (Advanced Encryption Standard)**

- Symmetric encryption
- Same key for encrypt & decrypt
- Very fast
- Used for large data

App encrypts local data with a secret key.

**RSA (Rivest–Shamir–Adleman)**

- Asymmetric encryption
- Public key encrypts
- Private key decrypts
- Slower

Used for secure key exchange

**Real-world Usage (Important for interviews)**

In HTTPS:

- RSA → securely exchanges AES key
- AES → encrypts actual data

👉 AES = speed

👉 RSA = secure key sharing

## How Flutter Secure Storage Works

Plugin: flutter_secure_storage

On Android, uses: Android Keystore

AES key stored in hardware-backed keystore

On iOS, uses: Keychain Services

**Best for**

- Access tokens
- Refresh tokens
- Encryption keys

**Not for**

- Large data
- Caching

## Where to Store Tokens?

Access Token → Secure storage
Refresh Token → Secure storage
User profile → Local DB (Hive/Drift)

## Different Constructors in Dart

**Default constructor**

```dart
class User{
  User();
}
```

**Name constructor**

```dart
User.admin();
```

**Constant constructor**

```dart
const User(this.name);
```

**Factory constructor**

```dart
factory User.fromJson(Map<String, dynamic> json) => User(name: json["name"])
```

**Redirecting constructor**

```dart
User.guest() : this("Guest");
```

## Types of Parameters in Dart Constructors

**Positional**

```dart
User(String name)
```

**Named**

```dart
User({required String name})
```

**Optional positional**

```dart
User([String? name])
```

**Required named**

```dart
User({required String name})
```

**Default values**

```dart
User({this.role = "user"})
```

## Use of Factory Method

Factory constructor is used when:

- You want to return cached instance
- You want different subclasses
- You want validation before creating object
- Singleton pattern

```dart
factory Logger() {
  return _instance;
}
```

**Why factory over normal constructor?**

- Because factory can return existing instance
- It doesn’t always create new object
- Useful for parsing, caching, singleton, polymorphism

## What does % mean in Dart

% is the modulus (remainder) operator, it gives remainder after division

```dart
bool isEven(int input)=> input % 2 == 0; // ==0 true, != 0 false
// dart uses bitwise checks internally for detecting a int is odd or even and has extension isEven
```

## What are Bitwise Checks

Bitwise operations work directly on the binary representation (0s and 1s) of numbers Computers store integers in binary.

- 4 -> 100 [last bit - 0]
- 5 -> 101 [last bit - 1]
- 6 -> 110 [last bit - 0]
- 7 -> 111 [last bit - 1]

If the last bit is 0, it's even; if 1, it's odd.

## Why are Bitwise Checks Used?

- Faster (very slightly)
- Bitwise operations are extremely low-level and very fast.

**Used in**

- Performance-critical code
- Game engines
- System-level programming
- Memory manipulation
- Flutter engine internals

## what is pigeon in flutter

Pigeon is a code generation tool used in Flutter to create type-safe communication between Flutter (Dart) and native platforms (Android/iOS).

It helps you avoid writing manual MethodChannel boilerplate code.

**Why Pigeon is Needed**

In Flutter, when you want to call native code (like Bluetooth, NFC, camera custom APIs, smart lock SDKs, etc.), you usually use: MethodChannel, EventChannel, BasicMessageChannel

**But:**

- ❌ It uses dynamic types (Map, dynamic)
- ❌ No compile-time safety
- ❌ Easy to break during refactoring
- ❌ Hard to maintain in enterprise apps

Pigeon solves this by generating strongly-typed APIs.

**How Pigeon Works**

- You define a Dart file with API definitions.
- Pigeon generates:
- Dart code
- Kotlin/Java code (Android)
- Swift/Objective-C code (iOS)
- You implement the native side.
- Flutter calls native methods like normal Dart functions.

```dart
import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class BatteryApi {
  int getBatteryLevel();
}

// Call from Flutter

final api = BatteryApi();
int level = await api.getBatteryLevel();
```

## Explain Widget vs Element vs RenderObject in detail

**Widget**

- Immutable configuration
- Lightweight
- Recreated frequently

**Element**

- Bridge between widget & render object
- Holds state
- Manages lifecycle

**RenderObject**

- Performs layout & paint
- Heavy object
- Rarely recreated

Widget -> Element -> RenderObject

## When should you use Keys? Types of keys in flutter?

Used when Flutter needs help identifying widgets.

**Types:**

- ValueKey (reordering list item, when item has stable ID like index from live view builder, preserving state in list)

```dart
ValueKey(123)
ValueKey('1') == ValueKey('1') // true
```

- ObjectKey (use when your object overrides == and hashCode)

```dart
@freezed
class User with _$User {
  const factory User({required String id}) = _User;
}
ObjectKey(userObject)
ObjectKey(user1) == ObjectKey(user2)
```

- UniqueKey (Always unique. Never equal to anything else)

```dart
UniqueKey()
```

- GlobalKey (expensive!) (validating form, accessing widget state anywhere, preserving state even if position changes)

```dart
final formKey = GlobalKey<FormState>();
Form(
  key: formKey,
);
```

**Use case:**

- Reordering list items
- Preserving state
- Form validation

Avoid overusing GlobalKey (memory + performance cost)

## How does Flutter Add-to-App work?

Add-to-App embeds Flutter inside existing native app.

**Used when:**

- Migrating large native apps gradually
- Sharing modules between platforms
- Two approaches:
- FlutterActivity / FlutterFragment (Android)
- FlutterViewController (iOS)

**Communication via:**

- Platform Channels
- MethodChannel
- EventChannel
- Pigeon (type-safe communication)

## What challenges exist in Add-to-App?

- Multiple FlutterEngine management
- Memory overhead
- App lifecycle sync
- Navigation sync with native
- Plugin registration issues

**Best practice:**

- Use cached FlutterEngine
- Prewarm engine
- Control lifecycle carefully

## How do you prevent unnecessary rebuilds in Riverpod?

- Use select()
- Split providers
- Use ref.watch carefully
- Avoid watching large objects

```dart
ref.watch(userProvider.select((u) => u.name));
```

## Isolate vs Compute

**compute():**

```dart
final result = await compute(parseJson, jsonString);
```

**What it does:**

- Spawns temporary isolate
- Runs function
- Returns result
- Kills isolate

**Use when:**

- Short CPU-heavy task
- JSON parsing
- Image processing

**Limitation:**

- Must be top-level/static function
- No access to class instance
- Not good for long-running background tasks

**Manual Isolate:**

```dart
Isolate.spawn(myFunction, sendPort);
```

**Use when:**

- Long-running background processing
- Streaming data
- Continuous tasks
- Background service

**Why?**

- You manage lifecycle
- Reusable isolate
- Better control

## What is select() in Riverpod?

**Problem?**
If any field changes -> whole widget rebuilds

```dart
ref.watch(userProvider);
```

**Solution: select():**
Now widget rebuilds ONLY if name changes.

```dart
ref.watch(userProvider.select((user) => user.name));
```

**Use select for:**

- Performance optimization
- Large state objects
- List item widgets

## What are Slivers?

Slivers are scrollable pieces of the UI. The word "sliver" literally means a small, thin piece — in Flutter, it refers to a portion of a scrollable area.
Normal widgets like ListView and GridView are actually built on top of slivers under the hood. Slivers give you fine-grained control over scrollable layouts that normal widgets can't achieve.

**Why Use Slivers?**
When you need effects like:

- A collapsing app bar that shrinks on scroll
- Mixing a grid and a list in one scroll view
- A pinned/floating header mid-list
- Custom scroll effects

```dart
import 'package:flutter/material.dart';

class SliverExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(   // ← replaces Scaffold body
        slivers: [

          // 1. Collapsing AppBar
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,         // stays visible when collapsed
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Slivers Demo"),
              background: Image.network(
                "https://picsum.photos/400/200",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 2. A normal widget inside a sliver
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Featured Items",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 3. A Grid
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.blue[100 * ((index % 8) + 1)],
                child: Center(child: Text("Grid $index")),
              ),
              childCount: 6,
            ),
          ),

          // 4. A List below the grid (same scroll view!)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: Icon(Icons.star),
                title: Text("List Item $index"),
              ),
              childCount: 10,
            ),
          ),

        ],
      ),
    );
  }
}
```

## Sealed Classes in Dart (Flutter)

Introduced in Dart 3.0. A sealed class defines a closed set of subtypes — the compiler knows every possible subtype, enabling exhaustive pattern matching.

- All subtypes must be in the same file
- Cannot be extended or implemented outside the file
- Forces you to handle every possible case (like an enum but with data)

```dart
sealed class ApiState {}

class Loading extends ApiState {}

class Success extends ApiState {
  final String data;
  Success(this.data);
}

class Failure extends ApiState {
  final String error;
  Failure(this.error);
}
```

## Records in Dart 3.0

allows to return multiple values with different data types

```dart
// With named fields
({String name, int age, bool isActive}) getUser() {
  return (name: "John", age: 25, isActive: true);
}

void main() {
  final user = getUser();
  print(user.name);     // John
  print(user.age);      // 25
  print(user.isActive); // true
}

// Positional destructuring
final (name, age, isActive) = getUser();
print(name); // John
print(age);  // 25

// Named destructuring
final (:name, :age, :isActive) = getUser();
print(name); // John
```

## positional destructuring

Used when the record has no named fields — just positional values.

```dart
// Record with positional fields
(String, int, bool) getUser() {
  return ("John", 25, true);
}

// Destructure by POSITION — order matters!
final (age, name, isActive) = getUser();
print(age);  // "John" ❌ wrong! got String not int
print(name); // 25     ❌ wrong! got int not String
```

## Named Destructuring

Used when the record has named fields

```dart
// Record with named fields
({String name, int age, bool isActive}) getUser() {
  return (name: "John", age: 25, isActive: true);
}

// Destructure by NAME — order doesn't matter!
final (:name, :age, :isActive) = getUser();

// ✅ Same result regardless of order
final (:age, :isActive, :name) = getUser();
print(name); // John — still correct!
```

## BuildContext in Flutter

In Flutter, BuildContext is an object that represents the location of a widget in the widget tree. Every widget has its own BuildContext, which is passed automatically through the build() method

```dart
@override
Widget build(BuildContext context) {
  // 'context' is automatically provided here
  return Container();
}
```

**Important Rules to Remember:**

Don't use context across async gaps without checking mounted. After an await, the widget may no longer be in the tree.

Context is scoped — of(context) walks up the tree from that widget's position. If you use a context that's above a Scaffold, for example, Scaffold.of(context) will throw an error.
You can use Builder widget to get a context that is lower in the tree when needed:

```dart
Builder(
    builder: (innerContext) {
      return ElevatedButton(
        onPressed: () => Scaffold.of(innerContext).openDrawer(),
        child: Text("Open Drawer"),
      );
    },
  )
```

## How to Handle Network Errors Globally in Flutter

You handle network errors at 3 levels:

- **Level 1 – Dio Interceptor (Global Layer)**

Using Dio interceptor to catch errors globally

```dart
class AppInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.connectionError) {
      // Handle no internet
    }
    if (err.response?.statusCode == 401) {
      // Auto logout user
    }
    handler.next(err);
  }
}

// attach it once
dio.interceptors.add(AppInterceptor());
```

- **Level 2 – Repository Layer (Clean Architecture)**

convert raw errors to domain-friendly failures

```dart
Future<(User?, Exception?)> getUser() async {
  try {
    final response = await dio.get('/user');
    return (User.fromJson(response.data), null);
  } catch (e) {
    return (null, ServerFailure());
  }
}
```

- **Level 3 – UI Layer (Riverpod)**

```dart
ref.watch(userProvider).when(
  data: (data) => Text(data.name),
  loading: () => CircularProgressIndicator(),
  error: (e, _) => Text("Something went wrong"),
);
```

## Flutter onError Method (Global Error Handling)

- FlutterError.onError (ui errors)
- PlatformDispatcher.instance.onError (uncaught async errors)
- runZonedGuarded (isolate errors)

```dart
void main() {

  // ui errors
  FlutterError.onError = (details) {
    logError(details.exception, details.stack);
  };
  // uncaught async errors
  PlatformDispatcher.instance.onError = (error, stack) {
    logError(error, stack);
    return true;
  };
  // for isolate errors
  runZonedGuarded(() {
    runApp(MyApp());
  }, (error, stack) {
    logError(error, stack);
  });
}
```

## What are consumer

Used inside normal stateless/stateful widget, only this part rebuild. we get access to ref. Use Consumer for performance optimization to avoid full rebuild.

```dart
Consumer(
  builder: (context, ref, child) {
    final user = ref.watch(userProvider);
    return Text(user.name);
  },
)
```

## What are Consumer Widget

A widget that listens to providers, entire widget rebuilds when provider changes

```dart
class MyScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Text(user.name);
  }
}
```

## What is finally in try-catch

finally always runs whether exception happens or not. finally ensures cleanup logic runs regardless of success or failure.

```dart
try {
  await apiCall();
} catch (e) {
  print("Error");
} finally {
  print("Stop loader");
}
```

**When to use?**

- Stop loading indicator
- Close database
- Dispose controllers
- Release resources