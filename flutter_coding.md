## Parallel API calls with Partial Failure

```dart
Future<DashboardData> loadDashboard() async {
  final results = await Future.wait([
    _safeCall(() => api.get("/profile")),
    _safeCall(() => api.get("/stats")),
    _safeCall(() => api.get("/notifications")),
  ]);

  return DashboardData(
    profile: results[0],
    stats: results[1],
    notifications: results[2],
  );
}

Future<dynamic> _safeCall(Future<Response> Function() apiCall) async {
  try {
    final response = await apiCall();
    return response.data;
  } catch (_) {
    return null;
  }
}
```

## write compute funtion to parse JSON

```dart
Future<User> parseUser(String jsonStr){
   return compute(_parse, jsonStr);
}

User _parse(String jsonStr){
   final map = jsonDecode(jsonStr);
   return User.fromJson(map);
}
```

## what is Microtask in flutter

a Microtask is a task that is scheduled to run before the next event in the event queue. It runs as soon as the current synchronous code finishes, but before timers, UI events, or I/O events.

## Dart Event Loop

**Dart has two queues:**

- Microtask Queue (higher priority)
- Event Queue (lower priority)

**Execution order:**

1. Run current synchronous code
2. Execute all microtasks
3. Execute next event from event queue
4. Repeat

```dart
void main() {
  print("Start");

  scheduleMicrotask(() => print("Microtask"));

  Future(() => print("Event queue"));

  print("End");
}
```

**Output:**

Start
End
Microtask
Event queue

**Why?**

Because microtasks run before event queue tasks.

## How to Create a Microtask

1. Using scheduleMicrotask

```dart
import 'dart:async';

scheduleMicrotask(() {
  print("Microtask executed");
});
```

2. Using Future.microtask

```dart
Future.microtask(() {
  print("Microtask executed");
});
```
