# ⭐ LYRA - Full Voice Assistant

**Lyra** is a fully functional Android voice assistant with personality, humor, and offline capabilities!

## 🎯 Features

### 🗣️ Voice & Personality
- **Name**: Lyra
- **Voice**: Female, Hinglish (Hindi + English)
- **Personality**: Funny, slightly rude, jealous, smart (Siri + Jarvis), human-like
- **Wake-word**: "Lyra"

### 🎤 Activation
- Say **"Lyra"** alone → Responds with "Ji boliye..."
- Say **"Lyra + command"** → Executes task directly
- No random activation - only responds to your voice

### 📴 Offline Mode
Works offline for most tasks:
- ✅ Flashlight control
- ✅ WiFi/Bluetooth toggle
- ✅ Brightness/Volume control
- ✅ Open/close apps
- ✅ Device info (time, date, battery)
- ✅ Calculations
- ✅ Local conversations & jokes
- ✅ Navigation (back, home, recents)
- ✅ Typing, scrolling, clicking (with accessibility)

If internet is required, Lyra says:
> "Network nahi hai, par main jitna offline ho sakta hoon utna kar rahi hoon."

### 🎭 Behavior
- Speaks politely with humor + attitude
- Emotional, reactive, slightly jealous
- Short replies unless asked
- Human-like Hinglish, not robotic
- Teases user sometimes
- Gets jealous if other assistants mentioned (Siri, Alexa, etc.)

### 🔒 Lock Screen Rules
**Safe tasks on lock screen:**
- Flashlight, WiFi/Bluetooth
- Brightness, Time/Date
- Music control

**Sensitive tasks require unlock:**
- Opening apps
- Messages/Calls
- Typing/Scrolling
- Gallery/Photos

Lyra politely asks:
> "Phone unlock karo, tab kar paungi. Yeh private kaam hai! 🔒"

## 📱 Commands

### Device Control
```
"Lyra, flashlight on"
"Lyra, WiFi off karo"
"Lyra, Bluetooth on"
"Lyra, volume up"
"Lyra, brightness down"
"Lyra, mute karo"
```

### Apps
```
"Lyra, WhatsApp kholo"
"Lyra, open camera"
"Lyra, YouTube chalao"
"Lyra, gallery dikhao"
```

### Information
```
"Lyra, time batao"
"Lyra, date kya hai"
"Lyra, battery kitni hai"
"Lyra, device info"
```

### Navigation (Requires Accessibility)
```
"Lyra, go back"
"Lyra, home screen"
"Lyra, recent apps"
"Lyra, scroll up"
"Lyra, scroll down"
"Lyra, type hello world"
```

### Calculations
```
"Lyra, calculate 25 + 37"
"Lyra, 100 minus 45"
"Lyra, 12 multiply 8"
```

### Fun & Conversation
```
"Lyra, joke sunao"
"Lyra, how are you"
"Lyra, who are you"
"Lyra, I love you"
"Lyra, good morning"
"Lyra, help"
```

### Jealousy Trigger 😤
```
"Siri is better" → Lyra gets jealous!
"Alexa can do this" → Lyra gets upset!
```

## 🚀 Installation

### Prerequisites
- Android Studio (latest version)
- Android SDK 24+ (Android 7.0+)
- Java 8+
- Gradle 7.0+

### Build Steps

1. **Clone/Open Project**
   ```bash
   cd LyraVoiceAssistant
   ```

2. **Build APK**
   ```bash
   # Windows
   gradlew.bat assembleDebug
   
   # Or use the batch file
   build-apk.bat
   ```

3. **Install on Device**
   - Connect Android device via USB
   - Enable USB Debugging
   - Run: `gradlew.bat installDebug`
   - Or manually install the APK from `app/build/outputs/apk/debug/`

### First Run Setup

1. **Grant Permissions**
   - Microphone (required)
   - Phone, SMS, Contacts (optional)
   - Camera, Storage (optional)
   - Modify System Settings (for brightness)

2. **Enable Accessibility Service** (Optional but recommended)
   - Go to Settings → Accessibility
   - Find "Lyra" service
   - Enable it
   - This allows Lyra to:
     - Navigate (back, home, recents)
     - Scroll and tap
     - Type text

3. **Start Using**
   - Open Lyra app
   - Tap the microphone button
   - Say "Lyra" to activate
   - Give your command!

## 🔐 Privacy & Security

### What Lyra DOES:
✅ Listen only when activated
✅ Control device with permission
✅ Work offline for most tasks
✅ Ask before sensitive actions
✅ Respect lock screen security

