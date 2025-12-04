# CodeQuest Google Drive Backend

This Express server accepts PDF uploads from the client and uploads them to Google Drive using a Service Account. It optionally stores metadata in Firestore (using Firebase Admin SDK).

Important: Do not commit service account credentials to the repository. Use environment variables or secure secrets management.

## Setup

1. Create a Google Cloud Service Account with the Drive API enabled. Grant `role/owner` or appropriate role.
2. Create a JSON key and save it securely locally. Do NOT commit it to the repo.
3. (Optional) Create a Firebase service account or reuse the same credentials for Firestore writes.
4. Install dependencies:

```bash
cd backend/server
npm install
```

5. Set the environment variable to point to the service account JSON (or copy it to `backend/server/service-account.json` for local testing):

```bash
# Windows PowerShell
$env:GOOGLE_APPLICATION_CREDENTIALS = 'C:\path\to\service-account.json'

# Linux/Mac
export GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account.json
```

6. Start the server:

```bash
npm start
```

7. Call the endpoint `POST /api/upload-pdf` with `multipart/form-data` with fields:
  - `file`: PDF file
  - `moduleId`: module id string

Response will include `fileId` and `webViewLink`.

## Avatar upload endpoint

POST `/api/upload-avatar` accepts `multipart/form-data`:
- `file`: image file (png/jpg)
- `userId`: the user's ID

The upload will store the file in Google Drive and update the user's Firestore `avatarUrl` field with the public link if Firestore is initialized via Firebase Admin.

## 📱 6. How to Connect it to Flutter

There are two ways to upload files from a Flutter app:

Option 1 — Call the backend server (recommended)
- Use the Express endpoint (`/api/upload-pdf` and `/api/upload-avatar`) to POST multipart form-data.
- This avoids storing credentials on the client and keeps your Drive credentials server-side.

Flutter example (using `http` package):

```dart
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

Future<Map<String, dynamic>> uploadPdfToServer(File pdf, String moduleId) async {
  final uri = Uri.parse('http://<server-host>:3000/api/upload-pdf');
  final request = http.MultipartRequest('POST', uri);
  request.fields['moduleId'] = moduleId;
  request.files.add(await http.MultipartFile.fromPath('file', pdf.path, contentType: MediaType('application', 'pdf')));
  final streamed = await request.send();
  final response = await http.Response.fromStream(streamed);
  if (response.statusCode == 200) return json.decode(response.body) as Map<String, dynamic>;
  throw Exception('Upload failed: ${response.statusCode} ${response.body}');
}
```

Option 2 — Direct Google Drive API (client-side)
- Requires using OAuth2 and asking the user to grant permissions to their Drive account.
- Use this if you want the file to be uploaded into the user's Drive instead of an application-owned Drive.

Add the following packages to your Flutter `pubspec.yaml`:
- `googleapis`
- `googleapis_auth`

Example (user consent flow):

```dart
import 'package:googleapis_auth/googleapis_auth.dart' as auth;
import 'package:googleapis/drive/v3.dart' as drive;

final clientId = auth.ClientId('<YOUR_CLIENT_ID>', '');
final scopes = [drive.DriveApi.driveFileScope];

final client = await auth.clientViaUserConsent(clientId, scopes, (url) async {
  // Open this URL in a browser or WebView for the user to grant consent
  print('Please open this URL: $url');
});

final driveApi = drive.DriveApi(client);

// list files example
final files = await driveApi.files.list(q: "'FOLDER_ID' in parents");
print(files.files);

// upload example
final media = drive.Media(File('module1.pdf').openRead(), File('module1.pdf').lengthSync(), contentType: 'application/pdf');
final driveFile = drive.File()..name = 'module1.pdf';
final result = await driveApi.files.create(driveFile, uploadMedia: media);
print(result);
```

Note on where to put credentials: this flow requires a web/desktop OAuth client ID in the Google Cloud Console. Use server-side flow if you want app-owned Drive uploads.


## Security

- Consider creating a restricted service account that has limited drive/file permissions and uses a specific drive or shared drive.
- Optionally set `drive.permissions.create` role to restrict access.
- Protect the upload endpoint with authentication (e.g. a shared API key or Firebase Auth token). This sample does not implement auth.
