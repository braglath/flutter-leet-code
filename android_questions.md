# Android Questions

## Android activity lifecycle

onCrate, onStart, onResume, onPause, onStop, onDestroy, (onRestart)

## Activity

A single screen in android, flutter runs inside FlutterActivity

## Intent

used to navigate between activities or share data

## Permissions

Defined in AndroidManifest.xml

## Gradle

Android build system

## How do you handle ANRs on Android?

ANR = App Not Responding

**Causes:**

- Blocking main thread
- Heavy synchronous work

**Fix:**

- Move work to isolate
- Avoid synchronous disk IO
- Optimize startup time