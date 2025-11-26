import 'package:flutter/material.dart';

class UserProfile {
  final String userId;
  String name;
  String email;
  String? avatarUrl;
  int level;
  int xp;
  Map<String, bool> preferences;

  UserProfile({
    required this.userId,
    required this.name,
    required this.email,
    this.avatarUrl,
    this.level = 1,
    this.xp = 0,
    Map<String, bool>? preferences,
  }) : preferences = preferences ?? {
          'notifications': true,
          'soundEffects': true,
          'darkMode': false,
        };

  void updateProfile({String? name, String? email, String? avatarUrl}) {
    if (name != null) this.name = name;
    if (email != null) this.email = email;
    if (avatarUrl != null) this.avatarUrl = avatarUrl;
  }

  void updatePreferences(Map<String, bool> newPrefs) {
    preferences.addAll(newPrefs);
  }

  void addXp(int amount) {
    xp += amount;
    level = (xp ~/ 1000) + 1;
  }
}

class UserProfileService extends ChangeNotifier {
  final Map<String, UserProfile> _userProfiles = {};

  UserProfile createProfile(String userId, String name, String email) {
    if (_userProfiles.containsKey(userId)) {
      return _userProfiles[userId]!;
    }
    final newProfile = UserProfile(userId: userId, name: name, email: email);
    _userProfiles[userId] = newProfile;
    notifyListeners();
    return newProfile;
  }

  UserProfile? getProfile(String userId) {
    return _userProfiles[userId];
  }

  void updateProfile(String userId, {String? name, String? email, String? avatarUrl}) {
    final profile = _userProfiles[userId];
    if (profile != null) {
      profile.updateProfile(name: name, email: email, avatarUrl: avatarUrl);
      notifyListeners();
    }
  }

  void updatePreferences(String userId, Map<String, bool> newPrefs) {
    final profile = _userProfiles[userId];
    if (profile != null) {
      profile.updatePreferences(newPrefs);
      notifyListeners();
    }
  }

  void addXp(String userId, int amount) {
    final profile = _userProfiles[userId];
    if (profile != null) {
      profile.addXp(amount);
      notifyListeners();
    }
  }

  // Added uploadAvatar method to fix compile error
  void uploadAvatar(String userId, String avatarUrl) {
    final profile = _userProfiles[userId];
    if (profile != null) {
      profile.avatarUrl = avatarUrl;
      notifyListeners();
    }
  }
}