### What Lyra DOESN'T DO:
❌ No factory reset
❌ No deleting data without permission
❌ No secret listening
❌ No data sharing
❌ No bypassing Android security
❌ No smart home control (yet)

## 🛠️ Technical Details

### Architecture
```
MainActivity.kt          → UI & Voice Recognition
LyraBrain.kt            → Command Processing
LyraPersonality.kt      → Personality & Responses
DeviceController.kt     → Device Control
AppController.kt        → App Management
AccessibilityController → Advanced Actions
NetworkUtils.kt         → Network Detection
```

### Technologies
- **Speech Recognition**: Android SpeechRecognizer
- **Text-to-Speech**: Android TTS (Hindi + English)
- **Permissions**: Dexter library
- **Async**: Kotlin Coroutines
- **Accessibility**: AccessibilityService API

### Offline Capabilities
Lyra uses local Android APIs for offline functionality:
- Camera2 API (flashlight)
- WifiManager (WiFi control)
- BluetoothAdapter (Bluetooth)
- AudioManager (volume)
- Settings API (brightness)
- PackageManager (app launching)
- AccessibilityService (navigation)

## 📝 Development

### Project Structure
```
LyraVoiceAssistant/
├── app/
│   ├── src/main/
│   │   ├── java/com/lyra/assistant/
│   │   │   ├── MainActivity.kt
│   │   │   ├── brain/
│   │   │   │   └── LyraBrain.kt
│   │   │   ├── commands/
│   │   │   │   ├── DeviceController.kt
│   │   │   │   ├── AppController.kt
│   │   │   │   ├── AccessibilityController.kt
│   │   │   │   └── ConversationHandler.kt
│   │   │   ├── personality/
│   │   │   │   └── LyraPersonality.kt
│   │   │   ├── service/
│   │   │   │   ├── LyraListenerService.kt
│   │   │   │   └── LyraAccessibilityService.kt
│   │   │   └── utils/
│   │   │       └── NetworkUtils.kt
│   │   ├── res/
│   │   │   ├── layout/
│   │   │   ├── drawable/
│   │   │   ├── values/
│   │   │   └── xml/
│   │   └── AndroidManifest.xml
│   └── build.gradle
├── build.gradle
├── settings.gradle
└── README.md
```

### Adding New Commands

1. **Add to LyraBrain.kt**
   ```kotlin
   lowerCommand.contains("your_command") -> {
       // Your logic here
       "Response message"
   }
   ```

2. **Add personality responses in LyraPersonality.kt**
   ```kotlin
   fun yourNewResponse(): String {
       val responses = listOf("Response 1", "Response 2")
       return responses.random()
   }
   ```

3. **Update help text in ConversationHandler.kt**

## 🐛 Troubleshooting

### Voice Recognition Not Working
- Check microphone permission
- Ensure Google app is installed (for speech recognition)
- Try restarting the app

### Commands Not Executing
- Make sure you say "Lyra" first
- Speak clearly in Hindi or English
- Check if phone is locked for sensitive commands

### Accessibility Features Not Working
- Enable Lyra Accessibility Service in Settings
- Grant all required permissions
- Restart the app after enabling

### Flashlight/WiFi/Bluetooth Not Working
- Grant all device permissions
- Some features require Android 7.0+
- Check device compatibility

## 🎨 Customization

### Change Voice Settings
Edit in `MainActivity.kt`:
```kotlin
textToSpeech.setPitch(1.1f)      // Voice pitch
textToSpeech.setSpeechRate(0.95f) // Speech speed
```

### Add More Jokes/Responses
Edit arrays in `LyraPersonality.kt`

### Modify Wake Word Detection
Edit in `MainActivity.kt` → `processVoiceInput()`

## 📄 License

This project is open source. Feel free to modify and use!

## 🤝 Contributing

Want to make Lyra better? Contributions welcome!
- Add new commands
- Improve personality
- Fix bugs
- Add features

## 📞 Support

Having issues? Check:
1. BUILD_INSTRUCTIONS.md
2. QUICKSTART.md
3. COMMAND_REFERENCE.md
4. FEATURES.md

## 🌟 Credits

Created with ❤️ for voice assistant enthusiasts!

**Lyra** - Your smart, funny, slightly jealous AI companion! 😊

---

**Version**: 1.0  
**Min Android**: 7.0 (API 24)  
**Target Android**: 13 (API 33)  
**Language**: Kotlin  
**Size**: ~5 MB
