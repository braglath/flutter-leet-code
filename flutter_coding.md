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