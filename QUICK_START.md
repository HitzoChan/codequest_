# Quick Start Guide - CodeQuest App

## 🚀 Running the App

### Step 1: Navigate to Project Directory
```bash
cd codequest_app
```

### Step 2: Get Dependencies
```bash
flutter pub get
```

### Step 3: Run the App
```bash
flutter run
```

Or select a specific device:
```bash
# For Chrome (Web)
flutter run -d chrome

# For Android Emulator
flutter run -d android

# For iOS Simulator (Mac only)
flutter run -d ios
```

## 📱 What You'll See

The app will launch with a beautiful **Login Screen** featuring:
- 🎓 Two logo placeholders (university and department)
- 📧 Email input field
- 🔒 Password input field with visibility toggle
- 🔗 "Forgot Password?" link
- 🔵 Gradient "Login" button
- 🌐 "Continue with Google" button
- ✍️ "Sign Up" link

## 🎨 Current Features

### ✅ Implemented (UI Only)
- Login screen with complete UI
- Custom text fields with icons
- Gradient buttons
- Responsive layout
- Theme color: RGB(52, 141, 188)

### 🔄 To Be Implemented
- Home screen
- Profile screen
- Progress screen
- Modules screen
- Quiz functionality
- Backend integration (see BACKEND_TODO.md)

## 🖼️ Adding Your Logos

1. Place your logo images in `assets/images/`:
   - `university_logo.png`
   - `department_logo.png`

2. Update `lib/screens/login_screen.dart` (lines with Icon widgets):
   ```dart
   // Replace Icon widget with:
   Image.asset(
     'assets/images/university_logo.png',
     width: 60,
     height: 60,
   )
   ```

3. Run `flutter pub get` and restart the app

## 🛠️ Troubleshooting

### Issue: "No devices found"
**Solution**: 
- For web: Make sure Chrome is installed
- For mobile: Start an emulator/simulator first
- Run `flutter devices` to see available devices

### Issue: "Package not found"
**Solution**: 
```bash
flutter pub get
flutter clean
flutter pub get
```

### Issue: "SDK version error"
**Solution**: 
- Check your Flutter version: `flutter --version`
- Upgrade if needed: `flutter upgrade`

## 📚 Next Steps

1. **Explore the Code**
   - Check `lib/screens/login_screen.dart` for the login UI
   - Review `lib/widgets/` for reusable components
   - Look at `lib/main.dart` for app configuration

2. **Implement More Screens**
   - Create home_screen.dart
   - Create profile_screen.dart
   - Create modules_screen.dart
   - Add navigation between screens

3. **Backend Integration**
   - Follow the comprehensive guide in `BACKEND_TODO.md`
   - Set up Firebase or your preferred backend
   - Implement authentication
   - Connect APIs

4. **Testing**
   - Run tests: `flutter test`
   - Add more test cases
   - Test on different devices

## 🎯 Development Tips

- Use hot reload: Press `r` in terminal while app is running
- Use hot restart: Press `R` in terminal
- Check for errors: `flutter analyze`
- Format code: `flutter format .`

## 📖 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)
- [Material Design Guidelines](https://material.io/design)

## 💡 Pro Tips

1. **State Management**: Consider using Provider, Riverpod, or Bloc for state management
2. **Navigation**: Use named routes for better organization
3. **API Calls**: Use Dio or http package for API integration
4. **Local Storage**: Use shared_preferences or secure_storage for data persistence
5. **Animations**: Add subtle animations for better UX

---

Happy Coding! 🚀
