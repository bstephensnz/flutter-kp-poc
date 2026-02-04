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

## Detailed iOS Setup & Testing Guide
If you are setting this up on a Mac for the first time to test on an iPhone/iPad, follow these steps.

### Step 1 — Install tooling (15–20 mins)
**On the Mac:**
1. Install **Xcode** from the App Store.
2. Install **Flutter SDK**.
3. (Optional) Install Android Studio (not required for iOS).

Then run:
```bash
flutter doctor
```
*Ignore Android warnings. iOS should go green once Xcode is installed.*

### Step 2 — Sign into Xcode with your Apple ID (free)
1. Open **Xcode**.
2. Go to **Settings → Accounts**.
3. Add your **Apple ID** (No enrolment required).

*This enables free development signing and USB deployment.*

### Step 3 — Open the Flutter iOS project
```bash
cd your-repo
flutter pub get
open ios/Runner.xcworkspace
```

**In Xcode:**
1. Select **Runner** in the project navigator.
2. Go to **Signing & Capabilities**.
3. **Team**: Select your Apple ID.
4. **Bundle ID**: Leave as-is unless it clashes.
*Xcode will auto-create a temporary provisioning profile.*

### Step 4 — Plug in your iPhone / iPad
1. Cable connect your device to the Mac.
2. **Trust** the Mac on the device if prompted.
3. Select your device in Xcode or verify via:
   ```bash
   flutter devices
   ```

### Step 5 — Run the app on device
From terminal (simplest):
```bash
flutter run
```
Or press ▶️ in Xcode.
*App installs directly to your phone.*

### Step 6 — Bluetooth HID testing (the important part)
**Pairing:**
1. On iPhone / iPad, go to **Settings → Bluetooth**.
2. Pair your HID device.
   > ⚠️ **Important**: Pair outside the app first (system-level pairing).
3. Open the app and ensure it has focus to receive key events.
