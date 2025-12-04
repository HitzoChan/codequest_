# CodeQuest Backend Implementation TODO List

This document outlines the backend features and implementation steps needed for the CodeQuest Educational App.

## 🔐 Authentication & User Management

### 1. User Authentication System
- [ ] Set up Firebase Authentication or custom backend authentication
- [ ] Implement email/password registration
- [ ] Implement email/password login
- [ ] Implement Google OAuth sign-in
- [ ] Add password reset/forgot password functionality
- [ ] Implement email verification for new accounts
- [ ] Add session management and token refresh
- [ ] Implement secure logout functionality

### 2. User Profile Management
- [x] Create user profile database schema
- [x] Implement profile creation on first login
- [x] Add profile update API (name, email, avatar)
- [x] Store user preferences (notifications, sound effects, dark mode)
- [x] Implement profile picture upload and storage — server-side Google Drive upload endpoint implemented (`/api/upload-avatar`), client integration required
- [x] Add user level and XP tracking

## 📚 Learning Content Management

### 3. Course/Module System
- [ ] Design database schema for courses and modules
- [ ] Create API endpoints for fetching course list
- [ ] Implement module content delivery (text, video, code examples)
- [ ] Add module difficulty levels (Beginner, Intermediate, Advanced)
- [ ] Track module enrollment and completion status
- [ ] Implement module prerequisites and learning paths
- [ ] Add search and filter functionality for modules

### 4. Progress Tracking
- [ ] Create progress tracking database schema
- [ ] Implement XP (Experience Points) calculation system
- [ ] Track modules completed per user
- [ ] Calculate and store average quiz scores
- [ ] Track total study time per user
- [ ] Implement weekly XP tracking and statistics
- [ ] Add progress percentage calculations
- [ ] Create API for fetching user progress data

## 🎯 Gamification Features

### 5. Achievements & Badges System
- [ ] Design achievement/badge database schema
- [ ] Define achievement criteria (First Steps, Quiz Master, Week Warrior, etc.)
- [ ] Implement achievement unlock logic
- [ ] Create API for fetching user achievements
- [ ] Add achievement notifications
- [ ] Track locked vs unlocked achievements

### 6. Streak System
- [ ] Implement daily streak tracking
- [ ] Create streak calculation logic
- [ ] Add streak reset on missed days
- [ ] Implement streak notifications/reminders
- [ ] Store streak history

### 1. User Authentication System
- [x] Set up Firebase Authentication (see `main.dart` & Firebase initialization) — client-side implemented
- [x] Implement email/password registration (`lib/screens/sign_up_screen.dart`)
- [x] Implement email/password login (`lib/screens/login_screen.dart`)
- [x] Implement Google OAuth sign-in (`lib/screens/login_screen.dart`) *client-side*
- [x] Add password reset/forgot password functionality (`lib/screens/login_screen.dart`)
- [ ] Implement email verification for new accounts (not implemented)
- [x] Add session management and token refresh (handled by Firebase SDK; used in app)
- [x] Implement secure logout functionality (`lib/screens/profile_screen.dart`)
  - Maintaining streaks
### 2. User Profile Management
- [x] Create user profile database schema (using Firestore `users` documents; see `lib/backend/firestore_service.dart` and `lib/screens/profile_screen.dart`)
- [x] Implement profile creation on first login (Sign up writes the `users` doc; see `lib/screens/sign_up_screen.dart`)
- [x] Add profile update API (name, email, avatar) — implemented server-side wrapper functions (`lib/backend/firestore_service.dart`), UI update endpoint not yet connected
- [ ] Store user preferences (notifications, sound effects, dark mode) — UI toggles exist in `profile_screen.dart` but persistence is not implemented
- [ ] Implement profile picture upload and storage — not implemented yet
- [x] Add user level and XP tracking (partially: XP stored & incremented; leveling logic not implemented) — see `lib/backend/firestore_service.dart` and `course_module_management.dart`
- [ ] Create API for fetching quiz questions
### 3. Course/Module System
- [x] Design database schema for courses and modules (implemented with `Course`/`Module` model and `toMap`/`fromMap` methods in `lib/backend/course_module_management.dart`)
- [x] Create API endpoints for fetching course list (in-app API: `CourseModuleAPI.getCourses()` and `fetchCourses()`; `lib/backend/course_module_api.dart`)
- [x] Implement module content delivery (text, video, code examples) — see `lib/screens/module_detail_screen.dart` showing YouTube player, summary, and content -> PDF
- [x] Add module difficulty levels — added to Module model and UI filtering (`modules_screen.dart`)
- [x] Track module enrollment and completion status (in-memory + Firestore persistence via `firestore_service.dart` and `CourseModuleService.enrollUser`/`completeModule`)
- [ ] Implement module prerequisites and learning paths (not implemented yet)
- [x] Add search and filter functionality for modules (`lib/screens/modules_screen.dart`)
- [ ] Track time spent on each module
### 4. Progress Tracking
- [x] Create progress tracking database schema (Firestore `user_progress` collection used in `lib/backend/firestore_service.dart`)
- [x] Implement XP (Experience Points) increment on module completion (`incrementUserXp` in `firestore_service.dart`)
- [x] Track modules completed per user (`user_progress` doc with `status: 'completed'`)
- [ ] Calculate and store average quiz scores (not implemented)
- [ ] Track total study time per user (not implemented)
- [ ] Implement weekly XP tracking and statistics (not implemented)
- [x] Add progress percentage calculations (we set completionPercentage to 100 for completed modules; finer-grained calculations not implemented)
- [ ] Create API for fetching user progress data (read methods exist for user profile; explicit progress listing API is not yet implemented)
- [ ] Implement notification preferences storage
### 8. Quiz Management
- [x] Design quiz data object (client-side `lib/backend/quiz_data.dart` + `QuizScreen`) — server schema not yet implemented
- [x] Create API for fetching quiz questions (client-side: `QuizScreen` uses `SqlIntroQuiz.questions`; `CourseModuleAPI.getQuizForModule` returns static map for seed module)
- [x] Implement quiz submission and grading (client-side grading performed in `lib/screens/quiz_screen.dart`)
- [ ] Track quiz attempts and scores in database (not implemented)
- [ ] Calculate and store quiz statistics (not implemented)
- [ ] Add quiz time limits (optional) (not implemented)
- [x] Implement multiple-choice question type (implemented in `QuizScreen`)

