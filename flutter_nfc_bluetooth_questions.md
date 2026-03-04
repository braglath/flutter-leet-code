# Flutter based NFC bluetooth questions

## Flutter with NFC – How it Works

Flutter communicates with NFC hardware using platform channels or plugins.
Common plugin:
nfc_manager

**How NFC Works (Concept):**

- Phone has NFC chip
- Tag emits radio signal
- Device reads tag UID or NDEF data
- App processes it

```dart
NfcManager.instance.startSession(
  onDiscovered: (NfcTag tag) async {
    print(tag.data);
    NfcManager.instance.stopSession();
  },
);
<uses-permission android:name="android.permission.NFC" />
```

**Important Points:**

- NFC works only on physical device
- Requires foreground dispatch system
- Can read/write NDEF messages
- Security: Use encryption for sensitive data

## How would you architect a Flutter app for smart lock access control?

For a smart access control app, I would follow a modular Clean Architecture:

- Presentation Layer → Flutter UI + Riverpod
- Domain Layer → Use cases (UnlockDoor, SyncKeys, RegisterDevice)
- Data Layer → Repository abstractions
- Infrastructure Layer → BLE/NFC services + REST APIs

I also would:

- Separate device communication (BLE/NFC) into isolated services
- Add offline capability with local cache (Drift/Isar)
- Implement strong encryption for key exchange
- Add retry + fallback mechanisms for device failures
- I would also isolate hardware communication logic so we can swap BLE/NFC implementation without touching domain logic.

## How would you secure communication between app and smart lock?

Since this is a physical access system, security is critical.
I would implement:

- Mutual authentication
- Token-based short-lived credentials
- AES encryption for BLE payload
- Certificate pinning for backend APIs
- Device binding per user
- Also Store sensitive keys in secure storage (Keystore/Keychain)
- Never store raw credentials locally

## Unlock Flow for Smart Lock

- API validate access
- BLE connect
- Send unlock command
- wait for acknowledgement
- timeout handling

```dart
enum UnlockState {
  idle,
  validating,
  connecting,
  unlocking,
  success,
  failure
}

```

## How Bluetooth Device Communicates with Flutter

Flutter does NOT directly talk to Bluetooth hardware.

It uses plugins like:

- flutter_blue_plus
- flutter_reactive_ble

Communication flow:
Flutter → Platform Channel → Native Android/iOS → Bluetooth Stack → Device

## Security Measures in Bluetooth Devices (Smart Lock Level Answer)

**Secure Access Systems:**

- BLE pairing + bonding
- AES encrypted payload
- Device authentication challenge-response
- Rolling keys / session keys
- Certificate-based auth
- Firmware validation
- Timeout auto-disconnect
- Prevent replay attacks

**For smart locks:**

- Never send plain unlock command
- Use nonce-based encryption
