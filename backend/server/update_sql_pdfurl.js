const admin = require('firebase-admin');
const fs = require('fs');

// Initialize Firebase Admin
const serviceAccountPath = process.env.GOOGLE_APPLICATION_CREDENTIALS || './service-account.json';

if (!fs.existsSync(serviceAccountPath)) {
  console.error('ERROR: service-account.json not found!');
  console.error('Place your Firebase service account key at:', serviceAccountPath);
  process.exit(1);
}

admin.initializeApp({
  credential: admin.credential.cert(require(serviceAccountPath))
});

const db = admin.firestore();

async function updateSqlModulePdfUrl() {
  console.log('=== Updating SQL Module pdfUrl in Firestore ===\n');
  
  try {
    // Get the course document
    const coursesSnapshot = await db.collection('courses').get();
    console.log(`Found ${coursesSnapshot.size} courses in Firestore`);
    
    for (const courseDoc of coursesSnapshot.docs) {
      console.log(`\nCourse: ${courseDoc.id}`);
      const courseData = courseDoc.data();
      const modules = courseData.modules || [];
      
      let updated = false;
      const updatedModules = modules.map(module => {
        console.log(`  Module: ${module.moduleId} - pdfUrl: ${module.pdfUrl || 'NULL'}`);
        
        if (module.moduleId === 'sql_intro_01') {
          console.log(`  -> Updating SQL module pdfUrl`);
          updated = true;
          return {
            ...module,
            pdfUrl: 'https://drive.google.com/uc?export=download&id=1PJB_RGym9HPHDThWpCACGteyVh8gDMpO'
          };
        }
        return module;
      });
      
      if (updated) {
        await courseDoc.ref.update({ modules: updatedModules });
        console.log(`  ✓ Course ${courseDoc.id} updated successfully`);
      } else {
        console.log(`  No SQL module found in this course`);
      }
    }
    
    console.log('\n=== Update Complete ===');
    console.log('Please restart your Flutter app to see the changes.');
    
    // Verify the update
    console.log('\n=== Verifying Update ===');
    const verifySnapshot = await db.collection('courses').get();
    for (const courseDoc of verifySnapshot.docs) {
      const courseData = courseDoc.data();
      const modules = courseData.modules || [];
      
      modules.forEach(module => {
        if (module.moduleId === 'sql_intro_01') {
          console.log(`SQL Module pdfUrl: ${module.pdfUrl}`);
        }
      });
    }
    
  } catch (error) {
    console.error('ERROR:', error);
  } finally {
    process.exit(0);
  }
}

updateSqlModulePdfUrl();
