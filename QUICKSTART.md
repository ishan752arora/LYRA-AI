# 🚀 Lyra Quick Start Guide

Get Lyra up and running in 5 minutes!

## Step 1: Build the APK

### Option A: Using Batch File (Easiest)
```bash
build-apk.bat
```

### Option B: Using Gradle
```bash
gradlew.bat assembleDebug
```

The APK will be created at:
```
app/build/outputs/apk/debug/app-debug.apk
```

## Step 2: Install on Android Device

### Method 1: Direct Install via USB
1. Connect your Android phone via USB
2. Enable USB Debugging on your phone:
   - Settings → About Phone → Tap "Build Number" 7 times
   - Settings → Developer Options → Enable "USB Debugging"
3. Run:
   ```bash
   gradlew.bat installDebug
   ```

### Method 2: Manual Install
1. Copy `app-debug.apk` to your phone
2. Open the APK file on your phone
3. Allow "Install from Unknown Sources" if prompted
4. Tap "Install"

## Step 3: First Launch

1. **Open Lyra app**
2. **Grant Permissions** when prompted:
   - ✅ Microphone (Required)
   - ✅ Phone & SMS (Optional)
   - ✅ Contacts (Optional)
   - ✅ Camera (Optional)
   - ✅ Modify System Settings (For brightness control)

3. **Tap the Microphone Button** 🎤

## Step 4: Try Your First Commands

### Basic Test
```
You: "Lyra"
Lyra: "Ji boliye..."
You: "Time batao"
Lyra: "Abhi time hai 3:45 PM! ⏰"
```

### Direct Command
```
You: "Lyra, flashlight on"
Lyra: "Flashlight on! Andhera door! 💡"
```

### Fun Command
```
You: "Lyra, joke sunao"
Lyra: [Tells a funny joke in Hinglish] 😄
```

## Step 5: Enable Advanced Features (Optional)

For navigation, scrolling, and typing commands:

1. Go to **Settings → Accessibility**
2. Find **Lyra** in the list
3. **Enable** the Lyra service
4. Confirm the permission

Now you can use:
- "Lyra, go back"
- "Lyra, scroll down"
- "Lyra, type hello"

## 🎯 Quick Command Reference

### Device Control
- "Lyra, flashlight on/off"
- "Lyra, WiFi on/off"
- "Lyra, volume up/down"
- "Lyra, brightness up/down"

### Apps
- "Lyra, open WhatsApp"
- "Lyra, camera kholo"
- "Lyra, YouTube chalao"

### Information
- "Lyra, time batao"
- "Lyra, battery kitni hai"
- "Lyra, date kya hai"

### Fun
- "Lyra, joke sunao"
- "Lyra, how are you"
- "Lyra, who are you"

### Help
- "Lyra, help" → Shows all commands

## 🔧 Troubleshooting

### "Lyra not responding"
- Check microphone permission
- Tap the mic button again
- Speak clearly: "Lyra"

### "Command not working"
- Make sure you say "Lyra" first
- Try: "Lyra [command]" format
- Check if phone is unlocked for sensitive commands

### "No speech recognition"
- Install/Update Google app
- Check internet for first-time setup
- Restart the app

### "Accessibility features not working"
- Enable Lyra in Settings → Accessibility
- Grant all permissions
- Restart app

## 💡 Pro Tips

1. **Offline Mode**: Most commands work without internet!
2. **Lock Screen**: Safe commands work on lock screen
3. **Continuous Listening**: Lyra keeps listening after each response
4. **Hinglish**: Mix Hindi and English freely
5. **Personality**: Try mentioning other assistants (Siri, Alexa) - Lyra gets jealous! 😤

## � CYou're Ready!

Lyra is now your personal voice assistant. Enjoy! 😊

For more commands, see: **COMMAND_REFERENCE.md**  
For features, see: **FEATURES.md**  
For build details, see: **BUILD_INSTRUCTIONS.md**

---

**Need Help?** Check the full README.md for detailed documentation.
