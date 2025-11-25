# Assets Directory

This directory contains image assets for the CodeQuest app.

## Required Logo Files

Please add the following logo files to this directory:

1. **university_logo.png** - Your university's official logo
   - Recommended size: 512x512 pixels
   - Format: PNG with transparent background
   - Used on: Login screen (top left)

2. **department_logo.png** - Your department's official logo
   - Recommended size: 512x512 pixels
   - Format: PNG with transparent background
   - Used on: Login screen (top right)

## How to Add Logos

1. Save your logo files in this directory with the exact names above
2. Run `flutter pub get` to refresh assets
3. The logos will automatically appear on the login screen

## Current Status

Currently, the app uses placeholder icons (school and computer icons) for the logos. Replace these with your actual logos by:

1. Adding the image files to this directory
2. Updating the login screen code in `lib/screens/login_screen.dart` to use `Image.asset()` instead of `Icon()`

Example code to replace in login_screen.dart:

```dart
// Replace this:
Icon(
  Icons.school,
  size: 50,
  color: Color.fromRGBO(52, 141, 188, 1),
)

// With this:
Image.asset(
  'assets/images/university_logo.png',
  width: 60,
  height: 60,
  fit: BoxFit.contain,
)
```

## Additional Assets

You can also add other image assets here such as:
- App icon
- Splash screen images
- Achievement badge icons
- Module thumbnails
- User avatar placeholders

Make sure to update `pubspec.yaml` if you add new asset directories.
