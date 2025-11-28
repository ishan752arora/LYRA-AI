# 🔨 Build Instructions for Lyra Voice Assistant

## Quick Start (Windows)

### Method 1: Using Android Studio (Recommended)

1. **Install Android Studio**
   - Download from: https://developer.android.com/studio
   - Install with default settings
   - Install Android SDK (API 24-34)

2. **Open Project**
   ```cmd
   cd LyraVoiceAssistant
   ```
   - Open Android Studio
   - File → Open → Select `LyraVoiceAssistant` folder
   - Wait for Gradle sync (first time takes 5-10 minutes)

3. **Connect Device**
   - Enable Developer Options on Android phone
   - Enable USB Debugging
   - Connect via USB
   - Allow USB debugging prompt on phone

4. **Build & Install**
   - Click green "Run" button (▶️) in Android Studio
   - Or: Run → Run 'app'
   - APK will build and install automatically

### Method 2: Command Line Build

1. **Install Java JDK 17**
   - Download from: https://adoptium.net/
   - Add to PATH

2. **Build Debug APK**
   ```cmd
   cd LyraVoiceAssistant
   gradlew.bat assembleDebug
   ```

3. **Find APK**
   - Location: `app\build\outputs\apk\debug\app-debug.apk`

4. **Install on Phone**
   ```cmd
   adb install app\build\outputs\apk\debug\app-debug.apk
   ```

### Method 3: Build Release APK (For Distribution)

1. **Create Signing Key**
   ```cmd
   keytool -genkey -v -keystore lyra-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias lyra
   ```
   - Enter password (remember it!)
   - Fill in details

2. **Create keystore.properties**
   Create file: `LyraVoiceAssistant/keystore.properties`
   ```properties
   storePassword=YOUR_PASSWORD
   keyPassword=YOUR_PASSWORD
   keyAlias=lyra
   storeFile=../lyra-release-key.jks
   ```

3. **Update app/build.gradle**
   Add before `android` block:
   ```gradle
   def keystorePropertiesFile = rootProject.file("keystore.properties")
   def keystoreProperties = new Properties()
   if (keystorePropertiesFile.exists()) {
       keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
   }
   ```

   Add inside `android` block:
   ```gradle
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile file(keystoreProperties['storeFile'])
           storePassword keystoreProperties['storePassword']
       }
   }
   
   buildTypes {
       release {
           signingConfig signingConfigs.release
           minifyEnabled false
           proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
       }
   }
   ```

4. **Build Release**
   ```cmd
   gradlew.bat assembleRelease
   ```

5. **Find Release APK**
   - Location: `app\build\outputs\apk\release\app-release.apk`
   - This APK is signed and ready for distribution!

## 📱 Install APK on Phone

### Method 1: USB Cable
```cmd
adb install app\build\outputs\apk\debug\app-debug.apk
```

### Method 2: Direct Transfer
1. Copy APK to phone storage
2. Open file manager on phone
3. Tap APK file
4. Allow "Install from Unknown Sources" if prompted
5. Install

### Method 3: Share via Cloud
1. Upload APK to Google Drive/Dropbox
2. Download on phone
3. Install

## 🔍 Troubleshooting

### Gradle Sync Failed
```cmd
gradlew.bat clean
gradlew.bat build --refresh-dependencies
```

### ADB Not Found
- Install Android SDK Platform Tools
- Add to PATH: `C:\Users\YourName\AppData\Local\Android\Sdk\platform-tools`

### Build Failed - Memory Error
Edit `gradle.properties`:
```properties
org.gradle.jvmargs=-Xmx4096m -Dfile.encoding=UTF-8
```

### Permission Denied on Phone
- Go to Settings → Apps → Lyra
- Grant all permissions manually

### Voice Recognition Not Working
- Install "Google" app from Play Store
- Enable microphone permission
- Check internet connection for first setup

## 📦 APK Size Optimization

To reduce APK size, edit `app/build.gradle`:

```gradle
android {
    buildTypes {
        release {
            minifyEnabled true
            shrinkResources true
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
    
    splits {
        abi {
            enable true
            reset()
            include 'armeabi-v7a', 'arm64-v8a'
            universalApk false
        }
    }
}
```

## 🚀 Quick Test Commands

After installation, test these:

1. Open app
2. Grant all permissions
3. Say: "Lyra"
4. Wait for: "Ji boliye..."
5. Say: "flashlight on"
6. Flashlight should turn on!

## 📊 Build Variants

- **Debug**: For development, includes debugging info
- **Release**: Optimized, signed, for distribution

## 🔐 Security Notes

- Never commit `keystore.properties` to Git
- Keep `.jks` file safe (backup it!)
- Don't share your signing key

## ✅ Checklist Before Release

- [ ] Test on multiple devices
- [ ] Test all voice commands
- [ ] Test offline mode
- [ ] Check all permissions work
- [ ] Test on Android 7, 10, 13+
- [ ] Verify flashlight works
- [ ] Verify app opening works
- [ ] Test personality responses
- [ ] Check jealousy triggers
- [ ] Verify "Ji boliye" flow

## 📱 Minimum Requirements

- Android 7.0+ (API 24)
- 50 MB free space
- Microphone
- Internet (for first setup only)

## 🎉 Success!

If build successful, you'll see:
```
BUILD SUCCESSFUL in 2m 34s
```

APK ready at: `app\build\outputs\apk\debug\app-debug.apk`

**Now install and enjoy Lyra!** 🌟
