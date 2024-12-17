# Patch Assessment Flutter App

## Overview
Patch Assessment is a Flutter mobile application that provides a comprehensive product browsing experience with features like category filtering and product listings.

## Prerequisites
- Flutter SDK (version 3.5.4 or higher)
- Dart SDK
- Android Studio or VS Code with Flutter extensions
- Git

## Project Structure
```
patch_assessment/
│
├── assets/
│   └── images/
│       ├── electronics.jpg
│       ├── jewelry.jpg
│       ├── mens_clothing.jpg
│       └── womens_clothing.jpg
│
├── lib/
│   ├── constants/
│   ├── models/
│   ├── providers/
│   ├── screens/
│   └── utils/
│
└── pubspec.yaml
```

## Setup and Installation

1. Clone the repository:
```bash
git clone https://github.com/Esetobore/PatchAssessment.git
cd patch_assessment
```

2. Install dependencies:
```bash
flutter pub get
```

3. Verify asset images:
- Ensure all category images are in `assets/images/`
- Check image filenames match those in the code

## Running the App

### Method 1: Using Flutter CLI
```bash
flutter run
```

### Method 2: Using IDE
- Open the project in Android Studio or VS Code
- Ensure you have a connected device or emulator
- Click "Run" or press F5

## Key Dependencies
- provider: State management
- http: Network requests
- shimmer: Loading animations

## Features
- Product listing
- Category filtering
- Responsive design
- Asset-based category selection

## Troubleshooting
- Run `flutter clean` if you encounter asset or dependency issues
- Verify Flutter and Dart SDK versions
- Check internet connectivity for API calls