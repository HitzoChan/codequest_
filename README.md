# CodeQuest Educational App

A Flutter-based educational mobile application for learning Mobile App Development with gamification features.

## 🎨 Design

The app features a modern, clean UI with:
- **Main Theme Color**: RGB(52, 141, 188) - A professional blue tone
- **Gradient Backgrounds**: Smooth blue gradients for visual appeal
- **Rounded Containers**: Modern card-based design
- **Responsive Layout**: Works on various screen sizes

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio (recommended IDEs)

### Installation

1. **Clone or navigate to the project directory**
   ```bash
   cd codequest_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

   Or for specific platforms:
   ```bash
   # For Android
   flutter run -d android
   
   # For iOS
   flutter run -d ios
   
   # For Web
   flutter run -d chrome
   ```

## 📱 Features Implemented (UI Only)

### Login Screen
- ✅ University and Department logo placeholders
- ✅ Email and password input fields with icons
- ✅ Password visibility toggle
- ✅ Forgot password link
- ✅ Gradient login button
- ✅ Google sign-in button
- ✅ Sign-up navigation link
- ✅ Responsive design with gradient background

### Custom Widgets
- ✅ `CustomTextField` - Reusable text input with icons
- ✅ `GradientButton` - Styled button with gradient background

## 🎯 Screens to be Implemented

Based on the Figma designs provided:

1. **Home Screen** - Dashboard with user stats, continue lesson, and quick access
2. **Profile Screen** - User profile with XP, badges, day streak, and settings
3. **Progress Screen** - Weekly XP chart, module completion, achievements
4. **Modules Screen** - List of learning modules with difficulty levels and progress
5. **Quiz Screen** - Interactive quizzes for each module
6. **Settings Screen** - App preferences and account settings

## 📂 Project Structure

```
codequest_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── screens/
│   │   └── login_screen.dart     # Login page UI
│   └── widgets/
│       ├── custom_text_field.dart # Reusable text input
│       └── gradient_button.dart   # Reusable gradient button
├── assets/
│   └── images/                   # Logo and image assets
├── BACKEND_TODO.md               # Comprehensive backend implementation guide
└── README.md                     # This file
```

## 🎨 Customizing Logos

To add your university and department logos:

1. Place your logo images in `assets/images/` directory:
   - `university_logo.png` - Your university logo
   - `department_logo.png` - Your department logo

2. Update `pubspec.yaml` to include the assets:
   ```yaml
   flutter:
     assets:
       - assets/images/university_logo.png
       - assets/images/department_logo.png
   ```

3. Update the logo containers in `lib/screens/login_screen.dart`:
   ```dart
   // Replace the Icon widget with Image.asset
   Image.asset(
     'assets/images/university_logo.png',
     width: 60,
     height: 60,
   )
   ```

## 🔧 Configuration

### Theme Colors

The main theme color is defined in `lib/main.dart`:
```dart
primaryColor: const Color.fromRGBO(52, 141, 188, 1)
```

You can customize other colors in the theme as needed.

## 📋 Backend Implementation

See [BACKEND_TODO.md](BACKEND_TODO.md) for a comprehensive guide on implementing the backend features including:
- Authentication system
- User management
- Progress tracking
- Quiz system
- Gamification features
- Database design
- API endpoints
- And much more!

## 🛠️ Development Roadmap

### Phase 1: UI Implementation (Current)
- [x] Login screen
- [ ] Home screen
- [ ] Profile screen
- [ ] Progress screen
- [ ] Modules screen
- [ ] Quiz screen

### Phase 2: Backend Integration
- [ ] Set up Firebase/Backend
- [ ] Implement authentication
- [ ] Connect APIs
- [ ] Add state management

### Phase 3: Features
- [ ] Progress tracking
- [ ] Quiz functionality
- [ ] Gamification (XP, badges, streaks)
- [ ] Notifications

### Phase 4: Polish
- [ ] Animations
- [ ] Error handling
- [ ] Testing
- [ ] Performance optimization

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📱 Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

1. Create a new branch for your feature
2. Make your changes
3. Test thoroughly
4. Submit a pull request

## 📄 License

This project is created for educational purposes.

## 📞 Support

For questions or issues, please refer to the Flutter documentation:
- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)

---

**Note**: This is currently a UI-only implementation. Backend functionality needs to be implemented according to the BACKEND_TODO.md guide.