### 11. Activity Feed
- [ ] Create recent activity tracking
  - Streaks maintained
#### User_Preferences Table
```
- user_id (foreign key)
- notifications_enabled
- sound_effects_enabled
- dark_mode_enabled
```
  - Module completions

- email
#### Quiz_Attempts Table
```
- attempt_id (primary key)
- user_id (foreign key)
- quiz_id (foreign key)
- score
- passed
- time_taken
- attempted_at
```
- password_hash
### 15. API Integration in Flutter
- [ ] Set up HTTP client (Dio/http package) — Not implemented
- [x] Implement API service layer (In-app `CourseModuleAPI` and `FirestoreService` wrappers)
- [ ] Add error handling and retry logic (partially implemented in `profile_screen` and other UI components)
- [ ] Implement token storage (secure_storage) — not implemented
- [ ] Add offline data caching — not implemented
- [ ] Implement state management (Provider/Riverpod/Bloc) — not implemented (app uses basic setState)
- [x] Add loading states and error handling UI (Progress indicators & basic error SnackBars exist in several screens)
- updated_at
```

#### User_Preferences Table
```
- user_id (foreign key)
- notifications_enabled
- sound_effects_enabled
- dark_mode_enabled
```

#### Modules Table
```
- module_id (primary key)
- title
- description
- difficulty_level
- xp_reward
- estimated_time
- content_url
- order_index
- created_at
```

#### User_Progress Table
```
- progress_id (primary key)
- user_id (foreign key)
- module_id (foreign key)
- status (enrolled, in_progress, completed)
- completion_percentage
- time_spent
- started_at
- completed_at
```

#### Quizzes Table
```
- quiz_id (primary key)
- module_id (foreign key)
- title
- passing_score
- time_limit
```

#### Quiz_Questions Table
```
- question_id (primary key)
- quiz_id (foreign key)
- question_text
- question_type
- options (JSON)
- correct_answer
- points
```

#### Quiz_Attempts Table
```
- attempt_id (primary key)
- user_id (foreign key)
- quiz_id (foreign key)
- score
- passed
- time_taken
- attempted_at
```

#### Achievements Table
```
- achievement_id (primary key)
- name
- description
- icon
- criteria (JSON)
```

#### User_Achievements Table
```
- user_id (foreign key)
- achievement_id (foreign key)
- unlocked_at
```

#### XP_History Table
```
- history_id (primary key)
- user_id (foreign key)
- xp_amount
- source (module_completion, quiz_pass, daily_login, etc.)
- earned_at
```

## 🔒 Security & Performance

### 13. Security Implementation
- [ ] Implement JWT token authentication
- [ ] Add rate limiting to prevent abuse
- [ ] Implement input validation and sanitization
- [ ] Add CORS configuration
- [ ] Encrypt sensitive data
- [ ] Implement secure password hashing (bcrypt/argon2)
- [ ] Add API key authentication for mobile app
- [ ] Implement role-based access control (student, instructor, admin)

### 14. Performance Optimization
- [ ] Implement database indexing
- [ ] Add caching layer (Redis) for frequently accessed data
- [ ] Optimize database queries
- [ ] Implement pagination for large data sets
- [ ] Add CDN for static content delivery
- [ ] Implement lazy loading for module content

## 🚀 API Endpoints Overview

### Authentication Endpoints
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user
- `POST /api/auth/google` - Google OAuth login
- `POST /api/auth/forgot-password` - Request password reset
- `POST /api/auth/reset-password` - Reset password
- `POST /api/auth/logout` - Logout user
- `GET /api/auth/verify-email` - Verify email address

### User Endpoints
- `GET /api/user/profile` - Get user profile
- `PUT /api/user/profile` - Update user profile
- `GET /api/user/progress` - Get user progress stats
- `GET /api/user/achievements` - Get user achievements
- `PUT /api/user/preferences` - Update user preferences

### Module Endpoints
- `GET /api/modules` - Get all modules (with filters)
- `GET /api/modules/:id` - Get specific module details
- `POST /api/modules/:id/enroll` - Enroll in module
- `PUT /api/modules/:id/progress` - Update module progress
- `POST /api/modules/:id/complete` - Mark module as complete

### Quiz Endpoints
- `GET /api/quizzes/:moduleId` - Get quiz for module
- `POST /api/quizzes/:id/submit` - Submit quiz answers
- `GET /api/quizzes/:id/results` - Get quiz results
- `GET /api/user/quiz-history` - Get user's quiz history

### Progress Endpoints
- `GET /api/progress/weekly-xp` - Get weekly XP data
- `GET /api/progress/stats` - Get learning statistics
- `GET /api/progress/recent-activity` - Get recent activities

### Notification Endpoints
- `GET /api/notifications` - Get user notifications
- `PUT /api/notifications/:id/read` - Mark notification as read
- `POST /api/notifications/register-device` - Register device for push notifications

## 🛠️ Technology Stack Recommendations

### Backend Framework Options
- **Node.js + Express** - Fast, scalable, JavaScript ecosystem
- **Python + Django/FastAPI** - Robust, great for data processing
- **Firebase** - Quick setup, managed services, real-time features

### Database Options
- **PostgreSQL** - Relational, robust, good for complex queries
- **MongoDB** - NoSQL, flexible schema, good for rapid development
- **Firebase Firestore** - Managed, real-time, easy integration

### Additional Services
- **Firebase Authentication** - Easy auth implementation
- **Firebase Cloud Messaging** - Push notifications
- **AWS S3 / Firebase Storage** - File storage for avatars, content
- **Redis** - Caching layer
- **Cloudinary** - Image optimization and delivery

## 📱 Mobile App Integration

### 15. API Integration in Flutter
- [ ] Set up HTTP client (Dio/http package)
- [ ] Implement API service layer
- [ ] Add error handling and retry logic
- [ ] Implement token storage (secure_storage)
- [ ] Add offline data caching
- [ ] Implement state management (Provider/Riverpod/Bloc)
- [ ] Add loading states and error handling UI

### 16. Real-time Features
- [ ] Implement WebSocket connection for real-time updates
- [ ] Add real-time progress synchronization
- [ ] Implement real-time notifications
- [ ] Add presence system (online/offline status)

## 🧪 Testing & Deployment

### 17. Testing
- [ ] Write unit tests for API endpoints
- [ ] Implement integration tests
- [ ] Add load testing
- [ ] Test authentication flows
- [ ] Test data validation

### 18. Deployment
- [ ] Set up CI/CD pipeline
- [ ] Configure production environment
- [ ] Set up monitoring and logging
- [ ] Implement backup strategy
- [ ] Configure auto-scaling
- [ ] Set up error tracking (Sentry)

## 📊 Analytics & Monitoring

### 19. Analytics Implementation
- [ ] Integrate analytics service (Google Analytics, Mixpanel)
- [ ] Track user engagement metrics
- [ ] Monitor API performance
- [ ] Track feature usage
- [ ] Generate reports for insights

## 🔄 Future Enhancements

### 20. Advanced Features (Phase 2)
- [ ] Social features (friends, leaderboards)
- [ ] Discussion forums for modules
- [ ] Live coding challenges
- [ ] Video content streaming
- [ ] Certificate generation on course completion
- [ ] Instructor dashboard
- [ ] Content management system for admins
- [ ] Multi-language support
- [ ] Offline mode with sync

---

## Priority Order

### Phase 1 (MVP - Minimum Viable Product)
1. Authentication system (email/password, Google OAuth)
2. User profile management
3. Module content delivery
4. Basic progress tracking
5. Quiz system
6. XP and level system

### Phase 2 (Core Features)
1. Achievement system
2. Streak tracking
3. Notifications
4. Weekly statistics
5. Recent activity feed

### Phase 3 (Enhancement)
1. Advanced analytics
2. Performance optimization
3. Real-time features
4. Social features

---

## Estimated Timeline

- **Phase 1 (MVP)**: 6-8 weeks
- **Phase 2 (Core Features)**: 4-6 weeks
- **Phase 3 (Enhancement)**: 4-6 weeks

**Total Estimated Time**: 14-20 weeks for full implementation

---

## Notes

- Start with Firebase for rapid development, can migrate to custom backend later
- Prioritize security from the beginning
- Implement proper error handling and logging
- Keep API documentation updated (use Swagger/OpenAPI)
- Regular backups are crucial
- Monitor performance metrics continuously
