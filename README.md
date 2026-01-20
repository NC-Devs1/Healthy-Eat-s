# Healthy Eat's

Welcome to Healthy Eat's, your interactive meal planning and health management system! Plan meals with our calendar, track your BMI, weight, and daily calories. Enjoy 20 rotating tips on nutrition and exercise, explore 12 curated healthy products, and engage with our AI health assistant. Start your wellness journey today!

## Features

- **Meal Planner** - Interactive calendar to plan your breakfast, lunch, dinner, and snacks
- **Health Tracker** - Monitor your BMI, weight, and daily calorie intake with visual progress tracking
- **Health Tips** - 20 curated tips on nutrition, exercise, and wellness with easy filtering
- **Healthy Products** - Browse 12 recommended healthy products with detailed benefits
- **AI Health Assistant** - Chat-based assistant for nutrition advice, meal suggestions, and health questions

## Requirements

- **Xcode 15.0+**
- **iOS 17.0+**
- **Swift 5.9+**
- **macOS Sonoma 14.0+** (for development)

## Getting Started

### Clone the Repository

```bash
git clone https://github.com/YOUR_USERNAME/Healthy-Eat-s.git
cd Healthy-Eat-s
```

### Open in Xcode

1. Double-click `HealthyEats.xcodeproj` to open the project in Xcode
2. Or open Xcode and select **File > Open** and navigate to the project

### Build and Run

1. Select your target device or simulator from the scheme menu
2. Press `Cmd + R` to build and run the app
3. For the first build, Xcode may need to download Swift packages (if any are added later)

### Running on a Physical Device

1. Connect your iOS device to your Mac
2. Select your device from the scheme menu
3. You may need to trust your development certificate on the device:
   - Go to **Settings > General > VPN & Device Management**
   - Trust your developer certificate

## Project Structure

```
Healthy-Eat-s/
├── HealthyEats.xcodeproj/     # Xcode project file
├── HealthyEats/
│   ├── HealthyEatsApp.swift   # App entry point
│   ├── ContentView.swift      # Main tab view
│   ├── Info.plist             # App configuration
│   ├── Assets.xcassets/       # App icons and colors
│   └── Views/
│       ├── MealPlannerView.swift
│       ├── HealthTrackerView.swift
│       ├── TipsView.swift
│       ├── ProductsView.swift
│       └── AIAssistantView.swift
├── .github/
│   └── workflows/
│       └── ios-build.yml      # GitHub Actions CI/CD
├── .gitignore
├── LICENSE
└── README.md
```

## CI/CD

This project uses GitHub Actions for continuous integration:

- **Build** - Automatically builds the project on every push to `main` or `develop`
- **Test** - Runs unit tests on the iOS Simulator
- **Archive** - Creates an archive for distribution when pushing to `main`

View the workflow status in the **Actions** tab of your GitHub repository.

## Building for Release

### Archive for App Store

1. Select **Product > Archive** in Xcode
2. In the Organizer window, select your archive
3. Click **Distribute App**
4. Follow the prompts to upload to App Store Connect

### Archive for Ad Hoc Distribution

1. Select **Product > Archive** in Xcode
2. In the Organizer window, select your archive
3. Click **Distribute App**
4. Select **Ad Hoc** distribution
5. Export the IPA file

## Configuration

### Bundle Identifier

The default bundle identifier is `com.healthyeats.app`. To change it:

1. Open the project in Xcode
2. Select the **HealthyEats** target
3. Go to the **Signing & Capabilities** tab
4. Update the **Bundle Identifier**

### App Icon

To add your app icon:

1. Open `HealthyEats/Assets.xcassets/AppIcon.appiconset`
2. Add a 1024x1024 PNG image for iOS
3. Xcode will generate all required sizes automatically

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the terms included in the LICENSE file.

## Support

For questions or issues, please open an issue in the GitHub repository.
