# King Pong PoC

A Proof-of-Concept Flutter application to valid HID (Keyboard) input from Bluetooth clickers/remotes on iOS, Android, and Web.

## Prerequisites
- Flutter SDK (Latest Stable)
- iOS / Android Simulator or Device
- Chrome (for Web debugging)

## Getting Started

### 1. Developer Mode
Run the app using the dev configurations:
```bash
flutter run -t lib/bootstrap/main_dev.dart
```

### 2. Experience Modes
Test the "Fun" vs "Club" config stubs:
```bash
flutter run -t lib/bootstrap/main_fun.dart
flutter run -t lib/bootstrap/main_club.dart
```

## HID Input Testing
This specific PoC is designed to capture keyboard events without a visible text field.

1. **Pair your Bluetooth Clicker/Remote** to your device.
2. Launch the app.
3. Ensure the **Focus** indicator says "Active" (Green).
    - If not, tap the "Refocus" button or anywhere on the screen.
4. Press buttons on your remote.
5. Verify:
    - The "Last Pressed" section updates.
    - The event log below adds a new entry.
    - The `Logical Key` and `Physical Key` data is populated.

### Caveats
- **iOS**: The app *must* have focus. Some clickers behave as "media keys" which might not trigger standard key events unless mapped. standard "Enter/Space/Arrow" clickers should work.
- **Web**: Browser security requires the window to be focused to receive key events.
