const express = require('express');
const cors = require('cors');
const multer = require('multer');
const fs = require('fs');
const {google} = require('googleapis');
const admin = require('firebase-admin');

// Load service account key path via env var: GOOGLE_APPLICATION_CREDENTIALS or a path
const serviceAccountPath = process.env.GOOGLE_APPLICATION_CREDENTIALS || './service-account.json';

// Initialize Firebase Admin if you want to record file metadata
if (fs.existsSync(serviceAccountPath)) {
  admin.initializeApp({
    credential: admin.credential.cert(require(serviceAccountPath))
  });
}

const driveAuth = new google.auth.GoogleAuth({
  keyFile: serviceAccountPath,
  scopes: ['https://www.googleapis.com/auth/drive.file']
});

const upload = multer({ dest: 'uploads/' });
const app = express();
app.use(cors());
app.use(express.json());

// POST /api/upload-pdf
// form-data: file (pdf), moduleId
app.post('/api/upload-pdf', upload.single('file'), async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({error: 'No file uploaded'});
    }

    const moduleId = req.body.moduleId || 'module';
    const fileName = req.file.originalname || `${moduleId}.pdf`;

    // Create an authenticated client
    const authClient = await driveAuth.getClient();
    const drive = google.drive({ version: 'v3', auth: authClient });

    const filePath = req.file.path;

    // Upload to Drive
    const fileMetadata = { name: fileName };
    const media = {
      mimeType: 'application/pdf',
      body: fs.createReadStream(filePath),
    };

    const response = await drive.files.create({
      resource: fileMetadata,
      media: media,
      fields: 'id, name, webViewLink, webContentLink'
    });

    // Optionally set public access (careful with privacy)
    try {
      await drive.permissions.create({
        fileId: response.data.id,
        requestBody: {
          role: 'reader',
          type: 'anyone'
        }
      });
    } catch (e) {
      console.warn('Failed to set file sharing', e.message);
    }

    // Store metadata in Firestore if admin initialized
    if (admin.apps.length > 0) {
      const db = admin.firestore();
      const metadata = {
        moduleId,
        driveFileId: response.data.id,
        name: response.data.name,
        webViewLink: response.data.webViewLink || null,
        uploadedAt: admin.firestore.FieldValue.serverTimestamp(),
      };
      await db.collection('module_pdfs').add(metadata);
    }

    // Clean up local file
    fs.unlinkSync(filePath);

    res.json({
      success: true,
      fileId: response.data.id,
      webViewLink: response.data.webViewLink || null,
      webContentLink: response.data.webContentLink || null
    });
  } catch (err) {
    console.error('Upload failed', err);
    res.status(500).json({ error: err.message });
  }
});

// POST /api/upload-avatar
// form-data: file (image), userId
app.post('/api/upload-avatar', upload.single('file'), async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ error: 'No file uploaded' });
    }

    const userId = req.body.userId || 'unknown';
    const fileName = req.file.originalname || `${userId}-avatar.png`;

    const authClient = await driveAuth.getClient();
    const drive = google.drive({ version: 'v3', auth: authClient });
    const filePath = req.file.path;

    const fileMetadata = { name: fileName };
    const media = {
      mimeType: req.file.mimetype || 'image/png',
      body: fs.createReadStream(filePath),
    };

    const response = await drive.files.create({
      resource: fileMetadata,
      media: media,
      fields: 'id, name, webViewLink, webContentLink'
    });

    // Make public (if needed); consider using signed URLs or more secure access
    try {
      await drive.permissions.create({
        fileId: response.data.id,
        requestBody: { role: 'reader', type: 'anyone' },
      });
    } catch (e) {
      console.warn('Failed setting permissions', e.message);
    }

    // Update user profile in Firestore if Admin initialized
    if (admin.apps.length > 0) {
      const db = admin.firestore();
      const doc = db.collection('users').doc(userId);
      await doc.set({ avatarUrl: response.data.webContentLink || response.data.webViewLink || null }, { merge: true });
    }

    fs.unlinkSync(filePath);

    res.json({
      success: true,
      fileId: response.data.id,
      webViewLink: response.data.webViewLink || null,
      webContentLink: response.data.webContentLink || null,
    });
  } catch (err) {
    console.error('Upload avatar failed', err);
    res.status(500).json({ error: err.message });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Drive backend listening on ${PORT}`);
});
